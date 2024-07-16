Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AD4C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heAbERP48FJoWKIX4Z0NdZ1Rwcq/fsHdvXN7RyYxS7A=; b=kBVm7MCxcl3/LISRwKA2HEpHOk
	i2zTppkH99iEe5DbanUnC9gfq2xCN2aFR7ygXpbSOAzg0L0BFAh1+Dvze1bofPaci2kzfL5mqtIvd
	7U5ugrApwXxL7Mxl+boC1OO8W8DcIrV01XSTLRiwM7EwO2P0ZdX9/sxLSEm087NJx/oeJpcazImM3
	aAJe/tG/mo5HU7+IpVU1C3UVVRkOr+nSD9aSxztnBiXRp9pFZqUV3cihFSfgSzFBSQ6jujuUv39ft
	NrKIIqdXUnz18bwI0W/vHjpDQKpsLtqI9j+QXmOaQQkKAt/MdBZJNsJQufPbfk7adxpn2NYEWIaqX
	5VuP0W+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTj7v-0000000Agbh-30oM;
	Tue, 16 Jul 2024 14:25:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTj7a-0000000AgVP-2jJ7;
	Tue, 16 Jul 2024 14:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6E7FCE1345;
	Tue, 16 Jul 2024 14:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C112AC4AF0D;
	Tue, 16 Jul 2024 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721139936;
	bh=GetdLgWuS9LJx19DF+x6VeDsh1GD/sT8WCGs+6TCgjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNWyAFgVf3ulJkrNVxaUF1EM6HBc+FRlCO1BEPGpPamvdUvUkdwpekG5s9WiX18Kd
	 /8PJ/iaiW76jA4xRovga2xFGyACsZTaYxN7xAwuaUxPEdhm8kZFbsMfe4w7+fSCDII
	 lCQUiaOnkd/VmMr8nZrJwdOLw9KlEPBaXN+dCz+IiLSk3V/j71cKeF/Bgi4WzaEGB/
	 YwuwvtgGbVABGL9bwkcx+nXl8jV5a0QnM0L98Zrg/iUxltX4mM/ySi38TubEIaejEw
	 FWJdCTtVK1w+Sg0p0TSXAs2aNYqeuzhrvm7cqVaUqHXL0bHi00mKfJZp6hm3rk6/JE
	 7ykNeNRI1tWpA==
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
Subject: [PATCH AUTOSEL 6.9 06/22] tee: optee: ffa: Fix missing-field-initializers warning
Date: Tue, 16 Jul 2024 10:24:13 -0400
Message-ID: <20240716142519.2712487-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142519.2712487-1-sashal@kernel.org>
References: <20240716142519.2712487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072538_900799_34E98C06 
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
index ecb5eb079408e..c5a3e25c55dab 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -660,7 +660,9 @@ static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
 					const struct ffa_ops *ops)
 {
 	const struct ffa_msg_ops *msg_ops = ops->msg_ops;
-	struct ffa_send_direct_data data = { OPTEE_FFA_GET_API_VERSION };
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_GET_API_VERSION,
+	};
 	int rc;
 
 	msg_ops->mode_32bit_set(ffa_dev);
@@ -677,7 +679,9 @@ static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
 		return false;
 	}
 
-	data = (struct ffa_send_direct_data){ OPTEE_FFA_GET_OS_VERSION };
+	data = (struct ffa_send_direct_data){
+		.data0 = OPTEE_FFA_GET_OS_VERSION,
+	};
 	rc = msg_ops->sync_send_receive(ffa_dev, &data);
 	if (rc) {
 		pr_err("Unexpected error %d\n", rc);
@@ -698,7 +702,9 @@ static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
 				    unsigned int *rpc_param_count,
 				    unsigned int *max_notif_value)
 {
-	struct ffa_send_direct_data data = { OPTEE_FFA_EXCHANGE_CAPABILITIES };
+	struct ffa_send_direct_data data = {
+		.data0 = OPTEE_FFA_EXCHANGE_CAPABILITIES,
+	};
 	int rc;
 
 	rc = ops->msg_ops->sync_send_receive(ffa_dev, &data);
-- 
2.43.0


