Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F635C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 01:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eh4m/1X2ZBneDKLABBQvRcMp8ItBCeFqSz9khEvWio=; b=gynrEg8lR6Aav6
	7WwiseumdirGKUwN4gHYtZ3+GutX5HCPKfxLW7m8xPMFaTd5lHYHaBhegKecE5E0FGZmlPFPxdLSy
	QZrffjSLxZ8HGeEVm12k1fwR6NEY4Cb295STLCpgSbfWWufXIIcA6h+S85iey3BH3mDFhYfI1aymV
	jcrYsKE3DQ3IT/CJljL5illq871Mg9cvRQ/W31DzmcoospMjfdThDsUGw51Wi4NEx82eCnZXhHTZY
	HiCNh3MuwLy6EFvrwTC+uHeWgUdQXG3CDlLGovj4vFyKnr5t4m7J057lC3v1aIa+/7SsIlJ5HFWX6
	dI29At+9e3Cf8jzMDYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLxmo-002qJ1-7G; Mon, 21 Feb 2022 01:46:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLxma-002qFs-LJ; Mon, 21 Feb 2022 01:46:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9101A6102F;
 Mon, 21 Feb 2022 01:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26B5C340FB;
 Mon, 21 Feb 2022 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645407990;
 bh=4qgWKGsTwLoKg719UeLRaB5xjFNi6yHpYigKnDRlLFk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SUX4N46OttGRGAAIqutUGrlVqlh7v9joWSOmD9infNx8I+VAYBUHDbSUoLSk4L+r2
 cSoHdPqAcBoE5mbaJA3SsHKlIBkrsQEq2QDK9L0z8qHFTWBL1jvGq5le6zZ+4m5r2n
 ofAryaWxczbfKi9nTWYtctVknmbyG5CyAMGV5zhFTN2mD/he+rxz8MWVIQzv/42L4c
 OiUQM+NJjiW9pLi37/OB5ieUDFfk5H8Qfpr0SCXeUKQmQ8Jzyh94HT14pO85iO5I4t
 JxfMt01+I5R5NA5NWqxVMO1fPlHbUNodRyol4D2WsJnxCRaL1jLT4FTM9RWId7v+Tx
 /STkJs3EafZ0w==
Received: by mail-ej1-f42.google.com with SMTP id p15so29010921ejc.7;
 Sun, 20 Feb 2022 17:46:29 -0800 (PST)
X-Gm-Message-State: AOAM531D1SHA2s1RZwep42GEfTtsfMtU+JOrZcXJc964BiEHIYrjnHaK
 e99lrdPTgDX1/2jNcgAKkW8FmSk0R8LM1/f4Bg==
X-Google-Smtp-Source: ABdhPJwuTQy36EkhUNRD6M2+IcyGr33kZ+4z7L5xdpFKroaHetdf6U/UnYEQCCEMkMZsPcTHm7dMj6912ba9+VrWsIg=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr13799127ejb.638.1645407988130; Sun, 20
 Feb 2022 17:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-6-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-6-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 09:46:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
Message-ID: <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/19] drm/mediatek: dpi: move dpi limits to board
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
X-CRM114-CacheID: sfid-20220220_174632_818518_D0072A86 
X-CRM114-Status: GOOD (  19.72  )
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
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgZHBpIGxpbWl0cyB0byB0aGUgYm9hcmQgY29uZmln
CgpUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIEJ1dCBJIHdvdWxkIGxpa2UgdG8ga25vdyB3
aGF0J3MgdGhpcwpsaW1pdCBhbmQgd2h5IGl0IHZhcnkgaW4gZGlmZmVyZW50IFNvQy4gSWYgcG9z
c2libGUsIHdvdWxkIHlvdSBwbGVhc2UKcHJvdmlkZSBtb3JlIGRlc2NyaXB0aW9uIGZvciB0aGlz
PwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFu
cXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwo+IGluZGV4IDQ1NTRlMmRlMTQzMDkuLjQ3NDZlYjM0MjU2NzQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTI1LDYgKzEyNSw3IEBAIHN0
cnVjdCBtdGtfZHBpX2NvbmYgewo+ICAgICAgICAgYm9vbCBlZGdlX3NlbF9lbjsKPiAgICAgICAg
IGNvbnN0IHUzMiAqb3V0cHV0X2ZtdHM7Cj4gICAgICAgICB1MzIgbnVtX291dHB1dF9mbXRzOwo+
ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0Owo+ICB9Owo+Cj4g
IHN0YXRpYyB2b2lkIG10a19kcGlfbWFzayhzdHJ1Y3QgbXRrX2RwaSAqZHBpLCB1MzIgb2Zmc2V0
LCB1MzIgdmFsLCB1MzIgbWFzaykKPiBAQCAtMjM1LDkgKzIzNiwxMCBAQCBzdGF0aWMgdm9pZCBt
dGtfZHBpX2NvbmZpZ19mYl9zaXplKHN0cnVjdCBtdGtfZHBpICpkcGksIHUzMiB3aWR0aCwgdTMy
IGhlaWdodCkKPiAgICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9TSVpFLCBoZWlnaHQgPDwg
VlNJWkUsIFZTSVpFX01BU0spOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdf
Y2hhbm5lbF9saW1pdChzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0KQo+ICtz
dGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX2xpbWl0KHN0cnVjdCBtdGtfZHBpICpk
cGkpCj4gIHsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xpbWl0ICpsaW1pdCA9
IGRwaS0+Y29uZi0+bGltaXQ7Cj4gKwo+ICAgICAgICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX1lf
TElNSVQsIGxpbWl0LT55X2JvdHRvbSA8PCBZX0xJTUlOVF9CT1QsCj4gICAgICAgICAgICAgICAg
ICAgICAgWV9MSU1JTlRfQk9UX01BU0spOwo+ICAgICAgICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJ
X1lfTElNSVQsIGxpbWl0LT55X3RvcCA8PCBZX0xJTUlOVF9UT1AsCj4gQEAgLTQ0OSw3ICs0NTEs
NiBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkKPiAg
c3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19kcGkgKmRwaSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSkKPiAgewo+IC0gICAgICAgc3RydWN0IG10a19kcGlfeWNfbGltaXQgbGltaXQ7
Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RwaV9wb2xhcml0aWVzIGRwaV9wb2w7Cj4gICAgICAgICBz
dHJ1Y3QgbXRrX2RwaV9zeW5jX3BhcmFtIGhzeW5jOwo+ICAgICAgICAgc3RydWN0IG10a19kcGlf
c3luY19wYXJhbSB2c3luY19sb2RkID0geyAwIH07Cj4gQEAgLTQ4NCwxMSArNDg1LDYgQEAgc3Rh
dGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19kcGkgKmRwaSwKPiAg
ICAgICAgIGRldl9kYmcoZHBpLT5kZXYsICJHb3QgIFBMTCAlbHUgSHosIHBpeGVsIGNsb2NrICVs
dSBIelxuIiwKPiAgICAgICAgICAgICAgICAgcGxsX3JhdGUsIHZtLnBpeGVsY2xvY2spOwo+Cj4g
LSAgICAgICBsaW1pdC5jX2JvdHRvbSA9IDB4MDAxMDsKPiAtICAgICAgIGxpbWl0LmNfdG9wID0g
MHgwRkUwOwo+IC0gICAgICAgbGltaXQueV9ib3R0b20gPSAweDAwMTA7Cj4gLSAgICAgICBsaW1p
dC55X3RvcCA9IDB4MEZFMDsKPiAtCj4gICAgICAgICBkcGlfcG9sLmNrX3BvbCA9IE1US19EUElf
UE9MQVJJVFlfRkFMTElORzsKPiAgICAgICAgIGRwaV9wb2wuZGVfcG9sID0gTVRLX0RQSV9QT0xB
UklUWV9SSVNJTkc7Cj4gICAgICAgICBkcGlfcG9sLmhzeW5jX3BvbCA9IHZtLmZsYWdzICYgRElT
UExBWV9GTEFHU19IU1lOQ19ISUdIID8KPiBAQCAtNTM2LDcgKzUzMiw3IEBAIHN0YXRpYyBpbnQg
bXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAgICBl
bHNlCj4gICAgICAgICAgICAgICAgIG10a19kcGlfY29uZmlnX2ZiX3NpemUoZHBpLCB2bS5oYWN0
aXZlLCB2bS52YWN0aXZlKTsKPgo+IC0gICAgICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9saW1p
dChkcGksICZsaW1pdCk7Cj4gKyAgICAgICBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX2xpbWl0KGRw
aSk7Cj4gICAgICAgICBtdGtfZHBpX2NvbmZpZ19iaXRfbnVtKGRwaSwgZHBpLT5iaXRfbnVtKTsK
PiAgICAgICAgIG10a19kcGlfY29uZmlnX2NoYW5uZWxfc3dhcChkcGksIGRwaS0+Y2hhbm5lbF9z
d2FwKTsKPiAgICAgICAgIG10a19kcGlfY29uZmlnX3ljX21hcChkcGksIGRwaS0+eWNfbWFwKTsK
PiBAQCAtNzkwLDEyICs3ODYsMjAgQEAgc3RhdGljIGNvbnN0IHUzMiBtdDgxODNfb3V0cHV0X2Zt
dHNbXSA9IHsKPiAgICAgICAgIE1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfQkUsCj4gIH07Cj4K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xpbWl0IG10a19kcGlfbGltaXQgPSB7
Cj4gKyAgICAgICAuY19ib3R0b20gPSAweDAwMTAsCj4gKyAgICAgICAuY190b3AgPSAweDBGRTAs
Cj4gKyAgICAgICAueV9ib3R0b20gPSAweDAwMTAsCj4gKyAgICAgICAueV90b3AgPSAweDBGRTAs
Cj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxNzNfY29u
ZiA9IHsKPiAgICAgICAgIC5jYWxfZmFjdG9yID0gbXQ4MTczX2NhbGN1bGF0ZV9mYWN0b3IsCj4g
ICAgICAgICAucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCj4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9
IDMwMDAwMCwKPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRwdXRfZm10cywKPiAg
ICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyks
Cj4gKyAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsKPiBAQCAtODA1LDYgKzgwOSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewo+ICAg
ICAgICAgLm1heF9jbG9ja19raHogPSAxNTAwMDAsCj4gICAgICAgICAub3V0cHV0X2ZtdHMgPSBt
dDgxNzNfb3V0cHV0X2ZtdHMsCj4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0la
RShtdDgxNzNfb3V0cHV0X2ZtdHMpLAo+ICsgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQs
Cj4gIH07Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgzX2NvbmYg
PSB7Cj4gQEAgLTgxMyw2ICs4MTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29u
ZiBtdDgxODNfY29uZiA9IHsKPiAgICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTAwMDAwLAo+ICAg
ICAgICAgLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRzLAo+ICAgICAgICAgLm51bV9v
dXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTgzX291dHB1dF9mbXRzKSwKPiArICAgICAgIC5s
aW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2RwaV9jb25mIG10ODE5Ml9jb25mID0gewo+IEBAIC04MjEsNiArODI3LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7Cj4gICAgICAgICAubWF4X2Ns
b2NrX2toeiA9IDE1MDAwMCwKPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRwdXRf
Zm10cywKPiAgICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdXRw
dXRfZm10cyksCj4gKyAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+ICBz
dGF0aWMgaW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAt
LQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
