Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC732C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 19:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900A661400
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 19:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900A661400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ro5oVQihcdN9G/tKtSfE4LWLX3qeLQEeT5sEFhNhvS4=; b=N5IKa9KAEkwP4B
	fPLuRFhUCw0a+YtgdWKkGPdeZXVQs/mMyxkiWnRRDDuesO0Unx8rRljKHCGFIdU3Az4c2aPTQ1tQ3
	lE5yUoOgCIq2snLSJ6ltBa6+CRLcca7lO33KMrMQqrkUymQzd1bYr7mkd09IiZvqungCOExe5P7kt
	/3vyv9pubztxTo0ZsyFrEl9ECBfntrBEuKC+va1ymizYHWGZSiTbFUUGqaj7wjtP3RtZQoRAhHPcv
	gTDQrex8fe7PJVioGLh7wKwMoLDEss66MEAmDIozlImtP9TKfJ3M2l1PDXIPqJq5un+wJfJe65MNM
	GoL+5kUfhjcXHr7zutOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3l1w-00EmKy-Eg; Wed, 14 Jul 2021 19:58:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kiN-00Ebpy-Ux; Wed, 14 Jul 2021 19:38:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC7E613D6;
 Wed, 14 Jul 2021 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291519;
 bh=oYfTxqLGVBT5yg+xMwCwpdKCTFpfJ5wd+O/hqJoewfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pDOEL3HDnvdkfg0GgeT1Rogxj+wB62549G5BO48PERFx/bnTN+FgbetGh1b9M6XYw
 c6pDxfirHqhCi46PctRLRksp3Viid6aqDL2buVpqr5nzxtyG/YrKzf9XybeE7hEMLr
 oCf2TInAAJ+4I4Q2bwc9fjugrw/zqr7BjZyOE5W+ZQWo5A8DbQE8WW3VU8I67YlrN5
 nmyZ3MkY0mDh/xqQLSa+t0gEyO+MvpN+x0i9BG6kipnc6A3lmyPZr/lCm01MV2Cr20
 86S+gY47isYeSSD9snuUtEozaaznm9QEBoOeHnOyocqHHoTRMSEK406jK/weJHx2hc
 NElvxEiq3cE+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zou Wei <zou_wei@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 026/108] soc: mediatek: add missing
 MODULE_DEVICE_TABLE
Date: Wed, 14 Jul 2021 15:36:38 -0400
Message-Id: <20210714193800.52097-26-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714193800.52097-1-sashal@kernel.org>
References: <20210714193800.52097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_123840_052291_ACFB37A9 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zou Wei <zou_wei@huawei.com>

[ Upstream commit ba96de3ae5a7e2121cac80053b277eb2ab51a0ae ]

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
Link: https://lore.kernel.org/r/1620705350-104687-1-git-send-email-zou_wei@huawei.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/mediatek/mtk-devapc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f1cea041dc5a..7c65ad3d1f8a 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -234,6 +234,7 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
 	}, {
 	},
 };
+MODULE_DEVICE_TABLE(of, mtk_devapc_dt_match);
 
 static int mtk_devapc_probe(struct platform_device *pdev)
 {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
