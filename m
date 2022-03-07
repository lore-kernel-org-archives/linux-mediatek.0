Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C60C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mA0019PFHRV06gSt+IdFB4t3qlgcQDBKRD92Xpa2y4I=; b=kCBCzFmNBEBud2
	ifMPFyc1nI7N1kV1ZWUzEfivnF3P8SMRX77+4nwsRD+N03Fv3MMao4ev2RtWREJ9ufXIH2OHlRFLE
	MwSnt31e5h4iudvaXCA5aqVA+HeRulp4HCNKH5aELyOFd9RIkGJNJT4L5luCg0w5/RZRKMW6b5Llt
	KQ+HHD4T9Z0LO0k2e4Nfy9SqgmofBiKZWf2lkQ4w8FLxoVZCHS1VI/Aha04UzIdksGJyDU5I6JZMO
	ALk4HRg633YpwBtAzwpZfWIDWrVNkhaSL61jBkru4pYEAMBjjgvFsjdk3abEYVDeZmha0DyHSAvBz
	80Ubwi1tHaMEv/6C0PfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFjk-000kqN-0Z; Mon, 07 Mar 2022 15:57:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFjM-000kbX-FG; Mon, 07 Mar 2022 15:57:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D3E731F43DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646668622;
 bh=6NoOklKLAvSst15nOrzs5E10D4lpohNoFGlreOLuXl0=;
 h=From:To:Cc:Subject:Date:From;
 b=RHBjRupZj0c8esNwufh5vf3czfEKDc/TX4C2+dN2UNabI1D3e+C0xSAlDfwnpiYK8
 Mg0lSXIa/yrlNUpzy2xYENcDpQ3IxknhWVICVnNncb/oSBDScemMddZteuM3+Grf2p
 Xea/DVARxjmj2MccLrD/zYUdCB7j5J4dpkuMsLoHiRTekU8JxIX86Nwct1OStnLxPC
 wtp6/Cd+/ymSmTmY5YNr8+VgPO2Kx9Zwbd3EVX7Zj2RPODGhiH4NYiTNS0xG0lC5O1
 CACHM5APJKHsBlf8TVPMjCtsx3oMmDTwsLfNbQZbvm0RJlaOOijBU9xerFFff2m5RN
 7mUIAw5bvHyqg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: minghsiu.tsai@mediatek.com
Cc: houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hans.verkuil@cisco.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, acourbot@chromium.org, irui.wang@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
Date: Mon,  7 Mar 2022 16:56:53 +0100
Message-Id: <20220307155653.460910-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_075704_701231_05E58421 
X-CRM114-Status: UNSURE (   9.36  )
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

The mdp_ipi_comm structure defines a command that is either
PROCESS (start processing) or DEINIT (destroy instance); we
are using this one to send PROCESS or DEINIT commands from Linux
to an MDP instance through a VPU write but, while the first wants
us to stay 4-bytes aligned, the VPU instead requires an 8-bytes
data alignment.

Keeping in mind that these commands are executed immediately
after sending them (hence not chained with others before the
VPU/MDP "actually" start executing), it is fine to simply add
a padding of 4 bytes to this structure: this keeps the same
performance as before, as we're still stack-allocating it,
while avoiding hackery inside of mtk-vpu to ensure alignment
bringing a definitely bigger performance impact.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

This patch has been tested on Acer Chromebook R 13 (MT8173 Elm) on Debian Sid.

This is an alternative solution to the mtk-vpu approach, found here:
https://lore.kernel.org/all/20210920170408.1561-1-dafna.hirschfeld@collabora.com

 drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
index 2cb8cecb3077..b810c96695c8 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
@@ -40,12 +40,14 @@ struct mdp_ipi_init {
  * @ipi_id        : IPI_MDP
  * @ap_inst       : AP mtk_mdp_vpu address
  * @vpu_inst_addr : VPU MDP instance address
+ * @padding       : Alignment padding
  */
 struct mdp_ipi_comm {
 	uint32_t msg_id;
 	uint32_t ipi_id;
 	uint64_t ap_inst;
 	uint32_t vpu_inst_addr;
+	uint32_t padding;
 };
 
 /**
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
