Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6927C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2958i29z43nMg1DW5V3Bl7fp0FcC22GpMm2auRptyZM=; b=h3Sv3QQzQmK8ag
	NJXRg3hbrP4NHPRqblM9cRDXVqBGbQDFiX5OHCm7bJWM3VspnjM0j/dqoUwgof+ijAtyk8jxDe0Ql
	Ph/5UR2duiVGL3avmfKu99dRgoClDOqyyD7uPh56MD6AzN6Xm2vQeKUxascf2Gmmq2Se+tyk8H3xh
	AYdAfOegI9mkJNMNGjhZhGEbjIFPAGnmrI8ZafNyROWuWpYLfmI7Y2uH/xalG/+YpoCmtHdqosm0t
	U7DboEoGI4/2E2iFtngSTqiwxv1Fo/F4TMeilaZ2nmdpd5YfGCWlKJ+hAaVo6vGkz5hTOUm90CSnh
	JYmgaRhELuELoJFOE+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzg4z-008fxo-CK; Fri, 10 Jun 2022 14:57:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzg4v-008fwn-OU; Fri, 10 Jun 2022 14:57:39 +0000
Received: by mail-ej1-x62e.google.com with SMTP id m20so53902626ejj.10;
        Fri, 10 Jun 2022 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FiFiZSOb5fy9Qyr8SrnJ9LwGpGEbO4FbIZTS4c08mfw=;
        b=mHU8yDAtySOxuZnlqlJbNLpyJN3LBFi9PrnPSFEfeFm7M2jv5fjv8Qf76KtG5ym6pL
         zkZuCdBdSgbcyNoKtu/B6lszfOt0Fqu8SsJ8CMw5fYM1VNDA/Y+sUBYi+0zJpPpd0xpX
         GqJnvLd7h8gOjOxHxYZ/XhWYDauZ6ABgtRMVuL/FwV9lajqaalv5jN2AMxSm1u+li79y
         SOozLN5MSK0xUqb+vCqGOgxuxQhV6pd7co2o75pIOxdiwQ9NIOtUiXyicUlKY7RcEXkx
         D2hlqs1xCK/BKhcwcnjRNBLBnLizBihH24xIJcCjwlZlIblip3w3rkDylnKfA4zaFT3C
         1Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FiFiZSOb5fy9Qyr8SrnJ9LwGpGEbO4FbIZTS4c08mfw=;
        b=RxBaarCMDMTIPG1g/4GVbuGZZDs81Ch/4hYcgHtToqQXFWjoq/eZPE/xhqCn+MfkiO
         bqdKOyzh2nIJniCsYvkj1zPlrNbWNAWIq/F5JDJDxE373p+UYsZ/Zg77zEkzUw5h/1LQ
         ILC2JrkINcE020eYM9ALfhoHa2s83oLKVulE0yqmACQvP/c/Vf6/N0ZlONW4Dx7N7Aj7
         LF9bgD0d59dauOjuxx5QNhyw1BWmEVX+KDfIbKIwCi2MPOnFQKiqMF3bZLI2x8gtVt4U
         ujT326+P3u/NfDft8Dh36RluHjMbzUWX9yGY8cUWmJEA/iYQajcdpifMK78eZcokZrsQ
         T4aQ==
X-Gm-Message-State: AOAM532kkMtGKJ1hbKhQOHuQTNGFkYRdhuxIxhe/8nsoEQwWBAKXDk5F
	xWn8Gu5PamKv2c/FfbWaaKaXSnomwKlAbsyLXN0=
X-Google-Smtp-Source: ABdhPJwgw1cdwy7+7BSEWyUuttbgW9nGvtz5OwQueP4zXXWoa6V054VmGJY2Kj9j5Z7jUAiFw2Aa2m1Mt+A03k0tKIs=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr15425618ejm.636.1654873054113; Fri, 10
 Jun 2022 07:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-22-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-22-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:56:57 +0200
Message-ID: <CAHp75VdpAaO1VCy1WxUgR6z2LZ62gE+6Gp5aE=UrYdCqmZtBWw@mail.gmail.com>
Subject: Re: [PATCH 21/34] iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, chrome-platform@lists.linux.dev, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Benjamin Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>, 
	Andy Gross <agross@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Benson Leung <bleung@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture <venture@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_075737_835899_172A9159 
X-CRM114-Status: GOOD (  19.22  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIGNhbiBlaXRoZXIg
cmV0dXJuIE5VTEwgb3IgYW4gZXJyb3IgcG9pbnRlcgo+IHNvIHRoYXQgb25seSBkb2luZyBJU19F
UlIoKSBpcyBub3QgZW5vdWdoLiBGaXggaXQgYnkgY2hlY2tpbmcgdGhlIE5VTEwKPiBwb2ludGVy
IGNhc2UgYW5kIHJldHVybiAtRU5PREVWIGluIHRoYXQgY2FzZS4gTm90ZSB0aGlzIGlzIGRvbmUg
bGlrZSB0aGlzCj4gc28gdGhhdCB1c2VycyBvZiB0aGUgZnVuY3Rpb24gKHdoaWNoIG9ubHkgY2hl
Y2sgZm9yIGVycm9yIHBvaW50ZXJzKSBkbwo+IG5vdCBuZWVkIHRvIGJlIGNoYW5nZWQuIFRoaXMg
aXMgbm90IGlkZWFsIHNpbmNlIHdlIGFyZSBsb3NpbmcgZXJyb3IgY29kZXMKPiBhbmQgYXMgc3Vj
aCwgaW4gYSBmb2xsb3cgdXAgY2hhbmdlLCB0aGluZ3Mgd2lsbCBiZSB1bmlmaWVkIHNvIHRoYXQK
PiBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIG9ubHkgcmV0dXJucyBlcnJvciBjb2Rlcy4K
ClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
Cgo+IEZpeGVzOiA2ZTM5YjE0NWNlZjcgKCJpaW86IHByb3ZpZGUgb2ZfaWlvX2NoYW5uZWxfZ2V0
X2J5X25hbWUoKSBhbmQgZGV2bV8gdmVyc2lvbiBpdCIpCj4gU2lnbmVkLW9mZi1ieTogTnVubyBT
w6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vaW5rZXJuLmMgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gaW5kZXggOWQ4NzA1
Nzc5NGZjLi44N2ZkMmEwZDQ0ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJuLmMK
PiArKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwo+IEBAIC00MTIsNiArNDEyLDggQEAgc3RydWN0
IGlpb19jaGFubmVsICpkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiAgICAgICAgIGNoYW5uZWwgPSBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShu
cCwgY2hhbm5lbF9uYW1lKTsKPiAgICAgICAgIGlmIChJU19FUlIoY2hhbm5lbCkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBjaGFubmVsOwo+ICsgICAgICAgaWYgKCFjaGFubmVsKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPgo+ICAgICAgICAgcmV0ID0gZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9paW9fY2hhbm5lbF9mcmVlLCBjaGFubmVs
KTsKPiAgICAgICAgIGlmIChyZXQpCj4gLS0KPiAyLjM2LjEKPgoKCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
