Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 03:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fnuoPfR0f0tWSWrHURa2ZL9PJ2KBhSU0JzoubxgBAI=; b=m3sXtUh9PPzk2x
	8xpYfQRmCr6F3RtmuiclU7vbvrxRq1QpBnd8yLmWgc1v1gRpVHrSG/MC6zXmpvDHa+WIMh8e3C8Tt
	+XfaB93D8s75cgDRlIafDyV+QJCY1L71pOHMiohwydwPJkrbW9L7ehHCniqXqnR7mnji6eNSh9xjG
	xJOkuHxzuQ//3SSNbNFyS6oF4UaoE0Y3NrIUArXanUYKY5HC0JLS2ely2wcOtqI8ULEdqc1apyuo4
	MxDgyBCLF67Bu2Gj+qqbprb0wehXiQ0YvBhwrsxBOt6/AAVcl5ttKM4gkVgwTNeM3qkj5GmQ1WgJi
	CZqLEu3LQcw7qn8Ds2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLzS6-003DIp-RX; Mon, 21 Feb 2022 03:33:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLzRt-003DER-Me; Mon, 21 Feb 2022 03:33:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F6BB61156;
 Mon, 21 Feb 2022 03:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E12C340F3;
 Mon, 21 Feb 2022 03:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645414396;
 bh=jX3lfdiLUVCw6uNnO03H95weJLMzcQ7bp4tg8jLdSxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BLvFy+oyFgpf1kjBC/6XOK8zM/GyfV2FnY64eMuTKKhzMfcc/w5DNoaKvlvpwYmx6
 yfmZoqnpPDxjVzzvGFoYT9dbG7eXxV9HzaU0s0cp/kAEu01pH28hsO2K5+cHXJrdha
 B3TPihjH1j7pWgNUiN8StjCdP5qrH0XX7D0RHO/3JN9DiZegbQr/4SlF0rj1vYejdi
 6kGU4Jbyal+kPlaC+x+D9IRUOpbxg2AZTQ3sXFzo2dWxD8JDpR/jAXq7JzMoj6bktT
 OqtzEj61wIzP1F5vuKrfUkx/mdAmdYkvsjiJH+1oHdA4sOslPgguI4lounlgquuAGE
 PcI2bP1F/rMbQ==
Received: by mail-ej1-f42.google.com with SMTP id a23so29558043eju.3;
 Sun, 20 Feb 2022 19:33:16 -0800 (PST)
X-Gm-Message-State: AOAM533edNjD1QbyXNZHt2Vd45Y5QmH2LydYC8XpZABNX0lj3WvDj/FD
 7k1OXzRTpZEdXZiWnepIkTNx8akY1M4sF1Ysog==
X-Google-Smtp-Source: ABdhPJyH+8NQ9JObbRrNfFEeuU51f6EKV59HjEwkk77My7ZD/4unjxWgtNqhunLC4/YWgzTsjkYV7tCd1S4zNzS1W3o=
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr14515037ejo.48.1645414394846; Sun, 20
 Feb 2022 19:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-13-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-13-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:33:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__3K=2ommcNcfow7kKkOQpL7D0_YuqNBB9rQWjhz7e_DA@mail.gmail.com>
Message-ID: <CAAOTY__3K=2ommcNcfow7kKkOQpL7D0_YuqNBB9rQWjhz7e_DA@mail.gmail.com>
Subject: Re: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to
 board config
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
X-CRM114-CacheID: sfid-20220220_193317_837158_2FEF7960 
X-CRM114-Status: GOOD (  16.96  )
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
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgY3NjX2VuYWJsZSBiaXQgdG8gYm9hcmQgY29uZmln
CgpBZnRlciByZXBsYWNlICdib2FyZCcgd2l0aCAnU29DJywKClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWls
bGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiBpbmRleCBmY2Y4OGRjZDhiODlkLi5iZTk5Mzk5ZmFmMWJiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTEzMyw2ICsxMzMsNyBAQCBzdHJ1Y3QgbXRrX2Rw
aV9jb25mIHsKPiAgICAgICAgIHUzMiBodnNpemVfbWFzazsKPiAgICAgICAgIHUzMiBjaGFubmVs
X3N3YXBfc2hpZnQ7Cj4gICAgICAgICB1MzIgeXV2NDIyX2VuX2JpdDsKPiArICAgICAgIHUzMiBj
c2NfZW5hYmxlX2JpdDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZHBpX3ljX2xpbWl0ICps
aW1pdDsKPiAgfTsKPgo+IEBAIC0zNjMsNyArMzY0LDggQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9j
b25maWdfeXV2NDIyX2VuYWJsZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLCBib29sIGVuYWJsZSkKPgo+
ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jc2NfZW5hYmxlKHN0cnVjdCBtdGtfZHBpICpk
cGksIGJvb2wgZW5hYmxlKQo+ICB7Cj4gLSAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfQ09O
LCBlbmFibGUgPyBDU0NfRU5BQkxFIDogMCwgQ1NDX0VOQUJMRSk7Cj4gKyAgICAgICBtdGtfZHBp
X21hc2soZHBpLCBEUElfQ09OLCBlbmFibGUgPyBkcGktPmNvbmYtPmNzY19lbmFibGVfYml0IDog
MCwKPiArICAgICAgICAgICAgICAgICAgICBkcGktPmNvbmYtPmNzY19lbmFibGVfYml0KTsKPiAg
fQo+Cj4gIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX3N3YXBfaW5wdXQoc3RydWN0IG10a19k
cGkgKmRwaSwgYm9vbCBlbmFibGUpCj4gQEAgLTgyNyw2ICs4MjksNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19kcGlfY29uZiBtdDgxNzNfY29uZiA9IHsKPiAgICAgICAgIC5odnNpemVfbWFz
ayA9IEhTSVpFX01BU0ssCj4gICAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwK
PiAgICAgICAgIC55dXY0MjJfZW5fYml0ID0gWVVWNDIyX0VOLAo+ICsgICAgICAgLmNzY19lbmFi
bGVfYml0ID0gQ1NDX0VOQUJMRSwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+
ICB9Owo+Cj4gQEAgLTg0Myw2ICs4NDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlf
Y29uZiBtdDI3MDFfY29uZiA9IHsKPiAgICAgICAgIC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ss
Cj4gICAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwKPiAgICAgICAgIC55dXY0
MjJfZW5fYml0ID0gWVVWNDIyX0VOLAo+ICsgICAgICAgLmNzY19lbmFibGVfYml0ID0gQ1NDX0VO
QUJMRSwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gQEAgLTg1
OCw2ICs4NjIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxODNfY29u
ZiA9IHsKPiAgICAgICAgIC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ssCj4gICAgICAgICAuY2hh
bm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dBUCwKPiAgICAgICAgIC55dXY0MjJfZW5fYml0ID0gWVVW
NDIyX0VOLAo+ICsgICAgICAgLmNzY19lbmFibGVfYml0ID0gQ1NDX0VOQUJMRSwKPiAgICAgICAg
IC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4gQEAgLTg3Myw2ICs4NzgsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxOTJfY29uZiA9IHsKPiAgICAgICAg
IC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ssCj4gICAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0
ID0gQ0hfU1dBUCwKPiAgICAgICAgIC55dXY0MjJfZW5fYml0ID0gWVVWNDIyX0VOLAo+ICsgICAg
ICAgLmNzY19lbmFibGVfYml0ID0gQ1NDX0VOQUJMRSwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtf
ZHBpX2xpbWl0LAo+ICB9Owo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
