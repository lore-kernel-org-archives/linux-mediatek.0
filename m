Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA39C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 01:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Nyf9xERdZj6WdWXy2i8SUTiaA7f7lxX3oahUX7RD1s=; b=nzNzAukhNH6FUUBR/yl42MSAO0
	8+qJCGAn64CJsYI+rkZzqRwckhHi0U8enmXe4si311bB4Gc0rkDE+YeM71oA3VDk4lgzCrD9amdtl
	yRQVZGSvLYjDybd4c4rpYClst7r8yR9trB6LeHvJemRdxgIb+M2H1aavsp/ikXg2zcC9wm7VVuJUu
	x5tT/VtJ0ABRApwxLRpmOkBep3+SLPcjo3bo9O9I/aRrMr4CFY+6Ji+EnkgME5ZvH0/KmGicQRxml
	emLBe/B/ddP4iWvLTgxMLF8QBbyr0OH7Dfh2qC6PBrOw6VoQw5X8XPx+cFoJxMECXISmP+6fvr4nE
	Dat/AHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkTV-002Ouc-1D;
	Mon, 24 Jul 2023 01:35:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNkTK-002OqD-2e;
	Mon, 24 Jul 2023 01:34:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AC1661053;
	Mon, 24 Jul 2023 01:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7084FC433CA;
	Mon, 24 Jul 2023 01:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162489;
	bh=p/kXK0oG2oy8tHU0cEq30EV2AblklY6LbKFSx0eTQfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LP+sr/N1OWQsmxZvffVUJaNo1eSR+9Hh5YFb+hAT8RgaykOiQDneWu1Lxn29LaFHr
	 EPO77QyLToRpFC3y5XHJfcQQR6AkcZVzPjI8s9f9dSImScr2R5SgWArsVOQnA8sG55
	 gpcxs+XgzTEd4V2U4B+btROtpuv+LkwStFBHJ92tCLxtLcQjI9m7zZoHMBf3Nff2yf
	 ItChGW8ZZ8Ss0gyfbZcxNoe1zc0/qkJ/CPUvEB6cdG3ftB1r/WasGgiwvXh0WFBWHx
	 Ao3xa+GL2MSgR6w2/pgb66H55GHCV5p2fPwWCmrDa5XMIDM4WrN1C9We8K+sLDOGNt
	 VzFsrDyxqWcAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	tiffany.lin@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 2/9] media: platform: mediatek: vpu: fix NULL ptr dereference
Date: Sun, 23 Jul 2023 21:34:38 -0400
Message-Id: <20230724013445.2334326-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013445.2334326-1-sashal@kernel.org>
References: <20230724013445.2334326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.288
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_183450_900125_3F86474E 
X-CRM114-Status: GOOD (  13.38  )
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
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 9b57fb2857285..46ec1f2699aa7 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -537,16 +537,18 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
 int vpu_load_firmware(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu;
-	struct device *dev = &pdev->dev;
+	struct device *dev;
 	struct vpu_run *run;
 	const struct firmware *vpu_fw = NULL;
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


