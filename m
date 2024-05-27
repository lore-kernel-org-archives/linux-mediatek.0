Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D07C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC4pMqfb4hzCsC4mrtoheBzzCX+jebiTXeYB+FxV4WM=; b=TUpYsadzB9pjQyJHXpQg8x0hm6
	yqOFS7PJSYjhSE4osoicl18tKHcxbeQ4UjWdBbqhUVvpA2AumX/lAV8DadDy2CH0N9SMwTyj94gVc
	5o0CQEcHo5hlQ6uS9lXq7xTQVggJPTmjhg8DMjcxNExOZidgNQfs29OviN+sI3SBKZc/mKw0FKmQl
	sJeZy+a7xwE6WZzOgYO2p7vJM/6rdEYECa8Br6JKoyzt0datQaNqasprQWR13vQyz9D0YCjs0BC+w
	xphioaWjXbg2Px4qiep9ZO6++4TlzLNVjdnqI/nFhCIsDzMyURsqkxs3GtLR7sYZ4/OgkHLWD6v/X
	zwVnbVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcem-0000000Ffl9-2E1w;
	Mon, 27 May 2024 15:53:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcei-0000000Ffjr-10k3;
	Mon, 27 May 2024 15:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 314B4CE0DAB;
	Mon, 27 May 2024 15:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00EEC2BBFC;
	Mon, 27 May 2024 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825176;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XvtvWAsAu7Htom0xdcQVR8q3NVLpL1WbXUNSiEfjmSgWgRQ+0qltD6J058p4VZMnj
	 dufe7Ogf0KbX68VO2mvJriHWUJxO+ubhZfv6Lgv0ZL5Nzx6dpWUZylFXBVGe9xjWz/
	 La1Km13UILNYnfdRZhhIG7w2jGuYPo/5J75PJB3WJTFGbl5wYkQLJqXusZM1dXXOnS
	 oCcZlBOrGqVBdg2894e7jRmG8YYUruirXGXXX3OYAr7FXFXdqlBq6hW4+Tyeo67tx1
	 yXti2NxfbbDFv43zE/RXHsXDM1RlVZAAo8Wnh9A7ozwEjiD/VkKY+YJa7x08jrAQs4
	 9vR/zMrvJCscA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fullway Wang <fullwaywang@outlook.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	colin.i.king@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.9 21/23] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:50:22 -0400
Message-ID: <20240527155123.3863983-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155123.3863983-1-sashal@kernel.org>
References: <20240527155123.3863983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_085300_498477_4760BFF1 
X-CRM114-Status: UNSURE (   9.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index 6bbe55de6ce9a..ff23b225db705 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -79,6 +79,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.43.0


