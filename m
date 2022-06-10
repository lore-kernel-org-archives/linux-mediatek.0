Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ACAC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/7qBFRQzB42PQMsKFDBGQH2JO3vd3lmXW8fodWIOyY=; b=ujIswfAzty4rYV
	zA65pmZnmPfb9i7bHdFEqHQhfbHwD++F1X4otasPVBkiZDz6ijqBwWOUq1TsQChbt1+fpG4XIsvoT
	7WA9QEVotrrOyaJd+1Hjl7IoTpEOEJYog4rpi/bS8C79pVgHbStJux/zwdNewM85s45n6dqtN6R7Z
	ploKsUhddad8KdAwH/fSOxbg2YPRUtDMkQFTIChnNb4NmytN6RwquIEtmoXqo01FHjoUNErzNsbL2
	I82ODuwPVAofVXGs9jCJY4UwGbgruSx7xoDiJ0/uvhU1ZLGwyJIrqT8nQwaI+34VSHh63niLxQWKX
	lU29b+Y+7Zd1lg5EONvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgZQ-008m2a-D3; Fri, 10 Jun 2022 15:29:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzgZN-008m16-Sq; Fri, 10 Jun 2022 15:29:07 +0000
Received: by mail-lj1-x231.google.com with SMTP id s10so5563748ljh.12;
        Fri, 10 Jun 2022 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v+jZ6r+UjKDKeJGUYw7c5giWLtAjtBGzVupfZsrUfPw=;
        b=YftxElw48vAzTMHF/1nfU7VfFHsJSYUmrN1ldESryIJDZgWI62xwEtnFBnCOtU1dBy
         hugT6puqW7XaZIJXo1TEsfOzKiAxZbj7elvsLJSguBWcH268hWJLPJ9n6csgtT0bsFAu
         oG+5atjoQLcNfaqFj1A/1giu0nztBRDoV5yyzxGAH+WDdZW8PWD5NPRMy9Jb68+jEOas
         rO7SvIZAjGbxr/an2qmDZHU6GyFFqKxmQkILq2u14xvgnxAOPDhGLNNy8IiKfsMtIYqY
         o3DiP0TqRJiGuuR8sP4NOpGYv3F2oz+tU1K7wiqJ+zfYH/pArdVyPDp3VHieI+PB2M76
         nAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v+jZ6r+UjKDKeJGUYw7c5giWLtAjtBGzVupfZsrUfPw=;
        b=fmMoulnGhWTHZ5Skuldc2HSj6a8/KIAIeX4fy11RNLHuqjXN5RuWfcHq4RcVdtZHcB
         0/mfqZY62hn4dd4DK91sF2PBaBFP/wuBocuH9YwD0it0gGjXY47OlK7uyynwty689Jrq
         yzVJBVgL7rbRI2MFLuzW4Fb70K316hj7TKgA3hvh4mNaWdGKnVsMobvsNLolNNOe/lXv
         oUIcaxufaArNjfTG2SYMAO48aW3B5l8i1vUc8uf6yxgGIhQ4TN2C+HXBU0svzcC24mqn
         e044uBM2ZcK/z4htMVv8XLHsMAEd/D0QJ0SwFvYyitlyUYjDYiVArYslYVIHRAWRlCot
         Ru8A==
X-Gm-Message-State: AOAM530t80I/AkSuV/m6BYLrW4KdRAr7hIGrGEGCZBvfMF51ROw4MGqi
	GNZQdb7ElrjKX5w702e9p2iydqjD2c9Glfx3B6s=
X-Google-Smtp-Source: ABdhPJwl2v2/H6OLQAJbbAo++RAUaoWbhTiq/DJO2nyXA23eqXmg6t46Wkkb2wH2XOIksQG/+e42V+8jRbh1NeB2EQY=
X-Received: by 2002:a2e:b8d1:0:b0:255:bfef:7212 with SMTP id
 s17-20020a2eb8d1000000b00255bfef7212mr8012769ljp.378.1654874942164; Fri, 10
 Jun 2022 08:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
In-Reply-To: <CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 17:28:24 +0200
Message-ID: <CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
Subject: Re: [PATCH 00/34] make iio inkern interface firmware agnostic
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
X-CRM114-CacheID: sfid-20220610_082905_988674_0208BAFD 
X-CRM114-Status: UNSURE (   6.88  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgNDo0OCBQTSBBbmR5IFNoZXZjaGVua28KPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1
IEFNIE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+IHdyb3RlOgoKPiBSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgoKRGl0dG8gZm9yIHBh
dGNoZXMgMjYtMzQuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
