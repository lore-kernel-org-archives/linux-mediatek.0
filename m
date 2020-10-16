Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F6BC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 00:27:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE83207F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 00:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HI7hM2Z9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bfed4zAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE83207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zp071fWJcNdc9u091kVPSKf8JOZwX8J5eEbq/EF+xiU=; b=HI7hM2Z9XTPDU59oHlpELZ9Kb1
	Ac8oTMtxNYBAK43Iuu+RL84D4PHCyzZ3K3vcHdq3MxT0IANE43xQEY6U0cCUyHxHaPeZMEQKdC3/s
	SV9CI5hx/FnYyedkSJPtXRw7dudDKEgdFKawAXva61Yb7fxJXwoswzY0eg5OzKPrYOXKHR/HsyXZQ
	JnlIswYxXMHpvlrG2Rztr/6LIDPV+Lj1FUPNwFCTXjkHJ0qTx0yNYz7VY7EGn/nUlYaVkT35GK2xK
	s/7smXBy0/3XV7PSiZ1pdQcMF0J7mN3n7J7alVI6gklI3eqFtHorxGi3sNXU2mqPkve0xWIW5hAws
	S0vhDI0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTDaP-0005ge-Ab; Fri, 16 Oct 2020 00:27:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTDaL-0005et-9L
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 00:27:07 +0000
X-UUID: d07c291a897348d9baeba9ee915b9186-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bMfVRMKx8CbHQ6zK9+0AUtlDVS68xAYQbTyAUQ/UhAs=; 
 b=bfed4zAzfENpa1zs0LN/iCCN5QZdADj0tDISII1DKJVeB9Oxdx8vlKWou6tiCsihUGy37pzRmnG+Iq9KopPWmy94VlHiK2I3V3byUW3HeOcHtv2bLf8pRWxx5sbDMjYiYvvU5cYGOFd304L8s0vT+r69/bx8xCggUez9qq65Djs=;
X-UUID: d07c291a897348d9baeba9ee915b9186-20201015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2038648805; Thu, 15 Oct 2020 16:26:58 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 17:26:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Oct 2020 08:26:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Oct 2020 08:26:42 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7663: handle failure event for patch semaphore cmd
Date: Fri, 16 Oct 2020 08:26:41 +0800
Message-ID: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B668A4925E40B91B0B7B564063D5E6D26155C7129E86D65B82670778F1CCA332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_202705_450084_F05B8994 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: ryder.lee@mediatek.com, Sean
 Wang <objelf@gmail.com>, sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 YN Chen <YN.Chen@mediatek.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <objelf@gmail.com>

Just follow up vendor driver to retry a few times obtaining patch
semaphore when the event is PATCH_NOT_DL_SEM_FAIL. That usually
happens in Bluetooth and Wifi driver contends to download patch
simultaneously.

Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by:  Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 2b17bd1c2a32..c990ccd6f472 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1945,14 +1945,21 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
 {
 	const struct mt7615_patch_hdr *hdr;
 	const struct firmware *fw = NULL;
-	int len, ret, sem;
+	int len, ret, sem, c = 50;
 
+retry:
 	sem = mt7615_mcu_patch_sem_ctrl(dev, 1);
 	switch (sem) {
 	case PATCH_IS_DL:
 		return 0;
 	case PATCH_NOT_DL_SEM_SUCCESS:
 		break;
+	case PATCH_NOT_DL_SEM_FAIL:
+		if (is_mt7663(&dev->mt76) && c--) {
+			msleep(100);
+			goto retry;
+		}
+		fallthrough;
 	default:
 		dev_err(dev->mt76.dev, "Failed to get patch semaphore\n");
 		return -EAGAIN;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
