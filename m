Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2B6C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=; b=gHImExZsM2/JnRBQhSAcSUjauh
	lZZzIpizh0zCHljMyHFszf0YEeKwk/q0bS/bBp0s/+jh83069VdpfJq6mLmOaPPcDv4nJaPPdOf1m
	nSigV2rpgCwTTci+hd0sjYb4TEmGUNaDXhdLQnRSkJa3xymk09CN87vneM3jNSHbRBR6rNMcnWMFj
	mVePe5snvm07VAmf62dfGlzkhJrD6N/LxB9UMFY2tPnD7dOs0mhVs3GLxvFJVKS7PsknU/lHYyTOx
	OOf2wKjpZXKB8zMFsBe7b1CY9dlEoG+apELJCdIPsWJ1zdcpbdyYV6LAd84Joso0SDJUoax5uGeSW
	U5GMnlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS82-00000009dBF-3Lcc;
	Mon, 15 Apr 2024 19:36:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6P-00000009c7g-0YAV
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=; b=l0Av8raC/o2/XevB/036t1E2Ec
	1J42zTeqdJs7JfgPW4rY+Y6fMX/C0m6rLd784+AVCc4jJxb5DDHflKIqllNdNQslnprzrLgZIOoKt
	0WaI6qTQvdZzw4FdTPSnJ4wdyiq4YzxH7eafqQrh1NIENIoBTaYng+IVn/8iHAPQM9OXpzj/rXHOI
	q2/02x97/XyEilzZ9/8rL3oaqdXXgZaCKkXTdsJNJdN2zHb2fD1t2Ev7XcO3Tkfyeieoue0YcTA7F
	cb2ZjG6ruwNdp1GZtD7awhbmr6W0X3y8dpiqRFo6/yH5+4PzpUUGJWqSoFnezYehAElCf40QN/lHO
	PkA0AX6w==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS68-0000000AifO-3YQp
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:42 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-78ec78c4fceso238100585a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209675; x=1713814475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=ZLnXbA3mqK2Cf2rWguyE35J/nEps1Al5jk6H+nmWqyO4aQXrMTd5prsKm+fco48SAi
         Hmh9StfZPWwfBUN485PC4JRl/ZQfFzcN4vA6EIsT+9NBP1Iw/G2Ren5ixp//3ffhMpHr
         mXZ9/E3Zt7uHT35GNgTr7ggrz7u+lVOypnPcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209675; x=1713814475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=Mnu0md0KLT1r1cORWlAbz3076Qka2brDSL8HwAdajlUcI6qR9fmw4oSnSkvUcI6Oro
         OYHH+2H9/kTlGi47b2iD/TTa4YluyrjdQYumabBSyv0FpOle5SlkiG+/b7YCpCoRF+hb
         3NlA3Y0lmLhn9p2X7NbzovWyCwp1b2n42rqQLkgMUmUsqKrKlBvb2fdlTFacliYE4L+i
         OPY4/I7GchsUYLmWrShw5PwjYat1mRWNQ6wRYWEHPLNVoE6U77ksBGL6RqKnxgXPk8Yw
         QBxd+nXWUUnAu3GY36e+X/5LO2B6JDv0YfXfnxuf7tkK6kapMQ7kCLsICaZ3TG7ul9+n
         gMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXGXKuPoeyEx9QNsEL/uziWGIjRVg0ipitYbrUMkpgQ97tB9NYb8i0STBht1f5mNiX8wFTwbt2ZT1Kx7tCu/t8wDbcaJbQarNLmgBP70g5+sBiG
X-Gm-Message-State: AOJu0YyBB+bVZkzUWznZw8O51iIF9gDIOftvUjbZwWAsGk+GTcl/9tVB
	4fv4LfOkf13cRnXJssYDXh/29oPtqxrYg48RB0kdmr1L+evbZUuOeg/8L4Kybg==
X-Google-Smtp-Source: AGHT+IHNEVyzd3evramKoXF4voaYnhuPvr7ES/TUx15oMijuB+fT7oxPAB5JZ66ego178FVyftQu6Q==
X-Received: by 2002:a05:620a:470f:b0:78d:3b55:21c8 with SMTP id bs15-20020a05620a470f00b0078d3b5521c8mr1321999qkb.24.1713209675268;
        Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:25 +0000
Subject: [PATCH 08/35] media: dvb-frontends: tda18271c2dd: Remove casting
 during div
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-8-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_203437_633542_921D003B 
X-CRM114-Status: GOOD (  11.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

do_div() divides 64 bits by 32. We were adding a casting to the divider
to 64 bits, for a number that fits perfectly in 32 bits. Remove it.

Found by cocci:
drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda18271c2dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index a34834487943..fd928787207e 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -328,7 +328,7 @@ static int CalcMainPLL(struct tda_state *state, u32 freq)
 
 	OscFreq = (u64) freq * (u64) Div;
 	OscFreq *= (u64) 16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	MainDiv = OscFreq;
 
 	state->m_Regs[MPD] = PostDiv & 0x77;
@@ -352,7 +352,7 @@ static int CalcCalPLL(struct tda_state *state, u32 freq)
 	OscFreq = (u64)freq * (u64)Div;
 	/* CalDiv = u32( OscFreq * 16384 / 16000000 ); */
 	OscFreq *= (u64)16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	CalDiv = OscFreq;
 
 	state->m_Regs[CPD] = PostDiv;

-- 
2.44.0.683.g7961c838ac-goog


