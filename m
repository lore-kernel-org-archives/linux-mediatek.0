Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B3EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Jul 2022 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=If536OaMJIFA2FDUGLO0n+ymPQbvWa1j8+yywMbJu+U=; b=aQ00e50tcwfyjf+3c19fAvRH/P
	D4D/36yGo1hFe96dQGmG3jscT3UPcEkSwbL9Rexs2MH/wFPiJhPh95u697OH0CYKZc0FzFqUS2Gkq
	CthXao20Uhc+aLzTof5eyefFDKcggwZePLxj32oG4Tm3o+XV8zo0IVRJgdL59JEQ6dCfA7bLcKbAi
	WWwVyYx2OYS/LQISwJ1BP9d5WXKioD56HHcXEYnQryRUiMAd/jO2nzkWVO9PiXIOXSJnpOon28/Jz
	jBfM9QFfgJYIcf1/okYpMIpge/u1aC8ML8rBP7DMCQXOPRNWElRFXDWjSJL3I0vZcmaQs5cdHKqXt
	pcST+kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFZTY-0058eQ-8r; Sun, 24 Jul 2022 11:08:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFZTN-0058Yi-Bt; Sun, 24 Jul 2022 11:08:35 +0000
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LrL0f0tnKzWf6t;
	Sun, 24 Jul 2022 19:04:34 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 24 Jul 2022 19:08:24 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sun, 24 Jul
 2022 19:08:24 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <tzungbi@kernel.org>,
	<jiaxin.yu@mediatek.com>, <julianbraha@gmail.com>, <geert+renesas@glider.be>
CC: <renzhijie2@huawei.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH -next] ASoC: mediatek: mt8186: fix Kconfig dependency
Date: Sun, 24 Jul 2022 19:06:19 +0800
Message-ID: <20220724110619.212774-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_040833_600582_2FB9232F 
X-CRM114-Status: UNSURE (   7.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If CONFIG_SND_SOC_MT8186=y and CONFIG_SND_SOC_MT6358 is not set,
make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-, will be failed, like this:

sound/soc/mediatek/mt8186/mt8186-mt6366-common.o: In function `mt8186_mt6366_init':
mt8186-mt6366-common.c:(.text+0x4d): undefined reference to `mt6358_set_mtkaif_protocol'
make: *** [vmlinux] Error 1

To fix this build error, add select SND_SOC_MT6358 to config SND_SOC_MT8186 dependency.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 96917743b0db..363fa4d47680 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -157,6 +157,7 @@ config SND_SOC_MT8186
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on COMMON_CLK
 	select SND_SOC_MEDIATEK
+	select SND_SOC_MT6358
 	select MFD_SYSCON if SND_SOC_MT6358
 	help
 	  This adds ASoC driver for Mediatek MT8186 boards
-- 
2.17.1


