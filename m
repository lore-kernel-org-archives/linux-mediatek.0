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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27FEC0044D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41AB20578
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j2mmrU7m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avwLSbYP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41AB20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDMIva+AVYNxZKZ5kbq6jGks2T/CAseg8rDIJoIpWQ8=; b=j2mmrU7m5MmZuQ
	BQG/A7Ty7K7A94h8oo6Bw2rRkK+ZHoRsY+DQoXCz3TSRlg1W9gjjsg5x4YXD7+YjlleoIegA4dcww
	V42hctAQHYIvlz5APchsbyv/Tzqsxmf5I+cN6MxxG95hoiE0PvjzdY7Zii74/XVR9m1FPltpNUV+5
	TxtdcYDKBDvsuqMAPpghVvYW0xzHAEdLwTWlsK08N1+ina5nLXjem6ER+zCxSlCdLl+dDybhBwQlz
	GtMkMMuj4ABtF2ViMbEfqU18nuNUKXYYPZ4CgjDcBP1BCzcQWn5OhXcctVPgBliLPZq6IF8sa24e0
	j6BRHTyb9xTv1O4axCoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6uF-0008G3-Tr; Wed, 11 Mar 2020 19:20:39 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6t9-0006Aa-JK; Wed, 11 Mar 2020 19:19:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id j20so1538763pll.6;
 Wed, 11 Mar 2020 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02Tw1k2Q38WueLNikGUX0EcXKDMIWen5M9i6gPM5Zj4=;
 b=avwLSbYPrJFeGMWyeeJPgpyMc6eZIgulQvJJACFk8LWJ7HzV7HO8ikUbQSac0O2Soj
 /RjNmGzqh3cSgVBNRF8SWz0kd1JNjiwKtfzfdTlHW6eG09Sf04ZE2X2+P2mBinSoSbEd
 ZtbV8rrBa9wwNAw6uF+WKE5ZC5z+jqKmGAHILwskaowFvMVSkx5YuY+cGwn7VknnDL2a
 JWrihz0fTOXoLdKzTc7yZvZ4/gbWPExseEhqgLuMa3bmlmkHOEe42v5iSpOwJoWoVo1k
 CEbqUOOP4ESOlvpND9fptc3xDLYda6kFYg0dH4XM6NlQYMk5E8nYUFstmTKAQg84fTr4
 BRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02Tw1k2Q38WueLNikGUX0EcXKDMIWen5M9i6gPM5Zj4=;
 b=gRKYwjXn57h+t9s1/aO3IFayTWnYvNIdjpP/UH+r9uo9ebDPobONAzw8u6HWCc7jC2
 UwisM5Bv7Tqpx4DPsAfQNFuLePtzyl/NMCBLY7ZrDBTN6V+4XqGZN4Qz/yII0n80GEIl
 g9peIx98YNBGE8u9NfR6rRY9BNTIJGEzVC5e6QanGIlXkYl2Hd2f08byZ9HMKcpzyh98
 hmnQbgUiVWdJzaPssnNnjZ7kVq2rR5xX45riaC3KyXBfea4XWUsHVK35xUHHguUyxaam
 X+8wlrtjkKAOv/wt4TO7QKQDJF4LZACVuj+gujjBaG3j2mqKGHIdZ2hp37/S+FEet4ES
 Volw==
X-Gm-Message-State: ANhLgQ3H5ruTyQKjbGLbq55B7FuJrT/YB89pTZ9hXcvDbvySBaoQAEpn
 A/j0Ack9OC7LynmBX7Z5Zjw=
X-Google-Smtp-Source: ADFU+vtd+b65PXv741B2Xvl/VY102ZDKa3qJON+wOaBSCOeGYGNq4QbLyV54jjgen3Er7PN+hX2uRA==
X-Received: by 2002:a17:902:ab95:: with SMTP id
 f21mr4077798plr.188.1583954370555; 
 Wed, 11 Mar 2020 12:19:30 -0700 (PDT)
Received: from localhost.localdomain ([103.46.201.94])
 by smtp.gmail.com with ESMTPSA id z17sm3792673pff.12.2020.03.11.12.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:19:30 -0700 (PDT)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Subject: [PATCH 3/5] pci: handled return value of platform_get_irq correctly
Date: Thu, 12 Mar 2020 00:49:04 +0530
Message-Id: <9e2c5bf46fe04e27ead8d559425fb97231777ee1.1583952276.git.amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583952275.git.amanharitsh123@gmail.com>
References: <cover.1583952275.git.amanharitsh123@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_121931_663361_6B48AB20 
X-CRM114-Status: GOOD (  10.84  )
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
 drivers/pci/controller/pcie-mobiveil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 3a696ca45bfa..fe816a284dd4 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -456,9 +456,9 @@ static int mobiveil_pcie_parse_dt(struct mobiveil_pcie *pcie)
 		pcie->ppio_wins = MAX_PIO_WINDOWS;
 
 	pcie->irq = platform_get_irq(pdev, 0);
-	if (pcie->irq <= 0) {
+	if (pcie->irq < 0) {
 		dev_err(dev, "failed to map IRQ: %d\n", pcie->irq);
-		return -ENODEV;
+		return pcie->irq;
 	}
 
 	return 0;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
