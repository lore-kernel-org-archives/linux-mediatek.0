Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88C6CD5BAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Tv1KV4V2E+d6FJx3XVzNwtiiaceB2O+rc7MvK8GBfQ=; b=1TJ5SV1hpwWuzZjjVD7iSdGIFr
	RQ4nb6ktyW/JQAI+zUJvCubKo9VSehqPiSVfXxuC/5BwFHdeaFHOXywBdOzwtqS11FzAs7v9O2r63
	gFFuE5xDKAhg8+XTiDMloPcs260aAwV0rv1JlQh8FfEWdWh6YxTEXwJGdPI4UHeWg2chEyS+1m667
	Fz2IuQxLmUYWjSI1v2Rc+Tanir0naIjfbQJVNfQpsm0cwdxnSIC4nStRhzIvoS+HT3uCImhxDYeA0
	jle6jhGDFATLtGwfqPf4OFQEzNV3/ujNu8QgASSKZCoH/Q/05zz4T9z8F97E7IqCEqVcMOdbUxj9g
	nfDAiRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Tc-00000008gdo-31t3;
	Thu, 21 May 2026 17:46:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7TY-00000008gc7-3vh1
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 17:46:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk8oZ4049719
	for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 17:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Tv1KV4V2E+d6FJx3XVzNwtiiaceB2O+rc7
	MvK8GBfQ=; b=jldDL0CjAzWZaDr4IpaevONG9zxLBxUPUNy+zoLbCkLvKV5U3AL
	FVV5eQQZsIq7vxULMooNclWz5lm7Xw0RTebVTM3PF29XJ124Jv60sSvPT1+ds+d2
	+aXqFz5xheNzUyx2X9bg05mbLWfXuOb2bX1zTdLMfRbwLHE9XIYWa1jUuk0RV4a6
	bJkNttPo8qD8NOwaFsbcCa3pNIltWWgNAqdvei9jppRhh2TPV2VRyCh47evGqMda
	JmN20jHZ4hp9IMRgIsjNx1nuZ+DM2E63YPP5cYylGd1T+w69yvx0NbRiw962Occg
	PKNMcEnKbTNEaUh9N6PXcuUgCBpHZxvE8qA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr33jqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 17:46:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so47747135ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779385587; x=1779990387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Tv1KV4V2E+d6FJx3XVzNwtiiaceB2O+rc7MvK8GBfQ=;
        b=IkAlKJcVZsvTmlPdWU2jqvKQqOtk26yLCLTG1mla3NIbkZoJo8jzplThMspWzz2DTy
         tjm8ZbwsZ6tDmVFF5LBsNwdvTmjOQEeOsS8i2BLWWGT8EPMMFWX6kmu+Lxrt4BToVboJ
         JQuCJKGkzNvB0VLlJmiETjjSqG4gm4lg6emeHmB1MRG1x+c2kySa382U4MPGOGgv8vk9
         Kc6DpAIcwkpXTHeQqNZ/gpVS35vFG+IUHABTx3czAZ51w3+1LHRJ+MtwojD9S6w5Nwf2
         2veyg2pRagaVke+u08mYm0t6FB7xZY8pI9wRD9hrJHmCpZBfmMWqGAJiqOX/MWroBqPa
         L6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385587; x=1779990387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Tv1KV4V2E+d6FJx3XVzNwtiiaceB2O+rc7MvK8GBfQ=;
        b=k+PdXZcKQc0GsqWdD8bRuJVq2YTbn36PouBLrgffIo4QMHhyT+euVsuyRsq41kTHFy
         UEOH/uoQ8DrdQC/hGBygg1ljpjm8fm9AGIirAT2E5FlsJ36pfzV3oLbKJPor4bWjkS1O
         AA64owhEglHuMbSBMwra9Bi7Y+3/vjTQIeggtSLF1EJM/loBHAXNcEA10KMUAQd4IQiR
         K9KTpotSff+LXHCv42+YrdOqg6fxzmEUrUpWPesOqbMpaprLywVMPFyFVIqbhySbhn8D
         IcFAMCxG1bCd21l89Xj+7G1NRKF9tfPfw95RhZOyE8PS7rKyXwpBd6wYzqn+AitgjKUf
         DxVA==
X-Forwarded-Encrypted: i=1; AFNElJ/PfRilwHL8GYgzDYqudglbQqX3pPzwkccgalYewsl85UaftuUa7nSpVVlBEiXxH1ugUuZpzb/q8LPuyq2wBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoCbNEPnjj8DqGvEDlni/F4YLhLBLR412sLIKIQdzlvGIAWDmW
	7MUzVQQCDrRciaBja1Jj642NV1EmXCmj1bKVt7Dk6ULw8bYioAluqhfd4lIeT8qBbsVD4xlzVAo
	IL+pCq0MzfAsmqom6VCnfilvOql5T66zLu+9inlk9e3MFKnYnFYtIgw5IZdzOLgur8Wi+iL8T67
	M=
X-Gm-Gg: Acq92OE50ZcyxvLvUPUsrVQnOpxabKixEML4InysrRiTvsyFxme+vWjvGKUyVIQDxb3
	Fq2IyhT8oShH1uSyISCpnkeWOCPeozJSf558Cpnw5MucnOR3il1eFfaG4Gp7VvxOaDflJBx2T85
	t5Sz9Qqh76dBVGKloMpFGFu1n1aNImXAQrbc/ud7Cj6y8qaIy/3Iu5uXJ+oy1GNa3IjS0k4NC8k
	C6esIvQ/kwzMlzOh5pXq5e8Ru6Xh2HLkp/vwGIycPZXl8NimWuBkQp8JHjyKkUpNOn3NIsMFd1Q
	eJ4qk+ElibxJ8S7LTxA7dDfM+VZLl8y/tyuWKnbwnjaDWrCs0K+Dnh28b94wFx2Au3kzZIfO3rc
	7DfNvgFU=
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr37526155ad.20.1779385586424;
        Thu, 21 May 2026 10:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr37525755ad.20.1779385585704;
        Thu, 21 May 2026 10:46:25 -0700 (PDT)
Received: from work.. ([120.60.66.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990105fsm19011775ad.55.2026.05.21.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:46:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, mani@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2] PCI: mediatek: Fix IRQ domain leak when port fails to enable
Date: Thu, 21 May 2026 23:16:17 +0530
Message-ID: <20260521174617.17692-1-mani@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e8sVLX5yJ3yUSrFdcKO_j_vfNgFdAH0T
X-Proofpoint-ORIG-GUID: e8sVLX5yJ3yUSrFdcKO_j_vfNgFdAH0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE3OCBTYWx0ZWRfX0WKxmtv8wFSx
 vp32r6WpYRyVmKl2AOuyKi+ZVz/JSmyF2bOekSy+VOt9iTXVl3YEdHk3JfokeB2zuATI6PgbIuK
 /fK95DZImQU/cYjx3hFrb3O9vogga3p837bbsdAP5oWt1BitLdx54U6gP6u02pfOWXJMLa6wHMk
 LKES6cWnp5T0iALpUzXRy0LLVIl5Vw1tP6LxSn9BVQq0IgYlIo6hRAqsLHUkVSb9MSpuJbOJqny
 xgdoQN5NfsXghih3O6ALZN9qhYnLybNfDFmgArWjME/+bpkdFBmpT/lbRwPQwWcB8Z3bFDa837Q
 qOb2sPqHfrA02S6XeozW2ZehHBPEtWXC5HTEAoeH4F4IuOaEEabIPZVjZpjeCStPs9SoWQnmRRB
 8yTZ18IxNQ2c0aw7cltvYx6di37UXj9/EazWmikDXs7ma5vgh3dwU7weIIms6OmAqmLAu81PC68
 WTmD8+fq53sC9JbWOVg==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f44f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=F8mVszBSU3svo1NvbJWAvw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=qMEm_45GddOWhgBJpCIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_104629_273331_185F22DA 
X-CRM114-Status: GOOD (  19.80  )
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

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

When mtk_pcie_enable_port() fails, mtk_pcie_port_free() removes the port
from pcie->ports and frees the port structure. However, the IRQ domains set
up earlier by mtk_pcie_init_irq_domain() are never freed.

Fix this by refactoring mtk_pcie_irq_teardown() into a per-port helper,
mtk_pcie_irq_teardown_port(), and calling it from mtk_pcie_setup() when
mtk_pcie_enable_port() fails. Since the IRQ teardown must only happen in
the probe error path (during resume, child devices may have active MSI
mappings and the NOIRQ context prohibits sleeping locks),
mtk_pcie_enable_port() is changed to return an error code so callers can
distinguish the two paths and act accordingly.

This issue was reported by Sashiko while reviewing the EcoNet EN7528 SoC
support series.

Cc: stable@vger.kernel.org # 5.10
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Fixes: b099631df160 ("PCI: mediatek: Add controller support for MT2712 and MT7622")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v2:

* Used a different approach by refactoring mtk_pcie_irq_teardown() and calling
  mtk_pcie_irq_teardown_port() from mtk_pcie_setup(), as Sashiko flagged some
  potential issues with v1.

 drivers/pci/controller/pcie-mediatek.c | 63 ++++++++++++++++----------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 75722524fe74..907ae4285ecb 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -529,23 +529,27 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	writel(val, port->base + PCIE_INT_MASK);
 }
 
-static void mtk_pcie_irq_teardown(struct mtk_pcie *pcie)
+static void mtk_pcie_irq_teardown_port(struct mtk_pcie_port *port)
 {
-	struct mtk_pcie_port *port, *tmp;
+	irq_set_chained_handler_and_data(port->irq, NULL, NULL);
 
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
-		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
+	if (port->irq_domain)
+		irq_domain_remove(port->irq_domain);
 
-		if (port->irq_domain)
-			irq_domain_remove(port->irq_domain);
+	if (IS_ENABLED(CONFIG_PCI_MSI)) {
+		if (port->inner_domain)
+			irq_domain_remove(port->inner_domain);
+	}
 
-		if (IS_ENABLED(CONFIG_PCI_MSI)) {
-			if (port->inner_domain)
-				irq_domain_remove(port->inner_domain);
-		}
+	irq_dispose_mapping(port->irq);
+}
 
-		irq_dispose_mapping(port->irq);
-	}
+static void mtk_pcie_irq_teardown(struct mtk_pcie *pcie)
+{
+	struct mtk_pcie_port *port, *tmp;
+
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
+		mtk_pcie_irq_teardown_port(port);
 }
 
 static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
@@ -865,7 +869,7 @@ static int mtk_pcie_startup_port_an7583(struct mtk_pcie_port *port)
 	return mtk_pcie_startup_port_v2(port);
 }
 
-static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
+static int mtk_pcie_enable_port(struct mtk_pcie_port *port)
 {
 	struct mtk_pcie *pcie = port->pcie;
 	struct device *dev = pcie->dev;
@@ -874,7 +878,7 @@ static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
 	err = clk_prepare_enable(port->sys_ck);
 	if (err) {
 		dev_err(dev, "failed to enable sys_ck%d clock\n", port->slot);
-		goto err_sys_clk;
+		return err;
 	}
 
 	err = clk_prepare_enable(port->ahb_ck);
@@ -922,11 +926,15 @@ static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
 		goto err_phy_on;
 	}
 
-	if (!pcie->soc->startup(port))
-		return;
+	err = pcie->soc->startup(port);
+	if (err) {
+		dev_info(dev, "Port%d link down\n", port->slot);
+		goto err_soc_startup;
+	}
 
-	dev_info(dev, "Port%d link down\n", port->slot);
+	return 0;
 
+err_soc_startup:
 	phy_power_off(port->phy);
 err_phy_on:
 	phy_exit(port->phy);
@@ -942,8 +950,8 @@ static void mtk_pcie_enable_port(struct mtk_pcie_port *port)
 	clk_disable_unprepare(port->ahb_ck);
 err_ahb_clk:
 	clk_disable_unprepare(port->sys_ck);
-err_sys_clk:
-	mtk_pcie_port_free(port);
+
+	return err;
 }
 
 static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
@@ -1109,8 +1117,13 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 		return err;
 
 	/* enable each port, and then check link status */
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
-		mtk_pcie_enable_port(port);
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+		err = mtk_pcie_enable_port(port);
+		if (err) {
+			mtk_pcie_irq_teardown_port(port);
+			mtk_pcie_port_free(port);
+		}
+	}
 
 	/* power down PCIe subsys if slots are all empty (link down) */
 	if (list_empty(&pcie->ports))
@@ -1209,14 +1222,18 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 {
 	struct mtk_pcie *pcie = dev_get_drvdata(dev);
 	struct mtk_pcie_port *port, *tmp;
+	int err;
 
 	if (list_empty(&pcie->ports))
 		return 0;
 
 	clk_prepare_enable(pcie->free_ck);
 
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
-		mtk_pcie_enable_port(port);
+	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+		err = mtk_pcie_enable_port(port);
+		if (err)
+			mtk_pcie_port_free(port);
+	}
 
 	/* In case of EP was removed while system suspend. */
 	if (list_empty(&pcie->ports))
-- 
2.48.1


