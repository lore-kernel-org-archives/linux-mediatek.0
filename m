Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0690C433F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9083521744
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VK/BM6RS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q433sx5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9083521744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zLNCu469aazFdr0F3KYGSRsjOEYPFWjIDJwnLG1Dh+A=; b=VK/BM6RS8qqLJlbkyz2sqHYBSG
	yJCIa8c6GZVzpFT07/hJp08zTKTqa6txcvnAM0esoDYk6RNbKa6kYKlvoAWa7BHL0D0lN6Kv5ci+n
	l/sHU3CFqd1LFC6Mfjw+pK7OlX68tm7L1BWGAJlSJxF4ED2OOoh4BPmFumkahG6h+UTC01xPIycH1
	sOnn8vakWDv7MEBOMbko73gmpUQpPsQ9rp5IRxhnZLak9B5Jb5A4UHlBb2dyf9OqwAYqdhKPl5COf
	f+/IUd0fxouS29xM1sX4bwj98Rjw6h+GefHTvWS3sD2YQYLmZrXL5vngCAKCY98FqGwJrli0AU0rn
	B70brktg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0CTJ-0007s8-OG; Mon, 27 Jul 2020 23:23:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0CTF-0007qr-7r; Mon, 27 Jul 2020 23:23:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C907220786;
 Mon, 27 Jul 2020 23:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595892227;
 bh=x7YoQtupH7CiYhIjtuOqqsTxqZZSxlDcl4I1Z5TtKrI=;
 h=From:To:Cc:Subject:Date:From;
 b=Q433sx5jaX7YtQhjB71uXxNSpyaSrya38qdWSyQ5ByJw3awzIE5X0s/Oc638rkU87
 av6JGC54Rs09q3BXtfTmB0Vm73CTzfEbkJ5E20QDUNH5+Nfh2d2G/nLtyGO3N2K6yh
 vF1lmvphvkKD2s7y9vHO0T4CApPGQMuEB7uUjSaI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 01/25] mt76: mt7615: fix lmac queue debugsfs entry
Date: Mon, 27 Jul 2020 19:23:21 -0400
Message-Id: <20200727232345.717432-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_192349_367845_66C3CFA2 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit d941f47caa386931c3b598ad1b43d5ddd65869aa ]

acs and wmm index are swapped in mt7615_queues_acq respect to the hw
design

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index b4d0795154e3d..a2afd1a3c51ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -206,10 +206,11 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 	int i;
 
 	for (i = 0; i < 16; i++) {
-		int j, acs = i / 4, index = i % 4;
+		int j, wmm_idx = i % MT7615_MAX_WMM_SETS;
+		int acs = i / MT7615_MAX_WMM_SETS;
 		u32 ctrl, val, qlen = 0;
 
-		val = mt76_rr(dev, MT_PLE_AC_QEMPTY(acs, index));
+		val = mt76_rr(dev, MT_PLE_AC_QEMPTY(acs, wmm_idx));
 		ctrl = BIT(31) | BIT(15) | (acs << 8);
 
 		for (j = 0; j < 32; j++) {
@@ -217,11 +218,11 @@ mt7615_queues_acq(struct seq_file *s, void *data)
 				continue;
 
 			mt76_wr(dev, MT_PLE_FL_Q0_CTRL,
-				ctrl | (j + (index << 5)));
+				ctrl | (j + (wmm_idx << 5)));
 			qlen += mt76_get_field(dev, MT_PLE_FL_Q3_CTRL,
 					       GENMASK(11, 0));
 		}
-		seq_printf(s, "AC%d%d: queued=%d\n", acs, index, qlen);
+		seq_printf(s, "AC%d%d: queued=%d\n", wmm_idx, acs, qlen);
 	}
 
 	return 0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
