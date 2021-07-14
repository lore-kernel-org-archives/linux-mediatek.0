Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96BFC12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 20:57:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FDC613D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 20:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FDC613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ro5oVQihcdN9G/tKtSfE4LWLX3qeLQEeT5sEFhNhvS4=; b=5ECLFZTyZ6QWYg
	LWkNRw4Ut9YgcZV1oxKNIjULU/SJmDddHaDLG7YkhCHsL5kiD0fpqDrPKZjk1Oj59EODNqm/eUAhK
	o1nyQO7xgog3gx0KqLyn6Gcy/PfkiRVtqCzDI+W1fjzwNDruMWxgqPUYEDoG/1J7i3hKpe6NNo5I2
	oAZVmQAd5h6ehV9bB4A6OzJozRvQk+3+R4FglMkf1QRKsCkAiyfYsT7+3PT3Tx/nkzpwk9fYy/sW0
	H+nGOQJK8qBI+1TgGTwbRr0ctp4NgOyJt0MR1MrCF10X2jw82rE2OKSyHbSfjuvQ+ZlspGpsCx7wV
	07amPlNnW1Nhygmqk8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3lw6-00FCfy-0r; Wed, 14 Jul 2021 20:56:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kks-00EdS1-RC; Wed, 14 Jul 2021 19:41:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54D6F613F1;
 Wed, 14 Jul 2021 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291674;
 bh=oYfTxqLGVBT5yg+xMwCwpdKCTFpfJ5wd+O/hqJoewfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=id7NpUMDZiuEx341ljGc3/hZbh1Lc86eNcij5s09NcNQSY+yyxcr/Cc8yLaBXLfAZ
 KQwGaG4A2OsFrJpycfrdBsb1PsoJfOibC5h0g/PqKyxvwV+P7GlmD3SURnK8PdTPXO
 mLlaK+Xe2Qyh1gBcMGLOyZCrhzEvfpPqsFwyUkomdxwtFdbGUUrPBfPntIGYI6Q4Gz
 O7MTZ9D7BPiq0K+TdeQTNfVh4S6e+X/Ycy/foDWIzKaeT4V5vlv9QluCQP2FEpGNeo
 aguDAupew9tTaWnOEPE/MIhIZNbj7/MT4hp9ugeDJijH1crtYW586Lm5H/yuIg4drc
 Yms2Qwswquf/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zou Wei <zou_wei@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 026/102] soc: mediatek: add missing
 MODULE_DEVICE_TABLE
Date: Wed, 14 Jul 2021 15:39:19 -0400
Message-Id: <20210714194036.53141-26-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_124114_967902_E309EDE4 
X-CRM114-Status: UNSURE (   9.75  )
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
