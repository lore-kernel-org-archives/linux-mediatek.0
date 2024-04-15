Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241F8C04FF9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=; b=TxxAj6+HGipxTsIbQiSwCeNSRZ
	lFHa94bNDPaoK33iPqnmzLVBgwPGFjZ9YgZRTuiu/T8kcIUkrYH9dsg8B/FB1imRTK80fGz0WV5jz
	6bWHpUjMtScumcq622h/zDwsOJIAZPGpFJo1npE/ohzG/RjBWjF2boYPpbSUXF64QnGBitCau5pTY
	qQW80Ab3/fQ2unt8KqLhl65BKktYMDZY5fstQzJ2kqwLgM8Ls36OUDN1m5lnv59taPDiISLs7oTn7
	aXQs4SmOm/7sCSPHU1jzn76ff19apFqrcaULYUrIUpmPWmIQHWa7/UibIZV/Cen80IaVkmq2lQWk1
	o0fDAAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSAJ-00000009ec5-3iMW;
	Mon, 15 Apr 2024 19:38:55 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6b-00000009cKs-3I7M
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:35:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-61ac45807cbso13627217b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209705; x=1713814505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=EzCB5VL+5fQDFhYpw7PBZn+FgZ8OcFREQdWnOGxRk92zUzfw+ehVtf20z9FxC1QAKr
         23YMJOjnsSCWga8tmUBEXKZtt1NlbbIXpRcxQBLl+GyK/xJydNHBr8mxnxFhx3QQPReB
         MdbG91f4NuCQwjOwrTmFceim5JRPxyEepvK0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209705; x=1713814505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=mjLCgP4V/AamosUTiBFf9/huRjAN/EOdf7krL2lAFtkP4TvIDQa7S+uCdHjBWtcq8h
         biB0Y0LD50v3KAHQ+ZUQSPCNClwwg7JG/ZFswJBasN1vdG+ChWiJ5ENR0oTgk/87nqjI
         H4DsY1DJqi7NzOGSCEiJ27kilTBVgPpt3P6aPWql9Ug8SqQbayJGWQnwhOYBlHE4usdd
         VonuhWqJ4SDF0bfTVGV5Vg7mBvmRB7YXNv0FyIy58g2AMsQcJW5FIZiBU7yn3bcb0md/
         RFlW7Pu4WDxFtu55WbGEQQ+NhJ97jZgqt8jLuy5xGdRlOek7zvR8mQSBVq+6RCXswI44
         jtTg==
X-Forwarded-Encrypted: i=1; AJvYcCUulqOU3OhXN22U9/k5aQ7B1DOj2tpNaih4SQM55YW3AzRRLAfBVejrLfMHU5j6t+zBaq9zmif8cu9CSh/K/HrfPec7GwsnbR/9FoS6eZMpNuaX
X-Gm-Message-State: AOJu0Yx8ucBvGeeGMmuUk+XFHrSo3PeB4ka46/+nh5PeMHvck4afIunI
	eFJS4knvAQ2LV569QIl8nWJsZiXhl3CPi2c3/HJYD06uEzAlDJAzAy1IYhBVPg==
X-Google-Smtp-Source: AGHT+IFGGKloXi4LQc1kB9HoB/VhdVmfNZmSGv5YL+7VwXl3CHp5amZHgBcaP1BDvt5Qqswtqu1lLA==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8807707ywd.21.1713209704967;
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:50 +0000
Subject: [PATCH 33/35] media: ttpci: Refator return path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-33-477afb23728b@chromium.org>
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
X-CRM114-CacheID: sfid-20240415_123506_227193_AF63C8FB 
X-CRM114-Status: GOOD (  14.03  )
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/pci/ttpci/budget-core.c:280:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ttpci/budget-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index 25f44c3eebf3..2d85ae1ef50b 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -277,7 +277,10 @@ static int ttpci_budget_debiwrite_nolock(struct budget *budget, u32 config,
 	saa7146_write(saa, MC2, (2 << 16) | 2);
 
 	result = saa7146_wait_for_debi_done(saa, nobusyloop);
-	return result < 0 ? result : 0;
+
+	if (result < 0)
+		return result;
+	return 0;
 }
 
 int ttpci_budget_debiwrite(struct budget *budget, u32 config, int addr,

-- 
2.44.0.683.g7961c838ac-goog


