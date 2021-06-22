Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BCBC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:25:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18C06023F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18C06023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eb/QZ8hyVFBn+NpUrxmfZIOP/CMAHkV5NYZUps2P+M=; b=ZWMomMfpa/GRiF
	NcHaspkmqRo7LRbVqMqulIJAAHILkev/qMd0vAaPHFAOYvjvxL9fvGeZEzCmca/KHbHs6BBoVtWCl
	JjGVkOJ+rOhnCTCNGifJt1CGZHIPCx+zNAKV3lYMyw4RDv7DvNUiQ52puVOtoS1toAShfv40S4S62
	rjI378AgFGVQZjZ3D9SguV2+5U315E6/fid1eLqTvPs6Ck/oHXCnrmhCjkPp8zURlGMxwYYl3Cy37
	tByaXJGUyfOciQuOK9LFzNCHJVemkCwpOG1HY+JrvftEMCqzuxwzJgEJ4Lb6r9+HRDdRuH7OloMki
	Ypl6W7vYliDhbABfipfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviH3-007g8b-L7; Tue, 22 Jun 2021 15:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviH0-007g6f-D9; Tue, 22 Jun 2021 15:25:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C59731B;
 Tue, 22 Jun 2021 08:25:06 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1ECC3F718;
 Tue, 22 Jun 2021 08:25:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 7C5A86837C9; Tue, 22 Jun 2021 16:25:04 +0100 (BST)
Date: Tue, 22 Jun 2021 16:25:04 +0100
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
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-5-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082510_612235_5A4619D0 
X-CRM114-Status: GOOD (  28.24  )
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

SGVsbG8sCgpPbiBUdWUsIEp1biAyMiwgMjAyMSBhdCAwNDowOTo0NFBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiBGb3IgS01TIGRyaXZlcnMsIHJlcGxhY2UgdGhlIElSUSBjaGVj
ayBpbiBWQkxBTksgaW9jdGxzIHdpdGggYSBjaGVjayBmb3IKPiB2Ymxhbmsgc3VwcG9ydC4gSVJR
cyBtaWdodCBiZSBlbmFibGVkIHd0aG91dCB2YmxhbmtpbmcgYmVpbmcgc3VwcG9ydGVkLgo+IAo+
IFRoaXMgY2hhbmdlIGFsc28gcmVtb3ZlcyB0aGUgRFJNIGZyYW1ld29yaydzIG9ubHkgZGVwZW5k
ZW5jeSBvbiBJUlEgc3RhdGUKPiBmb3Igbm9uLWxlZ2FjeSBkcml2ZXJzLiBGb3IgbGVnYWN5IGRy
aXZlcnMgd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcsCj4gdGhlIG9yaWdpbmFsIHRlc3QgcmVt
YWlucyBpbiBkcm1fd2FpdF92YmxhbmtfaW9jdGwoKS4KPiAKPiB2MjoKPiAJKiBrZWVwIHRoZSBv
bGQgdGVzdCBmb3IgbGVnYWN5IGRyaXZlcnMgaW4KPiAJICBkcm1fd2FpdF92YmxhbmtfaW9jdGwo
KSAoRGFuaWVsKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jICAgIHwgMTAg
KysrLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTMgKysrKysrKysr
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9pcnEuYwo+IGluZGV4IGMzYmQ2NjRlYTczMy4uMWQ3Nzg1NzIxMzIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2lycS5jCj4gQEAgLTc0LDEwICs3NCw4IEBACj4gICAqIG9ubHkgc3VwcG9ydHMgZGV2
aWNlcyB3aXRoIGEgc2luZ2xlIGludGVycnVwdCBvbiB0aGUgbWFpbiBkZXZpY2Ugc3RvcmVkIGlu
Cj4gICAqICZkcm1fZGV2aWNlLmRldiBhbmQgc2V0IGFzIHRoZSBkZXZpY2UgcGFyYW10ZXIgaW4g
ZHJtX2Rldl9hbGxvYygpLgo+ICAgKgo+IC0gKiBUaGVzZSBJUlEgaGVscGVycyBhcmUgc3RyaWN0
bHkgb3B0aW9uYWwuIERyaXZlcnMgd2hpY2ggcm9sbCB0aGVpciBvd24gb25seQo+IC0gKiBuZWVk
IHRvIHNldCAmZHJtX2RldmljZS5pcnFfZW5hYmxlZCB0byBzaWduYWwgdGhlIERSTSBjb3JlIHRo
YXQgdmJsYW5rCj4gLSAqIGludGVycnVwdHMgYXJlIHdvcmtpbmcuIFNpbmNlIHRoZXNlIGhlbHBl
cnMgZG9uJ3QgYXV0b21hdGljYWxseSBjbGVhbiB1cCB0aGUKPiAtICogcmVxdWVzdGVkIGludGVy
cnVwdCBsaWtlIGUuZy4gZGV2bV9yZXF1ZXN0X2lycSgpIHRoZXkncmUgbm90IHJlYWxseQo+ICsg
KiBUaGVzZSBJUlEgaGVscGVycyBhcmUgc3RyaWN0bHkgb3B0aW9uYWwuIFNpbmNlIHRoZXNlIGhl
bHBlcnMgZG9uJ3QgYXV0b21hdGljYWxseQo+ICsgKiBjbGVhbiB1cCB0aGUgcmVxdWVzdGVkIGlu
dGVycnVwdCBsaWtlIGUuZy4gZGV2bV9yZXF1ZXN0X2lycSgpIHRoZXkncmUgbm90IHJlYWxseQo+
ICAgKiByZWNvbW1lbmRlZC4KPiAgICovCj4gIAo+IEBAIC05MSw5ICs4OSw3IEBACj4gICAqIGFu
ZCBhZnRlciB0aGUgaW5zdGFsbGF0aW9uLgo+ICAgKgo+ICAgKiBUaGlzIGlzIHRoZSBzaW1wbGlm
aWVkIGhlbHBlciBpbnRlcmZhY2UgcHJvdmlkZWQgZm9yIGRyaXZlcnMgd2l0aCBubyBzcGVjaWFs
Cj4gLSAqIG5lZWRzLiBEcml2ZXJzIHdoaWNoIG5lZWQgdG8gaW5zdGFsbCBpbnRlcnJ1cHQgaGFu
ZGxlcnMgZm9yIG11bHRpcGxlCj4gLSAqIGludGVycnVwdHMgbXVzdCBpbnN0ZWFkIHNldCAmZHJt
X2RldmljZS5pcnFfZW5hYmxlZCB0byBzaWduYWwgdGhlIERSTSBjb3JlCj4gLSAqIHRoYXQgdmJs
YW5rIGludGVycnVwdHMgYXJlIGF2YWlsYWJsZS4KPiArICogbmVlZHMuCj4gICAqCj4gICAqIEBp
cnEgbXVzdCBtYXRjaCB0aGUgaW50ZXJydXB0IG51bWJlciB0aGF0IHdvdWxkIGJlIHBhc3NlZCB0
byByZXF1ZXN0X2lycSgpLAo+ICAgKiBpZiBjYWxsZWQgZGlyZWN0bHkgaW5zdGVhZCBvZiB1c2lu
ZyB0aGlzIGhlbHBlciBmdW5jdGlvbi4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCAzNDE3ZTFh
Yzc5MTguLmE5OGE0YWFkNTAzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zi
bGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IEBAIC0xNzQ4LDgg
KzE3NDgsMTMgQEAgaW50IGRybV93YWl0X3ZibGFua19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLAo+ICAJdW5zaWduZWQgaW50IHBpcGVfaW5kZXg7Cj4gIAl1bnNpZ25l
ZCBpbnQgZmxhZ3MsIHBpcGUsIGhpZ2hfcGlwZTsKPiAgCj4gLQlpZiAoIWRldi0+aXJxX2VuYWJs
ZWQpCj4gLQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJaWYgIChkcm1fY29yZV9jaGVja19mZWF0
dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKSB7Cj4gKwkJaWYgKCFkcm1fZGV2X2hhc192Ymxhbmso
ZGV2KSkKPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJfSBlbHNlIHsKPiArCQlpZiAoIWRl
di0+aXJxX2VuYWJsZWQpCj4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsKPiArCX0KCkZvciBhIHN5
c3RlbSBjYWxsIHRoYXQgaXMgdXNlZCBxdWl0ZSBhIGxvdCBieSB1c2Vyc3BhY2Ugd2UgaGF2ZSBp
bmNyZWFzZWQgdGhlIGNvZGUgc2l6ZQppbiBhIG5vdGljZWFibGUgd2F5LiBDYW4gd2Ugbm90IGNh
Y2hlIGl0IHByaXZhdGVseT8KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gIAo+ICAJaWYgKHZibHdh
aXQtPnJlcXVlc3QudHlwZSAmIF9EUk1fVkJMQU5LX1NJR05BTCkKPiAgCQlyZXR1cm4gLUVJTlZB
TDsKPiBAQCAtMjAyMyw3ICsyMDI4LDcgQEAgaW50IGRybV9jcnRjX2dldF9zZXF1ZW5jZV9pb2N0
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKCFkcm1fY29yZV9j
aGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQ
UDsKPiAgCj4gLQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gKwlpZiAoIWRybV9kZXZfaGFzX3Zi
bGFuayhkZXYpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gIAljcnRjID0gZHJtX2Ny
dGNfZmluZChkZXYsIGZpbGVfcHJpdiwgZ2V0X3NlcS0+Y3J0Y19pZCk7Cj4gQEAgLTIwODIsNyAr
MjA4Nyw3IEBAIGludCBkcm1fY3J0Y19xdWV1ZV9zZXF1ZW5jZV9pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRl
diwgRFJJVkVSX01PREVTRVQpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gLQlpZiAo
IWRldi0+aXJxX2VuYWJsZWQpCj4gKwlpZiAoIWRybV9kZXZfaGFzX3ZibGFuayhkZXYpKQo+ICAJ
CXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gIAljcnRjID0gZHJtX2NydGNfZmluZChkZXYsIGZp
bGVfcHJpdiwgcXVldWVfc2VxLT5jcnRjX2lkKTsKPiAtLSAKPiAyLjMyLjAKPiAKCi0tIAo9PT09
PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwK
fCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAg
LwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
