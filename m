Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0DEFF885A
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 06:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chNkK9PBIBNzUOa5LRwgRtZxceUQzPCmBW2qT9Zz+9A=; b=pPvBFyKppxmF83j2xklQ7S53rT
	yLH+PodyRVfvAZ5r6Rn5YDpxBL+kgfXhee/z27dQnEoZNrPjeN+XHs8d2rb8A0iYUcaWqHZSB0hDo
	ypVBDNibTTkAXUe1f4YwCGr2ue4ztuFcJdZmVKOhgyO41vs2WTWwHuJIL14H2KZRA8uZYueYEKfYA
	OcQulndBLsZqhDdYHaOx7fIYPiuWjrmwFwOmVDuJDG8u/AC1b7mqtTQosRpl3IJhyd6KX3oTrtrzE
	TKuPGaI7lR8qsIAlvscw+yJRjAQXfT3OkGvld8XIKtQcxL2n79bJHaDTcc7sca9hBMLlY+n/oBMRF
	Qk/PujZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcKG-00000000eg8-3OlT;
	Tue, 28 Apr 2026 06:53:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcKE-00000000efj-1sUQ;
	Tue, 28 Apr 2026 06:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A049360133;
	Tue, 28 Apr 2026 06:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E74C2BCAF;
	Tue, 28 Apr 2026 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359221;
	bh=PcMY8rNtk+alf5ERoe5UCqYOPg+SjVnTOq5lid6Morc=;
	h=From:Date:Subject:To:Cc:From;
	b=CEFyPsVGr+7/LKa3Rq5imoYzwrjQKMUGio1kkxw2EmP/ynlOFMfyFt78g+XZDlkoF
	 CGTaPvu9Shf3OKYSy2j6eCRTWi9ydgVv76LInuNK69Z1IEnPnWrAPcPABHHKSsvS3s
	 DC+09hFOWxDpHGDfuY3sm2TuivkqqUJKRdqEaVWuKwEKfUT39TUlfp17wnAxTRpvNi
	 z1rJeCHWASPJM21YXNkSRtdwY4U2JKzMgzeNW7V1ok/QuCyGIu/f+KQgab8+cZsbxJ
	 T3hDk4jjy2jeJx7M2ONVg0agSdCuj/prjDfQLLeWC7oZXvPqVmlp6cI4prOPUmxX6K
	 DRDBVJZOArY9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 28 Apr 2026 08:53:16 +0200
Subject: [PATCH net] net: airoha: Do not return err in ndo_stop() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-airoha-ndo-stop-not-err-v1-1-674506d29a91@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDQAxA4atI1g04YfpDryJdxBprNolkBhHEu
 zt0+S3eO6BIqBR4dweEbFrUrSHdOvgubD9BnZqBenr0mV7IGr4w2uRYqq9oXlEikNM9c5qfNGa
 CVq8hs+7/8wAmFT7neQGmoir4bgAAAA==
X-Change-ID: 20260428-airoha-ndo-stop-not-err-a154a1f72b42
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Always complete the airoha_dev_stop() routine regardless of the
airoha_set_vip_for_gdm_port() return value, since errors from
ndo_stop() are ignored by the networking stack and the interface is
always considered down after the call.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5effb4a4ae84..f8b3d53bccad 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1747,13 +1747,10 @@ static int airoha_dev_stop(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
-	int i, err;
+	int i;
 
 	netif_tx_disable(dev);
-	err = airoha_set_vip_for_gdm_port(port, false);
-	if (err)
-		return err;
-
+	airoha_set_vip_for_gdm_port(port, false);
 	for (i = 0; i < dev->num_tx_queues; i++)
 		netdev_tx_reset_subqueue(dev, i);
 

---
base-commit: 3bc179bc7146c26c9dff75d2943d10528274e301
change-id: 20260428-airoha-ndo-stop-not-err-a154a1f72b42

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


