Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BEC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBBUGC/Oj1wvxUYvTqlY1uJGoG69/JNfPRIdg3+nvaE=; b=HWffHLNPBzqVCOTTGREKMWLTJg
	aL71K6hYgvS/6046bH+17HN/vJA8CV0A4oQ3CmzVavmMrTlCd+Lb6S6fPydMGPwybozt9s5gWZqob
	td6IMvxsiD3RlitnQqpNdOwXkrMODFmsjKTORFSbv0Dl9Wqg/5NZBoNViQZH1z47beTbRTFl7NQ4t
	akigzzad9u923q1hCFpLo8n8zWEMzKGn84erYErDVWBt1wJO5obmp1z48Qbodb6jhXqVIW4FLNurD
	Rq5XhmNoAtBGf4MzMQGqP7Ll8uaqgiNAghEsi7Y5e0C8XpiuIUWRObvQAzH6r/Qjk5tiIXyiN0Fy3
	mjnrGKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkRU-002OFQ-09;
	Mon, 24 Jul 2023 01:32:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkRO-002ODF-0v;
	Mon, 24 Jul 2023 01:32:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB67C60FD2;
	Mon, 24 Jul 2023 01:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D77C433C7;
	Mon, 24 Jul 2023 01:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162369;
	bh=oic8MhHfq/X2OOEIn8Jzx3Zbi0JffgiyYnBAzW0+2WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9rynjkObnSbNQhgl+EDxENIzjNr5nykYEcIlzmS2gX2fFL64MxWIsE241AOCUJ6E
	 A/xeMCe6GSqCvl/fWX9rA4qqPZxri/sk4lXzedaXSedmmn+T6+FrQoAh8ExmF191VZ
	 JOrQnPF1KJR7rvRvwWLCsybzBwKE8KT4tlb9Fvq/S/kKVmXgTh45miMKleDo9k9yRj
	 CJRDX5EvFY+v27upON22ChAq+vgbeM2ify9yx+O5T9lKhq/wlU+wi/1RjNWBvRN7Ip
	 jm0ffMZQ3UDFfgNUOiscEH2OAUNHjeejA+hh1nXmjU7vnEEBJiHvO05Wc0FyJo9LeT
	 c8rw8QjgcI5ZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 07/34] media: platform: mediatek: vpu: fix NULL ptr dereference
Date: Sun, 23 Jul 2023 21:32:10 -0400
Message-Id: <20230724013238.2329166-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013238.2329166-1-sashal@kernel.org>
References: <20230724013238.2329166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183250_367321_3A04F34E 
X-CRM114-Status: GOOD (  13.15  )
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

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 3df55cd773e8603b623425cc97b05e542854ad27 ]

If pdev is NULL, then it is still dereferenced.

This fixes this smatch warning:

drivers/media/platform/mediatek/vpu/mtk_vpu.c:570 vpu_load_firmware() warn: address of NULL pointer 'pdev'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 47b684b92f817..6beab9e86a22a 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -562,15 +562,17 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
 int vpu_load_firmware(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu;
-	struct device *dev = &pdev->dev;
+	struct device *dev;
 	struct vpu_run *run;
 	int ret;
 
 	if (!pdev) {
-		dev_err(dev, "VPU platform device is invalid\n");
+		pr_err("VPU platform device is invalid\n");
 		return -EINVAL;
 	}
 
+	dev = &pdev->dev;
+
 	vpu = platform_get_drvdata(pdev);
 	run = &vpu->run;
 
-- 
2.39.2


