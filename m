Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B985C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=; b=qq67SCXCP1xAf0v1qXfAPZ+ylI
	mmiL96MuiK/1zHn6xxbrFJb5jsqFm988diJEDYCkubKwJS+TISm/9+4ejDDcUlZL8jFdqpeJtHSLM
	JDbCD643GI2nyEse7ccneKEBdoh1isNUr5CtZ8JSRtH+sykoriE6z2fyJ1k9jpSq+NYcbbZcVyrg+
	Y1opwWX1zxVVAGOIdQmumu+Q+AgtXAaNq0+EkTIp1eDWAaGSFjtQIg0TNHeIMh1Wmyq1rt2Ez8uzL
	cgEcQnqMeNbnWdxJ6Sr+q2Q1qttP5rIJym/4q5Z4aclh+ld767EWhFjhQU+SoDcvSUexXc2HOpamT
	t3svdGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkuT-00000005ANf-0ROz;
	Fri, 19 Apr 2024 09:51:57 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000591b-0qfq
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:48 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78f02298dc6so151338385a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520178; x=1714124978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=cwjfvOc5t2/Rv8qFUttYxYGvFXodHL/LaHscuwkq7i+GErkNpmRuwsKxJYFlkyKaeA
         19uiywWsU0w3Wh+RLGG7PLxL11teL5DQEKqx/ilVfkwSOcauWBgLAkykKXGo5i0LOdou
         bnfCTV/ZM8EA3JoyguDgIkCZPvfGF2Snbpi3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520178; x=1714124978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=kMEZ4sCZKSOYdEIaB/oqGt192hXffvvZS3ML/xjS3gqSLIIVGxqGQc6iV3KuKePaaI
         cWPMRW2nRsYYtzW+ZmjA4ngUEYMq/GLfW77MPTeprsOL+phgHV0CFvZ/RIq49vRWZhwo
         ni6ONgUmj6QPi9qpWPEnNWDe3spCwFH2gL+qmYIK9oyIAkyVfHqIwHQE2jVoS1mH5409
         4OyMf0viP8xHNGpL7q5dbKhyDeMfMCdt4GDoNdL6PzWh+OYilWXu94IJVJ/YTrwYJBET
         McikWqG9Hv6/rUvrcbEem3jJGr+Pc5y8gNLCtJ1yFIfHdAcZeiaS5kP1w+7wp+ZFcr4P
         YSzA==
X-Forwarded-Encrypted: i=1; AJvYcCVkYlnP0z1JfNl2j3RD1hdT/Z97U4+6YFzC9lR58sQn2rpdmLhxSbyV/SxDcf+LMpAw2K0xNP1qp7wAlmsYJOiuuRBFc+HZmQ6bEiMkfJB0wsJw
X-Gm-Message-State: AOJu0YwFfINyz6oVENyuNCKNz9XoCOrWa051zc5AfEHqyILME7gHBdP2
	2/+QXikRCT2NObhN8S1OmiYHX4ZKR07RsCQQ7GzGH6MyZb/BXC78r1XT1WhSfw==
X-Google-Smtp-Source: AGHT+IECi6Jyi4V4xEUSov8CqJCQ4or6T8Il7gtYs1qBNIhEZ0wlq/VmHa5Y/Lm3RCi/7xPm+Pq8wA==
X-Received: by 2002:a05:620a:45a7:b0:78d:5d86:ee3a with SMTP id bp39-20020a05620a45a700b0078d5d86ee3amr2694110qkb.27.1713520178140;
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:02 +0000
Subject: [PATCH v2 16/26] media: au0828: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-16-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_024940_410791_F9AB38F9 
X-CRM114-Status: GOOD (  10.53  )
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
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.769.g3c40516874-goog


