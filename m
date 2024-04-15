Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9FDC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=; b=RQpfCIkQPfTa50aSQBJtIVHhrp
	MwYymSXBWTa42EhAzxgyqrWPfuKY+sawVUCf/R6benOgC9AegBt86SHbPf17bC9uw+VaD844WVJUI
	zGQBdniIXfW5APivwLKJ9X3BpDdvhJJ6KumzwqnNaV6t+qmVzHn1tGaPqJUyw5dLXa1QxM27fvoAJ
	ZGhSECtP6c+iSUFB1KPaE1zOTvBde9ny5TVa7dBju2igCC3D71deGzF1UUsPBkrc/56A6x736VK0E
	99kCk00Hw2LXCK5bulH5ekyIAbW1i5RBN4g2HcmtJttfh39IYESUnai5rBiiyjE5anP1Le+SWVTmp
	A2HHX2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS9M-00000009dus-0gNa;
	Mon, 15 Apr 2024 19:37:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6V-00000009cDx-1owP
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=; b=TF3LeZ6pM8nvofOhCh9ROpHUmV
	hniGzzJOnyA+clS5Dhu9d8ikH+s51/jOn5vzC1mohkRSh0VJCuHrtuc2CvCxWBkDqjP1zaPa+L2aL
	HmxO4jYYA6jshQM8yNnOzFleXMK7JvKW+cqTtFraRLPiJ6AjCyO2MFO9dAH2+FwalziiDRk/OHWY9
	oMdGODqESk6HD75lVFv67yPZXvjMNqO/4BxHbEd3W69nyXamyhYI+DvySQ36s7+6hjoo7lg1iWKtc
	hmBX8ImkK+ybIbrgqDjOKs8Y7ohGm6l9hxPOMcH4/aMB1Xjig7FsyydxWomXUe8hFdRKHHjebkRNI
	O9G7O22A==;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6O-0000000AijB-2FxO
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:55 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78d77b309f2so322286085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209690; x=1713814490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=hZlszzlgbAW6CeHqDfWA0DxNT76rUM3rFB2LKmsjx5NrhrsjD/tfr52Wbh+v++wMrB
         zjJ23wZfhfO3ltdjxOt83A91N6QQxiSfsFQXIPn096c6qwjUw1rbYY7na9cNvs6Mb15o
         +DeKjJJ0ioo5SVGslephigA05Ff14AlMOXoWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209690; x=1713814490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKMvbnJBvce6w6rhgAtTaziLR0gQM5TDA935faRghdc=;
        b=RLurYJ3xvNzan4TgzE/cEyDUsl0eHT02rS7ox1xDC/ssm38y8I+T8J0hH+Gpvry+zj
         sPMOwWPoEDSkZyplj5aAkypp7JdhT75wWw7QQJgkw+emyHBIsFVxnnlLioFgRYNboHh4
         alTZilB1tXMovMWmIx6RaEqn+YKJVt7PiwA2VRoZh3kkxORzXL/FHLf8+Rrv1PDpiTq0
         5+FvJZXGS1cX8FF6Uza3gfDJRlowFTOoo/yVy2rvjB2cPRfMMpV60Qm2X72kuH7npENg
         yVVfbhFxE3wCelnSt1T5+A4D7EfHKA7bwNdp9r76XzVq9QaeKcAspzv1HYOD5xRR1dsh
         Ijqg==
X-Forwarded-Encrypted: i=1; AJvYcCWeqVb1Rd6v0ZYKyMNsTMexeZnWC+imo3/TtMbxb5k6IM55OahSgL2iHd8SVQ5YA2kdivKsmlsbycdsJpqpgjjJUS4+IFPsCLlwibLxCcmvDSbi
X-Gm-Message-State: AOJu0YzhesCp2QQn+QGeibBS0DtaYTNyxoD9igwzd0In/1nT54U/+u/L
	YsExntnAJZ61vuptTGo7LPXCx+M/6E+mndyVoTxAE+0vm+qy4/XKc5ypIVydcA==
X-Google-Smtp-Source: AGHT+IEuVGO99fF8WY6cFUn2TeptksBJEwdpaYOr7CSPDLRmva6Ltt+et0Zcs6jy4zj82KXO8YnR2A==
X-Received: by 2002:a05:620a:4486:b0:78d:65e0:3100 with SMTP id x6-20020a05620a448600b0078d65e03100mr15166755qkp.60.1713209690125;
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:36 +0000
Subject: [PATCH 19/35] media: stk1160: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203453_497427_ADCB7C12 
X-CRM114-Status: GOOD (  13.19  )
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
2.44.0.683.g7961c838ac-goog


