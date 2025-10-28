Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0084DCCD1BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkIoDKeSUsylx1fLCoOrf8/xYkmWmnqqdw4vCm+dSXY=; b=vfvm63OJBSX+F6b9xtyDeoEQzb
	rbW8i7tetghzFYbNycVJuifMZdC4Oqe0IZ1BeWE0kCe3hanUAtEd++uLlk/9/nrHZb2lQI5qPNR0Y
	BIxgBzW32gzI0FAjraEO+pmXVTsnmbpvubvJN0+mOqwlCIevLSzjtWL7aH+dstTeY5548cX+vHhYS
	BHu+AvNOB0x8m0H/M3chCC2VHsnZP6pKJ5d3nwyEx4hIwnVyFDuisth5BS5iHSEueU6Yu77cwZEoZ
	ceuvmjnlSyd4wux9LdnGmR0pdkSDQY0tfxB1sCfGx51/SQywDWnnDKIBrflQ7xe9Nv4xTAq8vxGrg
	xONKQkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgZz-0000000FiKe-3uYi;
	Tue, 28 Oct 2025 10:05:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgZy-0000000FiK2-1kEc
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 10:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA8460295;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E404C4CEF7;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=8jWerZzCn0ClHy8BlojGWt6khL1ZwPkVWdms5ih6Wgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uO0Rl0daCyw4JUN3Uu7Hb3+RKfT39ccMG7CqjcbtlyDo0OiSLaoAaZdzzUcwRyioM
	 Dkfyp+/c/iu9hsvv8ZhnoVxi/dFfDBV5eQlrYHJWSvi7xS75rUaSWXdVNsOMJ+D0Ic
	 w1+h2zHYOMnaaFxOYXaXQ5qFXUZzNRChTziMf9k087uPgcCWxEQxiulngBQsdnt/Gc
	 xEUQ8JytC8F/+5T/I1zS32GVrhyLjhXMqgdL5rhqES3NIyTo87bHqhlE8j/sMKUKda
	 xuu3VWy62s2pEmFLhxKvKTA43zFT2a1QJyyw0ohDZ45lxPUpL4uM7k7gb9OKROG6s9
	 Ij1eKcEXdtqQg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014k-48F8;
	Tue, 28 Oct 2025 11:05:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device() documentation
Date: Tue, 28 Oct 2025 11:04:54 +0100
Message-ID: <20251028100454.4086-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a comment to the vpu_get_plat_device() documentation to make it
clear that the VPU platform device is returned with an incremented
reference count (which needs to be dropped after use).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index da05f3e74081..5808311d2b15 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
  *		device for using VPU API.
  *
  * Return: Return NULL if it is failed.
- * otherwise it is VPU's platform device
+ * otherwise it is VPU's platform device with incremented reference count
  **/
 struct platform_device *vpu_get_plat_device(struct platform_device *pdev);
 
-- 
2.51.0


