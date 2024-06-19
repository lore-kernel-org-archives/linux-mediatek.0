Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BA3C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8dkd36bdHVT03harmhMJP7xfFANHyP7BVDPFQNuKxc=; b=hCTpUoWGG/lwYO
	uC4n+sB2RQS6mC3sFdQ/USRgxSsltb89kdnAlWqNLoq853DWybG+zlVqydVAZ0f702ZOMwArXWd/H
	8yHpxEZpzNVyriOqoTkgl6d/CjJzU93Re9sZWSzzw1cea2lqsDYBhrdynDKFdSmLfjAAwh6Vxncsx
	ARLkSVWftr0Z3VqYP4KHnW4MqDQ1Bw5tIxM+pS6jd3O3bhtztUXZySSdHoODH8yKf5qssXIk4LS/n
	m218Geij0Hyk0a9viY49Cm2FE5JpWKa7/rY5oXxK8Gxg2vt3DQmt1zdtKM4GeTB+IyKzCCB4HAGZ0
	kw+2UyG8nUqZXU+0SvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsaQ-00000000nnJ-44cG;
	Wed, 19 Jun 2024 10:30:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsaN-00000000nmV-2dI5;
	Wed, 19 Jun 2024 10:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718793037;
	bh=uWBOfNWDaWysr82LJvlFXwnZM9j18ErxE9+uXo17HHg=;
	h=From:To:Cc:Subject:Date:From;
	b=Dodw+hqEZzT7cQGDj+ZKzi81LYGZmNbHRAUVFDkKHPFhX8AvrHsAG7xno1PwqwMh4
	 bABg1RI2g/mGDF/B6or+yCyyLUD9ZkSupn3PTWKIWcpt61nGKUxt/afREBfO9Dc5c0
	 hbpxLKXvauPcpfUmnBRWKkpYkvIL2BXCI89DcPXRZduGgcI6r8KWki5u+NMN4t5FR/
	 ssGl7SijzWzdg1MzipnnqLfHLoTR4s6TsXyzQoZKEXcOP6Kc2PjN13eBUyMj9QvkTt
	 fOP0LWOrvrlKAH4lQIQ9TeUyoFW2IwrU3cS45Yw+uOgpSzlY5CL/vkVAX3Tla2tWDr
	 rFdiqUDps0A0A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4299B3780F7F;
	Wed, 19 Jun 2024 10:30:37 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex table
Date: Wed, 19 Jun 2024 12:30:34 +0200
Message-ID: <20240619103034.110377-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_033039_956307_CB858444 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8188's MDP3 is able to use MDP_TCC0, this mutex_mod bit does
actually exist and it's the same as MT8195: add it to the table.

Fixes: 26bb17dae6fa ("soc: mediatek: mtk-mutex: Add support for MT8188 VPPSYS")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index b5af1fb5847e..01b129caf1eb 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -524,6 +524,7 @@ static const unsigned int mt8188_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 	[MUTEX_MOD_IDX_MDP_PAD0] = MT8195_MUTEX_MOD_MDP_PAD0,
 	[MUTEX_MOD_IDX_MDP_PAD2] = MT8195_MUTEX_MOD_MDP_PAD2,
 	[MUTEX_MOD_IDX_MDP_PAD3] = MT8195_MUTEX_MOD_MDP_PAD3,
+	[MUTEX_MOD_IDX_MDP_TCC0] = MT8195_MUTEX_MOD_MDP_TCC0,
 	[MUTEX_MOD_IDX_MDP_WROT0] = MT8195_MUTEX_MOD_MDP_WROT0,
 	[MUTEX_MOD_IDX_MDP_WROT2] = MT8195_MUTEX_MOD_MDP_WROT2,
 	[MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
-- 
2.45.2


