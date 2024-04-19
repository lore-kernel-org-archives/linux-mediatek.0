Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFBC0650F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=; b=P5MVEP3aAeqIdcWxm+BrrK+d7i
	hKchcFFwEs2R/dzolkc8lH+1ff5MDeN9zYffBPyhnIdnki0+KBWqImhAoME//XB5r77r3aP3hvAma
	872gNJbkbp64EQtjI/h7NVBaMOX/nJ2dLbb3FP5B8OACf6jQ500fgYv17qJ96NdyavAXXTtsoxJdU
	062AauxqZ+XGDR2wf98AVHNDtThSY/B+lldatFat8tGbCOj2FYq63+6JtgBoPHQ2+cRy6kYtz+KXR
	RE/e6lloRSfG/ur+OS+PNjOXPpRimAdTp+jxUJmsQ5uoS/wScgjjXof1NXbypWjeDXa230qCv3max
	ONJbae8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkti-000000059uW-3Lrh;
	Fri, 19 Apr 2024 09:51:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksM-0000000599G-22xc
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=; b=RqulXt1aPNJ7T25KxANTHNHEf4
	y6KysEA+ZxkJA5RsPQMaukL3r1AaOYzSofhJ09Gpil/r4nOqTnvo6VGB+qNn8baOlkYcQjAJiLhQN
	fZiuYGfL8KnlTZdouIVSPa3tIDgbMtYoosDN6AsVIB+fWMAm/4ZrDyIKT+0EjDDnpp0kFp50/pPRb
	0SxFibO9jz+Gv7/wOsu/ATfOO2SdoiiEQT/IchmLBxG7VqdIrHySqG7J/8t02zeXL2VE+Bd+xPVdB
	GvvbJRJhl2Ha2jwJ9XpIDfwYpNz69vWwKSwIFXtEn34WI8WtGWg2a0deTBFAzWBseore9aAgZrGxV
	/8ntqmGQ==;
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksJ-00000007NhH-1fuV
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:45 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c7165170eeso669051b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520180; x=1714124980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=O1DM6r9JUUb72i8DojfVGiMxlJVex7h8qadGgMyZ1EwxcmPXy1yoYKANzZpdFKYvuf
         iqXurFj337FOjvRus28ayJFZIVu8xDURgA/HCsINfqE+vIBl4oH4OXMATY5ad6laIIGM
         xSIjQh2KBvvHe2d/F1Rc3IBHzt6LGbPNMiGHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520180; x=1714124980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyue/FRqn/p1WnqrFE53P+Zy+G2t8IVLierFxkwHoc8=;
        b=v2sF9js5hIqXBYYLtdQClH2J9YppOlYUqtgWy4UtXs+Bm7NFPRA2/ijngJ/+Q2T/6C
         Kcs5LZNgYigkiTZh72sstpjUz1yE3iqvlFCkfPSdBKUfFswZo/Puowmnt++4BfNciwxk
         FxxYoZ78mmgjv3sR55PX9juM0DU6T4s31dYBO4KWE/csx2pBzPfdC0+dUlw5S9uHjLGJ
         CbQFG54sTJOQdhCFqDUXX1fxYx8LNF4FpGJiVRHZ6KfiL4f8rxRlRjKSxmH37x3v6Zq4
         a802tEzIqFPdas/fscqgzMgo3XQjLSU0vyFlNWqKsoKoAs+t3kwS4QlYhdPbEjQPraaB
         ih6w==
X-Forwarded-Encrypted: i=1; AJvYcCW1nZRFMweJlz+f1Qblm74Ff49u7QYgxTZfYmbC5yoEomUC1NbYBonq3fyMbkxODuYEHzcf6LcWOurWTS1eQ/PGcxnGgk/nI0+iRRgvpzk54Rjw
X-Gm-Message-State: AOJu0Yy6iPRCkEvniN8jpYbsaW+XkjUQObhOY1oRkkrVJmXLMNa/UWUq
	8Tb3sMSVT11xl048+1WiM96a8RL1O1h9V3jQxklry5GHvL16CnH7tE+BkTjTFw==
X-Google-Smtp-Source: AGHT+IF05pxTJqI8q4Gija+5b/6oIu70NmHvysRWeLZw4zGGPxVTDlI+xOCyxI7lSqjlpj1TWOe/3w==
X-Received: by 2002:a05:6808:60c:b0:3c6:f6c9:6bb6 with SMTP id y12-20020a056808060c00b003c6f6c96bb6mr1556563oih.41.1713520180310;
        Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:04 +0000
Subject: [PATCH v2 18/26] media: gspca: cpia1: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-18-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104943_488479_EDA1DE52 
X-CRM114-Status: UNSURE (   9.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplifies the code.

Found by cocci:
drivers/media/usb/gspca/cpia1.c:607:30-31: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/gspca/cpia1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 5f5fa851ca64..14aaf36cde6e 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -604,10 +604,8 @@ static int find_over_exposure(int brightness)
 	MaxAllowableOverExposure = FLICKER_MAX_EXPOSURE - brightness -
 				   FLICKER_BRIGHTNESS_CONSTANT;
 
-	if (MaxAllowableOverExposure < FLICKER_ALLOWABLE_OVER_EXPOSURE)
-		OverExposure = MaxAllowableOverExposure;
-	else
-		OverExposure = FLICKER_ALLOWABLE_OVER_EXPOSURE;
+	OverExposure = min(MaxAllowableOverExposure,
+			   FLICKER_ALLOWABLE_OVER_EXPOSURE);
 
 	return OverExposure;
 }

-- 
2.44.0.769.g3c40516874-goog


