Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D0C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=; b=eh8YOI0P6FVXKnvPGjD9CQRv/i
	s70R0ffMMLAB4r49AEcLuHjTTuxF43QhaSVRXZS23pMszRlA/wmf38P4pAri19iELD8S6oq+U6fIp
	htctdnXXB9998k5A1RPZZPscrSSWpjIGnu215Xqi0SFR/Lqxk7tTIr5n71jsmlaLhk3gl82nohfm/
	PaIVFy5URCId3rkCq2+XmV8HhletVbavJM3KcHLTX8pzQ3kTxwEO+V8rgfm5zzY8tJpDnsoNIqbJO
	P+UFlF2ePVWdNLP5UxP6VGjuPlgd9o3RIHOI3pZb5QbTa+p+woX9MJtE1U7xkpQx8A+6BUa0MDiU5
	op2N43uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkvA-00000005Aq5-0X4h;
	Fri, 19 Apr 2024 09:52:40 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksJ-00000005951-2iuJ
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:51 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1185488b6e.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520181; x=1714124981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=oNVml3L57tHzFiiK6Nq1VCyJRtCaxfPCeuTTMCeYDkvCHAWUC7X8z+Gj7U55bXrXls
         arimyZwzWXTkMq/0hPGuE0ndRC94glPWfMz87z917ArRGb4dHGQL+sTSnvaTsvGayZlt
         m/3VNgdNQzwNO+75HFCigUZNGpRr7lQa0MjSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520181; x=1714124981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=C13jy5dIGRJJymA1IuCzz0GRtfeX6NK0bL5coY9RL4uMSA5AmvyxBbeFmxptoOBN/t
         u/HSHlwa3U1Td/UNt5FwkPM+WRb/+ncFcTUZuebNp29mykRZJgkoOE8CEzLxhTF71tJU
         34UZ0L8XpGSuheKWGhQU0HONs8SuGeGuvfr19T/qO+XehWmO36IQfaYGGYXuK+xdht9i
         THKAFp7FCfludSfuN1QD1Sis5LH6M2ZARdeEspVF3krlTmftbjo3MpAG7jSJ0o8+8LAC
         OOuRcRZGBuJhJzz8Gn2IbcEQo4QBketqIw5d+ewXOqW5Q/Ip2/fn+84AIwX5IeKwebGL
         v6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgddNdwIxBCMUyq6tWuzn85MHNdpsKGzu4VhOswIMb4herIK5ncA0Ns+Hb/8L0nOsEO4K1uU7VbB6AuIabJFIqTh1TbRLMr95Hmd/8UFrQqNto
X-Gm-Message-State: AOJu0YwH2y24A80PJw47ufqN4wx6hDS+enE/3q8z1MNEcTp7vFpt4l5/
	K9qjgoIEhZ3e12S8iwkDSnEGA1KMWkg+gQzvfrgs8pUUk4EsMhZc09jREnAa0g==
X-Google-Smtp-Source: AGHT+IEqg8WI1huh374uXjkgiCfNW5dvf3VCHAQb3EvwSLWOaLDMHldgLr7J0rc8UDIeS/oMY5gCXQ==
X-Received: by 2002:a05:6808:2029:b0:3c7:2eff:7dec with SMTP id q41-20020a056808202900b003c72eff7decmr2132218oiw.2.1713520181341;
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:05 +0000
Subject: [PATCH v2 19/26] media: stk1160: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-19-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_024944_388868_81F77087 
X-CRM114-Status: GOOD (  13.15  )
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

Simplifies the code.

Found by cocci:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..0ba0f41fe3f4 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -130,10 +130,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	dst += linesdone * bytesperline * 2 + lineoff;
 
 	/* Copy the remaining of current line */
-	if (remain < (bytesperline - lineoff))
-		lencopy = remain;
-	else
-		lencopy = bytesperline - lineoff;
+	lencopy = min(remain, bytesperline - lineoff);
 
 	/*
 	 * Check if we have enough space left in the buffer.
@@ -173,10 +170,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		src += lencopy;
 
 		/* Copy one line at a time */
-		if (remain < bytesperline)
-			lencopy = remain;
-		else
-			lencopy = bytesperline;
+		lencopy = min(remain, bytesperline);
 
 		/*
 		 * Check if we have enough space left in the buffer.

-- 
2.44.0.769.g3c40516874-goog


