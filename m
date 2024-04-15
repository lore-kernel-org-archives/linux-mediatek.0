Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD5DC04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=; b=O7JGbNvyq1bm+/qR/tpkGG2nLX
	l+5fZFfu/Xww79R2hl2U1yQJdkPv9eiWfWLoPdS4EhSGKD6XQPf/n5KadJZhjQY+gIaA4Ps7S+h3G
	ZOw16XuvDcrvN6FLDo3M+UCtGYL31ZNUqD6/Vyhh1F8T6RgSmV4ur7YFR/Wtbw16FgHU9rVfh3zmy
	Y2S9E3Yu4s5lKFN/MKWrZQfGS/kTtcFcYDUmsvU7eM1aKsZGvIj9D1K6ZNzDNqITxHgheAQfdZKWH
	21J5giwUkUmpbW3o09E3IYUA2orctppCHEx2Vvo+fDmLOxANxjXE9Im7qcGXcvNx3hAWtnPriol6+
	8se6Cjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS9Y-00000009e3k-1QEg;
	Mon, 15 Apr 2024 19:38:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6X-00000009cFg-0L7b
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=; b=OrYJwzvjmlxosNIJ6lJesE5Ngv
	fa6IwKAMtWyELJQCvpael1CFNzsAROGWs7NAR/wbaDjyls19Z8TCTRGKLI8Z9WxzJdXwawf6FlLXi
	Jw4AHBaOxHLtSCy2QMMUFouZWfbPyIVfFVfzLm4DgiNDfHdw0fJrxTak68hQHQ48hrGHzyX+61lwy
	VF0czxZcY/sjM8wvqvUwLcApvklHh7YzK6bRZrYLnbglc4MoY3aZhXtkY2rcJLZNDrtJTPyYcCw9O
	YOavo+WuP/j2Hdozf0RWVm3Gn7zGUDmgR9stFLe1YqHKdH83gCopKg/RvRaP7qQ++4MpC71Kj6Edj
	GvNWcaJg==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6Q-0000000AijK-0DAZ
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:59 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6eb7d1a5d39so1007888a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209691; x=1713814491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=cdY25WV1HjuPQY2SeX4L/xlta+eH+H3fndGFFHKAOplp7iKjrEGQ7PdGogVpaYtknD
         MvzKQyUZoqlFcf27WpN/Lj0VJ/qPbrMlN+n3lj3aMeMXzgJ6YIww4C5D9jUqC/hon/el
         /jKP7nzxWS71oBkNneANPRl9BzjkHfluLMytE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209691; x=1713814491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=PeH2LgFXGJE2HT1tq2H+FGmvd4y2CVTbOzicdg93Q/U5pHSCeM/ZzGkdLTtkQximE/
         mBbfdx0/Qof28kPFVRxDIx6KVIe2Z2XtbhoNkR7m40kLXecNyaPy8EKGHkAOtXTM3wmb
         S5xZPt80RRaYsy+Jysk12i+I5Sr81BlZOvb/XWjJuddMGD7z5coBcVtXy3d75UYcaOeb
         n9fnJoMJ5FXHNnD4jjfgwB+s+7PL+APxpbCwnR22rZjAjnYk0T5JLiICJfjEQJONWNaX
         7dBIP2bxHDPTM9L7583qxHpo+T1E6LO3uvs6jCqHJIGQ4FZcE3LP1pMJ7R3Rlu4eGXcX
         jpUw==
X-Forwarded-Encrypted: i=1; AJvYcCXRyQ7h1T9Vv6UtZZl/i6DiHnrIqxI9GoR8ImfrQ2v/b3Gjn/aHBO0KABvgjn7JRvBCF3n9dtnoHpZ90EQVT2CXb96JdEdN7HlTnGxfwqUS0zdd
X-Gm-Message-State: AOJu0Yz+YMuML4pFJke+U7xEERoXwaNilCt917SmcNDr4mPlPOw5Wcj5
	kyhUo4SPvgI8hpV5gPSAj4TYXRKlLLPcSXaUnxFVLwCNReLsOBYH6QwH0iwn3w==
X-Google-Smtp-Source: AGHT+IH6vSvyyYYzExFejV09di7HyPhtKMxRA7xlKo8y+g1ouireMhE+BqwQkFqVSegum+jG+Rz+Iw==
X-Received: by 2002:a9d:6ac8:0:b0:6eb:75b6:4245 with SMTP id m8-20020a9d6ac8000000b006eb75b64245mr6116943otq.15.1713209691286;
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:37 +0000
Subject: [PATCH 20/35] media: tegra-vde: Refactor timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-20-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203457_635878_4349D686 
X-CRM114-Status: GOOD (  13.32  )
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.683.g7961c838ac-goog


