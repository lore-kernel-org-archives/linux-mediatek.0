Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1A8606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PkbVbC4g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9ZFuUlY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RiYL3yybOHHX1XwOBKzTHhVQkBpOulZqmuEcWqYHBys=; b=PkbVbC4gG3zuVLAJ9Q8SPMu1yn
	DZ6QgRp3KQyesRxA7Qo+UXDYbd6I5pQ4++h383oDW0wt0GM2Q4Cpe5OZeoy5nIEuLlNDMSxlbqHlB
	PRmEu6Ej5xNHP9QRZG4RSDxS20hET+OL54kEX+odK6yM8CUdgaw9OJZJiwhSGvaAQeMRv5UZqgr1x
	GAJuEmXuWXlyVUlsxeMQO3sdZA2d8EIGOx32hE9JHwgArEUyx2N6yCKaNVmAp+Rpiv8M5Wkg+vfR0
	TV3ZKlaSUG5UzSutXSNdktr56jqcKKMxEKZoBWNsaOmvfS3Do+1AcyRgGVFlrDpXVWzcKTLsOznjC
	XhFbagBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkd-0000000Bil4-1bmZ;
	Thu, 26 Nov 2026 00:54:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk9-0000000BiOW-2e6s
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 00:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52B9F46513;
	Thu, 26 Nov 2026 00:53:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654425;
	b=jCaPaq1FPvJ6UGX5nRmAL+jLxNAZSf3ufAnWNTi5CMZTyG3e8PLL+QrCqDPBjZJ21hoY
	 1EI5jzoudzG1sfOvgAMkNmaI21d0tRaQ+3k4iUDHPjuSLynfITD1Jxqgjuaser8ZJina1
	 4F8oA60YnF6K8tGjU2HIsSGx7rX7l4hkCuy1wDRo1rMB6s4dz18dv3E/H5z4NUrG8IF5P
	 wymM0bRgIW9B/t65jYbMmMJbt5nBiaYUpdDn0O2S40CEzMLRD/sPpUgOlRvE/WdvnVT5r
	 QWBjGOvG2pqOsPDNYPGjxRvHUOCfs9/EEI2TN+iOOkXMtFujzPJLKeb5wCohRft3XTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654425;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RiYL3yybOHHX1XwOBKzTHhVQkBpOulZqmuEcWqYHBys=;
	b=DsYViRhj+U8iQq3e3ImdPjZyHszb8ZTskByzC03ei7evcBr5+R6QKCQbEFzwO2y/wnxp
	 Nu6JRWPmDUqXPMoxsTPm/n1U2lVMcOcrold43VtBv9WetlqUr6Zv6PLX1PWSx49K52hSV
	 VT5C7zFm2RIunKFpWiePeGBaV0o9/xJKK/5uQk2igp0JDCl/Rgw1ZQoQIHfjV9X+Z6CUh
	 p5OXAffRAE3YTL64Cbf6309w4ybWRx333OYH8IFnVcAA9ZRWrYAkH9OEaZmznVpwDyYWI
	 r6jSrkml7XfaPYyWDe47n2jZ9qadtToLdY8F9fgVsjnH0CUpNdaNCuU8nSO0hMBUVWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2450C1F01806;
	Thu, 26 Nov 2026 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654425;
	bh=RiYL3yybOHHX1XwOBKzTHhVQkBpOulZqmuEcWqYHBys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=H9ZFuUlYd0I29kWoITUD1YfDDI+qKay07mCGzDsBaTXMGLo5uiRNmG8Qib2mFjd9C
	 /o/5ObVRyVAlXETy3R6YzyEO3EhGzuPhCKqlvK0lqGEXPdc6MP9qQLXoK7F7/rnbSl
	 4ALFIQhjYnzaabySiG+yeVRniP++ucVoqZRkx+6pnzL3GyN4ULKy3UDIozR9papxFr
	 RmQLLJzvwMaQSe/XQIkKZnJN3Cke6U0UMNr0OWdk1UMmAP/9mGvUYE0X9aoQuI9AED
	 ASZZgKaeDTFUPm6mBgV2LK1REW+pmvPqqn5KgplKgFjK6/Y3aIENhIZqq8M37rFtxD
	 69tbKqe0j+RtQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8855E4D157;
	Thu, 26 Nov 2026 00:53:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] scsi: ufs: mediatek: skip PA_TXHSADAPTTYPE on
 pre-UniPro-1.8 hosts
Date: Thu, 26 Nov 2026 00:53:30 +0000
Message-Id: <20261126005329.72010-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126005329.72010-1-iasnezhkov@gmail.com>
References: <20261126005329.72010-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654409; l=2232;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=TgRkIa3inzaHyEJPErj0qPCtjquOGG5huzUong94Mfw=;
 b=KQl6FqjHqQJUGS7Jf/0uYGqMLRIZZjJDeKPk25djze3HjBb2QG0avilLjMGYNuqXNAtklJprN
 VWlAkG5e8rcCls5FHFAZLPc8+9C2av12njFogmp0I4np76mqVYLbc3y
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

ufs_mtk_pre_pwr_change() calls ufshcd_dme_configure_adapt() on every
power mode change, which writes PA_TXHSADAPTTYPE (0x15d4) even when
passing PA_NO_ADAPT. PA_TXHSADAPTTYPE was introduced in UniPro 1.8, and
ufs_mtk_get_controller_version() sets host->hw_ver.major = 3 only when
PA_LOCALVERINFO >= UFS_UNIPRO_VER_1_8 (leaving older hosts at major = 2).

On pre-UniPro-1.8 MediaTek hosts such as MT6789 (UFS 2.2, HS-G3 rate B),
the DME write fails on every gear change with
"dme-set: attr-id 0x15d4 val 0x3 failed 0 retries". Because the failing
status is returned from PRE_CHANGE, ufshcd_config_pwr_mode() discards
the negotiated parameters and applies the caller's desired parameters
instead.

Return early from ufs_mtk_pre_pwr_change() when host->hw_ver.major < 3
so pre-UniPro-1.8 hosts do not write PA_TXHSADAPTTYPE, and simplify the
remaining major >= 3 branch.

Found on hardware and drafted with an AI coding assistant.

Fixes: e1e25d1b8996 ("scsi: ufs: ufs-mediatek: Use common ADAPT configuration function")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 7691349..38d05ac 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1468,21 +1468,18 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 		return ret;
 	}
 
+	if (host->hw_ver.major < 3)
+		return ret;
+
 	if (dev_req_params->pwr_rx == FAST_MODE ||
 	    dev_req_params->pwr_rx == FASTAUTO_MODE) {
-		if (host->hw_ver.major >= 3) {
-			ret = ufshcd_dme_configure_adapt(hba,
-						   dev_req_params->gear_tx,
-						   PA_INITIAL_ADAPT);
-		} else {
-			ret = ufshcd_dme_configure_adapt(hba,
-				   dev_req_params->gear_tx,
-				   PA_NO_ADAPT);
-		}
+		ret = ufshcd_dme_configure_adapt(hba,
+						 dev_req_params->gear_tx,
+						 PA_INITIAL_ADAPT);
 	} else {
 		ret = ufshcd_dme_configure_adapt(hba,
-			   dev_req_params->gear_tx,
-			   PA_NO_ADAPT);
+						 dev_req_params->gear_tx,
+						 PA_NO_ADAPT);
 	}
 
 	return ret;
-- 
2.54.0 (Apple Git-157)




