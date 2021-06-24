Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D25C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5B2613E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 10:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5B2613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAHVxBQ0jzHyzB04vTfRVlPqHkAOAmpxWMWWXFL0ptc=; b=NYT6j2a6Wwq6ko
	zYRUa5juDp+OKVT+usm8+sbwLrdv2dN7nWXH64hoMFRs3PzeCv7i0STWQzaou0/W8Qq9btz2M/nG7
	phZAfHQYsy7AZt760WSDus9Nc1L2tT4p8hllMAI4KQ4LQkt139m2HWbQCsdIu0z5pXOyoiOF8IruI
	/8SMlojCQC/f7Zb2mbafeORvqDJwTVD2ilxtGngfwFap2FsYnyOjNSF7FLgnr/77DKdZ/uKFGuxzK
	hicwiqJoZ+yGfeaOkNl4A9tebMU0vYmJpms9NK0OXhDuKpTpdPzdyMqoXtAJ3w4lFhlQjnQZF/aXI
	O74L+gMBW4itvV8Maqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwMd2-00E6u8-9q; Thu, 24 Jun 2021 10:30:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwMa9-00E5Su-D7; Thu, 24 Jun 2021 10:27:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051AA31B;
 Thu, 24 Jun 2021 03:27:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA68A3F718;
 Thu, 24 Jun 2021 03:27:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 75E09684F2B; Thu, 24 Jun 2021 11:27:32 +0100 (BST)
Date: Thu, 24 Jun 2021 11:27:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com,
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
 michal.simek@xilinx.com, rodrigo.vivi@intel.com,
 linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210624102732.3h7lnsik7mkbphgw@e110455-lin.cambridge.arm.com>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
 <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
 <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_032737_618239_B1BF5BF9 
X-CRM114-Status: GOOD (  27.75  )
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

T24gVGh1LCBKdW4gMjQsIDIwMjEgYXQgMTE6MDc6NTdBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyNC4wNi4yMSB1bSAxMDo1MSBzY2hyaWViIEphbmkgTmlr
dWxhOgo+ID4gT24gVGh1LCAyNCBKdW4gMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4gPiBIaQo+ID4gPiAKPiA+ID4gQW0gMjQuMDYuMjEgdW0g
MTA6MDYgc2NocmllYiBKYW5pIE5pa3VsYToKPiA+ID4gPiBPbiBUaHUsIDI0IEp1biAyMDIxLCBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKPiA+ID4gPiA+IGluZGV4IDM0MTdlMWFjNzkxOC4uMTBmZTE2YmFmY2I2
IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gPiA+ID4gQEAgLTE3
NDgsOCArMTc0OCwxNiBAQCBpbnQgZHJtX3dhaXRfdmJsYW5rX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiA+ID4gPiAgICAJdW5zaWduZWQgaW50IHBpcGVfaW5k
ZXg7Cj4gPiA+ID4gPiAgICAJdW5zaWduZWQgaW50IGZsYWdzLCBwaXBlLCBoaWdoX3BpcGU7Cj4g
PiA+ID4gPiAtCWlmICghZGV2LT5pcnFfZW5hYmxlZCkKPiA+ID4gPiA+IC0JCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPiA+ID4gPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfRFJNX0xFR0FDWSkKPiA+ID4g
PiA+ICsJaWYgICh1bmxpa2VseShkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0xF
R0FDWSkpKSB7Cj4gPiA+ID4gPiArCQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gPiA+ID4gPiAr
CQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+ID4gKwl9IGVsc2UgLyogaWYgRFJJVkVSX01P
REVTRVQgKi8KPiA+ID4gPiA+ICsjZW5kaWYKPiA+ID4gPiA+ICsJewo+ID4gPiA+ID4gKwkJaWYg
KCFkcm1fZGV2X2hhc192YmxhbmsoZGV2KSkKPiA+ID4gPiA+ICsJCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiA+ID4gPiArCX0KPiA+ID4gPiAKPiA+ID4gPiBTaGVlc2ggSSBoYXRlIHRoaXMga2lu
ZCBvZiBpbmxpbmUgI2lmZGVmcy4KPiA+ID4gPiAKPiA+ID4gPiBUd28gYWx0ZXJuYXRlIHN1Z2dl
c3Rpb25zIHRoYXQgSSBiZWxpZXZlIHNob3VsZCBiZSBhcyBqdXN0IGVmZmljaWVudDoKPiA+ID4g
Cj4gPiA+IE9yIGhvdyBhYm91dDoKPiA+ID4gCj4gPiA+IHN0YXRpYyBib29sIGRybV93YWl0X3Zi
bGFua19zdXBwb3J0ZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+ID4gCj4gPiA+IHsKPiA+
ID4gCj4gPiA+IGlmIGRlZmluZWQoQ09ORklHX0RSTV9MRUdBQ1kpCj4gPiA+IAlpZiAgKHVubGlr
ZWx5KGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTEVHQUNZKSkpCj4gPiA+IAo+
ID4gPiAJCXJldHVybiBkZXYtPmlycV9lbmFibGVkOwo+ID4gPiAKPiA+ID4gI2VuZGlmCj4gPiA+
IAlyZXR1cm4gZHJtX2Rldl9oYXNfdmJsYW5rKGRldik7Cj4gPiA+IAo+ID4gPiB9Cj4gPiA+IAo+
ID4gPiAKPiA+ID4gPwo+ID4gPiAKPiA+ID4gSXQncyBpbmxpbmUsIGJ1dCBzdGlsbCByZWFkYWJs
ZS4KPiA+IAo+ID4gSXQncyBkZWZpbml0ZWx5IGJldHRlciB0aGFuIHRoZSBvcmlnaW5hbCwgYnV0
IGl0J3MgdW5jbGVhciB0byBtZSB3aHkKPiA+IHlvdSdkIHByZWZlciB0aGlzIG92ZXIgb3B0aW9u
IDIpIGJlbG93LiBJIGd1ZXNzIHRoZSBvbmx5IHJlYXNvbiBJIGNhbgo+ID4gdGhpbmsgb2YgaXMg
ZW1waGFzaXppbmcgdGhlIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLiBIb3dldmVyLAo+ID4gSVNf
RU5BQkxFRCgpIGlzIHdpZGVseSB1c2VkIGluIHRoaXMgbWFubmVyIHNwZWNpZmljYWxseSB0byBh
dm9pZCBpbmxpbmUKPiA+ICNpZiwgYW5kIHRoZSBjb21waWxlciBvcHRpbWl6ZXMgaXQgYXdheS4K
PiAKPiBJdCdzIHNpbXBseSBtb3JlIHJlYWRhYmxlIHRvIG1lIGFzIHRoZSBjb25kaXRpb24gaXMg
c2ltcGxlci4gQnV0IG9wdGlvbiAyIGlzCj4gYWxzbyBvay4KCkVpdGhlciBvcHRpb24gbG9va3Mg
Z29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNv
bT4KClRoYW5rcyBmb3IgZG9pbmcgdGhhdCEKTGl2aXUKCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhv
bWFzCj4gCj4gPiAKPiA+IEJSLAo+ID4gSmFuaS4KPiA+IAo+ID4gCj4gPiA+IAo+ID4gPiBCZXN0
IHJlZ2FyZHMKPiA+ID4gVGhvbWFzCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IDEpIFRoZSBtb3Jl
IHZlcmJvc2U6Cj4gPiA+ID4gCj4gPiA+ID4gI2lmIGRlZmluZWQoQ09ORklHX0RSTV9MRUdBQ1kp
Cj4gPiA+ID4gc3RhdGljIGJvb2wgZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQo+ID4gPiA+IHsKPiA+ID4gPiAJaWYgICh1bmxpa2VseShkcm1fY29yZV9j
aGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0xFR0FDWSkpKQo+ID4gPiA+IAkJcmV0dXJuIGRldi0+
aXJxX2VuYWJsZWQ7Cj4gPiA+ID4gCWVsc2UKPiA+ID4gPiAJCXJldHVybiBkcm1fZGV2X2hhc192
YmxhbmsoZGV2KTsKPiA+ID4gPiB9Cj4gPiA+ID4gI2Vsc2UKPiA+ID4gPiBzdGF0aWMgYm9vbCBk
cm1fd2FpdF92Ymxhbmtfc3VwcG9ydGVkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPiA+ID4g
ewo+ID4gPiA+IAlyZXR1cm4gZHJtX2Rldl9oYXNfdmJsYW5rKGRldik7Cj4gPiA+ID4gfQo+ID4g
PiA+ICNlbmRpZgo+ID4gPiA+IAo+ID4gPiA+IDIpIFRoZSBtb3JlIGNvbXBhY3Q6Cj4gPiA+ID4g
Cj4gPiA+ID4gc3RhdGljIGJvb2wgZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQo+ID4gPiA+IHsKPiA+ID4gPiAJaWYgIChJU19FTkFCTEVEKENPTkZJR19E
Uk1fTEVHQUNZKSAmJiB1bmxpa2VseShkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVS
X0xFR0FDWSkpKQo+ID4gPiA+IAkJcmV0dXJuIGRldi0+aXJxX2VuYWJsZWQ7Cj4gPiA+ID4gCWVs
c2UKPiA+ID4gPiAJCXJldHVybiBkcm1fZGV2X2hhc192YmxhbmsoZGV2KTsKPiA+ID4gPiB9Cj4g
PiA+ID4gCj4gPiA+ID4gVGhlbiwgaW4gZHJtX3dhaXRfdmJsYW5rX2lvY3RsKCkuCj4gPiA+ID4g
Cj4gPiA+ID4gCWlmICghZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChkZXYpKQo+ID4gPiA+IAkJ
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+IAo+ID4gPiA+IFRoZSBjb21waWxlciBzaG91bGQg
ZG8gdGhlIHJpZ2h0IHRoaW5nIHdpdGhvdXQgYW55IGV4cGxpY2l0IGlubGluZQo+ID4gPiA+IGtl
eXdvcmRzIGV0Yy4KPiA+ID4gPiAKPiA+ID4gPiBCUiwKPiA+ID4gPiBKYW5pLgo+ID4gPiA+IAo+
ID4gPiA+ID4gICAgCWlmICh2Ymx3YWl0LT5yZXF1ZXN0LnR5cGUgJiBfRFJNX1ZCTEFOS19TSUdO
QUwpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gQEAgLTIwMjMsNyAr
MjAzMSw3IEBAIGludCBkcm1fY3J0Y19nZXRfc2VxdWVuY2VfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4gPiA+ICAgIAlpZiAoIWRybV9jb3JlX2NoZWNrX2Zl
YXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRU9QTk9U
U1VQUDsKPiA+ID4gPiA+IC0JaWYgKCFkZXYtPmlycV9lbmFibGVkKQo+ID4gPiA+ID4gKwlpZiAo
IWRybV9kZXZfaGFzX3ZibGFuayhkZXYpKQo+ID4gPiA+ID4gICAgCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiA+ID4gPiAgICAJY3J0YyA9IGRybV9jcnRjX2ZpbmQoZGV2LCBmaWxlX3ByaXYsIGdl
dF9zZXEtPmNydGNfaWQpOwo+ID4gPiA+ID4gQEAgLTIwODIsNyArMjA5MCw3IEBAIGludCBkcm1f
Y3J0Y19xdWV1ZV9zZXF1ZW5jZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ID4gPiA+ID4gICAgCWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZF
Ul9NT0RFU0VUKSkKPiA+ID4gPiA+ICAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+ID4g
LQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gPiA+ID4gPiArCWlmICghZHJtX2Rldl9oYXNfdmJs
YW5rKGRldikpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gPiA+ICAg
IAljcnRjID0gZHJtX2NydGNfZmluZChkZXYsIGZpbGVfcHJpdiwgcXVldWVfc2VxLT5jcnRjX2lk
KTsKPiA+ID4gPiAKPiA+IAo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4gCgoK
CgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUg
d29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3Vy
Y2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
