Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59EEC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 07:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D19460F25
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 07:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D19460F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k86S/Dm5QZco18I1zWYr+m8HEj6qFMKIQZZCFE/l0Vw=; b=VwwNJJ9LWWuF9prMkack6nwUsa
	5ZJJbQgb79X+VkkH+s5796UD2maMcOuzFJYZGEd7k3Q8AiB444QblT1ySRd5QBkK2HoL6EBq+blcB
	oENv5Pd1+io88I6cxiwHoRDrAXz2AuJBeczNcGQ/OuGFbQ5uElzgs363gEMwokO+XknKFK0miTkYS
	u40AO7X3zzbBWARZu/pZsghqV6QS4wdnOIrgrO8gkD7j9xUg8ekt2mEYa/U+OZkRWAf+1oORfZUW1
	ik7Y6NZ+19L6KnP8dh00epHMAb5LkkVmNUAy+XS/O6WhOnSwDCqq0QK5d2CBg92CgqwHiLKo3kDXs
	LxmycEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBub1-00BnFy-3A; Fri, 06 Aug 2021 07:48:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBuay-00BnF2-Ky
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 07:48:46 +0000
Received: from [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a] (unknown
 [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1183D1F443F8;
 Fri,  6 Aug 2021 08:48:42 +0100 (BST)
Subject: Re: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq
 handling
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
 <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
 <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f343f406-111b-326f-3671-094e699a3aa6@collabora.com>
Date: Fri, 6 Aug 2021 09:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_004844_859369_882069FA 
X-CRM114-Status: GOOD (  21.25  )
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

CgpPbiAwNi4wOC4yMSAwODo1OCwgSXJ1aSBXYW5nICjnjovnkZ4pIHdyb3RlOgo+IE9uIFdlZCwg
MjAyMS0wOC0wNCBhdCAxNjoyNyArMDIwMCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToKPj4gMS4g
RmFpbCBpZiB0aGUgZnVuY3Rpb24gbXRrX3Zjb2RlY19md19tYXBfZG1fYWRkcgo+PiByZXR1cm5z
IEVSUiBwb2ludGVyLgo+PiAyLiBGYWlsIGlmIHRoZSBzdGF0ZSBmcm9tIHRoZSB2cHUgbXNnIGlz
IGVpdGhlcgo+PiBWRU5fSVBJX01TR19FTkNfU1RBVEVfRVJST1Igb3IgVkVOX0lQSV9NU0dfRU5D
X1NUQVRFX1BBUlQKPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEu
aGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYyB8IDggKysrKysrKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYwo+PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jCj4+IGluZGV4IDMyZGM4NDRkMTZmOS4uMjM0NzA1
YmE3Y2Q2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
dmVuY192cHVfaWYuYwo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
dmVuY192cHVfaWYuYwo+PiBAQCAtMTcsNiArMTcsOCBAQCBzdGF0aWMgaW50IGhhbmRsZV9lbmNf
aW5pdF9tc2coc3RydWN0IHZlbmNfdnB1X2luc3QKPj4gKnZwdSwgY29uc3Qgdm9pZCAqZGF0YSkK
Pj4gICAJdnB1LT52c2kgPSBtdGtfdmNvZGVjX2Z3X21hcF9kbV9hZGRyKHZwdS0+Y3R4LT5kZXYt
PmZ3X2hhbmRsZXIsCj4+ICAgCQkJCQkgICAgIG1zZy0+dnB1X2luc3RfYWRkcik7Cj4+ICAgCj4+
ICsJaWYgKElTX0VSUih2cHUtPnZzaSkpCj4+ICsJCXJldHVybiBQVFJfRVJSKHZwdS0+dnNpKTsK
Pj4gICAJLyogRmlybXdhcmUgdmVyc2lvbiBmaWVsZCB2YWx1ZSBpcyB1bnNwZWNpZmllZCBvbiBN
VDgxNzMuICovCj4+ICAgCWlmICh2cHUtPmN0eC0+ZGV2LT52ZW5jX3BkYXRhLT5jaGlwID09IE1U
S19NVDgxNzMpCj4+ICAgCQlyZXR1cm4gMDsKPj4gQEAgLTQyLDYgKzQ0LDEyIEBAIHN0YXRpYyBp
bnQgaGFuZGxlX2VuY19lbmNvZGVfbXNnKHN0cnVjdAo+PiB2ZW5jX3ZwdV9pbnN0ICp2cHUsIGNv
bnN0IHZvaWQgKmRhdGEpCj4+ICAgCXZwdS0+c3RhdGUgPSBtc2ctPnN0YXRlOwo+PiAgIAl2cHUt
PmJzX3NpemUgPSBtc2ctPmJzX3NpemU7Cj4+ICAgCXZwdS0+aXNfa2V5X2ZybSA9IG1zZy0+aXNf
a2V5X2ZybTsKPj4gKwlpZiAodnB1LT5zdGF0ZSA9PSBWRU5fSVBJX01TR19FTkNfU1RBVEVfRVJS
T1IgfHwKPj4gKwkgICAgdnB1LT5zdGF0ZSA9PSBWRU5fSVBJX01TR19FTkNfU1RBVEVfUEFSVCkg
ewo+PiArCQltdGtfdmNvZGVjX2Vycih2cHUsICJiYWQgaXBpLWVuYy1zdGF0ZTogJXMiLAo+PiAr
CQkJICAgICAgIHZwdS0+c3RhdGUgPT0KPj4gVkVOX0lQSV9NU0dfRU5DX1NUQVRFX0VSUk9SID8g
IkVSUiIgOiAiUEFSVCIpOwo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwl9Cj4gCj4gSGkgRGFm
bmEsCj4gCj4gVGhpcyBzdGF0ZSBjaGVjayBpcyB1c2VsZXNzLCB0aGUgZW5jIHJlc3VsdCB3aWxs
IGNoZWNrIGluCj4gInZwdV9lbmNfaXBpX2hhbmRsZXIiLgo+IAoKSGksIHRoYW5rcyBmb3IgcmV2
aWV3aW5nLiBJIHNlZSB0aGF0IHRoZSB2cHVfZW5jX2lwaV9oYW5kbGVyIG9ubHkgdGVzdCB0aGUg
bXNnLT5zdGF0dXMKYW5kIEkgc2VlIHRoYXQgdGhlIHN0YXRlcyBhcmUgbm90IHRlc3RlZCBhbnl3
aGVyZSBleGNlcHQgb2YgInNraXAiIHN0YXRlIGluIHRoZSBoMjY0IGVuYy4KCkNhbid0IHRoZXJl
IGJlIGEgc2NlbmFyaW8gd2hlcmUgbXNnLT5zdGF0dXMgaXMgb2sgYnV0IHRoZSBzdGF0ZSBpcyBl
cnJvcj8KSSBhbSB0ZXN0aW5nIHRoZSB2cDggZW5jb2RlciBvbiBjaHJvbWVvcyBhbmQgYXQgc29t
ZSBwb2ludCB0aGUgZW5jb2RlciBpbnRlcnJ1cHRzIHN0b3AgYXJyaXZpbmcKc28gSSB0cnkgdG8g
ZmlndXJlIG91dCB3aHkgYW5kIHJlcG9ydCBhbnkgcG9zc2libGUgZXJyb3IuCgpUaGFua3MsCkRh
Zm5hCgo+IFRoYW5rcwo+IAo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+ICAgCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
