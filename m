Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62285C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 05:13:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1117961492
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 05:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1117961492
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7j5fXBLTbmpx2NCbBb246mShMJz2ligVg0eWRdQta0Q=; b=dnkJpKfHWvajxLRk4KB6O4e0N
	z07AHoGHW7XWPcIEikRA3rJ1WZ5EPxbAhHvaKsb2whclzsYwi4UJRyAplCVJEBRkUBFJYPEzykkY+
	7i8+HjlNX0787oEiIBtQRAbMiICgelv1NCinb3rwuONlee6jlxlJIpjtA7EAL7DG7kAWBEhuwG42j
	HfF3SgHCxmG4qBEbYxG3rpVfLnzqm12dVqSjlfyz2mcijvjLeH6jxbdwiAwZlRLMgCKbMfRSGgeT/
	0ihJrTWkAGVL24tdfd8K/oLNeuBmh0ORC31//eCxO+u3kfil/+wUYadL5TsdkKzoI2B6iMgq1R6Lq
	xqRvXuFNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6539-0004iY-FV; Sun, 31 Jan 2021 05:13:27 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6537-0004hs-P1
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 05:13:26 +0000
Received: by mail-io1-xd2a.google.com with SMTP id d13so13818980ioy.4
 for <linux-mediatek@lists.infradead.org>; Sat, 30 Jan 2021 21:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b9M8TJmZDwyrtjgKsvEvlpRNCVzQ223973tsROYzwTA=;
 b=dgFZhpJBVExa60g6NPDWpTo3obDotp5pfBHVxA9v4HbUiWa3Huxe3MlCrzTZ4ebVhC
 cTLkgIkO5OoDI62oV5J+63IGlN9Ew36mEV5j6hJr3itHJXE4S6QNLyaNADk7kn362Iec
 696G4Gs3oIS88/BfRPkZM6enoSFP7VytE2iIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b9M8TJmZDwyrtjgKsvEvlpRNCVzQ223973tsROYzwTA=;
 b=E0F0O1xeR3H5uajKUc0T4SxFhWQsMICNItT1MwDte+aUGmo4lTS01tBn+z/7ANOAg8
 LWezN91KIR2CBYFf0+b5H+IYmB+A2i69ut0roLLQGFsbD/6Z09YOV6/44xtYHEhKhNCY
 GsiHXAspVKpOOJnfgxgkjgq2p0clFinlPMz/SgUwwHJkpRy83Do47Drg27ivCjFhMAEK
 HxFeDF7X6AczVcfRWpxBwObZ5d7d47u5H9pVg6sgWuouV3TFPYlg8qznP9xgqrrZIr1F
 /rUAcA8Cpu7HtYcRFK3iu0uPLEVu/mZkW64YPr/DifU7vy03ijs4U/JNpI6hja1adU8d
 TVEQ==
X-Gm-Message-State: AOAM5303dK/xmQ4CBtbMAHYsb7nejE3C+qmt9TzqMtAiOSOgLTvGKOK5
 8+bCH4vcsUd7zyUb64J+fY4wD6ObilW5E2Ws0XDRdw==
X-Google-Smtp-Source: ABdhPJy92p4HESpnK7UKEIXXh4uQju71DMtrL4a7+osh3AUpuoLO1ym8islGZrNUyu2litzDwwEozvwGgin7xj6Dug4=
X-Received: by 2002:a05:6638:619:: with SMTP id
 g25mr9720692jar.43.1612070003530; 
 Sat, 30 Jan 2021 21:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-7-hsinyi@chromium.org>
 <CAAOTY_8rAAiiwtUJ_8nkp3WZKZ05Mo4oGxWnncywabGNHu3Ffg@mail.gmail.com>
In-Reply-To: <CAAOTY_8rAAiiwtUJ_8nkp3WZKZ05Mo4oGxWnncywabGNHu3Ffg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sun, 31 Jan 2021 13:12:57 +0800
Message-ID: <CAJMQK-hCuvpfAKMiLzi6DiFHdnrMcJ_gCOdoAt_PjKtGmAo1_A@mail.gmail.com>
Subject: Re: [PATCH v13 6/8] drm/mediatek: enable dither function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_001325_858106_105202A1 
X-CRM114-Status: GOOD (  26.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKYW4gMzEsIDIwMjEgYXQgMTE6NDAgQU0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEhzaW4tWWk6Cj4KPiBIc2luLVlpIFdhbmcg
PGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MeaciDI55pelIOmAseS6lCDkuIvljYg1
OjIz5a+r6YGT77yaCj4gPgo+ID4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gPgo+ID4gRW5hYmxlIGRpdGhlciBmdW5jdGlvbiB0byBpbXByb3ZlIHRo
ZSBkaXNwbGF5IHF1YWxpdHkgZm9yIGRpdGhlcgo+ID4gc3VwcG9ydGVkIGJwYyA0LCA2LCA4LiBG
b3Igbm90IHN1cHBvcnRlZCBicGMsIHVzZSByZWxheSBtb2RlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDE1ICsrKysrKysr
KysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+ID4gaW5kZXggYWMyY2IyNTYyMDM1Ny4uNTc2MWRkMTVlZWRmMiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiA+IEBAIC01Myw2ICs1
Myw3IEBACj4gPiAgI2RlZmluZSBESVRIRVJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoMCkKPiA+ICAjZGVmaW5lIERJU1BfRElUSEVSX0NGRyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMHgwMDIwCj4gPiAgI2RlZmluZSBESVRIRVJfUkVMQVlfTU9ERSAgICAgICAg
ICAgICAgICAgICAgICBCSVQoMCkKPiA+ICsjZGVmaW5lIERJVEhFUl9FTkdJTkVfRU4gICAgICAg
ICAgICAgICAgICAgICAgIEJJVCgxKQo+ID4gICNkZWZpbmUgRElTUF9ESVRIRVJfU0laRSAgICAg
ICAgICAgICAgICAgICAgICAgMHgwMDMwCj4gPgo+ID4gICNkZWZpbmUgTFVUXzEwQklUX01BU0sg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwM2ZmCj4gPiBAQCAtMzE0LDkgKzMxNSwxNyBAQCBz
dGF0aWMgdm9pZCBtdGtfZGl0aGVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCB3LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJw
Yywgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiA+ICB7Cj4gPiAgICAgICAgIHN0cnVjdCBt
dGtfZGRwX2NvbXBfZGV2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiAtCj4gPiAt
ICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCAmcHJpdi0+Y21kcV9y
ZWcsIHByaXYtPnJlZ3MsIERJU1BfRElUSEVSX1NJWkUpOwo+ID4gLSAgICAgICBtdGtfZGRwX3dy
aXRlKGNtZHFfcGt0LCBESVRIRVJfUkVMQVlfTU9ERSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5y
ZWdzLCBESVNQX0RJVEhFUl9DRkcpOwo+ID4gKyAgICAgICBib29sIHZhbGlkX2JwYyA9IChicGMg
PT0gNCB8fCBicGMgPT0gNiB8fCBicGMgPT0gOCk7Cj4gPiArCj4gPiArICAgICAgIG10a19kZHBf
d3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3Ms
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgRElTUF9ESVRIRVJfU0laRSk7Cj4gPiArICAgICAg
IGlmICh2YWxpZF9icGMpCj4gPiArICAgICAgICAgICAgICAgbXRrX2RpdGhlcl9zZXRfY29tbW9u
KHByaXYtPnJlZ3MsICZwcml2LT5jbWRxX3JlZywgYnBjLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBESVNQX0RJVEhFUl9DRkcsIERJVEhFUl9FTkdJTkVfRU4sCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfcGt0KTsKPiA+ICsg
ICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIERJ
VEhFUl9SRUxBWV9NT0RFLCAmcHJpdi0+Y21kcV9yZWcsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwcml2LT5yZWdzLCBESVNQX0RJVEhFUl9DRkcpOwo+Cj4gb2QgaGFzIHJlbGF5
IG1vZGUsCj4KPiBzdGF0aWMgdm9pZCBtdGtfb2RfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAg
KmNvbXAsIHVuc2lnbmVkIGludCB3LAo+ICAgdW5zaWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2
cmVmcmVzaCwKPiAgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3Qp
Cj4gewo+IG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHcgPDwgMTYgfCBoLCBjb21wLCBESVNQX09E
X1NJWkUpOwo+IG10a19kZHBfd3JpdGUoY21kcV9wa3QsIE9EX1JFTEFZTU9ERSwgY29tcCwgRElT
UF9PRF9DRkcpOwo+IG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9PRF9DRkcsIGNtZHFf
cGt0KTsKPiB9Cj4KPiBhbmQgaXQgZG9lcyBub3QgY2hlY2sgdmFsaWQgYnBjIChJIHRoaW5rIGRy
bSBjb3JlIGFscmVhZHkgc2V0IGJwYyB0bwo+IDQsIDYsIDggb3IgMCksIHNvIGFsaWduIGltcGxl
bWVudGF0aW9uIG9mIG10a19kaXRoZXJfY29uZmlnKCkgd2l0aAo+IG10a19vZF9jb25maWcoKS4K
PiBnYW1tYSBhbHNvIGhhcyByZWxheSBtb2RlIChyZWZlciB0byBbMV0gcGFnZSA2ODkpLCBidXQg
d2UgbmVlZCB0bwo+IGVuYWJsZSBnYW1tYSdzIGdhbW1hIGZ1bmN0aW9uLCBzbyB3ZSBkbyBub3Qg
c2V0IGdhbW1hIHRvIHJlbGF5IG1vZGUuCj4gU28gSSB0aGluayBtYXliZSB3ZSBjb3VsZCBpbXBs
ZW1lbnQgbXRrX2RpdGhlcl9jb25maWcoKSBhczoKPgo+IG10a19kaXRoZXJfY29uZmlnKCkKPiB7
Cj4gICAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgJnByaXYtPmNt
ZHFfcmVnLAo+IHByaXYtPnJlZ3MsIERJU1BfRElUSEVSX1NJWkUpOwo+ICAgICAgICAgbXRrX2Rk
cF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01PREUsICZwcml2LT5jbWRxX3JlZywKPiBw
cml2LT5yZWdzLCBESVNQX0RJVEhFUl9DRkcpOwo+ICAgICAgICAgbXRrX2RpdGhlcl9zZXRfY29t
bW9uKHByaXYtPnJlZ3MsICZwcml2LT5jbWRxX3JlZywgYnBjLAo+IERJU1BfRElUSEVSX0NGRywg
RElUSEVSX0VOR0lORV9FTiwgY21kcV9wa3QpOwo+IH0KPgo+IFsxXSBodHRwczovL3d3dy45NmJv
YXJkcy5vcmcvZG9jdW1lbnRhdGlvbi9jb25zdW1lci9tZWRpYXRla3gyMC9hZGRpdGlvbmFsLWRv
Y3MvZG9jcy9NVDY3OTdfUmVnaXN0ZXJfVGFibGVfUGFydF8yLnBkZgo+Cj4gUmVnYXJkcywKPiBD
aHVuLUt1YW5nLgo+CkhpIENLLAoKSSBzZW5kIHRoZSBwYXRjaCBoZXJlOgpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTAxMzEwNTEw
NTguMzQwNzk4NS0xLWhzaW55aUBjaHJvbWl1bS5vcmcvCmFzIG90aGVycyBhcmUgYWxyZWFkeSBt
ZXJnZWQgdG8gdGhlIHRyZWUuCgpUaGFua3MKCj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBt
dGtfZGl0aGVyX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+IC0tCj4gPiAyLjMwLjAuMzY1
LmcwMmJjNjkzNzg5LWdvb2cKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4g
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
