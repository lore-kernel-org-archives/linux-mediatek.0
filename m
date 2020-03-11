Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72FEC0044D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:20:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAF520578
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABk/8IGw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2+txh85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAF520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ny/v1lCe0b5Rw5c2IYiSu9VuPIJxsxCM8Lq1QYGJprU=; b=ABk/8IGwS2ytxK
	gkfjpRCcxBCSeAtW3ginTn74zUGI7fNLnGhLqdhoLP52ktD2BB5faeWa+QYzaQN6/vLmBWbLtt5i7
	fWZGHUANVUsopQWOpJksLGY5RHWzSjmBYF8GKqeEWgm8B+9tV+oeU3kCgxfRnwUl1H8Y1IU92giAw
	fTbS/ITEpC4zXAZFzULuFBoALHdyM8+UT2Tl/DoAv1p9MunM/ZxuJTYxaXvtDFhrLR2ue5utdAGBo
	DbIV5cB/gX1xmGOzpBrveS8NXHY84e0W8oV/GvUEsWcqT5gyEL55lFIuU1NEY2hpubhJ7dyuNKvsG
	INT1Pnwda2QnRPj7YFSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6tX-0006TC-5W; Wed, 11 Mar 2020 19:19:55 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6sy-0005wB-Ey; Wed, 11 Mar 2020 19:19:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id m5so1731492pgg.0;
 Wed, 11 Mar 2020 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r42oaftrh5pHz14qU1GYkB0RQE5bj151KUZhP6WCLUU=;
 b=G2+txh85XP+S2jm9NSogjxqBUikS9Ngp6DtlfWcrAd9ufiH47Xb0eN1WLqYPThF/21
 1CiU/fLxTDxovvO+tstyelBWaQNE54Cd9MaVw5sUNbbJll0t9oy6RoVBciTb1yx+p3n8
 SYMIbkSRuqEWGJPp9+ILBaLuPRjrhgatYgkP4uCMx2DpqGuBtdGqDm9bz7yvAOkct02H
 ymKsFcr0TFGylW3wkp6TPDnM7XYWoZVV1aaNU6yHrcziFZvZIJAKRJCwXzanVr0JxFdT
 eOoxecolqmumlXalOmw6vTiAKijvk0SgCuOyhL3gDgTTbUUoHdPR+r5SudaD3n/8pHnx
 JSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r42oaftrh5pHz14qU1GYkB0RQE5bj151KUZhP6WCLUU=;
 b=RL7X3Tap/7GoNQRLJEAZMBM3bMNJxXuEspBYKcARA3cykSk9TCh9qNjrSeXaQAaGDv
 ACbSmoUnqum43ChrtdsVXJ5drbc5WzZQQ2X/EUx0fkideKENchtJMYoGpR5Xoqrq7LF/
 XwcP17hi3W9jVqz3XcBWU92gABSygoRbfPJw6F5fzJCg1s6MVtxHwHIZ8BdqIz4FGz0x
 WK5o4Ux04oZuTop0Fcx5939vyvUFz5Q5BLR5EjJuNfPp3jL2COB9387TZ9GOd3W8cy0O
 OtO1n0jJ9oZqnDGGOrdfCb9MgegMy/38NqtImYa3WRAsxFApdqYpTiVubGZoCRbB44MM
 v/KQ==
X-Gm-Message-State: ANhLgQ0Bc8l2I8XY2k2Em7ZNTVqnrHxYRJ6M5wyVe0TBTTR0fbkZkJAL
 mIPGwuXcoEN4F0lj4uZDCgA=
X-Google-Smtp-Source: ADFU+vtbPme6BTAJZmyevs7rgWm3h1iPQrP+b1siICnoXHB1UQz+utoRSjjlAt3zopkF2PlmJnFY3w==
X-Received: by 2002:a62:ce48:: with SMTP id y69mr4249326pfg.178.1583954359553; 
 Wed, 11 Mar 2020 12:19:19 -0700 (PDT)
Received: from localhost.localdomain ([103.46.201.94])
 by smtp.gmail.com with ESMTPSA id z17sm3792673pff.12.2020.03.11.12.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:19:19 -0700 (PDT)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Subject: [PATCH 1/5] pci: handled return value of platform_get_irq correctly
Date: Thu, 12 Mar 2020 00:49:02 +0530
Message-Id: <d12a15f496ca472e100798ac2cd256fbfc1de15d.1583952276.git.amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583952275.git.amanharitsh123@gmail.com>
References: <cover.1583952275.git.amanharitsh123@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_121920_523119_75DB32D0 
X-CRM114-Status: GOOD (  10.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, amanharitsh123@gmail.com,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
---
 drivers/pci/controller/pci-v3-semi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index bd05221f5a22..a5bf945d2eda 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -777,9 +777,9 @@ static int v3_pci_probe(struct platform_device *pdev)
 
 	/* Get and request error IRQ resource */
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
+	if (irq < 0) {
 		dev_err(dev, "unable to obtain PCIv3 error IRQ\n");
-		return -ENODEV;
+		return irq;
 	}
 	ret = devm_request_irq(dev, irq, v3_irq, 0,
 			"PCIv3 error", v3);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
