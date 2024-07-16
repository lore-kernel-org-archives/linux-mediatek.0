Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AD6C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF8V4fEqQM+EbqQ+lIqeJ9l6Y6H2C3B/XqAnugPKAx8=; b=iz7vyz9huAdQGyLzV4DDAX79ah
	m1+Czqp63w9MoE5zog0z4bWUQSr8wSkMxAPY/2tkQ/hT71af8mCV01RYFL2N7hPSNHLcTosS0xLtN
	keSlh3VZ4bBImq78YJyYnFzU19smgOWhrt2Kkxk8V12nStR6kSXwqMTTNM5EExkBmm3Ezlz8zSIPU
	ZXQNW88lsPh7xpwTHmLQM97oroOgnOFbSM1e19Yh37cuTVYLBFBEuhXK4tCXIdrHzHlmB3j+hH2MP
	FSPlTvijpa+QaQnon0L1ja+HjJXgwlYGCUb2jt2NlxXnaRu9PpCD0b7yjlwF6MQyMGdkS3CONKfP/
	99T/OlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTj9k-0000000AhOd-38ps;
	Tue, 16 Jul 2024 14:27:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTj9N-0000000AhAV-2J9h;
	Tue, 16 Jul 2024 14:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0111ECE12A3;
	Tue, 16 Jul 2024 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E627CC4AF0E;
	Tue, 16 Jul 2024 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140047;
	bh=R2DMdjrSa3kuQt1wbmH93oKT3DWLTdFfmdRAmqb1P40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RooK46V5K9Iq5kQA7gKxdIUezVmLsCdLAE5AEi7f0TOEAh7HQouShpDRSZNQdljmV
	 vzZbDE2rgBvHy6mBL5eXVlMFQ+C5KcbDqVpKJoVj2bNm51cV6xrDiECNqy9vD0XKcb
	 aG9PSgv8P1Y3AIwYo7yRRRyYnaRge+AmwUTTiC8EN6yhQ/vr+oOouLI6VpldCGw/Vj
	 oMdPBaU3q2mjmlS1YRwa+hIofj6w87sxu3ob1xg0ef1tNeuVmDN70MLemcTFFbbJHe
	 W35PDQ8BAlEI6NoVgq2kOZK8ROMI87g6FSu7sVz04cxeO7nVso6cI8nMbXDd/0QsZk
	 W9SB2L4D6CRQg==
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
Subject: [PATCH AUTOSEL 6.6 05/18] tee: optee: ffa: Fix missing-field-initializers warning
Date: Tue, 16 Jul 2024 10:26:40 -0400
Message-ID: <20240716142713.2712998-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072729_790318_62D9E704 
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


