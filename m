Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E33BC43457
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:19:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E462231B
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CAY9mjK1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrC3Ta7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E462231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S+eTke96MkTcaG7DzPwHTScY2hb8U1aSXSzaI3DYIkE=; b=CAY9mjK1HdTRRONcmrZ8X3kMI
	f7gcpf4du/3LbfgSe8oX+2XD0I3FrXj776HlqgP6NZ6v2bSpj3ao7/Xl1P1PCynIpmR9fVWAfoBHv
	54VaPM4AK65czU9jF3iweeizNAJ0VRa8yxIvqhC/d2UNZNgSIbz0tybnV0enEx133KUAc3K5LV+rW
	i5mNUfWdRB2IXtgHudWEulHVNch0iXWOSpOuG1KyWahU5S/wqfa5A2PrO/CaN3V0OuppEpgI1vuyz
	9Za7RliLRiSdl9qf7kpCZRQjNtzw6epCcpSKmNGpZS8Kp9dgRTDlVJIcAwE3zH2YFw9dqPbMQxAdA
	C4XlWbC7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEDB-0006B8-UM; Sun, 18 Oct 2020 19:19:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUED4-00067K-TQ; Sun, 18 Oct 2020 19:19:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BA4F222EB;
 Sun, 18 Oct 2020 19:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603048754;
 bh=Il9Br0hKPkszm54/JVjOqIIyHlDSaKWZbOXM3vOFJvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HrC3Ta7h63uoW5XzmWTx3N8H3yStHqAznV4wgv5uYUyoGNcFe1y/BQ/pPbJ3lRXRx
 iejzdq4By1kPP4mUsVMFFZz+chZtC/O0cqw9/vHW+DGgxy41FbLL9Rkaa6hdcBA5rX
 7VLN7rdnz3cthD1RhCrC10eV2NDfxpuCk2JC1lz8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 055/111] mt76: mt7915: do not do any work in napi
 poll after calling napi_complete_done()
Date: Sun, 18 Oct 2020 15:17:11 -0400
Message-Id: <20201018191807.4052726-55-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_151915_155586_C84006C6 
X-CRM114-Status: GOOD (  12.36  )
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
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 38b04398c532e9bb9aa90fc07846ad0b0845fe94 ]

Fixes a race condition where multiple tx cleanup or sta poll tasks could run
in parallel.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index a8832c5e60041..8a1ae08d9572e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -95,16 +95,13 @@ static int mt7915_poll_tx(struct napi_struct *napi, int budget)
 	dev = container_of(napi, struct mt7915_dev, mt76.tx_napi);
 
 	mt7915_tx_cleanup(dev);
-
-	if (napi_complete_done(napi, 0))
-		mt7915_irq_enable(dev, MT_INT_TX_DONE_ALL);
-
-	mt7915_tx_cleanup(dev);
-
 	mt7915_mac_sta_poll(dev);
 
 	tasklet_schedule(&dev->mt76.tx_tasklet);
 
+	if (napi_complete_done(napi, 0))
+		mt7915_irq_enable(dev, MT_INT_TX_DONE_ALL);
+
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
