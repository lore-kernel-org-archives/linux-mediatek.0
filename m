Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70086C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hja1MQss1Gr+UnRtsMlNn4zuJhGTC9iFvbiWNu8UfhM=; b=2C4p9zCaGdNfgZ8VgCg6qDzCvX
	GFw4TUV30u5AtA2HHUpgaO7OyQCrFGuEC+lN8eeOuE8UKOyJkRAlqAizB/EmiloySshB+2VOzn7DU
	1tvYMzaKrZY7R6nppzCMbKPhQl9VLtpA9eyPDDlaRw3cc5Pws2V8MRRlRtL9zyyzvjfurmzQOtlwx
	QenCiMrUDtFtvMDCQ8uJgzul+sifO0hkMnvvha0QP22OF59X5VWQq9yrQbPkFC9aRPR7+CQeKNhSK
	VvrzP8Y2mY/Xa8D0CF2jE4E3Zk2U7ObbxTzJk9KhKvji6v1GOsa3aDm3Hfk1VoyshskZE1+jbdaQk
	bgtSOMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5At4-00EmzL-0T;
	Mon, 20 Nov 2023 20:28:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Asz-00EmxV-08;
	Mon, 20 Nov 2023 20:28:50 +0000
Received: from notapiano.myfiosgateway.com (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 518FF66071D4;
	Mon, 20 Nov 2023 20:28:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700512123;
	bh=gCwZgV8zJpLMsi8EPwsQoJVBIyq0juJd2X+ekA2F1+c=;
	h=From:To:Cc:Subject:Date:From;
	b=k3n50MQVYemXDQ0xWa4l3ho2D1Rr1/II7hG+Mr9k6DjxufxpvNbu3Jw5PdYW30po7
	 WxZHls2gEskNN9O7Qd9Iee1qJomMXTpRzebEaohbQa+xnOrtdJIbbUMBuorWwCJrgU
	 38PcqzeJjnGYVMttzXfA5X2hBA/KtL4YPRX0mN9SP6TWLujUK+k8XuyOvuFpKgC73p
	 JItG09o7yRrL2mYHXhJCzeKqn3q52whMXhQb99ktIu0mOav1dFmhBm7HnuftMjjuOU
	 AlCNpMHAPDKecVjzImr7btHiHQZtBeTe15yIplqN5dYq++dqqjU3utHgWUd7G4rl19
	 HdLZiMdPFgPSQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Date: Mon, 20 Nov 2023 15:28:16 -0500
Message-ID: <20231120202837.396760-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_122849_263609_C5851304 
X-CRM114-Status: UNSURE (   9.94  )
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

The mtk_dp driver registers a phy device which is handled by the
phy_mtk_dp driver and assumes that the phy probe will complete
synchronously, proceeding to make use of functionality exposed by that
driver right away. This assumption however is false when the phy driver
is built as a module, causing the mtk_dp driver to fail probe in this
case.

Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
ensure the phy module has been loaded before the dp, so that the phy
probe happens synchrounously and the mtk_dp driver can probe
successfully even with the phy driver built as a module.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e4c16ba9902d..2136a596efa1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
 MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: phy_mtk_dp");
-- 
2.42.1


