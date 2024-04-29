Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D44CC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouc75z4uJmyNonUkF5EXar7vMPGdSwUxTwWXSBMXCBo=; b=xvDGqc+QtR3kXO8dl+VOTpDR3U
	geaiEY28DSiO+hd5WcXmDVORJPAVKlbHgNK+QHmBPMTDJ51I4jKSENvC9zG528xRJ7WJOJRTFVAX1
	Svx2scTRtgEixJKeGZs1QQySuoDYzDKEdf44VFU6buaDFaOZ/bJxncIsD0uheHdcipludMPpm5aE5
	SDW8wKJdTFC8WVgJI9lp6yyt3KKKWUjXjlvayBdPVaE1uoWVe5U9MJnMt+uT4ln4Gr/2BlaIUt4I5
	YDWBMlcohwhNYeeJpASgeN+/BFZUzvXfSWGq/HF2KaGQg7XygH7MIavzDeKHXaUzMzKK+44U1kppW
	9oIvct9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sap-00000003Gd6-2x8T;
	Mon, 29 Apr 2024 15:06:59 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYs-00000003FRK-1E1h
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:05:00 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-79100a90868so29700085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403097; x=1715007897; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouc75z4uJmyNonUkF5EXar7vMPGdSwUxTwWXSBMXCBo=;
        b=brkT1KUg3Vu+80irgnN0D+JNtMBmA6XO9dHzlG0lz/RyHZwcBRPu5XmLB+ade66L7k
         a1e+Jovda4qfkpcygSXo6R5CbgOwJF8ZXPgVu8D4dIid4LUkuDfFTq9rAt+tRVUmunwz
         R8pRk2E12UarII6x4wE0PdmXPXywaeh+CQR0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403097; x=1715007897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouc75z4uJmyNonUkF5EXar7vMPGdSwUxTwWXSBMXCBo=;
        b=h7AtxZ7nvd7s/ZJkWiYWQ0uYSkwSceLXdH9gpSgQkbNWz2ZBnv30CvNh3Gm3hpOfZB
         zSQH7YISBN9uhBkTvLaPo1yGIPvw0CLkjwseTsinx3+mC5lkESjRZUY0MsynxPW5LVI8
         zHaBk1Nfb85onrROeXf5nKf2gxmB9UlG8Jl9SJw3Sabl2ahZVcjaILbi2HpBrjuTnxam
         RCA8w/2CBt03xNusCTZiSbJU+Hn5Txgyw1GV3nocIhjr9rxjgWBQr6wDY7z55KvoSvkV
         AVEE8gCzN7QEhEzr6NtZWfWNp1Jc6SrOontFQc6IQBdhfwl7eAT69duwACOYjeHvu+9m
         G6KA==
X-Forwarded-Encrypted: i=1; AJvYcCXI8UDYaaJoVvJvpuiiN36rKOJYeMPYnA/XUh6y1aeLwtVHMLLwJXF9vs7RolAXtCbAQJJLVI9goc8dQ7P2DyOx84ghUEEEbWZTsVF6lUiPjgpe
X-Gm-Message-State: AOJu0Yxa8fkuUM9OIQXVqcqyEwAHboMkfwL1CrF63OLv7ZuuUe/nlptR
	cPtz4urPYnlgLdqErCUeWBxreL6zZi6qfBd5A/SVFChWHEvg4YnTcjqKEVxGwQ==
X-Google-Smtp-Source: AGHT+IEBZ4dmfr/e0QaIDLPes2AA5z7Utc0Aqd4uHb97QSLpEnTeDt3Yt9PtJFu+W2rGkPiTmePlKA==
X-Received: by 2002:a05:620a:640a:b0:790:f573:2ec5 with SMTP id pz10-20020a05620a640a00b00790f5732ec5mr3631789qkn.8.1714403096616;
        Mon, 29 Apr 2024 08:04:56 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:52 +0000
Subject: [PATCH v3 13/26] media: common: saa7146: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-13-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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
X-CRM114-CacheID: sfid-20240429_080458_506945_B280F80E 
X-CRM114-Status: GOOD (  12.59  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


