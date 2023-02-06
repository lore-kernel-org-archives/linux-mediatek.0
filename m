Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3229DC636D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nhX0ZzO+o91oRktwk9h5syIPq4YTHnqk4Wg7b8YHlU=; b=gE+9y/BCjiHMQ+Evz+eJmfo7tR
	vOy8DDur9mWWObmAQqEvM3yJ9Cj3bn9z8kbTVxoT8i04q94MHzAtR0WIlm5p1+8VUzSd5VZYlstoF
	MeJPSHp0Sng0eKf0tzqMoN7ADu8kSsDjdz8j/lQUQUlnpqzGIsulgj9IaF2CnxH1LvkmXSEQrax/t
	398pX9ckYtpeuZe9sBzvSl2n96GekVpwkeIGj4ddQsu9Cc0fKDIW/1t2IyqIIqTNhfDlpcHJgdiiZ
	5ZZu7CDeO626xDJkUKjVJmdC0FFzsnBZY0qnVeF7Sy0Yhn4SA6Naj3/jly3HWwYFoGSadPZbffclO
	1c0EUhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3vW-00990s-5v; Mon, 06 Feb 2023 16:01:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3S8-008uDF-OH; Mon, 06 Feb 2023 15:30:46 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 42E686602FA2;
	Mon,  6 Feb 2023 15:30:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697443;
	bh=AXqX968TBKOM3eXq4Eobvq/6nMoQsQ7ZOJPn9J7khw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9wUUrvx8s/XmtJTwAc0HWq/fyHUYL/uV40Se9R+PXLv0oa1LY1YWI6rLCoAvOVhQ
	 Xd/W2kIOE7Fey8+jJwsIbH+AT5v0DVAEuYRxehnSuoaRUpD8FfeU3sTZNnxyiTqWD/
	 A2K4V33uQfcs30JNF9Q1nYhQ9RrWAeFRTW5+NSz2RBbt9MPogCoe5AMyQylpH9JoY9
	 KkwO8EpThPE3nJXji56ipzBrLU4cteIn9h7oPrAwfSU/ggMrFZM7mQjuMgUmkXT2mI
	 ZdUL/R/HMfbIXn2Lx1pwJCbsA9G0jfWgzA9PZuz/kAvxCjSzvRaCK85gxaRAwSuMFj
	 G40D4rT5jN2hQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 41/45] clk: mediatek: Allow building most MT6797 clock drivers as modules
Date: Mon,  6 Feb 2023 16:29:24 +0100
Message-Id: <20230206152928.918562-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073044_962011_9D652E20 
X-CRM114-Status: UNSURE (   8.42  )
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

Most of the MT6797 clock drivers can be built as modules: change them
to tristate to allow that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5444af1570ae..1497171a65ef 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -312,25 +312,25 @@ config COMMON_CLK_MT6797
 	  This driver supports MediaTek MT6797 basic clocks.
 
 config COMMON_CLK_MT6797_MMSYS
-	bool "Clock driver for MediaTek MT6797 mmsys"
+	tristate "Clock driver for MediaTek MT6797 mmsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 mmsys clocks.
 
 config COMMON_CLK_MT6797_IMGSYS
-	bool "Clock driver for MediaTek MT6797 imgsys"
+	tristate "Clock driver for MediaTek MT6797 imgsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 imgsys clocks.
 
 config COMMON_CLK_MT6797_VDECSYS
-	bool "Clock driver for MediaTek MT6797 vdecsys"
+	tristate "Clock driver for MediaTek MT6797 vdecsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 vdecsys clocks.
 
 config COMMON_CLK_MT6797_VENCSYS
-	bool "Clock driver for MediaTek MT6797 vencsys"
+	tristate "Clock driver for MediaTek MT6797 vencsys"
 	depends on COMMON_CLK_MT6797
 	help
 	  This driver supports MediaTek MT6797 vencsys clocks.
-- 
2.39.1


