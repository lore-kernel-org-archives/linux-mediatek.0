Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257C6C2BA16
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 12:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E939E206E9
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 12:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTkO644q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="FnkcgQFR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E939E206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8nevGWuyZR8rPTyB2Pg4ovharnjvu7OuP78AqizEirg=; b=tTkO644ql0h2ODraKRc4SQvb/
	Pol3jkuBysUdIDrZqf89BmtVjlem5KZGnINsdVwA9KogYZR609A42hlhlMS0QzSN2r+NJyF6/g0ue
	e4b5R1BH0iu2PqUkbMlWwjDgpA2d8r6/3dLMkRaXnqGYlN6yhw8K4UKlODDpbxac/3uIpfC0sSwU4
	E1fxGoBXivLYcZWW9Suj4lKxZvuZVYndvQp3LjX0sFv6+iKeWRpdacQy58iAHWL5GG7wnu3ziBkiz
	OaPP8j/TmGaZlE5fLb2qWSWf+5fJSIyPLW5BIxQcPY7otTP0GhZxkDCvDBWDxa493zO1Sonk2e8RO
	qx6QBDFKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKhmq-0003R8-N9; Sat, 04 Apr 2020 12:20:32 +0000
Received: from mx.0dd.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKhmn-0003Qg-1Z
 for linux-mediatek@lists.infradead.org; Sat, 04 Apr 2020 12:20:31 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id A81075FC75;
 Sat,  4 Apr 2020 14:19:54 +0200 (CEST)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="FnkcgQFR"; 
 dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 4CD4627C8BA;
 Sat,  4 Apr 2020 14:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 4CD4627C8BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1586002794;
 bh=ctayAcaFI2hlA1UO9mKHsTkEOszfKFOnmNt31e4Np0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FnkcgQFRZELMzJe7wCKoQLLnSJGlZWKvPN6+dQ6pGu2p1AJE439FO+gj7O8yLm2FD
 51WSsVONmjWuhENP5JtBfGcBJstO848Mcr1Su1pN+ntJOfggcmGfly9QsN3BZKd1Wc
 9OsTxvzq6kYNQdnEAmxRJ5pdAEz2EfIYLRB1+Xc51kKwOYVeXgYYbGfOYPDTy5RmUH
 PjfibHRoWN2G1gcctcK8ax45ErcuaBVa/8o/8S04z1+sABIwbHS6UiWiF0+jvbdT+j
 AqRZtxuPtDVw09HjT+mv2mB5UT+9Px5SpXLKJ5cgKNGmQHfJqjp/WwAGPg0XKZ6Ay/
 i05ABzsRQxn9g==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Sat, 04 Apr 2020 12:19:54 +0000
Date: Sat, 04 Apr 2020 12:19:54 +0000
Message-ID: <20200404121954.Horde.D4IT7LfXGUekf9m8q6GWcn4@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: sean.wang@mediatek.com
Subject: Re: [PATCH net 2/2] net: ethernet: mediatek: move mt7623 settings
 out off the mt7530
References: <1585960697-15547-1-git-send-email-sean.wang@mediatek.com>
 <1585960697-15547-2-git-send-email-sean.wang@mediatek.com>
In-Reply-To: <1585960697-15547-2-git-send-email-sean.wang@mediatek.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_052029_225210_5879A4F0 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 steven.liu@mediatek.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-mediatek@lists.infradead.org, john@phrozen.org, Mark-MC.Lee@mediatek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgU2VhbiwKClNlZSBjb21tZW50cyBiZWxvdy4KClF1b3Rpbmcgc2Vhbi53YW5nQG1lZGlhdGVr
LmNvbToKCj4gRnJvbTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+Cj4K
PiBNb3ZpbmcgbXQ3NjIzIGxvZ2ljIG91dCBvZmYgbXQ3NTMwLCBpcyByZXF1aXJlZCB0byBtYWtl
IGhhcmR3YXJlIHNldHRpbmcKPiBjb25zaXN0ZW50IGFmdGVyIHdlIGludHJvZHVjZSBwaHlsaW5r
IHRvIG10ayBkcml2ZXIuCj4KPiBGaXhlczogYjhmYzlmMzA4MjFlICgibmV0OiBldGhlcm5ldDog
bWVkaWF0ZWs6IEFkZCBiYXNpYyBQSFlMSU5LIHN1cHBvcnQiKQo+IFJldmlld2VkLWJ5OiBTZWFu
IFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4gVGVzdGVkLWJ5OiBTZWFuIFdhbmcgPHNl
YW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERvcnN0IDxv
cGVuc291cmNlQHZkb3JzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlh
dGVrL210a19ldGhfc29jLmMgfCA0MyArKysrKysrKysrKysrKysrKystLS0KPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuaCB8ICA4ICsrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMgIAo+IGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYwo+IGluZGV4IDhkMjhmOTBhY2Zl
Ny4uMTRkYTU5OTY2NGU2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlh
dGVrL210a19ldGhfc29jLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9t
dGtfZXRoX3NvYy5jCj4gQEAgLTY1LDYgKzY1LDE3IEBAIHUzMiBtdGtfcjMyKHN0cnVjdCBtdGtf
ZXRoICpldGgsIHVuc2lnbmVkIHJlZykKPiAgCXJldHVybiBfX3Jhd19yZWFkbChldGgtPmJhc2Ug
KyByZWcpOwo+ICB9Cj4KPiArdTMyIG10a19tMzIoc3RydWN0IG10a19ldGggKmV0aCwgdTMyIG1h
c2ssIHUzMiBzZXQsIHVuc2lnbmVkIHJlZykKPiArewo+ICsJdTMyIHZhbDsKPiArCj4gKwl2YWwg
PSBtdGtfcjMyKGV0aCwgcmVnKTsKPiArCXZhbCAmPSB+bWFzazsKPiArCXZhbCB8PSBzZXQ7Cj4g
KwltdGtfdzMyKGV0aCwgdmFsLCByZWcpOwo+ICsJcmV0dXJuIHJlZzsKPiArfQo+ICsKPiAgc3Rh
dGljIGludCBtdGtfbWRpb19idXN5X3dhaXQoc3RydWN0IG10a19ldGggKmV0aCkKPiAgewo+ICAJ
dW5zaWduZWQgbG9uZyB0X3N0YXJ0ID0gamlmZmllczsKPiBAQCAtMTYwLDExICsxNzEsMjEgQEAg
c3RhdGljIGludCBtdDc2MjFfZ21hYzBfcmdtaWlfYWRqdXN0KHN0cnVjdCAgCj4gbXRrX2V0aCAq
ZXRoLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfZ21hYzBfcmdtaWlf
YWRqdXN0KHN0cnVjdCBtdGtfZXRoICpldGgsIGludCBzcGVlZCkKPiArc3RhdGljIHZvaWQgbXRr
X2dtYWMwX3JnbWlpX2FkanVzdChzdHJ1Y3QgbXRrX2V0aCAqZXRoLAo+ICsJCQkJICAgcGh5X2lu
dGVyZmFjZV90IGludGVyZmFjZSwgaW50IHNwZWVkKQo+ICB7Cj4gIAl1MzIgdmFsOwo+ICAJaW50
IHJldDsKPgo+ICsJaWYgKGludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVfVFJHTUlJKSB7
Cj4gKwkJbXRrX3czMihldGgsIFRSR01JSV9NT0RFLCBJTlRGX01PREUpOwo+ICsJCXZhbCA9IDUw
MDAwMDAwMDsKPiArCQlyZXQgPSBjbGtfc2V0X3JhdGUoZXRoLT5jbGtzW01US19DTEtfVFJHUExM
XSwgdmFsKTsKPiArCQlpZiAocmV0KQo+ICsJCQlkZXZfZXJyKGV0aC0+ZGV2LCAiRmFpbGVkIHRv
IHNldCB0cmdtaWkgcGxsOiAlZFxuIiwgcmV0KTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICAJ
dmFsID0gKHNwZWVkID09IFNQRUVEXzEwMDApID8KPiAgCQlJTlRGX01PREVfUkdNSUlfMTAwMCA6
IElOVEZfTU9ERV9SR01JSV8xMF8xMDA7Cj4gIAltdGtfdzMyKGV0aCwgdmFsLCBJTlRGX01PREUp
Owo+IEBAIC0xOTMsNyArMjE0LDcgQEAgc3RhdGljIHZvaWQgbXRrX21hY19jb25maWcoc3RydWN0
IHBoeWxpbmtfY29uZmlnICAKPiAqY29uZmlnLCB1bnNpZ25lZCBpbnQgbW9kZSwKPiAgCXN0cnVj
dCBtdGtfbWFjICptYWMgPSBjb250YWluZXJfb2YoY29uZmlnLCBzdHJ1Y3QgbXRrX21hYywKPiAg
CQkJCQkgICBwaHlsaW5rX2NvbmZpZyk7Cj4gIAlzdHJ1Y3QgbXRrX2V0aCAqZXRoID0gbWFjLT5o
dzsKPiAtCXUzMiBtY3JfY3VyLCBtY3JfbmV3LCBzaWQ7Cj4gKwl1MzIgbWNyX2N1ciwgbWNyX25l
dywgc2lkLCBpOwo+ICAJaW50IHZhbCwgZ2VfbW9kZSwgZXJyOwo+Cj4gIAkvKiBNVDc2eDggaGFz
IG5vIGhhcmR3YXJlIHNldHRpbmdzIGJldHdlZW4gZm9yIHRoZSBNQUMgKi8KPiBAQCAtMjUxLDEw
ICsyNzIsMjAgQEAgc3RhdGljIHZvaWQgbXRrX21hY19jb25maWcoc3RydWN0ICAKPiBwaHlsaW5r
X2NvbmZpZyAqY29uZmlnLCB1bnNpZ25lZCBpbnQgbW9kZSwKPiAgCQkJCQkJCSAgICAgIHN0YXRl
LT5pbnRlcmZhY2UpKQo+ICAJCQkJCWdvdG8gZXJyX3BoeTsKPiAgCQkJfSBlbHNlIHsKPiAtCQkJ
CWlmIChzdGF0ZS0+aW50ZXJmYWNlICE9Cj4gLQkJCQkgICAgUEhZX0lOVEVSRkFDRV9NT0RFX1RS
R01JSSkKPiAtCQkJCQltdGtfZ21hYzBfcmdtaWlfYWRqdXN0KG1hYy0+aHcsCj4gLQkJCQkJCQkg
ICAgICAgc3RhdGUtPnNwZWVkKTsKPiArCQkJCW10a19nbWFjMF9yZ21paV9hZGp1c3QobWFjLT5o
dywKPiArCQkJCQkJICAgICAgIHN0YXRlLT5pbnRlcmZhY2UsCj4gKwkJCQkJCSAgICAgICBzdGF0
ZS0+c3BlZWQpOwo+ICsKCkFzIEkgdHJpZWQgdG8gZXhwbGFpbiBpbiBteSBlbWFpbCBvZiAyNyBN
YXJjaC4KCm10a19nbWFjMF9yZ21paV9hZGp1c3QoKSBuZWVkcyB0byBiZSBtb2RpZmllZCBvciBz
cGxpdC11cCEKUnVzc2VsbCBLaW5nIHBvaW50ZWQgb3V0IHRoYXQgbXRrX2dtYWMwX3JnbWlpX2Fk
anVzdCgpIGlzIHVzaW5nIHN0YXRlLT5zcGVlZAp2YXJpYWJsZS4gVGhpcyB2YXJpYWJsZSBtYXkg
aGFzIG5vdCB0aGUgcmlnaHQgdmFsdWUgc28gaXQgc2hvdWxkIG5vdCBiZSB1c2VkCmhlcmUuIEFs
c28gbXRrX2dtYWMwX3JnbWlpX2FkanVzdCgpIGlzIG9ubHkgY2FsbGVkIG9uIGEgIApzdGF0ZS0+
aW50ZXJmYWNlIGNoYW5nZQpub3Qgc3RhdGUtPnNwZWVkIGNoYW5nZS4KClNvIGNhbiB3ZSBtYWtl
IHRoaXMgZnVuY3Rpb24gb25seSBkZXBlbmRlbmQgb24gdGhlIHN0YXRlLT5pbnRlcmZhY2UgYW5k
IGhvdz8KCkkgdGhpbmsgaW4gYm90aCBjYXNlcywgcmVtb3ZlIG10a19nbWFjMF9yZ21paV9hZGp1
c3QoKSBjaGFuZ2VzIGluIHRoaXMgIApwYXRjaCBhbmQKY3JlYXRlIGEgc2VwYXJldCBwYXRjaCB0
byBmaXggbXRrX2dtYWMwX3JnbWlpX2FkanVzdCgpIGlzc3VlLiBXb3VsZCBiZSAgCmdyZWF0IGlm
CnRoYXQgYWxzbyBjb21wbGllcyB0byB0aGUgbGF0ZXN0IFBIWUxJTksgYXBpIFsxXS4gU28gdGhh
dCBmdW5jdGlvbnMgdGhhdCB1c2luZwpzdGF0ZS0+c3BlZWQgYW5kIG90aGVyIHJlbGF0ZWQgcGFy
YW1ldGVycyBtb3ZlIHRvIG1hY19saW5rX3VwKCkuIFNpbWlsYWlyIGFsc28Kb24gdGhlIG10NzUz
MCBzd2l0Y2ggZHJpdmVyIFsyXS4KCkdyZWF0cywKClJlbsOpCgpbMV06ICAKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIwMDIxNzE3MjI0Mi5HWjI1NzQ1QHNoZWxs
LmFybWxpbnV4Lm9yZy51ay8KWzJdOiAgCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L25ldGRldi9uZXQtbmV4dC5naXQvY29tbWl0Lz9pZD0xZDAxMTQ1ZmQ2
NTlmOWY5NmVkZTFjMzRlM2JlYTBjY2I1NThhMjkzCgo+ICsJCQkJLyogbXQ3NjIzX3BhZF9jbGtf
c2V0dXAgKi8KPiArCQkJCWZvciAoaSA9IDAgOyBpIDwgTlVNX1RSR01JSV9DVFJMOyBpKyspCj4g
KwkJCQkJbXRrX3czMihtYWMtPmh3LAo+ICsJCQkJCQlURF9ETV9EUlZQKDgpIHwgVERfRE1fRFJW
Tig4KSwKPiArCQkJCQkJVFJHTUlJX1REX09EVChpKSk7Cj4gKwo+ICsJCQkJLyogQXNzZXJ0L3Jl
bGVhc2UgTVQ3NjIzIFJYQyByZXNldCAqLwo+ICsJCQkJbXRrX20zMihtYWMtPmh3LCAwLCBSWENf
UlNUIHwgUlhDX0RRU0lTRUwsCj4gKwkJCQkJVFJHTUlJX1JDS19DVFJMKTsKPiArCQkJCW10a19t
MzIobWFjLT5odywgUlhDX1JTVCwgMCwgVFJHTUlJX1JDS19DVFJMKTsKPiAgCQkJfQo+ICAJCX0K
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3Nv
Yy5oICAKPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmgKPiBp
bmRleCA4NTgzMGZlMTRhMWIuLjQ1NGNmY2Q0NjVmZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5oCj4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuaAo+IEBAIC0zNTIsMTAgKzM1MiwxMyBAQAo+ICAj
ZGVmaW5lIERRU0kwKHgpCQkoKHggPDwgMCkgJiBHRU5NQVNLKDYsIDApKQo+ICAjZGVmaW5lIERR
U0kxKHgpCQkoKHggPDwgOCkgJiBHRU5NQVNLKDE0LCA4KSkKPiAgI2RlZmluZSBSWENUTF9ETVdU
TEFUKHgpCSgoeCA8PCAxNikgJiBHRU5NQVNLKDE4LCAxNikpCj4gKyNkZWZpbmUgUlhDX1JTVAkJ
CUJJVCgzMSkKPiAgI2RlZmluZSBSWENfRFFTSVNFTAkJQklUKDMwKQo+ICAjZGVmaW5lIFJDS19D
VFJMX1JHTUlJXzEwMDAJKFJYQ19EUVNJU0VMIHwgUlhDVExfRE1XVExBVCgyKSB8IERRU0kxKDE2
KSkKPiAgI2RlZmluZSBSQ0tfQ1RSTF9SR01JSV8xMF8xMDAJUlhDVExfRE1XVExBVCgyKQo+Cj4g
KyNkZWZpbmUgTlVNX1RSR01JSV9DVFJMCQk1Cj4gKwo+ICAvKiBUUkdNSUkgUlhDIGNvbnRyb2wg
cmVnaXN0ZXIgKi8KPiAgI2RlZmluZSBUUkdNSUlfVENLX0NUUkwJCTB4MTAzNDAKPiAgI2RlZmlu
ZSBUWENUTF9ETVdUTEFUKHgpCSgoeCA8PCAxNikgJiBHRU5NQVNLKDE4LCAxNikpCj4gQEAgLTM2
Myw2ICszNjYsMTEgQEAKPiAgI2RlZmluZSBUQ0tfQ1RSTF9SR01JSV8xMDAwCVRYQ1RMX0RNV1RM
QVQoMikKPiAgI2RlZmluZSBUQ0tfQ1RSTF9SR01JSV8xMF8xMDAJKFRYQ19JTlYgfCBUWENUTF9E
TVdUTEFUKDIpKQo+Cj4gKy8qIFRSR01JSSBUWCBEcml2ZSBTdHJlbmd0aCAqLwo+ICsjZGVmaW5l
IFRSR01JSV9URF9PRFQoaSkJKDB4MTAzNTQgKyA4ICogKGkpKQo+ICsjZGVmaW5lICBURF9ETV9E
UlZQKHgpCQkoKHgpICYgMHhmKQo+ICsjZGVmaW5lICBURF9ETV9EUlZOKHgpCQkoKCh4KSAmIDB4
ZikgPDwgNCkKPiArCj4gIC8qIFRSR01JSSBJbnRlcmZhY2UgbW9kZSByZWdpc3RlciAqLwo+ICAj
ZGVmaW5lIElOVEZfTU9ERQkJMHgxMDM5MAo+ICAjZGVmaW5lIFRSR01JSV9JTlRGX0RJUwkJQklU
KDApCj4gLS0KPiAyLjI1LjEKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
