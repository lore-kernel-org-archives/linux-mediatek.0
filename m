Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D720C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RNNKakkGuJwzQ5bbEYZqWj41ABvKXNi542ZOylYnYBg=; b=h0cc7ITCAIRiwMrA7oVpGowdzK
	PciYk37+LtaGUIOg3fYJIa3DxbzjXFc1+oud6mmVbOy7krf09AlWoGXGEhjXidl3iFllbpBhpjtdp
	fAwL0bmxQ/cs6VIC1Efjbfg5iPUrNdL7wFETBS2PMlNQWZoyyRSAfZ2FnHhybGzvTpzCMnLxZff3h
	Q7w+ogw6sDFxCIHBFOT1cFWBJkGWnVvuSK14yo0Amt3MSFFkHwPxtRpQkVIRdVVaTqfrM9RXI/ZlV
	CyQoAIAg7Bfd4Va3p9vngGaTAtkPGbNyEQnN2jt0xRb1Lhp2haX/W9sh07Smh4/sG+YoDAoVzzUaK
	/8Qm3nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot6HK-005cwZ-HU; Thu, 10 Nov 2022 12:03:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot6GS-005caM-JU; Thu, 10 Nov 2022 12:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21FBF615C0;
	Thu, 10 Nov 2022 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A55C433D6;
	Thu, 10 Nov 2022 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668081754;
	bh=7FTjqF2vypZO8iNUM0i1QVNi5EOess1TmlkVdrqkKf0=;
	h=From:To:Cc:Subject:Date:From;
	b=iMCysXRqDqc5O74eEFgu3MGtt4vIY6E17F0NyHH/h/AfmZWbreonUHFrMyhvnexxp
	 gxXdtjA8nuekJ/i7xK0z6ObCmQZihRjaLpbRdqMTnln35dyDPbpxFg9khX5sYpxv9T
	 QnmUqDmrIHh/WiCLp5Ac1oEP99fPGJGVD1n/M/bUoaN4pEyoZ2rxt2g2PNjxlJ7NKg
	 I/R0E/B3rviUEu7om4KSLSyC+u2QDrCVSjguG+w6S6HzPHZ3NnUo7gmC71VTuwglnA
	 GnaFw2QCFPvNud+orEYHLL/ER94NKzDIgDYXgFFCM6Kl6zMdORSNVnwromgu51Bjsh
	 iYIKEaP8j0zaQ==
From: matthias.bgg@kernel.org
To: matthias.bgg@gmail.com,
	nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: mediatek: Add deprecated compatible to mmsys
Date: Thu, 10 Nov 2022 13:02:22 +0100
Message-Id: <20221110120222.32297-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_040236_762512_F77FFB74 
X-CRM114-Status: GOOD (  11.58  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

For backward compatibility we add the deprecated compatible.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ba2e79b26993b..47106f557c574 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -303,6 +303,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
 	},
+	{	/* deprecated compatible */
+		.compatible = "mediatek,mt8195-mmsys",
+		.data = &mt8195_mmsys_match_data,
+	},
 	{
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
-- 
2.38.0


