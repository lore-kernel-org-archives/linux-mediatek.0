Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13172C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:46:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D199E20786
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 23:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2i8iYHC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="qGHOkhBi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D199E20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Subject:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2UYM5xCIHewCu0AXG5mj9nixYsRSp6jtN+Q/QoYdtM=; b=d2i8iYHCvkEvN5q9qSAMA41xf
	adU0jrvKpo8ltvLWmTR1R1wQS9uRA4w1teRxmf1uSOVcf8sIW/kTlpcokSv57WF9Zub2RRJfM7wRq
	nM4YzbvQRE2UDXk7aTG8+Bg22/fxCRea+gfE8s/Ckpug1/kUup/BtBPEuyAZ59pfRQ2DcrxI/cL2P
	4y4dEDB5qKisAZiROYFdF+jRV6VUKWgwyJBXlj4jKP8uUJFjbF37nArgu5hsx6HN20ibbxWZ7M14N
	pZuJg9vltpQIY4tpzHiNY6UCll2Sxb1VpLq2lHmnbHynzhm57AzCTn1P/X1YK9l24I9bd/7Bb8t9m
	Q+ZEGufMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Xmk-0007g0-S0; Wed, 19 Aug 2020 23:46:27 +0000
Received: from mx.0dd.nl ([5.2.79.48])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Xmi-0007eR-GM
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 23:46:25 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 622575FB19;
 Thu, 20 Aug 2020 01:46:13 +0200 (CEST)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="qGHOkhBi"; 
 dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 1AE02687EC9;
 Thu, 20 Aug 2020 01:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 1AE02687EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1597880773;
 bh=yV6u6+GKP89ZhLaPI4Lclma8HJH4chY3sZJwJgORk04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qGHOkhBi2BTnqCwqZeHEocVi0xr7Hlg1vEMcqqjBkt7QaRBDN87wOOJsh+wstepJc
 BLBrC0D257eGFvdyNvkLXFw7tnEgF9TlxcWZNKHcWzxamHDQkgWmFMvNev3biAagL+
 obPPQiN1S161exlA+7gLw44fgJ1tA3e1wannKNZUl+omiK78VI73vMbmpdKL2JCf8M
 jEg9PcmXnsGis7G4+BRnCdGye6An3tITSzJohT4BePTEVfdsqqsu5769Kx/vFCx4xM
 KUMF64MUQNhaVummXc5au5TALXk37O4RdLEY22WLMnjDgzkX7ww7Je19UbkJ2njkTf
 dYy2Z1eIRviMQ==
Received: from pc-rene.lan.vdorst.com (pc-rene.lan.vdorst.com
 [192.168.2.14]) by www.vdorst.com (Horde Framework) with HTTPS; Wed, 19 Aug
 2020 23:46:13 +0000
Date: Wed, 19 Aug 2020 23:46:13 +0000
Message-ID: <20200819234613.Horde.oQiJhMCnUINwnQP-5_MyHh-@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
 <20200818160901.GF2330298@lunn.ch> <1597830248.31846.78.camel@mtksdccf07>
In-Reply-To: <1597830248.31846.78.camel@mtksdccf07>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_194624_743849_D9A0204E 
X-CRM114-Status: GOOD (  29.32  )
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
Cc: mark.rutland@arm.com, Andrew Lunn <andrew@lunn.ch>, frank-w@public-files.de,
 f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, Sean Wang <Sean.Wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dqfext@gmail.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBMYW5kZW4gQ2hhbyA8bGFuZGVuLmNoYW9AbWVkaWF0ZWsuY29tPjoKCj4gT24gV2Vk
LCAyMDIwLTA4LTE5IGF0IDAwOjA5ICswODAwLCBBbmRyZXcgTHVubiB3cm90ZToKPj4gT24gVHVl
LCBBdWcgMTgsIDIwMjAgYXQgMDM6MTQ6MTBQTSArMDgwMCwgTGFuZGVuIENoYW8gd3JvdGU6Cj4+
ID4gQWRkIG5ldyBzdXBwb3J0IGZvciBNVDc1MzE6Cj4+ID4KPj4gPiBNVDc1MzEgaXMgdGhlIG5l
eHQgZ2VuZXJhdGlvbiBvZiBNVDc1MzAuIEl0IGlzIGFsc28gYSA3LXBvcnRzIHN3aXRjaCB3aXRo
Cj4+ID4gNSBnaWdhIGVtYmVkZGVkIHBoeXMsIDIgY3B1IHBvcnRzLCBhbmQgdGhlIHNhbWUgTUFD
IGxvZ2ljIG9mIE1UNzUzMC4gQ3B1Cj4+ID4gcG9ydCA2IG9ubHkgc3VwcG9ydHMgU0dNSUkgaW50
ZXJmYWNlLiBDcHUgcG9ydCA1IHN1cHBvcnRzIGVpdGhlciBSR01JSQo+PiA+IG9yIFNHTUlJIGlu
IGRpZmZlcmVudCBIVyBza3UuIER1ZSB0byBTR01JSSBpbnRlcmZhY2Ugc3VwcG9ydCwgcGxsLCBh
bmQKPj4gPiBwYWQgc2V0dGluZyBhcmUgZGlmZmVyZW50IGZyb20gTVQ3NTMwLiBUaGlzIHBhdGNo
IGFkZHMgZGlmZmVyZW50IGluaXRpYWwKPj4gPiBzZXR0aW5nLCBhbmQgU0dNSUkgcGh5bGluayBo
YW5kbGVycyBvZiBNVDc1MzEuCj4+ID4KPj4gPiBNVDc1MzEgU0dNSUkgaW50ZXJmYWNlIGNhbiBi
ZSBjb25maWd1cmVkIGluIGZvbGxvd2luZyBtb2RlOgo+PiA+IC0gJ1NHTUlJIEFOIG1vZGUnIHdp
dGggaW4tYmFuZCBuZWdvdGlhdGlvbiBjYXBhYmlsaXR5Cj4+ID4gICAgIHdoaWNoIGlzIGNvbXBh
dGlibGUgd2l0aCBQSFlfSU5URVJGQUNFX01PREVfU0dNSUkuCj4+ID4gLSAnU0dNSUkgZm9yY2Ug
bW9kZScgd2l0aG91dCBpbi1ibmFkIG5lZ290aWF0aW9uCj4+Cj4+IGJhbmQKPiBTb3JyeSwgSSds
bCBmaXggaXQuCj4+Cj4+ID4gICAgIHdoaWNoIGlzIGNvbXBhdGlibGUgd2l0aCAxMEIvOEIgZW5j
b2Rpbmcgb2YKPj4gPiAgICAgUEhZX0lOVEVSRkFDRV9NT0RFXzEwMDBCQVNFWCB3aXRoIGZpeGVk
IGZ1bGwtZHVwbGV4IGFuZCBmaXhlZCBwYXVzZS4KPj4gPiAtIDIuNSB0aW1lcyBmYXN0ZXIgY2xv
Y2tlZCAnU0dNSUkgZm9yY2UgbW9kZScgd2l0aG91dCBpbi1ibmFkIG5lZ290aWF0aW9uCj4+Cj4+
IGJhbmQKPiBTb3JyeSwgSSdsbCBmaXggaXQuCj4+Cj4+ID4gK3N0YXRpYyBpbnQgbXQ3NTMxX3Jn
bWlpX3NldHVwKHN0cnVjdCBtdDc1MzBfcHJpdiAqcHJpdiwgdTMyIHBvcnQsCj4+ID4gKwkJCSAg
ICAgIHBoeV9pbnRlcmZhY2VfdCBpbnRlcmZhY2UpCj4+ID4gK3sKPj4gPiArCXUzMiB2YWw7Cj4+
ID4gKwo+PiA+ICsJaWYgKCFtdDc1MzFfaXNfcmdtaWlfcG9ydChwcml2LCBwb3J0KSkgewo+PiA+
ICsJCWRldl9lcnIocHJpdi0+ZGV2LCAiUkdNSUkgbW9kZSBpcyBub3QgYXZhaWxhYmxlIGZvciBw
b3J0ICVkXG4iLAo+PiA+ICsJCQlwb3J0KTsKPj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gPiAr
CX0KPj4gPiArCj4+ID4gKwl2YWwgPSBtdDc1MzBfcmVhZChwcml2LCBNVDc1MzFfQ0xLR0VOX0NU
UkwpOwo+PiA+ICsJdmFsIHw9IEdQX0NMS19FTjsKPj4gPiArCXZhbCAmPSB+R1BfTU9ERV9NQVNL
Owo+PiA+ICsJdmFsIHw9IEdQX01PREUoTVQ3NTMxX0dQX01PREVfUkdNSUkpOwo+PiA+ICsJdmFs
ICY9IH4oVFhDTEtfTk9fUkVWRVJTRSB8IFJYQ0xLX05PX0RFTEFZKTsKPj4gPiArCXN3aXRjaCAo
aW50ZXJmYWNlKSB7Cj4+ID4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSToKPj4gPiAr
CQl2YWwgfD0gVFhDTEtfTk9fUkVWRVJTRTsKPj4gPiArCQl2YWwgfD0gUlhDTEtfTk9fREVMQVk7
Cj4+ID4gKwkJYnJlYWs7Cj4+ID4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9SWElE
Ogo+PiA+ICsJCXZhbCB8PSBUWENMS19OT19SRVZFUlNFOwo+PiA+ICsJCWJyZWFrOwo+PiA+ICsJ
Y2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfVFhJRDoKPj4gPiArCQl2YWwgfD0gUlhDTEtf
Tk9fREVMQVk7Cj4+ID4gKwkJYnJlYWs7Cj4+ID4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9S
R01JSV9JRDoKPj4gPiArCQlicmVhazsKPj4gPiArCWRlZmF1bHQ6Cj4+ID4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4+ID4gKwl9Cj4+Cj4+IFlvdSBuZWVkIHRvIGJlIGNhcmVmdWwgaGVyZS4gSWYgdGhl
IE1BQyBpcyBkb2luZyB0aGUgUkdNSUkgZGVsYXlzLCB5b3UKPj4gbmVlZCB0byBlbnN1cmUgdGhl
IFBIWSBpcyBub3QuIFdoYXQgaW50ZXJmYWNlIG1vZGUgaXMgcGFzc2VkIHRvIHRoZQo+PiBQSFk/
Cj4gSGkgQW5kcmV3LAo+Cj4gbXQ3NTMxIFJHTUlJIHBvcnQgaXMgYSBNQUMtb25seSBwb3J0LCBp
dCBjYW4gYmUgY29ubmVjdGVkIHRvIENQVSBNQUMgb3IKPiBleHRlcm5hbCBwaHkuIEluIGJwaS1y
NjQgYm9hcmQsIG10NzUzMSBSR01JSSBpcyBjb25uZWN0ZWQgdG8gQ1BVIE1BQywgc28KPiBJIHRl
bmQgdG8gaW1wbGVtZW50IFJHTUlJIGxvZ2ljIGZvciB1c2UgY2FzZSBvZiBicGktcjY0Lgo+Cj4g
SW4gZ2VuZXJhbCwgYWNjb3JkaW5nIHRvIHBoeS5yc3QsIFJHTUlJIGRlbGF5IHNob3VsZCBiZSBk
b25lIGJ5IHBoeSwgYnV0Cj4gc29tZSBNb0NBIHByb2R1Y3QgbmVlZCBSR01JSSBkZWxheSBpbiBN
QUMuIFRoZXNlIHR3byByZXF1aXJlbWVudHMKPiBjb25mbGljdC4gSXMgdGhlcmUgYW55IHN1Z2dl
c3Rpb24gdG8gc29sdmUgdGhlIGNvbmZsaWN0Pwo+Cj4gSWYgbXQ3NTMxIFJHTUlJIGltcGxlbWVu
dGF0aW9uIG5lZWRzIHRvIHNhdGlzZnkgZWl0aGVyIHBoeS5yc3Qgb3IKPiBzcGVjaWFsIE1vQ0Eg
cHJvZHVjdCwgSSB3b3VsZCBsaWtlIHRvIHNhdGlzZnkgcGh5LnJzdCBhbmQgcmVtb3ZlIE1BQwo+
IFJHTUlJIGRlbGF5IGluIHYzLiBGb3Igc3BlY2lhbCBwcm9kdWN0IG5lZWRzIE1BQyBSR01JSSBk
ZWxheSwgdGhpcyBwYXRjaAo+IGNhbiBiZSB1c2VkIGluIGl0cyBsb2NhbCBjb2RlYmFzZS4KCkhp
IExhbmRlbiwKCldpdGggdGhlIGN1cnJlbnQgbWFpbmxpbmUgY29kZSBbMV0sIHRoZSBkc2EgY29k
ZSB0cmllcyB0byBkZXRlY3QgaG93IHRoZSBNQUM1CmlzIHVzZWQuIEFsbCB0aGUgdGhyZWUgbW9k
ZXMgYXJlIHN1cHBvcnRlZC4gTUFDNSAtPiBQSFkwLCBNQUM1IC0+ICAKUEhZNCwgTUFDNSAtPgpF
WFRFUk5BTCBQSFkgYW5kIE1BQzUgdG8gZXh0ZXJuYWwgTUFDLgoKV2hlbiBNQUM1IGlzIGEgRFNB
IHBvcnQgaXQgc2tpcHMgc2V0dGluZ3MgdGhlIGRlbGF5IHNldHRpbmdzLiBTZWUgWzJdLgoKTWF5
YmUgeW91IGNhbiB1c2UgYSBzaW1pbGFyIGNvbmNlcHQuCgpHcmVhdHMsCgpSZW7DqQoKClsxXSAg
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9u
ZXQtbmV4dC5naXQvdHJlZS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMjbjEzMDMKWzJdICAKaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1u
ZXh0LmdpdC90cmVlL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyNuNTk4Cgo+Cj4gTGFuZGVuCj4+
Cj4+IAlBbmRyZXcKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
