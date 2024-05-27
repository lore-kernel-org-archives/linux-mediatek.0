Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF1C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC4pMqfb4hzCsC4mrtoheBzzCX+jebiTXeYB+FxV4WM=; b=k1mS0b6TUOfSceKG8FLTDnB32q
	7n4llV2CH9qYbQlURxaSmaqlQJNqp6ywUw8P0ybp0i1eUQOCvzHzJic1nv7TKBUw9aHgVLoaoXFBL
	+IcUTJ+DiddaWbDpguH3R+JgfFZc2KWVWyF2LygpDwWC2I6yzXBogaUvGcVOUvjMN8a/C81Ujlvk6
	B4dC36BBCFsgIbTPbtPh60e2ZSusR5MW19mZlWfB3d/F8T02ENbixLuJo7A97LeRGxX1h9ZExlPXo
	rzcsHfVtIFhG+B8DQiL4Rz5il4udPnhzKHxHEALv90qaAh7kwqLX9v27kKfmLDX52dcw6qAeBu3M6
	Wu59XrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcgk-0000000FgVr-1Wms;
	Mon, 27 May 2024 15:55:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcgg-0000000FgSd-1Jaj;
	Mon, 27 May 2024 15:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D3461B14;
	Mon, 27 May 2024 15:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE4C32781;
	Mon, 27 May 2024 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825301;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIWyOp2+M4MG//fbP9kWF6rtL5hIZvgOtSCWMlxn0+6ZtehgMUWTh+I7fRxR2sn3n
	 jQTOK2uH14bFX8VcF8Za8zvPs3uBfD+qwwR4fc5hjFze995dIkr2BgsAN8hwIgvVxY
	 07JlakurpdvuJd2FMrcFAdyTKg6k/pXMdQmCI8Knh79mmpxqKdJYWeWGL3mH0ZRSQw
	 GXpDX/yOJNjqmn9EB/0p1YIKSNSVzyXG0aQ3y+8KzvaWsHY6QuPb195WCefqdsLlam
	 KCzejA3nID3JoPFp6dCOeh4FQMd6cXFaX+GItSzX5nYwtAWCn3+xn+KYc2vu6B/HXv
	 L7mkHCEB4AhLg==
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
Subject: [PATCH AUTOSEL 6.8 18/20] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:53:01 -0400
Message-ID: <20240527155349.3864778-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_085502_421332_1449C6A3 
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


