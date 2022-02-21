Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2198EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC22Scz5wgIFwQl7+6a93V6JHM3dRp4A0vwqbm1B5kI=; b=wZVl/U/0MQOJ8M
	N0K5+ca2FxF7EVoh1fRRCoW64qn0Vaqab2dezf9sB2tnlk9pDC1+DXlOTzWR1iQ25H9/U3aBXurTz
	i8J955nhVOSY9TE3lqAsVBUjvm3lgNhUPxlWUvF5DevclMkmQc0V4+L8qpc/Cp5TcyoiEK37RN4wu
	HoTwSYVgWSKhd8MyRwA15vZ5oihTwXspoIbZAxEkoqDqNUe0wNFyfFaI2LGoNcL1r3t+s9Pg7//9R
	NGl1ElIoQmcfw0b7s6/vY0o/SA3+u+Be0898uEzmdg+QZqOh7DkQVUX3/K6ZpZa3kGpSxg0fSiZT9
	+icfTa+CBBXr/0kWrfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLzJu-003CAL-Lx; Mon, 21 Feb 2022 03:25:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLzJg-003C4X-Uw; Mon, 21 Feb 2022 03:24:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83C2161136;
 Mon, 21 Feb 2022 03:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD072C340F4;
 Mon, 21 Feb 2022 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645413886;
 bh=qO8573CRQiu/z0EEizzes65D3OQ8wZzEKmTCKW4MMZ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P7AwV41JAjM1ZOsTsvNlGJ6sJNmBEtTtLPKmNNZMC/XyySs3Tq3cBWL90hcL3jA/q
 uH9Vqr9YNCNgQQWZm0Ns9WoEljd+2walrv9TSiEkLrxEomBUJI0mMKWfIf5f0zDywj
 bossYpFjoH2fCEfV6X9jmPT+WwQZ5Am4PnnlP2Ibd54CyLY6tCVX3A+umM5Xi2ZPL6
 cqWvxZ7FiL48OjFb9T4kJAymjYyJaOzV6Txkn/N61dyxtab3v43prPY57tl1DEYf9B
 ZTyXJ7xlvbxzJPgswUVpXtVt4DPiaXRJdhBf+6O5c9xua6U289BEtAphzhZl4nKu6d
 +5Y+ufev1oAaQ==
Received: by mail-ej1-f42.google.com with SMTP id bg10so29568268ejb.4;
 Sun, 20 Feb 2022 19:24:46 -0800 (PST)
X-Gm-Message-State: AOAM532RJUuahsVF2mfTrX0nBHrZLptlpk1Pg8QyaiZNZrYtUsH8xUM3
 ZLnIFHkIAffA6vqJzfBK2Amhpb2cQA8rKmMUYA==
X-Google-Smtp-Source: ABdhPJwjAPsaHxaTO2fPl36BRiMDL+aqL50uBkML8OltdMe4CzpwYsfSM7uRTzFcal0fd0xrQupABtvgOQ9eblRYB5w=
X-Received: by 2002:a17:906:8143:b0:6cf:73c1:8a0 with SMTP id
 z3-20020a170906814300b006cf73c108a0mr14451460ejw.406.1645413884967; Sun, 20
 Feb 2022 19:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-11-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:24:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
Message-ID: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
 config
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_192449_100626_E7B314E5 
X-CRM114-Status: GOOD (  17.29  )
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

SGksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIy5bm0MuaciDE45pelIOmAseS6lCDkuIvljYgxMDo1NuWvq+mBk++8mgo+Cj4gQWRk
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgc3dhcCBzaGlmdCB2YWx1ZSB0byBib2FyZCBjb25m
aWcKPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA4ICsr
KysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IDBkM2FjZDA4ZWEzNTguLmVj
MjIxZTI0ZTBmZWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTMx
LDYgKzEzMSw3IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgewo+ICAgICAgICAgdTMyIGRpbWVuc2lv
bl9tYXNrOwo+ICAgICAgICAgLy8gTWFzayB1c2VkIGZvciBIU0laRSBhbmQgVlNJWkUgKG5vIHNo
aWZ0KQo+ICAgICAgICAgdTMyIGh2c2l6ZV9tYXNrOwo+ICsgICAgICAgdTMyIGNoYW5uZWxfc3dh
cF9zaGlmdDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xpbWl0ICpsaW1pdDsK
PiAgfTsKPgo+IEBAIC0zNDksNyArMzUwLDggQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdf
Y2hhbm5lbF9zd2FwKHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVUX1NF
VFRJTkcsIHZhbCA8PCBDSF9TV0FQLCBDSF9TV0FQX01BU0spOwo+ICsgICAgICAgbXRrX2RwaV9t
YXNrKGRwaSwgRFBJX09VVFBVVF9TRVRUSU5HLCB2YWwgPDwgQ0hfU1dBUCwKPiArICAgICAgICAg
ICAgICAgICAgICBDSF9TV0FQX01BU0sgPDwgZHBpLT5jb25mLT5jaGFubmVsX3N3YXBfc2hpZnQp
OwoKVGhpcyBtYXkgYmUgd3JvbmcgYmVjYXVzZSBvZiB0aGVzZSBkZWZpbml0aW9uOgoKI2RlZmlu
ZSBEUElOVEZfQ0hfU1dBUCBCSVQoMSkKI2RlZmluZSBEUElOVEZfQ0hfU1dBUF9NQVNLICgweDcg
PDwgMSkKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2Rw
aV9jb25maWdfeXV2NDIyX2VuYWJsZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLCBib29sIGVuYWJsZSkK
PiBAQCAtODIxLDYgKzgyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10
ODE3M19jb25mID0gewo+ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gICAg
ICAgICAuZGltZW5zaW9uX21hc2sgPSBIUFdfTUFTSywKPiAgICAgICAgIC5odnNpemVfbWFzayA9
IEhTSVpFX01BU0ssCj4gKyAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwKPiAg
ICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gQEAgLTgzNSw2ICs4Mzgs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsKPiAg
ICAgICAgIC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ICAgICAgICAgLmRpbWVuc2lvbl9t
YXNrID0gSFBXX01BU0ssCj4gICAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9NQVNLLAo+ICsg
ICAgICAgLmNoYW5uZWxfc3dhcF9zaGlmdCA9IENIX1NXQVAsCj4gICAgICAgICAubGltaXQgPSAm
bXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IEBAIC04NDgsNiArODUyLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgzX2NvbmYgPSB7Cj4gICAgICAgICAuc3dhcF9pbnB1
dF9zdXBwb3J0ID0gdHJ1ZSwKPiAgICAgICAgIC5kaW1lbnNpb25fbWFzayA9IEhQV19NQVNLLAo+
ICAgICAgICAgLmh2c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywKPiArICAgICAgIC5jaGFubmVsX3N3
YXBfc2hpZnQgPSBDSF9TV0FQLAo+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4g
IH07Cj4KPiBAQCAtODYxLDYgKzg2Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9j
b25mIG10ODE5Ml9jb25mID0gewo+ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUs
Cj4gICAgICAgICAuZGltZW5zaW9uX21hc2sgPSBIUFdfTUFTSywKPiAgICAgICAgIC5odnNpemVf
bWFzayA9IEhTSVpFX01BU0ssCj4gKyAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dB
UCwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gLS0KPiAyLjM0
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
