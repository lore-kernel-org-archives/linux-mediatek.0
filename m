Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C363C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gdAovYqNkNiTnQHvZuT48RvnW56IerxWyxGsWCgH8zY=; b=0rKyDrIqyn48xY
	uKErxBRlSWAf/3neuIAyfdQXfhXd5lqv7zsxDL6TuvvmzWRLwZFYSAn56DHfciz3xqeULzhzpQ4Mx
	JHvCBqcDMs1Y87OUPvpJifYVd0xLsAgjNvIL6Sa0M2Q7MecYJ1mJnTMlRTXQZgIqxa5bMUg4svkcf
	es5G1i9ibHTPuL0Kjjy1KkprZMeRpEhPXNG97Xv26KolSNCSNSPxMz/JUD922DGNex1v8d4jYzYwM
	55bjCxaSUMbLDFi/2XZrsBXq+/T2yzMMtBJ5jsu7y9XqHPxx70j+d6G+B8yYJL+d1odzroJNhdffi
	eviNlPvkr9+Ppe/+v+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFy8C-004KJh-73; Fri, 04 Feb 2022 12:56:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFy80-004KHr-Vf; Fri, 04 Feb 2022 12:55:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D7AA61F469E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643979348;
 bh=C4urODFZw7AtHIaxrvfdBAqahnpDdMVBAE6xBMu5TPc=;
 h=From:To:Cc:Subject:Date:From;
 b=T92LlZOAHSaRjlk14SGlbTbiQ2qznUnnPREWv2O84NkGuo0UIPHDbmW/Pms8SeIpe
 TUBm0sRvrdFxhpg4bb/KYYj80bZqesX99exRjxpf6sXlqDQDQmUF0qujOwJkThvRPr
 hbhuq3dx+bUHfr1BG2Ke71TgX1bHjxq+psEQau5SAMPLkNhCQtLhtnT3sdnTwHhYLu
 NiiZ+kZ29wDFf3+EMUtRkSEqiyCeNKabZ5SDOnpf9B4HhLrqELzhTbMGNkZbUcG0Nc
 +cTq5fJB7eO0TDEB+agYvxF9Kp25HEhIaSL4nMOWfBuzELk7L2iU27tmvqf7vz2t8U
 BQ3T3UfcMOd+A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzysztof.kozlowski@canonical.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] memory: mtk-smi: Enable sleep ctrl safety function for MT8195
Date: Fri,  4 Feb 2022 13:55:43 +0100
Message-Id: <20220204125543.1189151-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_045553_240885_A9F3FC6C 
X-CRM114-Status: UNSURE (   9.43  )
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

Enable the sleep ctrl function to wait until all the queued commands
are executed before suspending the LARBs, like done for MT8186.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c22acd3ddd10..86a3d34f418e 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -351,7 +351,8 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
-	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL,
 	.ostd		            = mtk_smi_larb_mt8195_ostd,
 };
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
