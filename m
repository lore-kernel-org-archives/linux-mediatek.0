Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441BACF885F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 21:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9szLUzHqWaoD0cYaKQZLMyz8MDSGbymSHGS9KqS6dU=; b=zXDLSq4tUDjb4/QoXI1zwja+Yy
	CG9MLsgcgqZTFilyPAunu3uZvWdn2gn1UVyocsiFmvCuZe6i/c+xv3xn08+2KbUEf2v7KSdWq8a+i
	ReB+Bbp5X+nAP5n2FSDwhyjyMq8MZodmAR15cmNThp4ACYT0kPCmXiPWq7C4AfUPQm4UT09RexXBw
	LVEr0hBYEI//JWi1yl8jKkk542c0tMpUOiWadeRh3xea10Q0/7ibRYy9/v9Luh+giNGGKZBJ/LT33
	c9deCBnJZPdSNpdIUJVtdNZD70ppF+l3AcFxpWNLh1fx5VxwF3kWRxhaupS5sG+d8hLQcKos4aU7c
	SzYic2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swqF1-0000000EJ8l-2UQB;
	Fri, 04 Oct 2024 21:53:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swqDl-0000000EJ4B-10bM;
	Fri, 04 Oct 2024 21:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EDA85C45AC;
	Fri,  4 Oct 2024 21:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D5BC4CEC6;
	Fri,  4 Oct 2024 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728078740;
	bh=uzpROxSyXHDis+ZcxSk361Wk81pS4vKtRyGOarVkMbE=;
	h=From:Date:Subject:To:Cc:From;
	b=hIvf4cZ1Io6xOWef9K8YqkmXQmvIcULpwkj+mH2ZFjnRCGPzU1B8UvOHd2Ua6+x0q
	 cwuoxaEpBt4HA3LZ0nKeNko28MShqjt5xYnwRAJHmMTGLRYgGKUKs1u2J2CKpz49Hj
	 Xx/ExKA3fvFnbzQH/WIHzP190+OjoxzKAuVKEHA7scdKfmBSE39UF8S+kD9XqlSBUf
	 zNVb0Ru8UhziqsQHxBqkJvZgizFCm5d8MoxgUcvWoqIrEQ8xAX/9Nf16VGFimd18sT
	 0wVlegWoPkTCPV3hnKVlSc3ZU55ClqVkSB7I9iD5x1Wn5DEVB6hbnT4sGjZer2pLrk
	 6tikCBrxH9qFA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Oct 2024 23:51:36 +0200
Subject: [PATCH net-next] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGdjAGcC/x3LQQqAIBBA0avIrBPUBKWrRIupppyNhkIE4d0bW
 j4+/4VGlanBpF6odHPjkgV2ULAlzCdp3sXgjPPWGK+Ra0moD36o6YiI0YawutGDLFelP8gxL71
 /y979ql4AAAA=
X-Change-ID: 20241004-airoha-fixes-8aaa8177b234
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_145221_355503_77BA0E65 
X-CRM114-Status: UNSURE (   9.70  )
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

Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus was not
introducing any user visible problem.

Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
for EN7581 SoC")

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 2e01abc70c170f32f4206b34e116b441c14c628e..a1cfdc146a41610a3a6b060bfdc6e1d9aad97d5d 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -554,7 +554,7 @@
 #define FWD_DSCP_LOW_THR_MASK		GENMASK(17, 0)
 
 #define REG_EGRESS_RATE_METER_CFG		0x100c
-#define EGRESS_RATE_METER_EN_MASK		BIT(29)
+#define EGRESS_RATE_METER_EN_MASK		BIT(31)
 #define EGRESS_RATE_METER_EQ_RATE_EN_MASK	BIT(17)
 #define EGRESS_RATE_METER_WINDOW_SZ_MASK	GENMASK(16, 12)
 #define EGRESS_RATE_METER_TIMESLICE_MASK	GENMASK(10, 0)

---
base-commit: c55ff46aeebed1704a9a6861777b799f15ce594d
change-id: 20241004-airoha-fixes-8aaa8177b234

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


