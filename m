Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84877C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C405611BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C405611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpAsxr46tPg7fnYwYPu13GAUAtCELb6GHpO7JqFTZac=; b=HFlH/6QegVca8E
	k6g55cQvPjDTwb1HTwOamvyYDMEfbSxke+I13jAtcFfwbvQ5HYKsl9hOegy9EvDAq4CV9KPOuNUiY
	cghxquvbibLP8uJvlNy82c8WFmh1Y5Zp4JTutm2BrPYypSf7dFLab7l/QB164I08ywccBjccpV1xO
	ygiwpd+8uI2TbRjn34mFQn08/JK53vhYutoR6jUY+mb9WoE57p2DCl0vNSlgZobHZlHjWWm9PSuFe
	qoLTeFiwVxOS1SQm0uUMuBiN1H8fmiMQ/Hg3A8jPdo5ZkprWykMo3mZCRDXTj8mGdrBY6nNbk8WNC
	6b1NC/pAcXOcaCkBAVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviIQ-007gYr-3U; Tue, 22 Jun 2021 15:26:38 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviIN-007gXF-Id; Tue, 22 Jun 2021 15:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2E9031B;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D102D3F718;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 938E46850D7; Tue, 22 Jun 2021 16:26:32 +0100 (BST)
Date: Tue, 22 Jun 2021 16:26:32 +0100
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
 michal.simek@xilinx.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 06/22] drm/malidp: Don't set struct
 drm_device.irq_enabled
Message-ID: <20210622152632.647akpp5nqcdfozk@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-7-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082635_754310_4C67726D 
X-CRM114-Status: GOOD (  17.00  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMDQ6MDk6NDZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZpZWxkIGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2Vk
IGJ5IGxlZ2FjeSBkcml2ZXJzCj4gd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNl
dCBpdCBpbiBtYWxpZHAuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9kcnYuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IGluZGV4IGRlNTlmMzMwMjUxNi4uNzhkMTVi
MDRiMTA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBAQCAtODQ3LDggKzg0Nyw2
IEBAIHN0YXRpYyBpbnQgbWFsaWRwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJaWYgKHJl
dCA8IDApCj4gIAkJZ290byBpcnFfaW5pdF9mYWlsOwo+ICAKPiAtCWRybS0+aXJxX2VuYWJsZWQg
PSB0cnVlOwo+IC0KPiAgCXJldCA9IGRybV92YmxhbmtfaW5pdChkcm0sIGRybS0+bW9kZV9jb25m
aWcubnVtX2NydGMpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAgCQlEUk1fRVJST1IoImZhaWxlZCB0
byBpbml0aWFsaXNlIHZibGFua1xuIik7Cj4gQEAgLTg3NCw3ICs4NzIsNiBAQCBzdGF0aWMgaW50
IG1hbGlkcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgdmJsYW5rX2ZhaWw6Cj4gIAltYWxp
ZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsKPiAt
CWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgaXJxX2luaXRfZmFpbDoKPiAgCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAljb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIGRy
bSk7Cj4gQEAgLTkwOSw3ICs5MDYsNiBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfdW5iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAlt
YWxpZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsK
PiAtCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgCWNvbXBvbmVudF91bmJpbmRfYWxsKGRl
diwgZHJtKTsKPiAgCW9mX25vZGVfcHV0KG1hbGlkcC0+Y3J0Yy5wb3J0KTsKPiAgCW1hbGlkcC0+
Y3J0Yy5wb3J0ID0gTlVMTDsKPiAtLSAKPiAyLjMyLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09
PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdy
ZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0t
LS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
