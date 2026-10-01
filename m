Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14748CA5FA5
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sABSzYc85d5+Bx6cfGkQEPOyOB56Oyo5c8xN1m47HU=; b=KCXD/eDCGKn/TZY4vCevFCPPGd
	AE+WIusAMnHcD18tHzb3skcEmgGFt1ZaALOYrp0/ea0iW6sCXExfRUjXTki3nWdHh22N9PwihjFz2
	85SM8zefxW+9dyWJE1f48x3QMqw0eYIWNEiEFntUMX4grVuDBwZm64VkDRKMDe03+Fyy/gz1na3Of
	0u+fvs7XACt9KWfu3II8BNT/lFcphzSwIPudoZbTuswTRoqto7llfF/5y9ebIJ5gPLXj5e9uwXLpa
	0SQmDDmYiO/3FzKo4YF9tj4X7HbSgUZT1/L3ZcEvvJ1/MYJw4jzEajtMEofv4iyKU5ceLZKadpxIK
	5QiYrJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC45-000000088Vd-0E3p;
	Thu, 01 Oct 2026 08:22:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC3f-000000087b1-2Msw;
	Thu, 01 Oct 2026 08:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2sABSzYc85d5+Bx6cfGkQEPOyOB56Oyo5c8xN1m47HU=; b=dqE95TywYChHQQ21opBV/CpchK
	DMsOEUGF2yjJtp3p7nvXPVHClDSpmQZtQ70QWR48f2YTD6p/r/unyMMtFm343CE2/gMX1ezhBGpDz
	eyOpIVySGecO//F2pL3TYZvXcBQupRlYEBu4QBq29Osjbq4wRdpXoAGDa8SIE9ExGsstJIu5Ztatg
	qwh0rZ2fYt7L0/eZ5u1T39cJ5MpHGvyhRL+5GfABdWKVxGj6kVPvr5xfvwr5Wiciwg8ECOQLcDDhg
	ZNyhkMc3JwXCNv5617LA5Sda8aHuUb7hZ9SEIsbpKdZgNrF2ypg3WkdghYUdpFn5egKoSqnWpLciR
	XBfXCNMA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC3c-00000004ivF-1H1A;
	Thu, 01 Oct 2026 08:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790842943;
	bh=hYw5l8ITTC4yOWEj6oIcMjL3L4MGefoHFESh7VIdLj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fcO2oDYodIDRH6Yj5CnWAE3uZeBv5izpJUVSxsDqfPD8JoPruY38UbpXO+bT/zZPc
	 yqDTUTdmv/UyI4IwaUBhCrUrnGtYrduQXSLN0TszpafYyexJ01cT6LboL2uvq3YhRk
	 WKg9RoC1TeVmaA7IgKHHn/BMhuUTZoEoEhGV3IADsOym7kEQc94qIQzljcEJ8bD/Jy
	 r0g/OCAJMUTdeiZpPhoXxBZLrz6mxQbl2fzH7qXOyPdGb5Wgtv5UQQinyLUSJsYt3s
	 AGYdGTKaOUxr47s+JMibi+GznuAwGrXnSX4HwkG1mAj6gk0wW225gwQzP4+yatz83s
	 SF/XYwHncn9CQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F6C917E022A;
	Thu, 01 Oct 2026 10:22:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 01 Oct 2026 10:21:54 +0200
Subject: [PATCH v13 22/24] scsi: ufs: mediatek: Remove ret local from
 link_startup_notify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-mt8196-ufs-v13-22-60854adab6d9@collabora.com>
References: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
In-Reply-To: <20261001-mt8196-ufs-v13-0-60854adab6d9@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790842918; l=1411;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1F57Ign+VHliX1ZKRDQ1o+JQ9gXhHl4PSftQ4ux4XwY=;
 b=6wJuu5aEng4aphpPBhco77+cyr4OwR0L9mUmcfF8miV/33YPJSlzo8k1Zz7cRLIxscOd+gnx0
 IR9o6wccNhIDBSc26d7OmrQysd7e7/eASyVPvJi53uYXshUmq59Szfi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092224_739354_43B6BF6D 
X-CRM114-Status: GOOD (  13.98  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Remove the "ret" local variable from ufs_mtk_link_startup_notify, as
it's pointless; in all cases it is assigned, it is returned right after
without being read first.

Rework the code to just return directly, and get rid of the default
branch while at it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index de3e0b5b50f7..2473aba8fbf8 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1558,21 +1558,15 @@ static void ufs_mtk_post_link(struct ufs_hba *hba)
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
2.55.0


