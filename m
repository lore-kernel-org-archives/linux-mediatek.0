Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B75C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32CBC600D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32CBC600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MR0f5XCUUVuos+YYV1FFYISfNZmIilKaXnDIQ5/RGw=; b=gvV6FGCOb6MlNv
	g/pTV/ZWS8aDAku4bJO6T/5obGlTA7zNqJ7hiTs3x4D21TPFBSuFIQk7u8V1JV6cVV/R0EvDfSfAP
	wyEY45GrXXPoJQ9ydmIgcgzZhT2mv4Jm6moRxTlBtipfnQ4h807+I0pVDkQ/YX/5WsVQu1Hcs9z7c
	lkxamZTVEcEJeQP3fRcT7Wa3+Rh5xrOSOKE6q+DBpRZAGxfKxaFCMjfCbuB8/DvydOqbTKBgW1Hw4
	pr8E9hnffNCqWJ/+N1rDE+XNOE5/rmdtM7EdNN8adWvB+YQO27jvah4mVCG9zIhmncdv1giw5z8AU
	dmonPeIBPOgtEf8rr6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviHp-007gNQ-K3; Tue, 22 Jun 2021 15:26:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviHm-007gLz-C9; Tue, 22 Jun 2021 15:26:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2F9DED1;
 Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E2263F718;
 Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 63299683943; Tue, 22 Jun 2021 16:25:54 +0100 (BST)
Date: Tue, 22 Jun 2021 16:25:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com,
 james.qian.wang@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/22] drm/komeda: Don't set struct
 drm_device.irq_enabled
Message-ID: <20210622152554.vc7mnohj5u2trxpi@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082558_538027_75062906 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMDQ6MDk6NDVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZpZWxkIGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2Vk
IGJ5IGxlZ2FjeSBkcml2ZXJzCj4gd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNl
dCBpdCBpbiBrb21lZGEuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuYwo+IGluZGV4IGZmNDVmMjNmM2Q1Ni4uNTJhNmRiNTcwN2EzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMK
PiBAQCAtMzAxLDggKzMwMSw2IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19h
dHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gZnJl
ZV9jb21wb25lbnRfYmluZGluZzsKPiAgCj4gLQlkcm0tPmlycV9lbmFibGVkID0gdHJ1ZTsKPiAt
Cj4gIAlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKPiAgCj4gIAllcnIgPSBkcm1fZGV2
X3JlZ2lzdGVyKGRybSwgMCk7Cj4gQEAgLTMxMyw3ICszMTEsNiBAQCBzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmtvbWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAKPiAg
ZnJlZV9pbnRlcnJ1cHRzOgo+ICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4gLQlk
cm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gIGZyZWVfY29tcG9uZW50X2JpbmRpbmc6Cj4gIAlj
b21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gIGNsZWFudXBfbW9kZV9jb25m
aWc6Cj4gQEAgLTMzMSw3ICszMjgsNiBAQCB2b2lkIGtvbWVkYV9rbXNfZGV0YWNoKHN0cnVjdCBr
b21lZGFfa21zX2RldiAqa21zKQo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7Cj4gIAlkcm1f
a21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiAgCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KGRybSk7Cj4gLQlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gIAljb21wb25lbnRfdW5iaW5k
X2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwo+
ICAJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMpOwo+IC0tIAo+IDIuMzIuMAo+
IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhl
IHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291
cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
