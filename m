Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6C6C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF878223AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Er9fxZEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF878223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WAB2+fTwvaYY9egIU+kb3Lbbmehyk/jO34Jh9j5FrHY=; b=Er9fxZEi1Cmfbja9KR/mRlmmw
	QkExHgJP9HLRjMDxMx8RyHTaXelPnu01WSD4HoPWMSM3EkfB4O8/cW9OKp9ipsECUgX9iJgpSBc6J
	E3IgKIKrISkY4nElA3gOd21mQVpfYXG6ATG2U7s2RJeUhwWXtnWeBxobseqIzFdINQXJTzRemJYhb
	88Err0DF9b6dnnb5l3LxeVmG8ukFG0bWfLvVA3qRfijgBgBx9E5JLYR/NQWmq5AJ8crTg+2hJnThN
	d3ZkgxZiVxLc7f/dQnxHgveus+7x0IC8Hs9zRTv7qUN9mnOdu0ztRiof8LrynC2S/tNp7u3Bbam5p
	F+qZnUK2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX4G9-0002zl-77; Mon, 26 Oct 2020 15:18:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX4Fn-0002qz-6w; Mon, 26 Oct 2020 15:17:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 513961F44A65
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 08/12] soc: mediatek: pm-domains: Add subsystem clocks
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-9-enric.balletbo@collabora.com>
 <d6d132ba-1ce1-f537-57ba-4b6bed784b48@gmail.com>
Message-ID: <e9809057-20b6-b72e-0320-1131fc37fae8@collabora.com>
Date: Mon, 26 Oct 2020 16:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d6d132ba-1ce1-f537-57ba-4b6bed784b48@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_111747_435435_050D1A83 
X-CRM114-Status: GOOD (  22.75  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LgoKT24gMi8xMC8yMCAxMTow
NCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiAKPiAKPiBPbiAwMS8xMC8yMDIwIDE4OjAxLCBF
bnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOgo+PiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxt
YnJ1Z2dlckBzdXNlLmNvbT4KPj4KPj4gRm9yIHRoZSBidXMgcHJvdGVjdGlvbiBvcGVyYXRpb25z
LCBzb21lIHN1YnN5c3RlbSBjbG9ja3MgbmVlZCB0byBiZSBlbmFibGVkCj4+IGJlZm9yZSByZWxl
YXNpbmcgdGhlIHByb3RlY3Rpb24uIFRoaXMgcGF0Y2ggaWRlbnRpZmllcyB0aGUgc3Vic3lzdGVt
IGNsb2Nrcwo+PiBieSBpdCdzIG5hbWUuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogV2VpeWkgTHUgPHdl
aXlpLmx1QG1lZGlhdGVrLmNvbT4KPj4gW0FkYXB0ZWQgdGhlIHBhdGNoIHRvIHRoZSBtdGstcG0t
ZG9tYWlucyBkcml2ZXJdCj4+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVn
Z2VyQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxl
bnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiB2MjoK
Pj4gLSBVc2UgZGV2X2Vycl9wcm9iZSBpZiBnZXR0aW5nIGNsb2NrcyBmYWlscywgc28gYW4gZXJy
b3IgaXMgbm90IHByaW50ZWQKPj4gwqDCoCBpZiBpcyBkZWZlcnJlZC4KPj4KPj4gwqAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYyB8IDg5ICsrKysrKysrKysrKysrKysrKysr
KystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9t
YWlucy5jCj4+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYwo+PiBpbmRl
eCBlMGE1MmQ0ODlmZWEuLjIwNzUwNzJmMTZkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYwo+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstcG0tZG9tYWlucy5jCj4gWy4uLl0KPj4gwqAgK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgcGQt
Pm51bV9zdWJzeXNfY2xrczsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrICpj
bGsgPSBvZl9jbGtfZ2V0KG5vZGUsIGkgKyBjbGtfaW5kKTsKPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKElTX0VSUihjbGspKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IFBU
Ul9FUlIoY2xrKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycl9wcm9iZShzY3Bz
eXMtPmRldiwgUFRSX0VSUihjbGspLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICIlcE9GbjogZmFpbGVkIHRvIGdldCBjbGsgYXQgaW5kZXggJWQ6ICVkXG4i
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGUsIGkg
KyBjbGtfaW5kLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wdXRf
c3Vic3lzX2Nsb2NrczsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgcGQtPnN1YnN5c19jbGtzW2ldLmNsayA9IGNsazsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoCByZXQgPSBjbGtfYnVsa19wcmVwYXJlKHBkLT5udW1fc3Vic3lzX2Nsa3MsIHBkLT5zdWJz
eXNfY2xrcyk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
X3B1dF9zdWJzeXNfY2xvY2tzOwo+PiArCj4gCj4gTm90IHN1cmUgaWYgaXQgcmVhbGx5IG1hdHRl
cnMsIGJ1dCBsb2dpY2FsbHkgd2Ugc2hvdWxkIHByZXBhcmUgdGhlIGJhc2ljIGNsb2Nrcwo+IGJl
Zm9yZSB3ZSBwcmVwYXJlIHRoZSBzdWJzeXN0ZW0gY2xvY2tzLiBBbmQgZml4IHRoZSBlcnJvciBo
YW5kbGluZyBhY2NvcmRpbmdseS4KPiAKCkNoYW5nZWQgaW4gbmV4dCB2ZXJzaW9uLgoKPiBSZWdh
cmRzLAo+IE1hdHRoaWFzCj4gCj4+IMKgwqDCoMKgwqAgcmV0ID0gY2xrX2J1bGtfcHJlcGFyZShw
ZC0+bnVtX2Nsa3MsIHBkLT5jbGtzKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKg
wqDCoMKgwqAgZ290byBlcnJfcHV0X2Nsb2NrczsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
X3VucHJlcGFyZV9zdWJzeXNfY2xvY2tzOwo+PiDCoCDCoMKgwqDCoMKgIC8qCj4+IMKgwqDCoMKg
wqDCoCAqIEluaXRpYWxseSB0dXJuIG9uIGFsbCBkb21haW5zIHRvIG1ha2UgdGhlIGRvbWFpbnMg
dXNhYmxlCj4+IEBAIC00NjIsNiArNTEzLDEyIEBAIHN0YXRpYyBpbnQgc2Nwc3lzX2FkZF9vbmVf
ZG9tYWluKHN0cnVjdCBzY3BzeXMgKnNjcHN5cywKPj4gc3RydWN0IGRldmljZV9ub2RlICpub2Rl
Cj4+IMKgIMKgIGVycl91bnByZXBhcmVfY2xvY2tzOgo+PiDCoMKgwqDCoMKgIGNsa19idWxrX3Vu
cHJlcGFyZShwZC0+bnVtX2Nsa3MsIHBkLT5jbGtzKTsKPj4gK2Vycl91bnByZXBhcmVfc3Vic3lz
X2Nsb2NrczoKPj4gK8KgwqDCoCBjbGtfYnVsa191bnByZXBhcmUocGQtPm51bV9zdWJzeXNfY2xr
cywgcGQtPnN1YnN5c19jbGtzKTsKPj4gK2Vycl9wdXRfc3Vic3lzX2Nsb2NrczoKPj4gK8KgwqDC
oCBjbGtfYnVsa19wdXQocGQtPm51bV9zdWJzeXNfY2xrcywgcGQtPnN1YnN5c19jbGtzKTsKPj4g
K8KgwqDCoCBkZXZtX2tmcmVlKHNjcHN5cy0+ZGV2LCBwZC0+c3Vic3lzX2Nsa3MpOwo+PiArwqDC
oMKgIHBkLT5udW1fc3Vic3lzX2Nsa3MgPSAwOwo+PiDCoCBlcnJfcHV0X2Nsb2NrczoKPj4gwqDC
oMKgwqDCoCBjbGtfYnVsa19wdXQocGQtPm51bV9jbGtzLCBwZC0+Y2xrcyk7Cj4+IMKgwqDCoMKg
wqAgZGV2bV9rZnJlZShzY3BzeXMtPmRldiwgcGQtPmNsa3MpOwo+PiBAQCAtNTQxLDYgKzU5OCwx
MCBAQCBzdGF0aWMgdm9pZCBzY3BzeXNfcmVtb3ZlX29uZV9kb21haW4oc3RydWN0IHNjcHN5c19k
b21haW4KPj4gKnBkKQo+PiDCoMKgwqDCoMKgIGNsa19idWxrX3VucHJlcGFyZShwZC0+bnVtX2Ns
a3MsIHBkLT5jbGtzKTsKPj4gwqDCoMKgwqDCoCBjbGtfYnVsa19wdXQocGQtPm51bV9jbGtzLCBw
ZC0+Y2xrcyk7Cj4+IMKgwqDCoMKgwqAgcGQtPm51bV9jbGtzID0gMDsKPj4gKwo+PiArwqDCoMKg
IGNsa19idWxrX3VucHJlcGFyZShwZC0+bnVtX3N1YnN5c19jbGtzLCBwZC0+c3Vic3lzX2Nsa3Mp
Owo+PiArwqDCoMKgIGNsa19idWxrX3B1dChwZC0+bnVtX3N1YnN5c19jbGtzLCBwZC0+c3Vic3lz
X2Nsa3MpOwo+PiArwqDCoMKgIHBkLT5udW1fc3Vic3lzX2Nsa3MgPSAwOwo+PiDCoCB9Cj4+IMKg
IMKgIHN0YXRpYyB2b2lkIHNjcHN5c19kb21haW5fY2xlYW51cChzdHJ1Y3Qgc2Nwc3lzICpzY3Bz
eXMpCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
