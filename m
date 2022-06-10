Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08794C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vggrWKnE9dppxn51Fzo7Mkwxs/FVUmB8p8zVLzQoV+k=; b=HprXypMP7ZAGwl
	wz65tjQJoLjmU+THewhVrFQe73UCbtIkSn5KR/twe57SssJCvo2UmyzLwbxL3qsmCtxiT/BwvyiEf
	kk2S95Zf96659qScxLNZvGLSwXHPibEf4mFqR23o+goOdFqiwtnbspNY4Ndpuk1HhDLmJEfZj/gSP
	x+6Y3R0ziFSO/I6eM8l3ZFIG0lrUqAHwLWIzMUki+d4piKeDNjFuJhTqLYaDxa85dp/WATPAHLPEm
	JxG0bozDJBuQsA/9zpPEa1McnjtF/q0g44koi7dpwO5yyMKuk+C/s8Am/rYN54I+o/vUNiognptjZ
	OFA6FKe/pr4n1L6U+68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzfvg-008dpY-Gk; Fri, 10 Jun 2022 14:48:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzfva-008dk1-Iy; Fri, 10 Jun 2022 14:47:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id 25so35324299edw.8;
        Fri, 10 Jun 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=++QT23Kd+FIQRCrQZQe7WTN4LUSOZ4DgBVw4lFAkbv8=;
        b=YwdpHX6f3Yq7XH6KVuJEH9ag++zBILZ6r8FsafNlXSwCgT0Dl8CqFiXT7KHM8bkxLF
         Nf3apV6d4L93j7uQRUCQhfPnmHha/4rR3cl4CH0wTu2qP9AubKK84Y1/5SrnrJXh4Ahn
         IHWXMQweEAe4L6rRNL8hyvGDC+tXkCijuh7kwaC6b4zb2Fi95twp90585Rpk40WBFx5Q
         muSamB7AY2Fu4ZNvlMLB4lydiKJ0aoWk0nyFA1KImb/1g5oZTCP5Wbi/kMK06kNHl63V
         +yQuuhfrlNx/YA3zsGLwtnf8allQ3v1lUsyKJ5ydnTMsCuw9LiMm1xrT9pUSobmkyPxj
         gU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=++QT23Kd+FIQRCrQZQe7WTN4LUSOZ4DgBVw4lFAkbv8=;
        b=j8bBZ2MprlyZgf3N1owFyZrwChjJhdb52Tqm0tyvDlgTLAC75Lmqz2CA0ZfRz17UFh
         4jnZScbZX5CZ3Rb41zngrpDuPOClPN8LzvCaXgjtBE/zfb+4D+0n432gXiQkBPwNM0UM
         aag7ZkGnetbedPTY8DWuKrUC1ydRlvGiHKADxKMXYjVSL8lTKgF6gqqC4mTtJA0iZ4Zr
         O1r+uTO94LnjnJ6SBlU6gn7ju4bwiY2R48moua+lmYG98pnmMUK1xpNck0Zqsf6TippH
         V1gpNzWpLy9JI7FhJo8CRTAkvLCRnEOReHxXuS2bpcstDKnuW2SA7HhRMcTzS5XP1wAp
         5Y4g==
X-Gm-Message-State: AOAM530SCmAf9CBipCCGF1Ywl6yUerDU5kl3SI0SgAE1p9p33hRzyznC
	HUP9cB+ypdws8eljT3VCen05xHqaRDMrn/PlOdk=
X-Google-Smtp-Source: ABdhPJxUxO59q0a4JvFZDrd7A8E4K6/eK/ZjPOa7JqgennKhOjFwPSMHvPp7iEiz3gXgkjUbucymQNwJhKdm75HJnyM=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr50565604edc.97.1654872475078; Fri, 10
 Jun 2022 07:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-16-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-16-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:47:16 +0200
Message-ID: <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
Subject: Re: [PATCH 15/34] iio: humidity: hts221_buffer: explicitly add proper
 header files
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
X-CRM114-CacheID: sfid-20220610_074758_674265_CD87E19A 
X-CRM114-Status: UNSURE (   9.99  )
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDcgQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBEbyBub3QgdHJ1c3QgdGhlIGZhY3QgdGhhdCBpaW8uaCBpbmNsdWRl
cyBvZi5oIHdoaWNoIGluIHR1cm4gaW5jbHVkZXMKPiBhbGwgdGhlIGhlYWRlcnMgd2UgYXJlIHJl
bHlpbmcgb24uCj4KPiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBhY3R1YWxseSBkcm9wIG9mLmgg
ZnJvbSBpaW8uaC4KCi4uLgoKPiAgI2luY2x1ZGUgPGxpbnV4L2lycXJldHVybi5oPgo+ICAjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KClllcywgSSBzZWUsIGJ1dCB5b3UgY2FuIG1ha2Ug
bGlmZSBlYXNpZXIgaWYgeW91IHRyeSB0byBzcXVlZXplIHRvIHRoZQptb3N0IHNvcnRlZCBwYXJ0
LiBJIGRvIG5vdCBzZWUgZnVsbCBjb250ZXh0LCBidXQgaGVyZSBJIHdvdWxkIHB1dCBpdApiZWZv
cmUgcmVnbWFwLmguCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
