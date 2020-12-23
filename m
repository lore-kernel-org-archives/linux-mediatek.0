Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9624C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:19:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F612256F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F612256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yPCP9DnCLQAMYboshHFak91gNWZFzcgdxOLzOFurHng=; b=EIeBSGaCvlD1hdee689BN86JZ
	xzUTk69We1hOy60rW0dO4HV30rHJS2twOd511Hy04az3Pbxp5bQ0O9Qy9lv39+5kBcqjxasvh+j5/
	eH31+mRjNMoXSZuPPWedobvP0ZkM/Alppm+4yrwO+ZhLD5Rzokhux/ZqH2GM0AwLRISI8O6ltOqJy
	B08o46z7XNVoBdgOIbAa+GG4W1rXOhtRgqCfytLZ1pFMuICv8q6bU/wC+xICb2snzGpKsNyuH70ZR
	KgMDVxtdrRrF3utMO6cLedTOqyp7oV818CFVJaCz5y24I8vyP4MzDVmCpNN7y0WqW3i1kfk0xqr0T
	d0eGCgxfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtkI-0008Cw-8B; Wed, 23 Dec 2020 02:19:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtk8-00088a-Kx; Wed, 23 Dec 2020 02:19:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DD5F229C5;
 Wed, 23 Dec 2020 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689952;
 bh=y4Yf4nMDHlDva8VK0qSvEb9qVjG00BlVP8FH46u0Dxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UCGYjBhhwooxJFexTLNgGbS3AWqR5w1Dy0j0yJ5BOqFYaq1iU0uSrq8RAtv9glwEW
 oh42Of0QadGADEW6+dl3+T38yYe35Moxx2FGVAdARve5+YKUJ6cm+TbnqERRM2K3os
 bwYw8jVulvWLhu4eN4Q66RrwAxI6MPBBjsB/yYL5ynbYico+cpRSerKZZi/J9s/0Yh
 uedyOlWNgl5ZpukYJ3x9I1NlBGUVHRM1YnbdpvKC3yZMTiBigbix+k0HlvSbMk0toc
 KOYHCOkLp5Eg15Aqa3IQm+9Ps4z/lIM5O/PKvj+L/ASLg92YyE8bcBI8UK2qAS9l5y
 zr2bMBp0Mkjyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 045/130] mmc: mediatek: fix mem leak in
 msdc_drv_probe
Date: Tue, 22 Dec 2020 21:16:48 -0500
Message-Id: <20201223021813.2791612-45-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_211912_808216_070B2E63 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Sasha Levin <sashal@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Zheng Liang <zhengliang6@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zheng Liang <zhengliang6@huawei.com>

[ Upstream commit bbba85fae44134e00c493705bd5604fd63958315 ]

It should use mmc_free_host to free mem in error patch of
msdc_drv_probe.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Link: https://lore.kernel.org/r/20201112092530.32446-1-zhengliang6@huawei.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/mtk-sd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 9d47a2bd2546b..3c11bd5a3b86c 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2242,8 +2242,10 @@ static int msdc_drv_probe(struct platform_device *pdev)
 
 	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								"hrst");
-	if (IS_ERR(host->reset))
-		return PTR_ERR(host->reset);
+	if (IS_ERR(host->reset)) {
+		ret = PTR_ERR(host->reset);
+		goto host_free;
+	}
 
 	host->irq = platform_get_irq(pdev, 0);
 	if (host->irq < 0) {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
