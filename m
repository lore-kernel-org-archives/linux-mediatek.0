Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13270CD343F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nN956VWUpzaipasyvgQamUM/S2X7TTAO6ecb5GJgO9w=; b=dk857O8uBAZmjlH2KmnbR6gdAP
	3tSybj42ZL/1dS7gI0t/QLJ4roMxosoVsABxL5Yg6fNLgf+fyDKhHhUWEgS1cpneiELVvDbv0AbuG
	bnCFY5Sg+i9lXFDJeyywsLdPqe36qcRUYnsEFYhJiFrBZkjakbrD+YdK7dLykPknih+LU84LdCljF
	Pp52Catp8v9unTkfCBnK3qqJ1YZmOylEHCRYAhzl61w2Bh7Me0BREYIewSDRr0doX5RpfrNpLNlIi
	QtiAIQflN9BeqTH6XVm4b56vibU0tPajKe9yrufZtEANgtmA3Edyj+kGx/ufkmYE/BQoo4VI+JHjk
	Wj5wVFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxgj-00000006vk5-0Yym;
	Thu, 21 May 2026 07:19:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxgg-00000006vjX-3dEg
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 07:19:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0JiC4748495
	for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 07:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nN956VWUpzaipasyvgQamUM/S2X7TTAO6ec
	b5GJgO9w=; b=jYw1drq37Aa8pNMI4dzSEE8mYokUb9i9XcsW2AJywqngw/X5t+x
	9WAYNSboIZS+bK+L/ylJKwL64H3eyAD6fxq3oVp+LO8gmXKHSxc/pau1Y8ZDwMgE
	HYKoGf6BZS5jvRSiaK2SqYPdCseTZvDCn0T59kUVlneBMv69O5vqdcRamNTxylH8
	7WeVdAHeEMQvqbnkdjrHNdyQA/D0QU2SuOs2r1EQp/JSCgI+Ur+m8zZT5unkp7rA
	P0HR/Ouu3U06sA2IthWJhcueLlvlmXEFZhvQIYmRqRMBtIH+cjp2bAtldXnt0SKV
	hnT1B2lfEEMshOXrX8sx9wCyeYNABKxgdhg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6k7ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 07:19:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so62749485ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2026 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779347961; x=1779952761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nN956VWUpzaipasyvgQamUM/S2X7TTAO6ecb5GJgO9w=;
        b=dTKbAMeR1PjmuzcCKsyXBw0eCVsgLwo6+bgt/PKphnQf2/9pWToTX2p88KkXYLj3Xz
         QMJMFitI9/YudV2IrnP4JOni1txV25Dzu2n2k5pTINi9LQ9I4ld5O5ZBAv2EmaIGZR5Z
         3BCZNXPht9NI/GclOcvaG31KrbeSXmM+c9AdYpH6fkz9jG65jhJBTG7EdlEeo1doeHBq
         hivodFOP5qvjw5iRc72++pVgA7ifD65IjWypPtliaOag0Sq2/9sS7E/LTj0XQZ6HkLdN
         QMD04RW3mGzx4nQ7bBz+/J0ymmDZ+PAPjJyylqnESnzIcwlzde1mQ4h9cQHSMmAqrnzd
         nmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347961; x=1779952761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN956VWUpzaipasyvgQamUM/S2X7TTAO6ecb5GJgO9w=;
        b=gFeBmUIHUkz2vVN9unR59tPvVSk2Q7gYSw6fpHVyh8JS3E5Jrd0/9qfhqV7mEB2WPU
         kNb8QVvM/DvZ6a/eNOItuRUWSw7EKw3tRL5X60+pO8xTbaRxlS3kXW9E6ebXdxPQEQxo
         5+d30Hfafk0xXqrfkA7c3XWLVlulDNfGeLh0tdkWqBhXHT6me1x+emuzpQGUCitQySBC
         Ol3bnGjcjg/Qh/7dEQiNThpWPBr/TEj6asTgxJjDjM5cCqJiTvwKVPZaIydAaMLjbp90
         0xdUjZ5tWZX/LH31bcZpcLjVEE5DeIqu2ovb/dR1td+gslASyxOH4I1w/XF07wzgH3El
         4dbA==
X-Forwarded-Encrypted: i=1; AFNElJ/Q9ebFV+wLKAp3H/QcapwXLu0RwMIEmmlp0Uh5BS5qVCX3bwIWU0lPNBcJAiB35Cz0Y2V9sF6Ya1Yd3hVLug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp+/XszxRR1KVrTZKsKlNfQCjdXJuYc3XYVEmNqzMN9yo1hG9l
	OYqpNJ2oU2LfKsb0ux2Pv+ZM46ip31En7wFTlmtMsxDfsR3xld5FKaNadJ/5xlvX3EmPUe0IPnx
	1uvg+O7V+Nt2Ww/Jircb/iT64+Drkg4nJqezLlML2q17jdP4HEooiU1wdlMM51DnbrWeVlqdbVi
	A=
X-Gm-Gg: Acq92OH1f6jL2fIibhEF3Oh+thmRpyHrj82eobZZfjA8LHV5Tjta2R2FDCxI3asKGuj
	pqJg/LAxyt+kF8YHgG4u9dax5/QT6q8fvXJZH0+r7CacF3Ot6n4IsfjkDc/w7Z5X9h3JyF5hJrG
	tzdcUwIM+msq/s41U1lJ8FwaZkGRMt6c3l9NShulB7ds0iqjAjnTL/j0eyfQnNOojhjav7Ltkc7
	jtAcVCeYNXibR/dYmA3/9d5gvSJ/ua+s7Ct6yaeARuINx3oacRfhZJt0Kaz2S8Me45dkZqSuFSk
	ywpgswD1lD8mF2gdlO3uPDsmcHPhIUwSAT+vQnOOZ2SSc5EwADZOW1SG8VJKilSgwx6v+CJo+2y
	9q5WMX4Q6rKEaqo2k0T58H7iJIfoHCgqRkYzFk55urRny2cyFXUDT0xdDcg==
X-Received: by 2002:a17:903:3bd0:b0:2ba:5f24:caeb with SMTP id d9443c01a7336-2bea229bfd5mr15735375ad.19.1779347961083;
        Thu, 21 May 2026 00:19:21 -0700 (PDT)
X-Received: by 2002:a17:903:3bd0:b0:2ba:5f24:caeb with SMTP id d9443c01a7336-2bea229bfd5mr15734965ad.19.1779347960462;
        Thu, 21 May 2026 00:19:20 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:ef8d:de79:6e34:4a35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98eca29sm468475ad.41.2026.05.21.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:19:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        ryder.lee@mediatek.com, jianjun.wang@mediatek.com
Cc: bhelgaas@google.com, robh@kernel.org, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH] PCI: mediatek: Free IRQ domains while freeing Root Ports
Date: Thu, 21 May 2026 12:49:07 +0530
Message-ID: <20260521071907.13614-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0eb1f9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0GrS9vw-3MyE2OudUf0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 1alA-LdM1gUcB8CHHjRNI_Cd0GOFvw2D
X-Proofpoint-GUID: 1alA-LdM1gUcB8CHHjRNI_Cd0GOFvw2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2OSBTYWx0ZWRfX9gUfBdLFOtO6
 bB+c45dn2JtftaXM1GdjXwCRygICuosmIsHHScbJbDEY+aBqPlRROc2LMTjGSMcqwWW8EvkOPYw
 hvxRyg8myM5ZLKFkrcV7oOPds4C7IVZxtX2WbcY6Plo1tWY4tMEBTl9e6iu+XBN2wfHwQVyge4F
 h5IOEDUbzISIrYLdpqblfx9AkJx7SOBhf6fPIeON9q0III3aafc8Rj2CFpL/yjFtXhegXzBKtP9
 gIyG+dbjp6bdZ3BuHWjdbKF+UI97NznJyudCHUhzzkhCjyAK75nmx6XSU9xoNk2vaaf8AHwT8EF
 LlGGarUU0iQh3UCAfbAsAiiXEzZnUEETGD36oWHqMoM63SFqiWHtmhaYIzMMjZaLV3IU9peHdU5
 f/PbOE1Wm2YQJ7zyjmhXNp6uLzbc6YS61UUg7bO9Y33UrQzoGsCcruyIIFAGl0ZEjrUln8R3OoD
 b8ztjd3XNg0QlN1MD1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_001922_906786_EDC7AF77 
X-CRM114-Status: GOOD (  14.96  )
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

Currently, the driver frees the IRQ domains only during driver remove().
But when mtk_pcie_enable_port() fails for some reason, the domains are
not freed. This leads to resource leakage.

Hence, free the IRQ domains inside mtk_pcie_port_free() helper which gets
called in the error path of mtk_pcie_enable_port() and also during driver
removal.

This issue was flagged by Sashiko when reviewing the EcoNet EN7528 SoC
support series.

Cc: stable@vger.kernel.org # 5.10
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Fixes: b099631df160 ("PCI: mediatek: Add controller support for MT2712 and MT7622")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/pcie-mediatek.c | 35 +++++++++++---------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index c503fbd774d0..c45baf681cf5 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -250,6 +250,20 @@ static void mtk_pcie_port_free(struct mtk_pcie_port *port)
 	struct mtk_pcie *pcie = port->pcie;
 	struct device *dev = pcie->dev;
 
+	if (port->irq) {
+		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
+
+		if (port->irq_domain)
+			irq_domain_remove(port->irq_domain);
+
+		if (IS_ENABLED(CONFIG_PCI_MSI)) {
+			if (port->inner_domain)
+				irq_domain_remove(port->inner_domain);
+		}
+
+		irq_dispose_mapping(port->irq);
+	}
+
 	devm_iounmap(dev, port->base);
 	list_del(&port->list);
 	devm_kfree(dev, port);
@@ -531,25 +545,6 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	writel(val, port->base + PCIE_INT_MASK);
 }
 
-static void mtk_pcie_irq_teardown(struct mtk_pcie *pcie)
-{
-	struct mtk_pcie_port *port, *tmp;
-
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
-		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
-
-		if (port->irq_domain)
-			irq_domain_remove(port->irq_domain);
-
-		if (IS_ENABLED(CONFIG_PCI_MSI)) {
-			if (port->inner_domain)
-				irq_domain_remove(port->inner_domain);
-		}
-
-		irq_dispose_mapping(port->irq);
-	}
-}
-
 static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
 			     irq_hw_number_t hwirq)
 {
@@ -1186,8 +1181,6 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	mtk_pcie_free_resources(pcie);
 
-	mtk_pcie_irq_teardown(pcie);
-
 	mtk_pcie_put_resources(pcie);
 }
 
-- 
2.51.0


