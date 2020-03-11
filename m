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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34D4C0044D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:21:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC64D20578
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fB6RthTc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CozuzMqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC64D20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZGPMRk3UbyaHuDcYeSZ+txRWl5faDXGcoHMQOsa+iM=; b=fB6RthTcgYqUU6
	5UqX1LT8ibPGBZqW32kIjAqIYJlRcMRJm6tsk3d3InTaZwzCpIeenUPn8DlbtSZFxwmhsHpcq3qHk
	2wWOS8+50u4kgpE9O7KqTi+TP+4G1gRAPZdtcuvALIHzeWtPooGn7BDfYk7f5UQgd82NGy3hlYElw
	i7d8BpmOmDmcL5vj0FevNTJobkOiwFenPjsPfIiXwNsvb51+7cbu1kldEvPbWkkNH2v9CDYMWJcAY
	QUsik7bhVG8POMCeeXgj+H0s3BHDbhihxp4o/KW1CxDw7oIms/Bm4dIrmXjTd+k5ml+oiThGPGrqp
	H6J7GoNFoaiaFm1Fgq5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6up-0000Qh-04; Wed, 11 Mar 2020 19:21:15 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6tK-0006L1-M9; Wed, 11 Mar 2020 19:19:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id u68so1885057pfb.2;
 Wed, 11 Mar 2020 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6tx20opC58CZx8EHUzpcUW3v0td0yDhkgy01mmgvT1k=;
 b=CozuzMqFhVkFE6pdK3cIh6s0uXsG2lK7hYQy5IVZtcQmUzBEAvs4Pb139yfhgUcRa9
 N2kLzQ5SjJ4V/dJTw7i+GKo/N1pv+gZxM58WXszNGBoQKI+uMjTkQV8zbt4kF/2vH6H5
 NJvfcNhZFERyJC3It01naJmHSsln6g6kKl1vzNrulqq5LAHF4wgNhbVyandZgnizxIO/
 cJgnDsnDD40sItIySZNC+HviwpK2K4wwHsgCEN7CPG5wC+lgXKwLhWQretoqWOKfhmxk
 PpPlksn5E6jm5/jvgOte7D5wpDz3s+voxXT0SDhgnRs5al+E5xvjKdYFYNU988j+8gtz
 FAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6tx20opC58CZx8EHUzpcUW3v0td0yDhkgy01mmgvT1k=;
 b=h8uazwxLNecGqdOuwbkdBprfKoiS4UmUAOT5Xh9MHdt2nJoW1dicUhrn+W88t2nEw1
 ygd6N4k4Ra9TfRkCFa1lm8WYkgu0ijIiTFB6Q2G6h+EnWjOCNHTJJW2UdjtoMTvF2WH3
 Rf/j/bP3if6QiDg+K2R2pTec3yczNgEHKfwwe3KwMr2oGsQIoOZ9K3MxSDuMMcVielDn
 Vxl0hRAAmCBoLSSKnZFyiMHV03g1GpVwIxH1/htPXnXmFWcQgCGMhCysuqJfQvAnzNrI
 KmWqMeou5f7XZT9MXgF2KG9hnTVQQz9ki3xgXiX4oQT46ox7bafcjZXbdY5HeEyEyYBu
 O6kA==
X-Gm-Message-State: ANhLgQ0INnMmMIuWzWLTYM215//KTdGu9uDeE0gbkL5E5dLB9493OVue
 xv5tVRUg2eHKYrpEoAcKjjA=
X-Google-Smtp-Source: ADFU+vuIATg8TgONqQwj07uaBbQTUtMOLI517xnn/BWXZKYW/0G/Tlqgwm379phb/QVQVuzVzgf6SQ==
X-Received: by 2002:aa7:90cc:: with SMTP id k12mr2456493pfk.94.1583954381475; 
 Wed, 11 Mar 2020 12:19:41 -0700 (PDT)
Received: from localhost.localdomain ([103.46.201.94])
 by smtp.gmail.com with ESMTPSA id z17sm3792673pff.12.2020.03.11.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:19:41 -0700 (PDT)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Subject: [PATCH 5/5] pci: added check for return value of platform_get_irq
Date: Thu, 12 Mar 2020 00:49:06 +0530
Message-Id: <a36999aa5c567c65ddfaf0b54406e8583343a510.1583952276.git.amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583952275.git.amanharitsh123@gmail.com>
References: <cover.1583952275.git.amanharitsh123@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_121942_748597_48F27260 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
 drivers/pci/controller/pcie-mediatek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cb982891b22b..ebfa7d5a4e2d 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -651,6 +651,9 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 	}
 
 	port->irq = platform_get_irq(pdev, port->slot);
+	if (port->irq < 0)
+		return port->irq;
+
 	irq_set_chained_handler_and_data(port->irq,
 					 mtk_pcie_intr_handler, port);
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
