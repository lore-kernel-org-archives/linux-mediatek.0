Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA71CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC563207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlJfAoix";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqzzLu7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC563207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y98emgi8bub4LdU2dq2W5rrysMlf4f1FIxcfyfhXV5Q=; b=nlJfAoixapg703VmmR7Medyxm
	5lnXhuswRUxbuoqZ4+d56ZSsps372bAJlT5ZUr4PlYsKgsASxjMS/L2a3th5i/8/73iQCtrpDHyYO
	+jfY/iDhzzmzGDqmE05fX3lnZ/2Zgwl/k+kIMw0AERLgBsJRPuRttvorqhT2dhzVzOgxgR8Xze1g7
	fGmzPpL9BIRCO4lQh+vIDDJ+9z+CGLkOS41RQfA8nsSD2AxxSIrup5/nvTi86n+/CTFiWLVafHwBA
	S6EYUm6n0lZgcRh9sgXUBS+qfi3LC+x6JymKaOJPIEQm2/H4uc7t8oRFvtHfwy05n8i9/8u0uGqf6
	CwHdQ92lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGrv-0005q0-GY; Fri, 03 Jul 2020 08:16:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGrt-0005p0-Sc
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:22 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E66A4206A1;
 Fri,  3 Jul 2020 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764181;
 bh=SMzFQ+DaQGVrufwH/LTf8U0k7pJKTYyPrLJWYFEvxD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PqzzLu7KGUkv5WsbTdeyM5zLPR2zyPk5CM3vpP3Om1fgKugpVO2uFlCcYMF7qA3lj
 y8ljX4v7XKGwDdq2tyEPzWYqi2FIXN73V6/shLG86ku+4YgXIpBgV3PkOtKCGXh9Yv
 XQsObGqBTw/kLtTCwtQW3dxs12yjb6Jmm/KMKPhs=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 01/22] mt76: mt7615: avoid polling in fw_own for mt7663
Date: Fri,  3 Jul 2020 10:15:40 +0200
Message-Id: <b30cd73dc1c62a646dabd6a16248c73407c2ec16.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041622_040522_20DE7730 
X-CRM114-Status: GOOD (  10.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According to the vendor sdk, mt7663 does not need to poll register after
firmware own. Since just mt7622 polls status register, set proper
timeout value according to the vendor sdk

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 156cf68c5419..89a09745df08 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1945,9 +1945,9 @@ int mt7615_firmware_own(struct mt7615_dev *dev)
 
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_FW_OWN);
 
-	if (!is_mt7615(&dev->mt76) &&
+	if (is_mt7622(&dev->mt76) &&
 	    !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN,
-			    MT_CFG_LPCR_HOST_FW_OWN, 3000)) {
+			    MT_CFG_LPCR_HOST_FW_OWN, 300)) {
 		dev_err(dev->mt76.dev, "Timeout for firmware own\n");
 		return -EIO;
 	}
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
