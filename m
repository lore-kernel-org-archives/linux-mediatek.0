Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A93EE63F2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQG1g3zL+BKbCUyUYcpkYqbknu7V71UGfW7Za3YjBSc=; b=IPbZgueg60nSgn8BG1JVfvapoT
	mJpa5OazjtnTOfDmbbabaxAXdtSRb8ajx/3tAWMNNhRJRRW48OWtUjJroej32HY3+u9YAga7c7jOO
	AGv17lTr5HImSqBwGXCLqK3n3cQtmlErYna4aKNbJrv+wSPEFImxI3LylifHRCHeCNUOBketk6rED
	jpqJtnVcuwF92sA1Eb/FU5BxK8Y28SeXpZtckO1pTcwRRBQtNXxbS92lfFM/wbDsKmrlHGQkzwH3l
	I7ik/zBXotydoeolPtvEHTjACS7DihgaP+jgX+jWw5rIfcaj+EUnMyzkEV6AOnzIpyWBAnFrOAHcV
	0aJDdKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrypn-00000006hTw-1XV1;
	Mon, 16 Feb 2026 13:40:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrypb-00000006hDM-0TkZ;
	Mon, 16 Feb 2026 13:40:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771249197; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SyhSOH7u/FhbOGQmbaeXceRmKC57GRErH4rQNHWrbANZJAUZ3uhtGmKWlRSCv9uumC+SIinOnC6G/k7gZ83HwDQdFcHlSaSrDVY+1T/t6cOr+Vb3oWN2oQc+MQ69wDlTEmKZUh49/VfuCvi7XcI3Zh30eVw/FjrOrrASjeDJ+a8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771249197; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vQG1g3zL+BKbCUyUYcpkYqbknu7V71UGfW7Za3YjBSc=; 
	b=CzXkTu7MQ40ipqJ3AZ7xyg8Y6vOeuXRRydzYyxeVdje6w98wXc2CTfsZ8E7i8niMKdn0DG3pjOgCVFelb+3UnBKIIG8Gac4/UY3hhjER2zk6iQwcB9fLH4mWARPBFiQoccxu1p5bfE+3T5Qh7Y9ThYQ+AlARs2R4cUhc6C1bObI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771249197;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vQG1g3zL+BKbCUyUYcpkYqbknu7V71UGfW7Za3YjBSc=;
	b=WOjxxSQ9nv37l1cR9fy3XJIYyx9+QcljF9O+tdxT5bXrYzq7gxm78J0aKvLPvmds
	xSbujXAzUpwDVPK677BqeHnt8YQO5TnXD3ZY5xeiUrl9uldIZ6NdTyeSPHOcT/ULSE+
	L0iH3SN5At5uelL3nKTxnVj+qSr0lEPrmeJismo0=
Received: by mx.zohomail.com with SMTPS id 1771249196462360.5065728806675;
	Mon, 16 Feb 2026 05:39:56 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:37:54 +0100
Subject: [PATCH v7 21/23] scsi: ufs: mediatek: Remove ret local from
 link_startup_notify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-mt8196-ufs-v7-21-b5f2907c6da7@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
In-Reply-To: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_054007_318552_6180E073 
X-CRM114-Status: GOOD (  11.75  )
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

Remove the "ret" local variable from ufs_mtk_link_startup_notify, as
it's pointless; in all cases it is assigned, it is returned right after
without being read first.

Rework the code to just return directly, and get rid of the default
branch while at it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 046e2f9bb6c7..e863e4f8af55 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1500,21 +1500,15 @@ static void ufs_mtk_post_link(struct ufs_hba *hba)
 static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 				       enum ufs_notify_change_status stage)
 {
-	int ret = 0;
-
 	switch (stage) {
 	case PRE_CHANGE:
-		ret = ufs_mtk_pre_link(hba);
-		break;
+		return ufs_mtk_pre_link(hba);
 	case POST_CHANGE:
 		ufs_mtk_post_link(hba);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int ufs_mtk_device_reset(struct ufs_hba *hba)

-- 
2.53.0


