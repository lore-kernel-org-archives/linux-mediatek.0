Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB40C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i/kTiL7qMggq0JM+wjpexcmuwEQeM/AkSaq1pFFVPU=; b=baC9ye1it3j2rTvUfZxWGZCIe0
	4bojbsCfZ0pgT5va1LughPxRCoW5FmeqLWNgXxKyNSDYC1U8rjGt2rvdahn8pQB/aTSej44fxjdZG
	L9itNCx1cyuOpiWUm9JX1XGSok85hDeSdOmTfWb4RPv2Fdo273ZUk5GcmRwE2W7MiaBOVCGa/qJwy
	YnqOiLRgU4qgWmhMuLvu9b7eLJ6IS97+6BHbya9Ykb/f7U0ASsHqKKmtpNabm9QC9svsqJTzrz77Z
	E8pfJf9yTBwoMNIM2k/2SjQStMkNY/6EUui025caHzkZ9OULJ92e0sp7EanBe/OM9NFod0NB22X0V
	2jmqAtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoZ-00A6ow-FG; Wed, 11 Jan 2023 07:46:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVoH-00A6do-08; Wed, 11 Jan 2023 07:46:12 +0000
X-UUID: 005603ec918411eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8i/kTiL7qMggq0JM+wjpexcmuwEQeM/AkSaq1pFFVPU=;
	b=n49Cs3fBZ8h+kHtJyBExDr501d6BgMj0anld91RxbMPVy2Ejyzs0yyBiOmyuBPcx1i8q8X80hb4QjUEf5gKy2m/O6FyZETak7CvSnsr1VHF3wifAzC+a5qZhvOSn25pEP7fSL/FTnWmCIJs18OjNBZ4T49Lxheyxjh2oHhOsrYw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:9376a458-7047-494c-abae-90a415dfcf0b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:29b15354-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 005603ec918411eda08d4d6090ec5a5c-20230111
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1654996165; Wed, 11 Jan 2023 00:46:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 15:45:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 15:45:30 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 07/14] soc: mediatek: mtk-svs: keep svs alive if CONFIG_DEBUG_FS not supported
Date: Wed, 11 Jan 2023 15:45:21 +0800
Message-ID: <20230111074528.29354-8-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111074528.29354-1-roger.lu@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_234609_092962_4D885712 
X-CRM114-Status: GOOD (  12.01  )
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

Some projects might not support CONFIG_DEBUG_FS but still needs svs to be
alive. Therefore, enclose debug cmd codes with CONFIG_DEBUG_FS to make sure
svs can be alive when CONFIG_DEBUG_FS not supported.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index a3c84e819bc5..70ca9c9acae0 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -138,6 +138,7 @@
 
 static DEFINE_SPINLOCK(svs_lock);
 
+#ifdef CONFIG_DEBUG_FS
 #define debug_fops_ro(name)						\
 	static int svs_##name##_debug_open(struct inode *inode,		\
 					   struct file *filp)		\
@@ -170,6 +171,7 @@ static DEFINE_SPINLOCK(svs_lock);
 	}
 
 #define svs_dentry_data(name)	{__stringify(name), &svs_##name##_debug_fops}
+#endif
 
 /**
  * enum svsb_phase - svs bank phase enumeration
@@ -652,6 +654,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	return ret;
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int svs_dump_debug_show(struct seq_file *m, void *p)
 {
 	struct svs_platform *svsp = (struct svs_platform *)m->private;
@@ -867,6 +870,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 
 	return 0;
 }
+#endif /* CONFIG_DEBUG_FS */
 
 static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
 {
@@ -2476,11 +2480,13 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_iounmap;
 	}
 
+#ifdef CONFIG_DEBUG_FS
 	ret = svs_create_debug_cmds(svsp);
 	if (ret) {
 		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
 		goto svs_probe_iounmap;
 	}
+#endif
 
 	return 0;
 
-- 
2.18.0


