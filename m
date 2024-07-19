Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44B1C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wZHeBsGrbMXI9KE6nMvuhq3U1yYMHE/cYGvXp/BOm0A=; b=tI3I2SDCqeXysJ68DvO3PPcOwV
	vSdBqwcXpk1kZM+lf6Wm1kYG+XWqbFeywH/kV9INPSxXx6Te+HZHFnRGqZjcJszz0u0veJgPrxIHV
	eG28sgFYotUHAaswoOLbMEc6fi8EnTt7YhJ1f+Iox8MIo0QxQ3VOHWIYqLpricnzCcnu/Qq3NsfMD
	oPw1dZOtODLFXWu7SB+IAOJqcajakzHFRbe/c3owj1HwelEuGAT8h2+PfCFUUA3ehE2ArGsazm7Ve
	FA0J0gCo9IJVenjhqrZD9lBl/dFxNnXfrWufWxmpXJ1h9hRs8rcAVCASwnaIhLrlgwk4gjl6cjQSI
	c+BgukPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuNs-00000003lTM-3G7e;
	Fri, 19 Jul 2024 20:39:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuNW-00000003lQI-1JiU;
	Fri, 19 Jul 2024 20:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D371DCE1C88;
	Fri, 19 Jul 2024 20:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEC1C32782;
	Fri, 19 Jul 2024 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721421535;
	bh=AON9XBl1TCaXqJyKVVpDsSKb6Hr7n3DQkS8P2XAGnBE=;
	h=From:To:Cc:Subject:Date:From;
	b=Xb5C67sY+1eQl6g3SCRQP0vLUQVmg+0oBlSZJVQESOUhAH+jZ6DOJtFojmAaN3IZZ
	 6bLJSyJaB34gUMxZvORFH3ZWuiF2XxjEK9pMCPlzXqRcZCiPvfOEe4tZiJK7JRED/+
	 LmXm30W+LN1eqDmsIMShbJ5sVsNamDLH6EZg9iVkSpkNSYFO5RVrur7/FIuD9opHzN
	 XiaPsM0Qj/NZNmMcXxJYV/f+Wo5BhNfeo3uB91Zt/W7ng5zWyZLGmDgt9/DcVy0A0H
	 LzGKqSQYwlrxkIcGi3OhcqRaGFH3O+eH2oLNArXB8kx2M0DbxudzGbREK6xrfVyibD
	 nu5alfn+hOHbw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com,
	dan.carpenter@linaro.org
Subject: [PATCH net] net: airoha: Fix MBI_RX_AGE_SEL_MASK definition
Date: Fri, 19 Jul 2024 22:38:31 +0200
Message-ID: <d27d0465be1bff3369e886e5f10c4d37fefc4934.1721419930.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_133858_559266_7B3E50A3 
X-CRM114-Status: UNSURE (   8.82  )
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

Fix copy-paste error in MBI_RX_AGE_SEL_MASK macro definition

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 16761fde6c6c..1c5b85a86df1 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -249,7 +249,7 @@
 #define REG_FE_GDM_RX_ETH_L1023_CNT_H(_n)	(GDM_BASE(_n) + 0x2fc)
 
 #define REG_GDM2_CHN_RLS		(GDM2_BASE + 0x20)
-#define MBI_RX_AGE_SEL_MASK		GENMASK(18, 17)
+#define MBI_RX_AGE_SEL_MASK		GENMASK(26, 25)
 #define MBI_TX_AGE_SEL_MASK		GENMASK(18, 17)
 
 #define REG_GDM3_FWD_CFG		GDM3_BASE
-- 
2.45.2


