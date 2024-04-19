Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ADEC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=; b=CX+QsZTxwbHhoPeBjbl1O3Wq56
	6e4w07zAt4j0LwIiTA5dnx11KgNEKyvWHgXiajyvEBuKdqPUW/38HB7Ug9fPeiEn323hLUfzQvHex
	aKgRA1Gq9d/gSPnIkgI1K+bRb78qoZV3rY3LgOOreacPPyw4S58jsQ3j945DPSGiAUZ5pVUmBDnTC
	QDkJ+HxwMz2Qrwh1izYfi8uUeT3iqLOD+rWBEE62zo5+18VRFLCS4ZkNHiIsac1WU8miTGQ8QNVT8
	08bCcCygIf3MRMLh3Yly5GMQkJekT6sHp/PPr3n2+4VGr0FMQGMkobRdTgWQLey1xIy1eBZRe9zPC
	9F5U6C+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxktK-000000059gT-1MfP;
	Fri, 19 Apr 2024 09:50:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksJ-00000005961-3UyW
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=; b=tfgSRRLLr2EYBT57W4rybzi5aS
	hr5Kw2+Do2lpCWSqEGsrlWP4/cMFWc84zib6pppnZH/QLymwm3/md0jNwWnxTFmU5RgAvSILMZWab
	H8pBq8CiMC/rNxwpQ8lmuESHByFV1aedz0Pi5c0A2Vw4gjLuQDkyRKejlfltafyrl1DSSqP6MB84Y
	klSdOfKn8lJ5YZDiZIEqtZ2/DF89tY6yWVFWjO+Bb/X8klBOLu6LTcq4mnECLrqT3Mjdt5DPkGJDZ
	Fk8S1H/hyZoSj5D6eAGRFbJ7qjLVhkHvV0q6xnIbuMvutOQZiqR3sIYnc6saSNWTn1nDP2NrSvDRK
	HGBjQ3HQ==;
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksF-00000007Nfm-0SbI
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:42 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78d62c1e82bso124700485a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520177; x=1714124977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=AeLQb+7yroz1N85IaLBmgCrfbdpcP3/Kr6zRrTzmvckfHbqn0C1akBhveY2xRW8Eu4
         bkG8sdLpAkU3nsJVUm8+DgPEASzHeDFPD/hAdivBNdcE9lRG0nDfprPfHzGTQx2FWJxM
         OpErqOFz61QcMdnjV75WKnwp8jWGDvF7oX4NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520177; x=1714124977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=tQYFn8G4/8N25ogk7VyOvAtnIAFzYqcGrZC8c/iKcQrTWjspGoDZP0+2TMC7/c4nnk
         eWfLKYD7+72v74UXmKqgSKSc+Cx7rINhzJjaOCy7Eti9kz7GpiCE8zcv+45VBWXls9NZ
         2hUHK1Z7pbh21kAouJGyHtCEV5lq22zgLZH5bdj1StCORPHXX9KJx81tc/Illc+M3qJD
         q5PWnaLR/Mv8ssI5ugmAXJyubTc3tGyDEINwu3RorWCQ4vpz2HS0RHF3sjt/iVmx47GL
         tI9NsGUOOrLLY6/MHL0A8dT5TmnL+jkSX7XyYotrAeJLEUCP9HQ2MEaH6xWB/gk0IZzJ
         AM5A==
X-Forwarded-Encrypted: i=1; AJvYcCXuvvZEVm/mt9T6JZwXn0wKbcmXCN/hoXsHGo33GKA1HqKgfieJoIkJJyP/nN9e6m1xrCMoib7jaspY6le2tWkjZMMT7HEjKZsvGAzfsbHCZ+Ax
X-Gm-Message-State: AOJu0Yy0j27B42FNEFUMcfa8yocb9DKxziDHtoIjP7h6LE68Dye5DrYw
	rbJuFEQ/JhmjzeWkFKbVxfCsvyVY8YYNb1XH95yWzZUQsJYKyX7Gthw4R9S55Q==
X-Google-Smtp-Source: AGHT+IHtaefRUDCkJpXsh07H2yA2NeK9gO3xvd3htQb2Rtwe8WSp0MnWmceFe0R4rsJzjkJBUbtDcw==
X-Received: by 2002:a05:620a:111a:b0:78b:e8b0:f156 with SMTP id o26-20020a05620a111a00b0078be8b0f156mr1546954qkk.67.1713520176717;
        Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:01 +0000
Subject: [PATCH v2 15/26] media: netup_unidvb: Use min macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-15-2119e692309c@chromium.org>
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
X-CRM114-CacheID: sfid-20240419_104939_214874_6E575422 
X-CRM114-Status: GOOD (  10.54  )
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

Simplify the code.

Found by cocci:
drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:138:26-27: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index 46676f2c89c7..1c885d620b75 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -135,7 +135,7 @@ static void netup_i2c_fifo_tx(struct netup_i2c *i2c)
 		(readw(&i2c->regs->tx_fifo.stat_ctrl) & 0x3f);
 	u32 msg_length = i2c->msg->len - i2c->xmit_size;
 
-	msg_length = (msg_length < fifo_space ? msg_length : fifo_space);
+	msg_length = min(msg_length, fifo_space);
 	while (msg_length--) {
 		data = i2c->msg->buf[i2c->xmit_size++];
 		writeb(data, &i2c->regs->tx_fifo.data8);

-- 
2.44.0.769.g3c40516874-goog


