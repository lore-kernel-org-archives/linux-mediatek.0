Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09CBB61038
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09CBB61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twOo08RMAcSCt1qu/ykn6kpXtNIk6j9wVKXLsNrLsMg=; b=iCI3QDw+Eat05hqAZpxPdiDBdp
	krg5KupeJMduKtPu9HFJq1GCxbzHRsfmujx8i5vi40NDSs/7rInoaULcscf+I5IF8bKM5bXOm7LJx
	s8hx3vRfPtPLECixD3M9OsNVNeTSot+HtMM3HbytdfiVtkgxTfmiWhodRnV7dJb5H6It3szHJMrB1
	EsouP8BiU0ajJbNNGojY/uxQrmA5JxhmYtbO63Ps7wfVtOxhXYX2UTFcYdi5zpl1qLnc/Ir3ufkg8
	FqBPQJzPn9whV0GR6/jOWeVTXeUe7j1bj3Hp1Xuo4sP7cDWn06KB6QJKWrOKuGq+8S6uVqF6LlHVy
	/BCzaC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR3y-00FPZs-T0; Mon, 18 Oct 2021 11:44:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR31-00FP3w-6x
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 11:43:21 +0000
Received: from [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6] (unknown
 [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A08951F42CB8;
 Mon, 18 Oct 2021 12:43:16 +0100 (BST)
Subject: Re: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU
 was not signaled
To: =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "dafna3@gmail.com" <dafna3@gmail.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "eizan@chromium.org" <eizan@chromium.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
 <Maoguang.Meng@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
 <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
 <6c56de481d7060b759d67417e9fa6383f6e2f418.camel@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8973bfb4-8708-e739-02cb-f9ee670f401a@collabora.com>
Date: Mon, 18 Oct 2021 13:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6c56de481d7060b759d67417e9fa6383f6e2f418.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044319_431553_9F4780EC 
X-CRM114-Status: GOOD (  20.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAwNi4wOC4yMSAwODo1MCwgSXJ1aSBXYW5nICjnjovnkZ4pIHdyb3RlOgo+IE9uIFdlZCwg
MjAyMS0wOC0wNCBhdCAxNjoyNyArMDIwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToKPj4gRWFj
aCBtZXNzYWdlIHNlbnQgdG8gdGhlIFZQVSBzaG91bGQgcmFpc2UgYSBzaWduYWwuIFRoZSBzaWdu
YWwKPj4gaGFuZGxlciBzZXRzIHZwdS0+c2lnbmFsZWQuIFRlc3QgdGhlIGZpZWxkIGFuZCBmYWls
Cj4+IGlmIGl0IGlzIDAuCj4gCj4gSSBzdXBwb3NlIHlvdSB3YW50IHRvIGhhbmRsZSB0aGUgbWVz
c2FnZSBleGVjdXRpb24gcmVzdWx0LCBpZiBpcGkKPiBtZXNzYWdlIGNhbid0IHNlbmQgb3IgYWNr
ZWQgc3VjY2Vzc2Z1bGx5LCB0aGUgcmV0dXJuZWQgInN0YXR1cyIgb2YKPiAibXRrX3Zjb2RlY19m
d19pcGlfc2VuZCIgd2lsbCByZXR1cm4sIHNvIEkgdGhpbmsgeW91IGRvbid0IG5lZWQgdG8KPiBj
aGVjayAic2lnbmFsZWQiIGFnYWluLgoKaW4gdGhhdCBjYXNlLCB0aGUgZmllbGQgJ3NpZ25hbGVk
JyBpcyBub3QgbmVlZGVkIGFuZCBjYW4gYmUgcmVtb3ZlZApTbyBJIGNhbiBzZW5kIGEgcGF0Y2gg
dG8gcmVtb3ZlIGl0LgoKVGhhbmtzLApEYWZuYQoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFm
bmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4g
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYyB8IDQgKysr
LQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3Zw
dV9pZi5jCj4+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1X2lm
LmMKPj4gaW5kZXggMjM0NzA1YmE3Y2Q2Li44MzMxYjFiZDE5NzEgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jCj4+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jCj4+IEBAIC05Miw2
ICs5Miw3IEBAIHN0YXRpYyBpbnQgdnB1X2VuY19zZW5kX21zZyhzdHJ1Y3QgdmVuY192cHVfaW5z
dAo+PiAqdnB1LCB2b2lkICptc2csCj4+ICAgewo+PiAgIAlpbnQgc3RhdHVzOwo+PiAgIAo+PiAr
CXZwdS0+c2lnbmFsZWQgPSAwOwo+PiAgIAltdGtfdmNvZGVjX2RlYnVnX2VudGVyKHZwdSk7Cj4+
ICAgCj4+ICAgCWlmICghdnB1LT5jdHgtPmRldi0+ZndfaGFuZGxlcikgewo+PiBAQCAtMTA2LDYg
KzEwNyw4IEBAIHN0YXRpYyBpbnQgdnB1X2VuY19zZW5kX21zZyhzdHJ1Y3QgdmVuY192cHVfaW5z
dAo+PiAqdnB1LCB2b2lkICptc2csCj4+ICAgCQkJICAgICAgICoodWludDMyX3QgKiltc2csIGxl
biwgc3RhdHVzKTsKPj4gICAJCXJldHVybiAtRUlOVkFMOwo+PiAgIAl9Cj4+ICsJaWYgKCF2cHUt
PnNpZ25hbGVkKQo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gICAJaWYgKHZwdS0+ZmFpbHVyZSkK
Pj4gICAJCXJldHVybiAtRUlOVkFMOwo+PiAgIAo+PiBAQCAtMTIyLDcgKzEyNSw2IEBAIGludCB2
cHVfZW5jX2luaXQoc3RydWN0IHZlbmNfdnB1X2luc3QgKnZwdSkKPj4gICAJbXRrX3Zjb2RlY19k
ZWJ1Z19lbnRlcih2cHUpOwo+PiAgIAo+PiAgIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZ2cHUtPndx
X2hkKTsKPj4gLQl2cHUtPnNpZ25hbGVkID0gMDsKPj4gICAJdnB1LT5mYWlsdXJlID0gMDsKPj4g
ICAKPj4gICAJc3RhdHVzID0gbXRrX3Zjb2RlY19md19pcGlfcmVnaXN0ZXIodnB1LT5jdHgtPmRl
di0+ZndfaGFuZGxlciwKPj4gdnB1LT5pZCwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
