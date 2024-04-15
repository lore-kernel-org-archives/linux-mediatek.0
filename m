Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4B4C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w49vqOwnRlIfNq1dtx4OWinIRfPHFawqCMqrawnhls=; b=TV13CrQZRuEwa4qStCTW2s4zBN
	buyPVXLhESq1xjRwcnc5UWMDxhQi6e93kPUCpx945upzH0AEWcf56silZyKGOmY+INX7je8Ec8fuE
	ZScKZx+f4xOCrI4bYJmI/EivVFLRQEvFvb8uaJxOp+Pw7OtMnw1nGwzc+wF/dVTIFUzcGCtB0VtAM
	/TC2awgEDsRVy6kQXodiyYE+5NdJJkqnCUSglcyJbqgF+JsoFGPbz084dyac4PO+dPg9DMbuebgVX
	0FdXx60PN7Xt53J28XL81+8VyVWjLUsVA9RhRQgG4mS8g0Zz+N9hWjYXdKYxiVztiN0s8g/0ZC0wA
	KufkfKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS7v-00000009d7S-3KmE;
	Mon, 15 Apr 2024 19:36:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6O-00000009c6Y-0Lnw
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Apr 2024 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8w49vqOwnRlIfNq1dtx4OWinIRfPHFawqCMqrawnhls=; b=NSlsQVIk33soXdkwBwoR05Gug1
	h16yDvyzaPDQuZydp7MpmvlzmEXsSFwZtz+jb8LFoBwVdDUF/tXOwWVh92w2QHkL6vGVmPXsvoh8Z
	w9u+FUei+qTyAXfEBjqcrqWUuK5n38o/VKqGa4T8XQOWBxKdSQ7NlqRdVDE8Vd4DPfjRsbM6vYNS9
	mle179HN+OQBIoHVfoy70IrF6HtnjV/SW2Kw+ejKOILum78yzXBFWwAfITY2/u7dW7mmF6lp9gFX3
	3M40+4vsl2Qf0Lkph+Pq4RZY8XtP31eeGM1WOH87x4Q5w2EIsrPByiHZmWmnJUodByLR1S+xqX5aJ
	19HS1uag==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS68-0000000AieY-0PL6
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:40 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-78d5e80bc42so314622785a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209673; x=1713814473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8w49vqOwnRlIfNq1dtx4OWinIRfPHFawqCMqrawnhls=;
        b=SXSJyJOE6QQC/V7SLIkSUMATmbOkbIb5YEyfdEhY/7XGHwgQjxysZItg+rCQckT++P
         LZGPXFkWg6nOi7YLRZzgHFopaFap6JaLS2w+jZ+HIQgGLl7N1jin/Quz6C9EqcvC2BUe
         vfSjjrnoiutARqtToLBD9H77Sd0dnTjK12UX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209673; x=1713814473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w49vqOwnRlIfNq1dtx4OWinIRfPHFawqCMqrawnhls=;
        b=YtzRp7wwvCbtxIjG4jgDt8p3mUovcAJ7ZATuMo9/I4wnve95HNgeOpYe8a7yjcsjpR
         N6fS4AiZd0cI0r9Ihdqj+3yk+9GsKFdzmGyYAl+iCwIlY9Vx0Bh6a1h5rEa9rpV5F69y
         gcrVIq554587gllmS538sY5atED/xjsjXeNVgLoB70IBo9YLX6k46YWZg8ACERJARCAk
         IH8w54lWMedgDi0a28yyqUyKv91yySX5t5xPCv2IRakoyJqqXpfUfYnJd5cqZ1OYjM87
         j/lh1SHpa0SHlfXg7itazw+5rONpO6ijLHo70dcv5FC4E4/EJPB9G2GoP2YVHoK3dTic
         BsOA==
X-Forwarded-Encrypted: i=1; AJvYcCX9vrX96Lk9r65X500XTUqD2p1M8HBAB3+hQZE5lCxZrsACNqb03sbV4rQ8w20is5ab4oNPc9Gx6K7a57Peqg3T8wbQk8spKGHGEUavyPSs7+VP
X-Gm-Message-State: AOJu0YzaDwq2rTlSgDgZcvynRyOhGfdnsZEpCB1O/TimKHDVOpCCndz1
	c8JLPfJ3/pOZBNssAaGlA+5lTKBYhOw2YZPrFTxjZjhMSirX0k3M+LBzURUkhQ==
X-Google-Smtp-Source: AGHT+IF3Z64gOvH813ZrsURn6c5OX0cA+P7DewlH+o86rsWDf5urUOYDJaPeLXGD215pMul/2CCAvg==
X-Received: by 2002:a05:620a:5e48:b0:78e:e7f8:a5e3 with SMTP id ya8-20020a05620a5e4800b0078ee7f8a5e3mr3707352qkn.52.1713209673334;
        Mon, 15 Apr 2024 12:34:33 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:23 +0000
Subject: [PATCH 06/35] media: stm32-dcmipp: Remove redundant printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_203436_555730_685E2714 
X-CRM114-Status: GOOD (  12.44  )
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

platform_get_irq() already prints an error message.

Found by cocci:
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index bce821eb71ce..c25027b0ca32 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
+	if (irq <= 0)
 		return irq ? irq : -ENXIO;
-	}
 
 	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dcmipp->regs)) {

-- 
2.44.0.683.g7961c838ac-goog


