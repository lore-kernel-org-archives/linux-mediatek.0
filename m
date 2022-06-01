Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F65C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 04:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HSsZPvqMK/8DRdfCd70348e/lHbS/Lq2U8J/WUPOFko=; b=cKz0ZuULHsP+xu
	0Gc5LyJLOrcLRIwQGmH8rAr3usdTQjR9/la3iXkF2zzFIbpiw1zWHfHhGMiET3TvaUo7yF/KCCCEj
	rA+cSNwsQ+LRyRee+ji9OPrtekp7a64dksB3mPygtGUzS4+hBly/BMnA5bzNrOVEDyvM0a5UuuVVW
	5zyQ7lqybPFCiX1XkBGczYrhchXM5MEXP9Z47hDDWWHSUNc/S38WrRbaf+U9qFJES25FKt3ojC/vS
	tfhTiTzbWwTl1Lyhpkg+SvmbQS0yUBqC0183PTWQ/etJfsRVfc0lYTnMjpuht1nWSQTebY/D1SuJL
	yIgzOinnOL6Hc2K6WLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFja-00Dleq-3M; Wed, 01 Jun 2022 04:13:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFjT-00Dlca-0s; Wed, 01 Jun 2022 04:13:20 +0000
Received: by mail-pj1-x1031.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso4931441pjl.3;
        Tue, 31 May 2022 21:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ilrv2fsQ1oyZr4Sxgimv3HjgUAGGQatiiqNbcEA0JFU=;
        b=im8+dOhyrYsZgyqm/2nx3dBhLfzOI7x5+GXKwk4veel/e3dCK2Lt2Ri/gyxKSDlOtG
         8rhg+YkF1ktZU6A9sosvKcMFf+/uZnko/TESgmA1vwUr4nM/S9+o0tM3KvTTN0vY6zYR
         a9CvDXgQvas+3Mox/NUQb/SO/p2/mqhhygeGrMnWUQdiDityjaCjgVLYMGdIJtR3lw92
         0fZprUZLdxYbEEX9kFeVbuDJ+F6/TdLvQU+G9Zhi29Q2a8gMEoGh6skDN7qQ7jOZcgPA
         7iz8OUwUzw+lLNXk2YP9aEOhqTVkAs6BNfvcKUjA2iF1ev4Q9qXN+g5BFWvBlmSJNf4g
         1Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ilrv2fsQ1oyZr4Sxgimv3HjgUAGGQatiiqNbcEA0JFU=;
        b=uNQPjKNQagx4SZkxfjjDlO32/yWUDz+SaL+lRef4gyssBDuCKsrpH6HzUugipHegWY
         AMjCubCWKtSk7tlRtVZIzpuwo5DYyqdzg7h8+ENrfVKIDaquAX3rQDTt4lOapXH4OV7J
         y7i0EZ0zJ62s8MXZa1Ro0dF5cwzqrwlD8IMXR2JnkMed8cMQPxhbVyge48akVbHcSsgT
         SULF5yTJZq/MPCNornUCjF4leTF1jGI/qegXTO4v/+/FseltDC3C89b94wgJfLpkyCvN
         GWcklnH6I2E6YRN9EEy7mdDngrDmB+ZNte1q+OOT0NLhqemCE++4OWz5ZcxHgF6cT4c3
         zK+Q==
X-Gm-Message-State: AOAM532nYqhyCwfuKYr4tkniIdbk7T5gg/9xnnFz++Kah3OunNSfZt96
	SblfX7Vzl8hmObohcRfd21GR11Yx3kdpDpgy
X-Google-Smtp-Source: ABdhPJyPvtXzWJO2RmYHgPiZUTuVpyzAZyIlZ53x15if6PBizKnZr1JaSDXzPfVBdWGswbimTAuoHg==
X-Received: by 2002:a17:902:ef48:b0:159:51d:f725 with SMTP id e8-20020a170902ef4800b00159051df725mr65758050plx.47.1654056796365;
        Tue, 31 May 2022 21:13:16 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id d17-20020a17090abf9100b001df68146a20sm2714564pjs.56.2022.05.31.21.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:13:15 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: miles.chen@mediatek.com,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH v3] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Wed,  1 Jun 2022 08:12:58 +0400
Message-Id: <20220601041259.56185-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_211319_130926_36DE7BEF 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- move of_node_put(intc_node) right after irq_domain_add_linear to cover
normal path and error paths.
---
changes in v3:
- call of_node_put() in error paths with goto, and call of_node_put() before
  return 0 in normal path. Since this function has a goto part to handle
  resources, so put them together, as suggested by Miles Chen <miles.chen@mediatek.com>

v1 link: https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
v2 link: https://lore.kernel.org/all/20220530064807.34534-1-linmq006@gmail.com/
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3e8d70bfabc6..bceed28446ed 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -600,7 +600,8 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
 						  &intx_domain_ops, pcie);
 	if (!pcie->intx_domain) {
 		dev_err(dev, "failed to create INTx IRQ domain\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_put_node;
 	}
 
 	/* Setup MSI */
@@ -623,13 +624,15 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
 		goto err_msi_domain;
 	}
 
+	of_node_put(intc_node);
 	return 0;
 
 err_msi_domain:
 	irq_domain_remove(pcie->msi_bottom_domain);
 err_msi_bottom_domain:
 	irq_domain_remove(pcie->intx_domain);
-
+out_put_node:
+	of_node_put(intc_node);
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
