Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECE8D12D5C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 02:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7nYu/zf/Hgjlcyv/67Jx00L9KGYZtgYj4zxfaqbKgZg=; b=ktgxPchJBgFCVjjB+PPe3c8O/e
	+DRV4PAxOB8WcEVrhReDH96CUF2GZUDY4OdRSBjSbPXqctiptD/wGOML1YTdhKVKGeYOOOZjoZ8AL
	CSa+I+XZrFBAu7pzLwz4MBzHzzpaetMRe4P4tPCY0dYfIaKzny7n/8TKp1J7EoYUfxo5nr1ebfB6k
	TAHu2oK2DrxoWt4naamrnc+uDuBlgmRsIGAnv35amNvi/SnmZZLhhSb21LvoEt7iVk6FfaOLIy6MJ
	It1L06N8QoYSqVBcZflQDWjSBZLcDlX0N1EFQHbRYQijEoVYiB8h3pzJXa1ywA/5gtL99TAt1W7Oc
	2Ihnj8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJk1-0000000G5QZ-2cBd;
	Mon, 11 Nov 2024 02:01:21 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJWe-0000000G4CF-0tns;
	Mon, 11 Nov 2024 01:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731289647; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7nYu/zf/Hgjlcyv/67Jx00L9KGYZtgYj4zxfaqbKgZg=;
	b=MCZDBxcLq3mgZEZ0/wxlvdEOUfehNeX648U3Wxp/e8n8cBzhKGBNSHXcBApbjHlNgBHcInyiyrdkQKpDYX1a8EVXjo4zzZ+XUSwscqFpZMvHVmE4+PaSi0WeRKEcA31PBHGvFYNeQ0/7CzUbNgZOp3noWRufzz72hmzCdhi2im0=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WJ3wdyF_1731289644 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Nov 2024 09:47:25 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: matthias.bgg@gmail.com,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/mediatek: Remove unneeded semicolon
Date: Mon, 11 Nov 2024 09:47:23 +0800
Message-Id: <20241111014723.73769-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_174732_591750_2930CECB 
X-CRM114-Status: UNSURE (   9.11  )
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

This patch removes an redundant semicolon.

./drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11790
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..9d8286424e98 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1089,7 +1089,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		/* No devicetree graphs support: go with hardcoded paths if present */
 		dev_dbg(dev, "Using hardcoded paths for MMSYS %u\n", mtk_drm_data->mmsys_id);
 		private->data = mtk_drm_data;
-	};
+	}
 
 	private->all_drm_private = devm_kmalloc_array(dev, private->data->mmsys_dev_num,
 						      sizeof(*private->all_drm_private),
-- 
2.32.0.3.g01195cf9f


