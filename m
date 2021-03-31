Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096F3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:48:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD2561994
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 11:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD2561994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lS9wYZHtM7MXFGZnSHRWaWegRCjPwEwFQK1du7bjbsY=; b=JtyWmR8eypl3OUwrU+PU44k40
	Zb5ljhZ5opWAb5GSq6/Tjz15wPBdi1tpW3ko2Bto/GxSsHrjHCn1TBT9Bh8McEnrv1K3iw0oTNS37
	gWLj/vSP/m94pRG2oYjwgtwhs0rBvuUMNbROTXYphy5PjZfos+H2HcH23Jz8/qj1dCbOWNaa6ZwDB
	NBc50BpFItrF5dp3PK09NjALF+YwXFbCC6dOfMqs9tbul3L2ApKyLPinDyMOiVYS0VEBSNkxd8hLy
	WXnCl4DoEy+2v+ZCrE27jocTF2jZ9QCOhjdPQ02RciYlwUUbIngB+1TdWAExWHfT49XjRC2MpuLPK
	TGilime2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRZKB-006UZx-Of; Wed, 31 Mar 2021 11:47:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRZI2-006UT1-Lw; Wed, 31 Mar 2021 11:47:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BBDB61994;
 Wed, 31 Mar 2021 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617191135;
 bh=cDe4OjB/cbS5HTDVYg7h362Cs5BammVyqKu/0uQ+P0o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mAEcUxi/xVimrj34vKUlkJ3sjV4d9uFeZs6mqnlgjWKUrPwthX1uuv76oSEVgueBm
 LwjNPYS89rUv3i6mriw8OqOXHj27wNIxPky4orockzFmdDPtpzDvgBufSaTMCvw9AQ
 7of0JfiUi7MRxhv9EmJ16/UfvbsS2fPs71WJfRoVI99f7R1UIIy0WJJyV1lB1tunw/
 lYRt0uvUEUXr75VAWHS5QlZNTICVNgXvwW69auH9ofwzmKyHM84vs1IbchOA/X4oSK
 9ZVmHSvsX/2zg8KfSHnkEp9K1B2ZS6VvvagBw31h0EHjH+if9LLtW61XeGFJ3KHgRi
 SO4DqXSEcnlKw==
Received: by mail-ej1-f54.google.com with SMTP id l4so29584367ejc.10;
 Wed, 31 Mar 2021 04:45:34 -0700 (PDT)
X-Gm-Message-State: AOAM532md+hw5G1jUo/Lc5wmMP1XeEGJa0eILnKHUZF1/GJD6D3PXN74
 paVXgYVTHb1eGC7X3lcFlVxMRwAWY1z/u9AgYQ==
X-Google-Smtp-Source: ABdhPJxeQ0vEWM2/DbBY7gb7TVueFOpb1LFucBbuIOFcN1gdvrRTfseG6I5VwDo3lUEIJVM37SyMy5PkEVwJAuvfn5s=
X-Received: by 2002:a17:907:629c:: with SMTP id
 nd28mr3099988ejc.267.1617191133354; 
 Wed, 31 Mar 2021 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210203110717.686204-1-enric.balletbo@collabora.com>
 <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
In-Reply-To: <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 31 Mar 2021 19:45:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9O2v10eac9KCDqBNCwRymX_1sr38gVJsZeBpd2mESvvA@mail.gmail.com>
Message-ID: <CAAOTY_9O2v10eac9KCDqBNCwRymX_1sr38gVJsZeBpd2mESvvA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add missing MODULE_DEVICE_TABLE()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Collabora Kernel ML <kernel@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_124739_173756_B5F3B1E8 
X-CRM114-Status: GOOD (  21.62  )
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjHlubQz5pyIMzDml6Ug6YCx5LqMIOS4i+WNiDU6NDPlr6vpgZPvvJoK
Pgo+IEhpLAo+Cj4gT24gMy8yLzIxIDEyOjA3LCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3Rl
Ogo+ID4gRnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIG1pc3NpbmcgTU9EVUxFX0RFVklDRV9UQUJM
RSBkZWZpbml0aW9ucyBvbiBkaWZmZXJlbnQKPiA+IE1lZGlhdGVrIGRyaXZlcnMgd2hpY2ggZ2Vu
ZXJhdGVzIGNvcnJlY3QgbW9kYWxpYXMgZm9yIGF1dG9tYXRpYyBsb2FkaW5nCj4gPiB3aGVuIHRo
ZXNlIGRyaXZlcnMgYXJlIGNvbXBpbGVkIGFzIGFuIGV4dGVybmFsIG1vZHVsZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KPgo+IEEgZ2VudGxlIHBpbmcgZm9yIHNvbWVvbmUgdG8gcmV2
aWV3IHRoaXMgcGF0Y2hzZXQgOi0pCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFd
LCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+IFRoYW5rcywKPiAgIEVucmljCj4KPiA+IC0tLQo+ID4KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jICAgICAgfCAyICsrCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyAgICAgIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgICAgIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX2RkYy5jIHwgMSArCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jZWMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY2VjLmMKPiA+IGluZGV4IGNiMjliNjQ5ZmNk
Yi4uM2I4NmU2MjZlNDU5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jZWMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jZWMuYwo+
ID4gQEAgLTcsNiArNyw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kX2Rldmlj
ZXRhYmxlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4KPiA+
IEBAIC0yNDcsNiArMjQ4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRr
X2NlY19vZl9pZHNbXSA9IHsKPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTczLWNlYyIsIH0sCj4gPiAgICAgICB7fQo+ID4gIH07Cj4gPiArTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgbXRrX2NlY19vZl9pZHMpOwo+ID4KPiA+ICBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10
a19jZWNfZHJpdmVyID0gewo+ID4gICAgICAgLnByb2JlID0gbXRrX2NlY19wcm9iZSwKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gaW5kZXggNTJmMTFhNjNhMzMwLi4yNjgwMzcw
NjUyZmQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBAQCAtODIy
LDYgKzgyMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcGlfb2Zf
aWRzW10gPSB7Cj4gPiAgICAgICB9LAo+ID4gICAgICAgeyB9LAo+ID4gIH07Cj4gPiArTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgbXRrX2RwaV9vZl9pZHMpOwo+ID4KPiA+ICBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIG10a19kcGlfZHJpdmVyID0gewo+ID4gICAgICAgLnByb2JlID0gbXRrX2RwaV9w
cm9iZSwKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiBpbmRleCA1
ZjQ5YTgwOTY4OWIuLmU0NjQ1YzhhZTFjMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+ID4gQEAgLTQ3MCw2ICs0NzAsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX29mX2lkc1tdID0gewo+ID4gICAgICAgICAuZGF0YSA9
ICZtdDgxODNfbW1zeXNfZHJpdmVyX2RhdGF9LAo+ID4gICAgICAgeyB9Cj4gPiAgfTsKPiA+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfZHJtX29mX2lkcyk7Cj4gPgo+ID4gIHN0YXRpYyBp
bnQgbXRrX2RybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIHsKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gaW5kZXggMDUyNzQ4MGMwN2JlLi5jNzFj
ZTYyZDFiZWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiBAQCAt
MTE5Myw2ICsxMTkzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2Rz
aV9vZl9tYXRjaFtdID0gewo+ID4gICAgICAgICAuZGF0YSA9ICZtdDgxODNfZHNpX2RyaXZlcl9k
YXRhIH0sCj4gPiAgICAgICB7IH0sCj4gPiAgfTsKPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCBtdGtfZHNpX29mX21hdGNoKTsKPiA+Cj4gPiAgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtf
ZHNpX2RyaXZlciA9IHsKPiA+ICAgICAgIC5wcm9iZSA9IG10a19kc2lfcHJvYmUsCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gaW5kZXggOGVlNTVmOWUyOTU0Li5iNDY5NmE5
ZDczZjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiA+IEBAIC0x
ODE4LDYgKzE4MTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJt
X2hkbWlfb2ZfaWRzW10gPSB7Cj4gPiAgICAgICB9LAo+ID4gICAgICAge30KPiA+ICB9Owo+ID4g
K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19kcm1faGRtaV9vZl9pZHMpOwo+ID4KPiA+ICBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfaGRtaV9kcml2ZXIgPSB7Cj4gPiAgICAg
ICAucHJvYmUgPSBtdGtfZHJtX2hkbWlfcHJvYmUsCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pX2RkYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pX2RkYy5jCj4gPiBpbmRleCA2MmRiYWQ1Njc1YmIuLjYyMDdlYWM4ODU1MCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9kZGMuYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2RkYy5jCj4gPiBAQCAtMzM1
LDYgKzMzNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19oZG1pX2Rk
Y19tYXRjaFtdID0gewo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMt
aGRtaS1kZGMiLCB9LAo+ID4gICAgICAge30sCj4gPiAgfTsKPiA+ICtNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdGtfaGRtaV9kZGNfbWF0Y2gpOwo+ID4KPiA+ICBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIG10a19oZG1pX2RkY19kcml2ZXIgPSB7Cj4gPiAgICAgICAucHJvYmUgPSBtdGtfaGRtaV9k
ZGNfcHJvYmUsCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
