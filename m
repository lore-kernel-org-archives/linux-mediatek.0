Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A29C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AEC235FF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6AEC235FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=35pOH/sTn9UGGAMcR0WLrN9uDMF+W0psCeUZD7F9oE0=; b=k4cIJGM+2p89pXYRfQFTJhSCL
	0wwy5598XEeSsHqgvmucKzNPkmUXL3dZexiIFQ8iilsfoIBQNYJMkaQt60WMqFi6uZ41y6yXZClRg
	GfqPDqomeXhHMWO4aKnN3o2Tae6NVa6XF7eA2ox7TYS2CqwaRKryAXexLfsz1rjMRPagaJ+rbi+7F
	jQHcFju9E17HWRuWoFu/P5EduIm7vEokcT51KxU3smsLA5p2G+UOHtIEQwiX90o2HMf9rwa90W3tD
	6CaRbwsPYX25NOcpIgjgASwmFcVIqgJkH362rU6ic6ySCwFHniJjJATd6kL6VO6W+XA825xvZnnK3
	vbMUgHrVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2rwI-0006yq-1N; Fri, 22 Jan 2021 08:37:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2rwE-0006xF-2F
 for linux-mediatek@lists.infradead.org; Fri, 22 Jan 2021 08:37:04 +0000
X-UUID: e83b939bb9524986809d3bbc49fb2110-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kv2GNKYL3eh4jcpRokEypBlnO88/lB8Q9ExWO1gtpyI=; 
 b=mxkw4TkkKLDE56NYDgEt43tkMFwEAxvWk7bwhOEuEJK+Er/nEa55mIazQywCQtlPZymemcQL4dEkq6j1qKzgpuEJ05KkUMwIV58lbDpqmmwOSeyCGm/z+2NtxJap6xtn3pINbhIMEHXvGLT4NAL4R/YJdzHFq1oGnKz0xIj7ztE=;
X-UUID: e83b939bb9524986809d3bbc49fb2110-20210122
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 335272330; Fri, 22 Jan 2021 00:36:54 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 00:36:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 16:36:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 16:36:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <jejb@linux.ibm.com>, <avri.altman@wdc.com>, <alim.akhtar@samsung.com>
Subject: [PATCH v3 1/2] arm64: configs: Support Universal Flash Storage on
 MediaTek platforms
Date: Fri, 22 Jan 2021 16:36:26 +0800
Message-ID: <20210122083627.2893-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122083627.2893-1-stanley.chu@mediatek.com>
References: <20210122083627.2893-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F1840B8654F83275B0B86B7812F4FA79CD6A7E398873C42452E32310C25006012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_033702_349142_1170B186 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: hanks.chen@mediatek.com, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support UFS on MediaTek platforms by enabling CONFIG_SCSI_UFS_MEDIATEK.

Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..12ff990b2691 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -283,6 +283,7 @@ CONFIG_SCSI_MPT3SAS=m
 CONFIG_SCSI_UFSHCD=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_QCOM=m
+CONFIG_SCSI_UFS_MEDIATEK=m
 CONFIG_SCSI_UFS_HISI=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
