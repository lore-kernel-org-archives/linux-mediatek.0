Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD3C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu0E1M8K1dntlevNwXL0p35MHZHy/9sKkrfHJjsMR5Q=; b=D1Qz9lYr0asgq9MEQvPBjj8zDV
	WkaQrT7Iy0vht9AsRL5iQcjCy+HUakq13FwQlgxSos0UrUCdZoknsl2JIP3kul/peKa8WABIdLFnC
	788NcAYA5wnntgSqTtr0tBkaYS3c2bKWHVJWzhpVjqcCRg+4FwL9jiBhf5KUb7/PN9iyjX5OfJ1WQ
	q81GIRcqVipLu97QdZ5BX8fTKWeueV7i45F02jJjIDEPHxDqDdQJSm8n1jJPY6033VU3f3i1XTQVB
	hAGjmegR9RY1sRqhKplt9+DJATL3KwktY2jIANGSiNTS5iX9DYJ6Cqk3HpDTFwt0LeaWXVP0NR1m4
	eiIj8rFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBciP-0000000FhFT-1jQz;
	Mon, 27 May 2024 15:56:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBciL-0000000FhDC-2X9I;
	Mon, 27 May 2024 15:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E9DC9CE0F2C;
	Mon, 27 May 2024 15:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F7FC32781;
	Mon, 27 May 2024 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825403;
	bh=xEyPTSI0oKT2ayAwMUNoeOnhWhpd3XcNCE5o6c/wOUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QdQtXAk7d8iwA3CwVsQrSJ+zmaLAGI+TfDKCazrZuLCf2jQ/O2NuQGUvTJ/HOR+0J
	 BwtdGCD9ujO39u0vFRhVrBiACT8ZuZJvqfnHNNTNbTQlYSKqQfIvN4qOmJ5/er6emL
	 U2bJkiBvLGvmXH9EhBQ7AgYqQcCJMblKOEseRhpbvLtIp9kcDpeOFiF5bcaz0wfGvL
	 XCVgz8VCo6H+Av1p6gNcia7/8hMMD6U7HS+TDJnQUJqJ5mB1/hMoKDG4LTA6W2zsUN
	 CqRwkCBz/YXYAPwXV35QAb/SsMMgdzW6IgTlO3uHIn3zqn/IX272Z/GSIx61bU6Ekg
	 XKputXYsncmjg==
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
Subject: [PATCH AUTOSEL 6.6 14/16] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:55:05 -0400
Message-ID: <20240527155541.3865428-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155541.3865428-1-sashal@kernel.org>
References: <20240527155541.3865428-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_085645_859542_3BC8A0A0 
X-CRM114-Status: UNSURE (   9.13  )
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
index 9e744d07a1e8e..774487fb72a31 100644
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


