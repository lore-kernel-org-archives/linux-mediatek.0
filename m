Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE349C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=; b=GkOCaTxV3G9ceeTjifadkd7Bi+
	6afrj5NcOrccHcl1vyZYfklFeNNxBj8LFG5qX8gfK4NonnVZwa+5aLG8ZMr9/2cEyssDUfZzH+pdG
	gGhVxh7rOkwUQY/VXhEQUcED2EjrEZ9UgZiszdxsexDEvTemKCL395VvABLNcDKeP6eTpqTozMVOR
	Qg5pHfC93hHS825ErpBF8+pQ6UUm382LG95i0ArnovYOMeUQE7jMtPsLMzIhB4r0y72lQrxpW9YCG
	3NCoW4ZninEtrf0SdNib6Cg/YF57cLM1x2LuL+yhpg4AEwbblMIYWydaT0+UT+TB5u1430NKBmulI
	SbNKMGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksr-000000059UZ-1J5g;
	Fri, 19 Apr 2024 09:50:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksH-0000000594D-32gg
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=; b=jl8srcobhefH6jIdtQuaGpZ9Yy
	WmTgBDN0Gy9mcw7u639J53Gy2awIOSRha4+FsSbNrY+Yl67UvqAURKbt1gnm9GYCllQKHEAWQcK6F
	GNGXJq945K2RI17Hs04eKq43WcUPGzmokifbD9q7UOui23J7ox1+TptGMUnJBTkvp5WzJBMzi3ShQ
	gHrD4KRlUgA6+JkR/yDY/o0g+UXJTvFRzRFchcV8zoivJOUrZrYYXRaW9dF+dP5cHY1EYtZmrIrBe
	Gu+TwpvDBmWLiEvSL4eAFN5HD7L90lIo81XAZDGWDClMT5c2CCNIcE9k0TxX5i5UUknMoZBxzGdA8
	4pGZbv0A==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksD-00000007Nf5-3OsR
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:40 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-78f0593f45dso121287085a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520174; x=1714124974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=;
        b=MLb31SWBp4JDBt/WljrDKfo3cxGfLFvCz/Pk4vEqBaKn4np3qKhvQ8G/wSXrqiAnL7
         jF5Qh85ywla7lpp9McxU66YLQ1VW+ou8X4Q08v67zGT/3S7b6SO5AHG20TGbWXZOOjq2
         rcvGiJveg5v+GsRMGK/d1APhcOhIhZLeA1zQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520174; x=1714124974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=;
        b=TsuS54IjfyuFAzPWHjWPALYsxALm6WWoTuly4vZUx8r0dI/NOogDy5o30M/Gm5Ro9c
         iMen4ENZ1vqMEGWGouPKsIrltFJJBEiJkVRurPEfsATIsxgj+kcM+GUF3jpzMsXxKJPP
         pcLwLjtXSUBfC6MErMEsxWiOu6LogOyOqrQv9s0nRQTRbqIuzoKmIJM4PqotCSq7vULT
         TrvakqUEV88fAmNIYRCYmpyUAYVtB0rUBeDiosqOI7vF4GyvYl07W7ZGbI7YnD0e52Ic
         aIy8yiX7MpN62T5lt5P+9caFL5Skt8pMqpCpDZegqCEXB5LuO9jkhwZqDfuX0CTpsn3a
         oFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEl+PxxiDXheeoLiG8FETX1jo6gJ3KjSiJysAo37LjnKjZiwPjLf6D/+PaMBOHjNaSNwaRXSE18fcEt6oRjAIsED6G1uGIeY9VTLgwWbnpLzLC
X-Gm-Message-State: AOJu0Yw5/1BctvmL50C5avm61T23qQPGrq7L2jSxUqHQLzEFm9dX2H1M
	onm+rPGmZdfhvwRejacvaRaQCyZuj/61bzqtk+OetHe/2qMLnzBp1k/jq278RQ==
X-Google-Smtp-Source: AGHT+IETv5IUoGgWksFs9Z+Dm4pcXtdl0bT854ihOygqGrbXzgeian082aGVpKk3VnS1RI+F74x9Bg==
X-Received: by 2002:a05:620a:4694:b0:78e:d2ff:a108 with SMTP id bq20-20020a05620a469400b0078ed2ffa108mr2287614qkb.0.1713520174478;
        Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:59 +0000
Subject: [PATCH v2 13/26] media: common: saa7146: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-13-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104938_065824_2F380FE5 
X-CRM114-Status: GOOD (  10.69  )
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

Simplifies the code. Found by cocci:

drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/saa7146/saa7146_hlp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 7569d8cdd4d8..fe3348af543e 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -122,7 +122,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 	xacm = 0;
 
 	/* set horizontal filter parameters (CXY = CXUV) */
-	cxy = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].hps_coeff;
+	cxy = hps_h_coeff_tab[min(xpsc - 1, 63)].hps_coeff;
 	cxuv = cxy;
 
 	/* calculate and set horizontal fine scale (xsci) */
@@ -151,7 +151,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 		xacm = 0;
 		/* get best match in the table of attenuations
 		   for horizontal scaling */
-		h_atten = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].weight_sum;
+		h_atten = hps_h_coeff_tab[min(xpsc - 1, 63)].weight_sum;
 
 		for (i = 0; h_attenuation[i] != 0; i++) {
 			if (h_attenuation[i] >= h_atten)
@@ -283,10 +283,10 @@ static int calculate_v_scale_registers(struct saa7146_dev *dev, enum v4l2_field
 		}
 
 		/* get filter coefficients for cya, cyb from table hps_v_coeff_tab */
-		cya_cyb = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].hps_coeff;
+		cya_cyb = hps_v_coeff_tab[min(yacl, 63)].hps_coeff;
 
 		/* get best match in the table of attenuations for vertical scaling */
-		v_atten = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].weight_sum;
+		v_atten = hps_v_coeff_tab[min(yacl, 63)].weight_sum;
 
 		for (i = 0; v_attenuation[i] != 0; i++) {
 			if (v_attenuation[i] >= v_atten)

-- 
2.44.0.769.g3c40516874-goog


