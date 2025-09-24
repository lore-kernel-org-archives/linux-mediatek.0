Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B5ACAC5B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b419yFsuEkwGJsgPfZyu1e0LQIajavyMGqeO9jaE5zI=; b=aawyKrdl+geqkXKMdKaJ2WJJf0
	rdsGmvTuZLjMza69auEB/qR9JrX/rgVo1NLJk96fA1bVi4VQ9mjvbeJO59coltdcpY7JFQkXYl8L1
	CMyzihEqy2yXSPOHN2AN9Thi7EbUuQcHBSzJnLCamHuzM+uUJOM4NYrySWKQm5VokmequmIRSEK6M
	Q8jJKYKV1tz2Mcfq3JFKDbmgzTA78M1DkBprhtj4B3dJqnqmo+0jtBtmcEFwr5ufBQQOHDZBb6/c2
	OjuH8A7ClxUboJ5kXN16caYA/VN/j1GFjWopVYm5MjcyPtU/3+UwWnA+HvNPl+q4X8fa+GsD4dCeP
	bOL3voqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pfc-00000000GpU-3jiL;
	Wed, 24 Sep 2025 13:36:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PfY-00000000GkC-3Aq1
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 13:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FE9844CF5;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F0C4CEF7;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=jve90eHMG69ekIGAvr0Md+ax6KbA5syj0SlM96b60/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mi+30k1DkGgqBZiZ2g9YAK8lQEYfznZP5K4oDTe9bcqcWdhPf/txdVEcddMKjrS/K
	 xb6MCF9RClKfZ90EKAGsdjR/BHFj3jdHRlO5UL41+CmHl61yGSCzfL0rzxtLEzGvnM
	 RNVjj2T+t12wJszTio2LOTkp2t+aTvSO2ay8guk3oryaS8X38Etmov1RCQsVp9AUr8
	 buJHdb3DVbZ1+EyjoR5bQ/t81eUJy7Z3+xxtWSKcNQ1gTmri6Lgbtz76IPb8/oasUr
	 Zw1dmf+TMzfFxmP8bt025woGBs/vhhvKK9MebM+OybDu3PBpGE4eldnGYyXccW5/YX
	 PE/Wr6THzyM/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vq-25q0;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] media: mediatek: amend vpu_get_plat_device() documentation
Date: Wed, 24 Sep 2025 15:35:52 +0200
Message-ID: <20250924133552.28841-4-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
References: <20250924133552.28841-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063628_835314_05963461 
X-CRM114-Status: GOOD (  12.61  )
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
2.49.1


