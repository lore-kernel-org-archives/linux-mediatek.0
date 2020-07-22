Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1189C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7DB20787
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDQwRnCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7DB20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9wP/Ir8dHBuF6fwordQVFBlZuFKfkcLdiklPvNPwHoI=; b=eDQwRnCASlWInmI9Z9osHnzcE
	xdenM0ZluWmdw3fEUxM6iO/0t3pO884tdrg9rG6pEYBgWu/cUUm3cqKe3wlb6fTg3L/Blu7ZSr+4S
	OLl1zWutyq4c2DdbAlgi7Dw8LeOOCtUlfOPqKYBsxwaoGTxN9P7OW6aBNjCUmdInKO8b3VRQsoMWK
	aGtA/cOXejbuMLIQHQNa9dZyAetfM2vnf2GLzNBugSYI+/xEqdt4fS2InYvB1nShrDNh9uCYsz2gA
	yy2BvrikbrJ9MWOPi/qHy2X7ENLUY8ybDglstYAuXCkqU26VhzMtRpzSrqm4IZtJA6DZNweQDrdvK
	/basjPDKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4WO-0006No-V7; Wed, 22 Jul 2020 02:30:17 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SV-00040a-9V; Wed, 22 Jul 2020 02:26:16 +0000
Received: by mail-io1-f66.google.com with SMTP id t131so881045iod.3;
 Tue, 21 Jul 2020 19:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mTNQAve5povS8TrvE+0nUolFQg+WN5UXhl/Hn39DM0=;
 b=X68H+NZN1WgFuolKdGupLyBbfk7Yb2Yeu5/Iet1yUEnSfkb1VDqK+gRUTgvF4nACDJ
 /rDxP+dFp7HpCKo1rEy8bSv4aCSViM1Fic/oqEzBwnzY6HVxGywrad6dQioomBNfocMY
 fuUnlMjIvFhX982i6HiiJ8KnWEExyzXcMXBqAuO8rqk1Ac+oNsKVqEfHy2I8vC0mVxlw
 C0JwqqPoXa7/+BlUu+4Dreq2wGVfD+hk3Uja7Zfw2waRl5ARZpGl01dEbXrKSi8h2u4x
 ldUY6xfFTPW5KY6G5yjR6yNrVmDysssSwDmIBKsY9Oy+yAJoK6cyay1GU8camCJIXJdD
 Js8Q==
X-Gm-Message-State: AOAM533Tk1Llfp5WPHTxlyPJfz3q/qMvZYNCGFXs9vKiS5g+b+fXW9eJ
 neS3BtbQUrju55NPZ2ZYCg==
X-Google-Smtp-Source: ABdhPJwBWgPlDrivNv7yM8QtASYvLdMFektK4ZjC00WS80MxFWmYcuAiL14q2J7bkLOOQkMyVsL6vQ==
X-Received: by 2002:a05:6602:2008:: with SMTP id
 y8mr24036196iod.69.1595384774572; 
 Tue, 21 Jul 2020 19:26:14 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:13 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 16/19] PCI: of: Reduce missing non-prefetchable memory region
 to a warning
Date: Tue, 21 Jul 2020 20:25:11 -0600
Message-Id: <20200722022514.1283916-17-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222615_626852_BEE6757C 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pci-rcar-gen2 controller requires only a prefetchable memory region,
and the error prevents using pci_parse_request_of_pci_ranges() for it.
Let's reduce this to just a warning message so this function can be used
for pci-rcar-gen2.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/of.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 27839cd2459f..cfb940c8b399 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -564,11 +564,10 @@ int pci_parse_request_of_pci_ranges(struct device *dev,
 		}
 	}
 
-	if (res_valid)
-		return 0;
+	if (!res_valid)
+		dev_warn(dev, "non-prefetchable memory resource required\n");
 
-	dev_err(dev, "non-prefetchable memory resource required\n");
-	err = -EINVAL;
+	return 0;
 
  out_release_res:
 	pci_free_resource_list(resources);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
