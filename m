Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0324C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=; b=UHEPuTUidUJ27kdFMEIE3noAXJ
	QDtNY+CrH+7r0DxDCNpn7VdrUfva4zRBgtI1BYoAggx1fC+dfj4diYa1Q6qRWIsiaz2XrMU8LYTGz
	DBA4MHa2PouYpIRY+OBTwP0DFX8VvXkJV5z/4grVwrXgVDvv3l5ftHHV+hj8R1bmn/KKZ4ET15Y8b
	lrrS/MNwpVs09Uz/v6R4Z9Tpd63+wZyeB/lNsKGnO8DB2PZwPasH/V8GDYkkFHYubn1SMO+iO5LdF
	uto8HPZ8b9SO95d/lgNQGUFvH8QSHIuj2ImaW9APbU5OgUxqfrrR0aC6+xt2aBWSM21ns1cnFJY+V
	fSGaH4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkui-00000005AXl-2ORE;
	Fri, 19 Apr 2024 09:52:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksO-000000059Bc-2UmQ
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=; b=MJn4pbKb0dYQcAJkCQT152EYde
	szq9WX75/hsjyCmy/RoCepEBXEeP64xq3Hm2VMMi+Tacwn1ewN/d0A5ZPJcFUr6XHZGH2sFWg3UqB
	QLypwW7N3sEoZD2+e2ELH7C62zwAjGYhNBBwdsan2QzFWgwEMv2DNoO+UdLqCtcZzdw0+9KFTGBZd
	y2z+zpe5MEuC4U7FOhEcOM/TsOzObgyrCZBnplw/FfQ8qMHOTpH5MQzLh1P8fbaJj3hhDfyT4hpiJ
	OpWb3GN2s/gRCxY2xViPPBzLDob529BWegkzkHh+cHfPEdJUuL1091UITJ2Cc5j5Tr3qfIJJckQpc
	M2FE4Dlw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000COP8-2b2j
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6eb7a0b3fe7so1118007a34.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520169; x=1714124969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=K2NrA282RPrQYhc2MWT6QS1716yrp9wybzQ6wF/RWEPqE5z0J8RutkMJIaDm1VM9Xa
         qXfTT4cIVYKUxpiPFkbJlpvp2LdOTyuorRWNQdanDmlg3IBN1lVVVDEjMr8svPT1kGwQ
         pnfOb4lXgVVxO7JC61uJeEGqeb49tzI6PLYwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520169; x=1714124969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI4AOi/6PtgU5zRnLUWjMVWmm8Y+CckVMvMt6qKhGc0=;
        b=qlfL+p6a3hq0Hk+hBqPFvooj3N+0oXeS4P1jyKUfu1HuxGtCVkARNDq/sWucdg+S1t
         8rnK5e5fdzzog2ty1c0sTkJYo0RvBqgjUvxZmUm6uvUi3kzHU/jNu5+0O9y544hT8sP3
         kYEBp52Mdd/4dS+cE6DOfwvJRoVK6ciOJZ7IGWohlPlS/XpcFs7gNXViygkaSDovarCC
         vyLxfIhaN90KxKOzTmZjU4GkTWdPhOVvI7CR4ameAD2jeaJhzljmhecXssAfsnD/PXc2
         tsjM17VUDqqHabsrboxaqqnVhpn3F+rAfriyLdyNoHdSn/TMxLgYZZEzknM8hp46S/D5
         PKyg==
X-Forwarded-Encrypted: i=1; AJvYcCUCsgtWE9FZMl55RNCdYg74bHIwH815mJO5U+Gjazt6XJG7T0U5IdVbnR+IcJMhtOdMuZmjxDmllSGx2NJhXT6CW8PBJcajlyeXx1XBrTc7n6oM
X-Gm-Message-State: AOJu0YxlWJn9veKVxFD05bIbrLnlNNF4R5NDX26Ag4Mvu881O+JoBNgf
	FvkCRGhm+l/7RGLDTNeuqP+5e0x6/Ve1ioYrsSsMXltLDeUDq04IvH6V5IUANw==
X-Google-Smtp-Source: AGHT+IEoa3EBjJC9669xc6mPVpvtJwhrzrmUgput3DoBfmRttNa6KJF0gCcMfSkwX6iyc+U8a8TeQg==
X-Received: by 2002:a05:6830:1d48:b0:6eb:7a07:8746 with SMTP id p8-20020a0568301d4800b006eb7a078746mr1521944oth.31.1713520169041;
        Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:54 +0000
Subject: [PATCH v2 08/26] media: dvb-frontends: tda18271c2dd: Remove
 casting during div
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-8-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_104942_363116_7F9267EC 
X-CRM114-Status: GOOD (  11.85  )
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
2.44.0.769.g3c40516874-goog


