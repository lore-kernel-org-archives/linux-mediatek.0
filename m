Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C896C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pW3VckTybkB0zrH3VyQSu6e87Zi4IOxA6JA1Edb2k9s=; b=ckhHIw/MaYXrVH
	2vQg9FBibItnYoJG5OzC//2W7thEK5kg3nS3jbHjV4zGa0RrU2mIuKyKpOf5TALEqkVrF87pkXR2Q
	XLLib378j7FO/mgz3y4tRbzgO5zqtUMVSn/wLn47udDz/y20y/UH66eKvAwli6iVZZ613huRqjoaK
	uKS7D2U3dORhtvzu4vbf2J0ysdVHvxnxqqrBX3TgHiDUqLVwqllYjMqKhEq+pfONcd8q4D0q2OL4j
	9vhMAZkrZGDidB+Rp1CAuEqVgO5YaVjL3ue5x4i1nEJ061Wh/jNaGKdp58fX+lQdnn5q5CrUF/9f2
	Rgk6x4rOHplxlBQ/6lvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgRl-008jkg-Dk; Fri, 10 Jun 2022 15:21:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgRi-008jjh-8Z; Fri, 10 Jun 2022 15:21:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c4so11329041lfj.12;
        Fri, 10 Jun 2022 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
        b=QuszwAyXszuHI8ReemXfLsvKVbRYP/Ciej6NodQS4f4DxB0dYCz1JKt3Z8KqRQdbVX
         Jqbo5bZLYC1v1EbQmqJbF588+MBvfJAEhBinRuB3cCDUahi9/8/q3PAe0W2Vgs45ckLW
         /hiuFN/v5rZ/itjafx60G3maggGA2cuzdXxWkUwbpLNnOq8CiWcKz0KQDvAWhjQwa/9r
         QOtElc4xrfhvBjGu9rsXtW8n9+fhA5ojdEZ/+ut9V4+pZWnRJ1pOf+C00H4egWSGhIy5
         cr1goHKSiGEFoiuomtuXSN8DfgxD+HYZKIUFs35eLE9qua0p+q3zFgLJ1Xe+CnTMsAx4
         6A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H+ga1sC9+ntYYTy6ffK9GjlUeE88A0FzNz+Ar82l8uE=;
        b=l3lnqOKCHbBIJ6oK3+zLgjCfN00YBACpKtDduvrN1XE3a7lI2FT5Onw/DfINeC8vg2
         k6DEZgLVZvi9iih9cLLgmMORR1VHFahXt/0OZtO9217vi8clzYjgG3c96ilb3tZ1xsru
         X89eCxDDx4VERO0zsOsPZahrcSEzZgsKJ6CGKqNk+OFn+i1KggbSrR3OmqP5rM0DLdQ6
         CuXF0LKnsU/rUeiX37A4BoMUTDELTMFmAR6JkvQZBPoXb/8x872wduM1IH10ReFz9oDh
         5lW4AgDL6VGaPDyaa0pefs2BLRHEAaRedoxqXvDlHyxUDlbt6y0fSz7khq8CcweBCVr3
         IYAg==
X-Gm-Message-State: AOAM531z2U7m+V88IlBuxyfXHiWZ98UqkW/COvE/LFGGkowaX+Oa3L7R
	eDFcnO6Eya8y3rQHIggUwdEt2Q8YUu+DCT5n1Sw=
X-Google-Smtp-Source: ABdhPJy+kvE8MxchmBmksNafSpi+qANBoJkttBTTtDBUpDtpcRk/iOf7pFYhhSUgUCkmvGrvjJK5StTzheGUp//PDx4=
X-Received: by 2002:a05:6512:308c:b0:479:54c2:c91 with SMTP id
 z12-20020a056512308c00b0047954c20c91mr13940269lfd.565.1654874468712; Fri, 10
 Jun 2022 08:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-26-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-26-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:20:28 +0200
Message-ID: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
Subject: Re: [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
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
X-CRM114-CacheID: sfid-20220610_082110_337726_B5165548 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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
LmNvbT4gd3JvdGU6Cj4KPiBNYWtlIHVzYWdlIG9mIHRoZSBuZXcgZmlybXdhcmUgYWdub3N0aWMg
QVBJCj4gJ2Rldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKScgdG8gZ2V0IHRoZSBJSU8g
Y2hhbm5lbC4KCl9vZl8gPyEKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
