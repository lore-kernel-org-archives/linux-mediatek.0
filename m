Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF6EC3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF8V4fEqQM+EbqQ+lIqeJ9l6Y6H2C3B/XqAnugPKAx8=; b=BGOuQL8kzA+QmT1NHhSOFAiVme
	LlJpSMXclMGltfwAktNWGmYW110XkGaR3/w/e5h6K27E2OuSiy/n1PuKL9NX7WyTvIbFU41eNUbgk
	INBXsGlCkCTO/71gBkey3EjE6bEw4crVS37jeHaDdBOppr9RVbO/pw0RzY2gpSgUKJ0U898LIqWo1
	64skiBz6Fnof4khZwjjpjZ7sUNVo13QdJYepxgVqy9L7porFIZNBqV/6mvxIZcGMxk6AeVjJ2xnxr
	PNbUTRnN3Qp3Mxa5rOHycKMNUYOYAv7yaeioDykLa8CgFnnFgT/D2RObEPbkQ4KL5DzGDSN6Jlhkf
	+OagtBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjAt-0000000Ai4f-3W9c;
	Tue, 16 Jul 2024 14:29:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjAW-0000000Ahro-41Pj;
	Tue, 16 Jul 2024 14:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 423FA60DF8;
	Tue, 16 Jul 2024 14:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60285C4AF0E;
	Tue, 16 Jul 2024 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140120;
	bh=R2DMdjrSa3kuQt1wbmH93oKT3DWLTdFfmdRAmqb1P40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TW/KJlIQHXZNRlG+Swru9f4S2Q0AmuU1C8M4itV9CBIf4tUa1AwbQ3cEyT1u8ZEYR
	 SGDO90mIsWfFHhenuM06Fi6wCx3ArZJRH+A8j1X4lGNbHxyD1SOg3WMam0iHPyFMbg
	 Y0LgKjLalIPUgfeIqDJimLjCyJdnYmZdd2eTkKujArhN/7/FKOVaeXVczYbtVCcv+/
	 G/z4ZbBWe/4s0SP1nb+eIXC3zajR0ZLGvrtoWvbg/dq756Tgmf9R6E9IVgNV+FDL9t
	 kmqLHumthSkxdhuODhHY7ola2jOH4mrznNXCvSmH9REqLk+rJrgF08VxqPjB/1i31V
	 jG+ZXsJYpRmQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	"ming-jen . chang" <ming-jen.chang@mediatek.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 05/15] tee: optee: ffa: Fix missing-field-initializers warning
Date: Tue, 16 Jul 2024 10:28:02 -0400
Message-ID: <20240716142825.2713416-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142825.2713416-1-sashal@kernel.org>
References: <20240716142825.2713416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.99
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072841_070247_DE70D817 
X-CRM114-Status: GOOD (  10.67  )
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

From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

[ Upstream commit e0556255a53d6d3d406a28362dffd972018a997c ]

The 'missing-field-initializers' warning was reported
when building with W=2.
This patch use designated initializers for
'struct ffa_send_direct_data' to suppress the warning
and clarify the initialization intent.

Signed-off-by: ming-jen.chang <ming-jen.chang@mediatek.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tee/optee/ffa_abi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 0828240f27e62..b8ba360e863ed 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -657,7 +657,9 @@ static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
 					const struct ffa_ops *ops)
 {
 	const struct ffa_msg_ops *msg_ops = ops->msg_ops;
-	struct ffa_send_direct_data data = { OPTEE_FFA_GET_API_VERSION };
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_GET_API_VERSION,
+	};
 	int rc;
 
 	msg_ops->mode_32bit_set(ffa_dev);
@@ -674,7 +676,9 @@ static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
 		return false;
 	}
 
-	data = (struct ffa_send_direct_data){ OPTEE_FFA_GET_OS_VERSION };
+	data = (struct ffa_send_direct_data){
+		.data0 = OPTEE_FFA_GET_OS_VERSION,
+	};
 	rc = msg_ops->sync_send_receive(ffa_dev, &data);
 	if (rc) {
 		pr_err("Unexpected error %d\n", rc);
@@ -694,7 +698,9 @@ static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
 				    u32 *sec_caps,
 				    unsigned int *rpc_param_count)
 {
-	struct ffa_send_direct_data data = { OPTEE_FFA_EXCHANGE_CAPABILITIES };
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_EXCHANGE_CAPABILITIES,
+	};
 	int rc;
 
 	rc = ops->msg_ops->sync_send_receive(ffa_dev, &data);
-- 
2.43.0


