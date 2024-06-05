Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BD7C27C52
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNsZkpgGA2JJEfc6O6J1wPfkJqlf7SIqcO8G925mUrg=; b=gmS18fzfSP9a8TAtb8nlWMKSBQ
	tQkFzPsrHg5lPTKW0q2RsJYY/hAvT0g7gDe2btB0zHTMULm51AiVN4pLBrOlmv4ukBVJWuOFcMyCk
	laKl+6oijP/kXLdmjk41tJw5wKWJgoBc9BLu0Vkyf5+OpNwCmw1rx5poey8W9ghNTzuh9RExw7CFl
	vF/eR5WP/iRg2ukwPzt50CvXn+VV3f5mSLqGp98/gE1uhSfSUmytntZ4o7DodkqOGOdBStsSblGKJ
	D8iAd53xT0aRVTO3Oob1t9PEx0XoKKC5f4lTVbC7v5Qut8q2wOL0SjzHUtJesvQuOSx5eE5Z3RU82
	X9bDYjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwQQ-00000007KvB-32CE;
	Wed, 05 Jun 2024 19:35:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwQN-00000007Ktg-2mT7;
	Wed, 05 Jun 2024 19:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717616150;
	bh=/OOgdOrNQp1uReXHDPfdGQSEZv1TGjR7OU/fKbfzaD0=;
	h=From:Date:Subject:To:Cc:From;
	b=pRspisL6ZFGD72AhvmkFlChFLPnCLMKYivkNMgGTSVW1fVa3s8f3pr/H0EBiPmlub
	 9rzJRO7+DeoHX+Gv9XIG9AFNPhkBYpHelKf6cd9RFCkB9kletam3kHhL/QhEbQPH8n
	 K69UUfhBH9DQYk5VJgaVrByIB2ustDGamGqmP56XOO9OmzwfW+NQmN/lqHpV+699mq
	 kPN4OyUf4udZJU1i4kkGtJ63y8oRb5sF460GAlbK5/DgmBg9zDeB2hJVI6+q6CT2vH
	 dVH5gmktk63yj4clNSHXM5uIpQaaqZY4w7GqVoXzLvgSd5aFKg3mTnzxcr/Rc8Ex6e
	 TKKaOUL9mSQog==
Received: from [192.168.1.251] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D518237821B7;
	Wed,  5 Jun 2024 19:35:48 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Jun 2024 15:35:44 -0400
Subject: [PATCH] remoteproc: mediatek: Don't print error when optional scp
 handle is missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAA++YGYC/x3MMQqAMAxA0atIZgO12KJeRRyKiZrBKqmIULy7x
 fEN/2dIrMIJhiqD8i1JjljQ1BXMW4gro1AxWGNb443D/eqa3iHtAdN8YjyIkVXRh444WE/t4qD
 Up/Iiz38ep/f9ADxlMk9pAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_123555_905962_62B42FF9 
X-CRM114-Status: GOOD (  12.08  )
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

The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
missing mdp3 will directly look for the scp node based on compatible.

For that reason printing an error in the helper when the handle is
missing is wrong, as it's not always an actual error. Besides, the other
user, vcodec, already prints an error message on its own when the helper
fails so this message doesn't add that much information.

Remove the error message from the helper. This gets rid of the deceptive
error on MT8195-Tomato:

  mtk-mdp3 14001000.dma-controller: can't get SCP node

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b885a9a041e4..f813117b6312 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -37,10 +37,8 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
 	struct platform_device *scp_pdev;
 
 	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
-	if (!scp_node) {
-		dev_err(dev, "can't get SCP node\n");
+	if (!scp_node)
 		return NULL;
-	}
 
 	scp_pdev = of_find_device_by_node(scp_node);
 	of_node_put(scp_node);

---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240605-mt8195-dma-scp-node-err-6a8dea26d4f5

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


