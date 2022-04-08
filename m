Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E900EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcNRa5M6TyStkpNV5hIRNYAsoqH53mpAymxIr19z9yc=; b=ofS+DhkKik9VsW
	HoMJvfV6XkgyM6rXBhdpxZGC/ui/VRxDAT6/Cc5UY0OJ1goDcSPN0CUuPDfFRkazUEUGKV8PPYKhI
	fSdgkVTH1EjWN4YMnvSd013bkED5lVUjxQIGrZUZ+P3x4vgvN1bZfjgMHnLkynLrjqjCX8vFmxLMS
	rwUGpE9NHjsZBRVymDN4tYlFpftras94MXpMfEQNDiWIrrf14JqElq8ctF7klkpZ/oWV/qCZzLg3f
	Hwp5jHzIepF8ecRs1R4yG1UsyTh/IWF6RDzaKpbQWbiYzvkVNE4preeAvbdWv4NNkavzt9T6/Ztw/
	KQCMcCE7RdtNxVse7JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgs8-00F1GX-Jv; Fri, 08 Apr 2022 05:09:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs3-00F1BV-7L; Fri, 08 Apr 2022 05:09:20 +0000
X-UUID: 6a5eb5257217478795c28312ac6ebb59-20220407
X-UUID: 6a5eb5257217478795c28312ac6ebb59-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1381021374; Thu, 07 Apr 2022 22:09:14 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 12:59:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:12 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH V2 10/15] cpufreq: mediatek: Make sram regulator optional
Date: Fri, 8 Apr 2022 12:59:03 +0800
Message-ID: <20220408045908.21671-11-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220919_298526_F7E058E0 
X-CRM114-Status: GOOD (  11.16  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

For some MediaTek SoCs, like MT8186, it's possible that the sram regulator
is shared between CPU and CCI.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 9e9bce0ff235..8f688d47e64b 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -435,7 +435,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	}
 
 	/* Both presence and absence of sram regulator are valid cases. */
-	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
+	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
 	if (IS_ERR(info->sram_reg))
 		info->sram_reg = NULL;
 	else {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
