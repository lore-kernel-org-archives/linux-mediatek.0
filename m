Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JN5mfTOUy/6hId7/ej9JXVYpFXToFJl552gwpA1jY5s=; b=4JsWKoW9GSYDhY
	KCry9FTsJ3rdKROQU8nXRb47M4qnURl85nMWlnWXAbUfzp5rULgIGBH/yNyQg6ggIBm9h+O/WDtO5
	qEzR/qiwvD2soTcwmxNibz2or7++23vmhnhGAKBPx7Wb6NvyUu+4tIm54iS6kre85nk3NQv5Xm2WU
	G5Tqj1iMueDa8gPL5yDHfl5+GyRCfDPyLHPo+tAcWwsdtYVc8mw2dXUZ7jLt8DfvC2e6Mc1iZpRlf
	dbyzYCof2rnYhfF1AK6DlYK/vhDC2IzPeegNJgAr5XFKnblglbAQf/hAOcga0HKITfe3FguWdvpcq
	yuQy85uHnoKOCGm9PT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzg43-008foE-UA; Fri, 10 Jun 2022 14:56:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzg40-008fn1-Jm; Fri, 10 Jun 2022 14:56:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o10so35618339edi.1;
        Fri, 10 Jun 2022 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
        b=eoLQQvbaXDJR95EC5g5LJ5CxHbAJV47MdiWWQDebUGy9Q4ljUChinzTC65zAyx9+cu
         P1TKzxsUNIbMO6DgJKWLF02va3yYhlizG8M969o8ytL6wp0eioeV35oB2ovGhpg0HL2J
         AtE27v900JQInLKWLqxjz95V4dBqhK4TH2d+FpSxvJHnaV2+W4R07LunLSpcHXFduZip
         CtWpeygUURiujmqCRQx07U09RQlXGX3kfWPB66KuMLyPm04qs+bAtSY+koRjNgs1IcDR
         1X5UPyx91NZwB8hqYfnf3lsrVd7c+3ZPhRnd7kjLUGHQEmxcvRwvNYyB/XfwXQBjPuch
         iMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=27H3ValQb+HBvUPzRu8Xf/glxEPwy0TQVzU1GqPnVOU=;
        b=vQFblhpOArmY8RPzkdp8dBHC2MC6hH9J2eCF1TFfLb+H84zig7QHM9D2MWXJrpTzsT
         TBCaVbReagRvFs1DEh4MuijNAu3aYZFjvQOK5/BI3wEi9IoBMbN3HcSgaZwnV3tbs7Om
         qHHAvSl9jp5EeWgowMxRwah3qluBR7qXlGx/oFF85R0uf/+Ed3Iwz5gmsFo2P8e4WP5q
         2L5WP+F2AvW5SgjlRCpQXPgUetBLqssMvNPvZ6qapA5mmkNLOL57GM+G43j2+A9Bq3do
         iOTr4mjMezyEtlnjU1JJKo23KNw6sYGX2NBIgLkNTbR3TG9UcGVHq7Af8Fkhn/HgB0lD
         twzg==
X-Gm-Message-State: AOAM532XQ4D9MSptgvtmjikWmt/WH6jjKyMPDVkeMcg4AX/dXRiEvzRF
	JnoJ+P+UVDCdRsy27dSqwHK1kAnGZZvr5P6bNg8=
X-Google-Smtp-Source: ABdhPJy+4W6TzW/Fih8FB8596xZDMbGHtv+y8KFgg0s5ncZshszK0PY5LIku4jQLDiOJ5W3CjVR22n6jku9zOiOB+lo=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr52267347edq.178.1654872998983; Fri, 10
 Jun 2022 07:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-21-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-21-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:56:02 +0200
Message-ID: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when done
 with it
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
X-CRM114-CacheID: sfid-20220610_075640_693657_0914581B 
X-CRM114-Status: GOOD (  12.00  )
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
LmNvbT4gd3JvdGU6Cj4KPiAnb2Zfbm9kZV9wdXQoKScgY2FuIHBvdGVudGlhbGx5IHJlbGVhc2Ug
dGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5Cj4gJ2lpb3NwZWMubnAnIHdoaWNoIHdvdWxkIGxlYXZl
IHVzIHdpdGggYW4gaW52YWxpZCBwb2ludGVyIChhbmQgd2Ugd291bGQKPiBzdGlsbCBwYXNzIGl0
IGluICdvZl94bGF0ZSgpJykuIEFzIHN1Y2gsIHdlIGNhbiBvbmx5IHJlbGVhc2UgdGhlIG5vZGUK
PiBhZnRlciB3ZSBhcmUgZG9uZSB3aXRoIGl0LgoKVGhlIHF1ZXN0aW9uIHlvdSBzaG91bGQgYW5z
d2VyIGluIHRoZSBjb21taXQgbWVzc2FnZSBpcyB0aGUgZm9sbG93aW5nOgoiQ2FuIGFuIE9GIG5v
ZGUsIGF0dGFjaGVkIHRvIGEgc3RydWN0IGRldmljZSwgYmUgZ29uZSBiZWZvcmUgdGhlCmRldmlj
ZSBpdHNlbGY/IiBJZiBpdCBzbywgdGhlbiBwYXRjaCBpcyBnb29kLCBvdGhlcndpc2UgdGhlcmUg
aXMgbm8KcG9pbnQgaW4gdGhpcyBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UuCgotLSAKV2l0aCBC
ZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
