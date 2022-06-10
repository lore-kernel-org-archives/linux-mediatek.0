Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04B9C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ab6H8COvTfvOIG4QUa+pcKRLabo4VuMuX1AsJnbB3Ic=; b=PnyRfV+UywFNp6
	MVCuZBJwTN0Oj7I6QlHfifZhilNpTderoQSt8dPfAJSdBVm5h5FFHWCtEv5AeUpKlOpRQ/sWs+tMR
	E0qJ5EbKofju/QyUY+zSm6bKRVkU4patW1xbjfnVkUzF4P/sSWAP+rl2hwySbJzz2xxi0vMdODGpe
	ilARqxfz3gC+rvKAe8tmvsCwCl9WmHK77V/V50GNb3cflCzi/6a2apirkA5HTemoYFcnegdS4DOf4
	zNk1dFGVrK6TzvSMUzGgMcHBnrjfEKoH5YOSukHN36Fzef2JiEqkjcwZbW/6zWpyPlZh6ocDlchQC
	V2BkprBmEFP28khrQ3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzftg-008dHC-RI; Fri, 10 Jun 2022 14:46:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzftd-008dFz-G3; Fri, 10 Jun 2022 14:45:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id bg6so34120492ejb.0;
        Fri, 10 Jun 2022 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
        b=cPMR1qwhgBciQ4QuFRIqiyeHmWI4Ln4CHN421omnkh7YH9MB7rz/jhyXlDcjROB6tT
         JiSpoNNM1qEgfFc/7U9Bzbww3hRJhk8lPntDxUJBZ89txLcz/l4eIrftQGXd/SjihNQ3
         DYhEWO3cPHerQ6tMoyNMwIS+iCRH+4RQ3UEZLVQEmS5QOfbNGv833fIl2ncEf4jXl14U
         yi4+tL0c+r7c5GU8P4oAYYhsdlfSHRZE9gQECvEhxRs3N2lDYwzDcaqkKjAEBpHjgt9p
         K0sdA/V/R/iXE5p8XbseNASd66P628xRR1EgKSZHtqMGGV6sRCzr4iT7MWyT+gB6Znn7
         cYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KoDE34zocTcx3MPzWCnR4QwZS2ytF1uI72CoiLyAcyQ=;
        b=Lu2Hgvo1puPV+5dZ1aXxUvJnyveI4UfWzY1JnWv8SDWCLdVz2qbRLjvnFHBfSuMksd
         3CnuQAPKiCtmRj7mmxy4RoxSdvFiwEXcrXQHmwOo9kDf2+F2kte4lbULURFLwDJgxkbe
         lLR+vfFoGLgUk46ojrOpB6TTRGdHRljQdJKaUQ5qU52Ro1cOEXoKM0n0WlId8e9EkN1y
         RKmlg5Md5w3MyJJ8kTnv4u8KyBeVYIRb+JcJfnYsKQIMHSKmn6VmAkVcrnnqpRIfsjpC
         RsGexSVDaGNuwyH9tV4DbRKA5SsF+5/g9i5VnBOICjDAOBALvPMv6M9/77tDX+DXQHKk
         DIGQ==
X-Gm-Message-State: AOAM533wommLw9a+qWpOvoPOSzZqCCdeVJ0wjPpLLkfd4eOI7y2IrVHS
	pn3aN1axtHuntwQOnSudB09JX65Te03uTZqEud8=
X-Google-Smtp-Source: ABdhPJxizt9m4eKBTNu+PJtwHNsl6LS2ZuZ/AzA8lc7FGXQyzDHIdcU8VIdIbeQpqLpHnNiy07ZL4b6rgaPhYce2N3E=
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr35595214eja.44.1654872354568; Fri, 10
 Jun 2022 07:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-7-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-7-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:45:07 +0200
Message-ID: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
Subject: Re: [PATCH 06/34] iio: adc: ingenic-adc: explicitly add proper header files
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
X-CRM114-CacheID: sfid-20220610_074557_575120_F463BE3F 
X-CRM114-Status: UNSURE (   9.20  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDYgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBEbyBub3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRl
cyBvZi5oIHdoaWNoIGluIHR1cm4gaW5jbHVkZXMKPiBhbGwgdGhlIGhlYWRlcnMgd2UgYXJlIHJl
bHlpbmcgb24uCj4KPiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmgg
ZnJvbSBpaW8uaC4KCi4uLgoKPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+
ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L29mLmg+CgpPcmRlcmluZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3Nl
ZCB1cCBhbHJlYWR5KQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
