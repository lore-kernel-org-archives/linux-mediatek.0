Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF69C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F65820757
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KYM1ZXtt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hS3d8K3H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F65820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JV0nuJMtWBPqct2oCQh+seMADWiK4JKqcblVbfedrIo=; b=KYM1ZXttc5a20u697nE8lH71ln
	wovNDOIXy7WCtv173as4rAdP9UZ0yqOmWpZeJUSKjTOpLZRU1Ff5ESPjGck2h4lLCRDq6TF3JEhk3
	ataGbx9fnh34TeMbHN4Ikn8Sqk3OmyWPUjYso/Q6HAY/3NvzpugHy9GGNpP2b1ndtRWaDVry6JCN+
	Wsk++Tz+r0qOJ/770Sj9N2ZTTPIfJidUbO5novqz7VzoFj6GpKVmxkcMnNA3ISZq2TGC9al2vR8u1
	GH79nH9nwqseE8Ql8pLsJCcuX6KsGQNDVoR6tMpM/vdzWK+81S9+LSZPx6Uy/RWyHKD7ZGzu8cPs5
	0S3GR7bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjZbN-0006EB-BX; Mon, 30 Nov 2020 03:11:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjZbK-0006Dj-A3
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 03:11:43 +0000
X-UUID: 4a8c80896b9949989a295f5238d6ef7a-20201129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aSX4ytBklW+GosJtAw21SujBgonawZEGIpRcB9t6Tcc=; 
 b=hS3d8K3H0R0t1YZeoIC4MJFoAhZM8T9XKH7jZLFoYf83gGrpk8w9dX7wKu1t66kDE6SaG/gF9MABZDqLpSXafIYEeAwS/qsqLRS2HQ39mwcY1WshaZIE0yLWL6cwcGp393839FCQQkePcHOtwzLqbLe6/LBwhI+wTkHfjdDeLCM=;
X-UUID: 4a8c80896b9949989a295f5238d6ef7a-20201129
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <lumi.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 349855350; Sun, 29 Nov 2020 19:11:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 Nov 2020 19:11:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 11:11:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 30 Nov 2020 11:11:30 +0800
From: Lumi Lee <Lumi.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: btcvsd fix tx stream assign
Date: Mon, 30 Nov 2020 11:11:15 +0800
Message-ID: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_221142_544957_86252432 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, Lumi Lee <lumi.lee@mediatek.com>,
 Shane.Chien@mediatek.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lumi Lee <lumi.lee@mediatek.com>

Fix tx/rx stream assign in write.
Write should use tx instead of rx.

Signed-off-by: Lumi Lee <lumi.lee@mediatek.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 668fef3..a554c57 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -808,7 +808,7 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 		spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 		if (!avail) {
-			int ret = wait_for_bt_irq(bt, bt->rx);
+			int ret = wait_for_bt_irq(bt, bt->tx);
 
 			if (ret)
 				return written_size;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
