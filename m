Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A802C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4XL0YsGQbNeRQwFVLg+t9FLPqQnXsfieULBnY7rvX1s=; b=jk7I2xfpkAWJNH
	bdJm3nH2w/ijpzedfqEPI4+22G22uolKggpnj0PLCwTGMGqbKKyFkGesYkJsY1svcU7YqeOGBn/D2
	yZcTniz0oZF5pZjD1oYeQ/8A/O+70aFiC/OKEGpj4PbviPwOdwRMn3AGelg5NyIqLenIfd93kGKd5
	LFFIYlJaXJWgaB95byadMoj/Yy3etPFdPVIiQTO7+Q4nSSz5GDwyl9KJMybIvmeYNv5cFrPUfymaU
	UTra+K//z7adBGZuGWsNTD7X/KYPsS7wfuqfUn4A1wiOouJLJOSGWBV2bjfGme+8DuqvME8XT8U2U
	YWC28VuPTJ8NDaLRM3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZD3-005aek-Jb; Mon, 30 May 2022 06:49:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZCz-005ac9-Dy; Mon, 30 May 2022 06:48:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id c65so9223442pfb.1;
        Sun, 29 May 2022 23:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzFFxChRf7RgMYcMJ2ll5DY8vkYnacLX8rZwLOdfqa8=;
        b=musOaD+e8VR3WVlAfkK5uKKyxkR+shVmejo5NWKByI75Uu3nTCkw0n/od0vocI2Y7u
         zB8S0/T21sOShBFD5iiqVFIgG6aSrIk5/F8UjfsW+QvNhEki23PnkrSVx9HDWTSWf2qU
         8QE0gj3kvFfiwxrQOZpJrJ5RpoBG9qz9vIs0GMmfCxnNynvnqxl92C0YCdfe7n8+/Mci
         nLYN4kQZN1DySeEfspZp4ZVtCn59f4Kz1pzelDGOUmDzRaSS3L879dZrxEGwRf+jKobg
         3KtmWmwHfKnqfG7t3TU/ZoFNayog8PscZk49H7GytwjPTPx2Qr5xJhdIz3e2Xbd/tsmc
         pgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzFFxChRf7RgMYcMJ2ll5DY8vkYnacLX8rZwLOdfqa8=;
        b=Kj6Jq7OnOp4jYLbCsLpcAw5o0/emhK4iv9aGfztYs8412ImZgHQ+9bAhKK4dFiiK2U
         32y3SUdQIHyvbJUbcY0aGGtChzYo0aGdu+UmHh5PfEAlhBWGCTzvef0HVTkxl9NNeOp1
         EfStZkCDUzkmT9VV+aDEHKvKkCBDo1l17mhbrythFusB39yy0mXWlPUiqFLb88amFEJ6
         Gkh0G389Jme+yHA/xQmp6tsmQbzYlB5mcBaikJBF5L2Jlr1nRYCgmi/QSckwnre70kcv
         Nb8QvkP445h1N4HnDKmVi4FZdjV1w/jH60t/PMrBrH0qXc4eMiyPzfgz+RZHlpoyGYBB
         wLIA==
X-Gm-Message-State: AOAM533Dm/jse+w4lE9QvzCMrq4Txc0oVJHcsAKmSB4SggXJVHCp744P
	eRwtvr7Zwm7dZFQ1BZ5Lt0w=
X-Google-Smtp-Source: ABdhPJxFqpNKl8VvLOwz6v8FfeXv5UDp72W5VWnmYNXP0X2DVfcSqFfEpd3ke0JpZuPugL7BR1W7fw==
X-Received: by 2002:a62:c186:0:b0:518:900c:837 with SMTP id i128-20020a62c186000000b00518900c0837mr41044044pfg.50.1653893333580;
        Sun, 29 May 2022 23:48:53 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id h28-20020a63211c000000b003fbaae74971sm5826704pgh.72.2022.05.29.23.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 23:48:53 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
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
Subject: [PATCH v2] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Mon, 30 May 2022 10:48:06 +0400
Message-Id: <20220530064807.34534-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_234857_505751_CC09306C 
X-CRM114-Status: GOOD (  11.68  )
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

v1 link: https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3e8d70bfabc6..19a01daad304 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -598,6 +598,7 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
 
 	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
 						  &intx_domain_ops, pcie);
+	of_node_put(intc_node);
 	if (!pcie->intx_domain) {
 		dev_err(dev, "failed to create INTx IRQ domain\n");
 		return -ENODEV;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
