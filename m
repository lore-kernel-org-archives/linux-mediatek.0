Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77833C7EE26
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+hJoJbqRjX2oQAj3m6axPoLPEZsM7TcuxXkCT9j0Hc=; b=QIYpPEzS15ojyjKP4CligpMvKN
	YTZZzJDMM/H7xxYyUJ41sPZz/nbOprRH3S2ryZVPOoyU35Ue3a2Q2h2vpYdQqjiQpRzNf+E/DPc6O
	uGV1bWhWRIPF4ORil7ZADboDu+ZOzJhtoFPfG03so2kBJBkVynGr7o4thNvQoWb4QkffvAEJjYlze
	9LyTnHiUcbgg1dKP1jgrYUIIHj4lA5UGaXkRf5R9fNMBtIG1O+zDVr5XYN4c6mGxIV/Omt9YnS6om
	qNCe4N4C9JR9PoECqQPBs5GIri9qeZExHo/P1/W9PVbhHMcJW+K+leMkaG2n3j/vPNucxJjIyeg6J
	LIGb+vDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXJR-007gu4-1p;
	Thu, 04 May 2023 11:39:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXJN-007grs-28;
	Thu, 04 May 2023 11:39:51 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABED666031D7;
	Thu,  4 May 2023 12:39:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683200388;
	bh=9rPMidGo7VzPQrQAdmCcj3emYqwqhn2GCJrcqjNy2DE=;
	h=From:To:Cc:Subject:Date:From;
	b=oNb0vggHdu6K02LSzKwWEembjWYjw1bhjPRCAF1o4n0EVd8Uyj1I3TMMOSDg02z0b
	 Sw0fNpVYFKRnzAcE2YdzSNxxe8PVx1olM8GQAvdlGJWiuTMqBSgEpOnUXJcOq9qApm
	 r9WHtDnHRJHDovcmVXoMgRun+Zo2FQ48qI9HmPxcE1WC8XngWnYCE1y6EKxYNmsnLU
	 Ed3WzW6MNYmIpVndj/Co0TCkHRlYQWgqhp15tcK3l4d6ZZpbOYImNNFtArzCGZSBRt
	 oYi0yM8dRAWYCSM3Kdc74EMV/yTkWJQcccQNn6xQ6oJzBrNL1uYSvx1aj0IF2ECUi6
	 rsQKvHm16iolg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	james.lo@mediatek.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] spmi: mtk-pmif: Add a WFVLDCLR specific timeout
Date: Thu,  4 May 2023 13:39:42 +0200
Message-Id: <20230504113942.187054-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_043949_828749_CCB3B652 
X-CRM114-Status: GOOD (  12.94  )
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

At least on MT8195, in some instances, at cold-boot the PMIF seems to
get busy and slow, triggering a failure in pmif_spmi_read_cmd() with
"failed to wait for SWINF_WFVLDCLR" message: at least on the Tomato
Chromebook, this gives issues with the GPU power supply, resulting in
a probe failure for panfrost.

Through trial and error (rebooting the machine ~50 times), it was
found that a timeout of at least 50 milliseconds does effectively
mitigate this issue, hence add an "extended" timeout and use it for
the WFVLDCLR polling.

Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index b3c991e1ea40..a7b4b030929e 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -22,6 +22,7 @@
 
 #define PMIF_DELAY_US   10
 #define PMIF_TIMEOUT_US (10 * 1000)
+#define PMIF_WFVLDCLR_TIMEOUT_US (50 * 1000)
 
 #define PMIF_CHAN_OFFSET 0x5
 
@@ -357,7 +358,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	 */
 	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
 					data, GET_SWINF(data) == SWINF_WFVLDCLR,
-					PMIF_DELAY_US, PMIF_TIMEOUT_US);
+					PMIF_DELAY_US, PMIF_WFVLDCLR_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
 		return ret;
-- 
2.40.1


