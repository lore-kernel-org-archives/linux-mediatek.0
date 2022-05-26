Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F225C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jW3weBWKcEnNa3p6BJoVip0fJxMgBWJ10Yf4fmD7ous=; b=mLorC1AXTYXZfY
	kBXG6QQJpa7Vw9UnAjVYSoo/8aAIShuvaJ/4bJGQ701sWhe4XswKcAl5S6K7ORDr76OIzqEXgcWPA
	ZQ2qgsM20A5TdLXr06qYoREmwi4fLWbiC8D4w5JvWoxS0WTCw7wVqrO59meCaCBZLUANzOEHY506P
	j/N1DOzTAxLnAMRX5vinZtJgPoUDzvI4V3aZ94ybDBnRO9fLxjj33ySIuzikwEaJXcAzGeC0gH4Sr
	cInO0r33FRDHg304Qx7MWiJPe9bqP1EmVne0PauuLOd4oag8+woq2vaaAvK/BsHuh2XHAbIwTeT5r
	ToTLDYkzg9OXfY6d7nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBI7-00EUou-FB; Thu, 26 May 2022 11:04:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBGe-00ETzU-DG; Thu, 26 May 2022 11:03:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id m1so1163800plx.3;
        Thu, 26 May 2022 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pQUCA+bAk9kVI/8KTFrFISyXPuEQ82dwO725ac3Sycc=;
        b=mImrJwj6KAgd0728Scm85+G/bDiUAaeeOA3NKofzoL0zUz3ATZra9wQ3f0wz5AdoJd
         cCFSmNyx5/WJc+nWyl//m/yZXJG0B4bcQXMIM83VVZYafy4uDfrUGVtHHCDYTdKqpfxy
         Qsn/PlbNfOodNnzS7L+jMl1BOuKxZ6mm/lNR/H3UuwNYRpWd5JpuGs+k9JSkMY1AJTKP
         hzIL0Wc143ZQ7QvedXICpdL8eW1N9aK+6Td7HkVfgtjqI6VEMUnJhZYGBc+MN8PSCG+D
         DGKWVUuWVj2yyPGauuXss/WgP6GlwIn/RBvUHt2lF/MQqq93UcyjtL6NrNnZvYMlJ94c
         udRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pQUCA+bAk9kVI/8KTFrFISyXPuEQ82dwO725ac3Sycc=;
        b=OAnudHbjSVYjyx4TDTYr8vry3uvKSztw/hELbFvcXVXPnCtDfsAUCUHCkr6VVhT0pE
         Ra+iDcApy4GArMzSsMZMGXO9dq83Ja/R4JOFI3t061vL3RKugAAd9h491OGTGd3HpCCE
         vfTu3xxLcY0thU9APXN9xpyPx/gh2RmiNk43DZGk5qyU5Ql45AvEZC5mQ7hUZKvxdXoV
         Xlvl94Jc4UgCKA6mib5mVKmhIEjAjBmGYY2qpWIai0OY/dpWCDkTF3B5CWQoH8Gritn9
         88tyRi4lbhihFGwvENmju+zc1+ribYgzcf428F1Yn8Vkv2HNEXYxo3a6Sji5qSS6IUpd
         8a+A==
X-Gm-Message-State: AOAM530wUHL2JihfYEIP4C5Ei6s+Mda8sD3IUgTEMSg7HP17LGvpFsmV
	tSHWuX367cwofyAit7bp7Q8=
X-Google-Smtp-Source: ABdhPJzQNCewyZz5gSKXq3raps72PN4ezX+1KdP2h6rnRD65QUCkIlb9JRWJUGJBbANgZNjY/Ze1HQ==
X-Received: by 2002:a17:902:cec6:b0:162:50b1:b40a with SMTP id d6-20020a170902cec600b0016250b1b40amr10923335plg.107.1653562977387;
        Thu, 26 May 2022 04:02:57 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id x1-20020a17090300c100b0015e8d4eb289sm1178902plc.211.2022.05.26.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 04:02:56 -0700 (PDT)
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
Subject: [PATCH] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Thu, 26 May 2022 15:02:46 +0400
Message-Id: <20220526110246.53502-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_040300_504822_669C73DA 
X-CRM114-Status: GOOD (  10.77  )
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
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3e8d70bfabc6..da8e9db0abdf 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -600,6 +600,7 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
 						  &intx_domain_ops, pcie);
 	if (!pcie->intx_domain) {
 		dev_err(dev, "failed to create INTx IRQ domain\n");
+		of_node_put(intc_node);
 		return -ENODEV;
 	}
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
