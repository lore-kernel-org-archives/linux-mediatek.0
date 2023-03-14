Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A4DC74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qer/TEf3ViRgymBCPA0wrGw/QtouPYPu9K32fep8uA=; b=TjiKHTTjfylU060LSzLMy9/1ZQ
	zWTED06IYTSNNQrIpkqB3+mG5Gi3XfJJvh3ZdiXx1pB4UoWWyHZ24t7JAJt0dKQGpHJUpcDkwQHD8
	V8BOIPdiCPR2WRIZjlD465/eWoCoBxPQ9czpiB7b3GUqy00hmlsQsvmAnBW80LEQpnMfRMAqJrGbZ
	eA7eUGLgU1eP0wig26lbiBlhWQrxqZuj3f3SR8x7QznGak44KvOXpdV68lxyomerlkaax0KHElgFX
	vKNEOHxrYg6ZPpaRISxUY8oqGobevvp3ahBghOBNLOigAA4axIiu2LAiIsXFGaECWs/A4pAeIhgjF
	VNC9a1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc3zo-00A9IF-11;
	Tue, 14 Mar 2023 12:43:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc3zj-00A9Fp-1W;
	Tue, 14 Mar 2023 12:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FAE76175A;
	Tue, 14 Mar 2023 12:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25323C4339B;
	Tue, 14 Mar 2023 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678797789;
	bh=VqcU0kjoPpaodik/tmc2o/BUXU32GcZs2CiF6oE5zjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sn9OrqdRBX3nRz6P18VSTNwiBMyXr7N/XjYvB3KnqNnh2UUMen30kAjO8brzQLtm1
	 Ibhl0IdK9g5+L5z6gMMH+WPg2TTuMQN6XfaXZXtRVNduUgieuSKdZxUEybyu5Aq1Bs
	 NSnVNu4PcfGtqjtzXrQWGCm9vxPC63bNS6VtAFt0DmF+j46rrbDr/Dyum6Y/fVmC7s
	 vLgZlk163tO6InZVFzWgPJ/7N/DLAIKDpLj4oV6fb4keqlDvTIbVtx8N/7zT+gT1Dq
	 yThnU0ZDuDpr/8ERASAs/LNxDWQfbPf/6w/T+7RyKWciTo59r3XqpPvmudCTAtvCha
	 /4yzJ1WVBBMWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roger Lu <roger.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 02/13] soc: mediatek: mtk-svs: keep svs alive if CONFIG_DEBUG_FS not supported
Date: Tue, 14 Mar 2023 08:42:54 -0400
Message-Id: <20230314124305.470657-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314124305.470657-1-sashal@kernel.org>
References: <20230314124305.470657-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_054311_570225_5E4E293A 
X-CRM114-Status: GOOD (  11.17  )
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

From: Roger Lu <roger.lu@mediatek.com>

[ Upstream commit 8bf305087629a98224aa97769587434ea4016767 ]

Some projects might not support CONFIG_DEBUG_FS but still needs svs to be
alive. Therefore, enclose debug cmd codes with CONFIG_DEBUG_FS to make sure
svs can be alive when CONFIG_DEBUG_FS not supported.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Link: https://lore.kernel.org/r/20230111074528.29354-8-roger.lu@mediatek.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/mediatek/mtk-svs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 00526fd37d7b8..e55fb16fdc5ac 100644
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
@@ -628,6 +630,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	return ret;
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int svs_dump_debug_show(struct seq_file *m, void *p)
 {
 	struct svs_platform *svsp = (struct svs_platform *)m->private;
@@ -843,6 +846,7 @@ static int svs_create_debug_cmds(struct svs_platform *svsp)
 
 	return 0;
 }
+#endif /* CONFIG_DEBUG_FS */
 
 static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
 {
@@ -2444,11 +2448,13 @@ static int svs_probe(struct platform_device *pdev)
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
2.39.2


