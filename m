Return-Path: <SRS0=9X0+=EU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2078C5519F
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2020 12:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CEF922240
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2020 12:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tze8QgEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CEF922240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jj37cEQyTSsSeOlmkmMHmrdvmYnNbW+Y93eK2MjGyoc=; b=Tze8QgEi556MVBPqH8EHED9ETI
	JCc4iG4TtofyrexACC9NrkqlIkSYB5FJD53aku5OoX08V5UFyJC7jAXH1yJNqS1a7jTrY/g5oXyjP
	Bj87w4lN8YKzv+NMIxJ9gcq8MF0YicfRW12S5rrqVBSzS2su11mwFT/Oe70YivoWN3je/LXQAmHKH
	FvYxvAgrfbrFOT8gqSRj1wFQhnxgLV9t9hnbegCSp3s4fEGiAz6Chvr/1CXBbxgw3PIcu4X+bYe0D
	UQAUu01z+4R7HZkRmfK/Ra9rokcKl8hu2nvgG+54lk2XBHRcf5Qqnjwtspp1Qk9OOtmw3A3JTl8+d
	J6ma76yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kduJ8-0003Ik-9U; Sat, 14 Nov 2020 12:05:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kduJ4-0003IR-Hg
 for linux-mediatek@lists.infradead.org; Sat, 14 Nov 2020 12:05:27 +0000
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net
 ([80.193.200.194] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kduIw-0002O5-Jt; Sat, 14 Nov 2020 12:05:18 +0000
From: Colin King <colin.king@canonical.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] phy: mediatek: fix spelling mistake in Kconfig "veriosn" ->
 "version"
Date: Sat, 14 Nov 2020 12:05:18 +0000
Message-Id: <20201114120518.416120-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_070526_671802_8D885B9C 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 50c5e9306e19..c8126bde9d7c 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -12,7 +12,7 @@ config PHY_MTK_TPHY
 	  it supports multiple usb2.0, usb3.0 ports, PCIe and
 	  SATA, and meanwhile supports two version T-PHY which have
 	  different banks layout, the T-PHY with shared banks between
-	  multi-ports is first version, otherwise is second veriosn,
+	  multi-ports is first version, otherwise is second version,
 	  so you can easily distinguish them by banks layout.
 
 config PHY_MTK_UFS
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
