Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA8FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:42:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E43615FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E43615FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUYHhPrud4jYwVUlT+wMQFt8rALDRJBSZCh14B9QA1M=; b=m5PBbrjDGC+DDI+XloP5q7zzw2
	UemScugrl0ITnRqs97XRtsE1EKwhqsQcpDEhlRmTwIeULzg8Wwpl85hUu9tAKfr9//2wZDiSyTmM3
	QnWLXhgYeBWHjiqkOiajEvHZtLrMU5XlVH5Sv6t8/tjxDYhinmawx5Y8FVTUpcMZgk5U8gctJDSyr
	7FkHFpSmb2iPtncATGGL2cNH/oCbdmqqHo5X647YgdiRKpJTnBltCkZDt8AR+Zw1wYIg3/qSH7tR4
	DCrJI79gUrv2WiwBxYSg8In9fOgkuqke1D88A+sZKP3fSHJeG3OI+4fRqj1/s8or+TfL1ewbTX7Ba
	Ni1baf7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPqc-00GzRp-EF; Tue, 11 May 2021 10:42:42 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMI4-00GSWv-1Z; Tue, 11 May 2021 06:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=7S7fK+5ekXfabi274JC/YGeaQz9aQzJFiwmtYbfBq08=; b=0dfAuvUQogUsN/gLgpGgtYOpOI
 +FwBzYG50d/KulVIBT/IzxpRh7CNP0TJ2eFaPWqBivX0kmYYg9gw3UoqtB2Mv5JFl4NTNzDAMIA46
 uywtLt4zmSAfoK6K5viicQ0ydlrxAlBzoYXWjpFkYnNNPpGgCW9hwktN+X2GeEtInDfi/cgJURd8s
 TUxWaH+CbLTYvdd4ziauufuWh61R6w4fgjoUYrC64SYzKhdZbLaaP+vJd2pW4q3ky3UbCQxTX1WCB
 C2pNdb99X1fzXr72G5vAFHE85ejJeo9oIZ6tqn6/Ap/sFsdeSX9icRzQG/wiBNxIPdAJkizJHrKhB
 RVHe/1bA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMI1-009LZd-0n; Tue, 11 May 2021 06:54:46 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfT9q2L3yz1BKfg;
 Tue, 11 May 2021 14:51:59 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 14:54:29 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <bhelgaas@google.com>,
 <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Zou
 Wei" <zou_wei@huawei.com>
Subject: [PATCH -next] PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
Date: Tue, 11 May 2021 15:11:31 +0800
Message-ID: <1620717091-108691-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_235445_253927_8AA2590B 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_235445_253927_8AA2590B 
X-CRM114-Status: UNSURE (   4.98  )
X-CRM114-Notice: Please train this message.
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

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3c5b9771..f3aeb8d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1012,6 +1012,7 @@ static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
 
 static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
-- 
2.6.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
