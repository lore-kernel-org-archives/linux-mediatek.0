Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F3D6ACFB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Mvuq9W7BceWzpOKzNkzpG5QgcRi2Nce5+K6NLFBn9M=; b=titug9jKi/8846gtbAqABpA61X
	Jq1jRzSo8p41UnMgeJFHA/1PDESore8GuVGK9xRIeZ1xfyZgTLP4FWE0wpn9FxOjgi9V2s3Rg/o3V
	pB6hFuvqoA6V821CKzXQ6/xVaVjjO3juPOxCsbzjJtY5u2yUmi3rfM6UECA0KFUfkpQ/PDCHYt+LZ
	iYhwYKeA9qilB9ibco3nLLLoJDEsA+gQqYOGjsoihgfsGbEk9qAk8F9KcNSnTi9xduOUGOPiCcTlp
	pBG2IDxdy0zfZHZCyTX9bWBr0UkLXqSGf7tIK9JU0lJeRFVdgNOORqfIzFvkoYI7/CcyxU2gQA5xh
	3TIl4M7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDZe-00000008TLZ-1IZ5;
	Thu, 18 Dec 2025 12:57:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDZS-00000008T8w-0q1P;
	Thu, 18 Dec 2025 12:57:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766062640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=igLWUMsISI1HDT9VtlkBT77t+Z14iPWHH4BrkbWGVVzlEsfbmEwMR/++pYCQ5LPQfT8srkoB9PRtrvEX1VqbHJdEfpD96Msj+30XDr8hCePpo7pKSiVLSL9IllnYmzpPwiRBU6ylrGucR5euQZXOaZJykhI/luGnpr4+KM1cJDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766062640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3Mvuq9W7BceWzpOKzNkzpG5QgcRi2Nce5+K6NLFBn9M=; 
	b=MvSuvLMQykVrwpzqv4YtQcXJW3VLgWE1If11zRMto8AB2WZX5w1AK0uFiS4STLeuqNRRy+bgx+Er9bqs+j5wL0SIxikksI2o1T+hayhy9EnH8gRUe6qcbVC10Y1Lzrb950KwX3yF70KuSiSB75tfugco+lWlFJ6OZ7Gx1sMMbDM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766062640;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3Mvuq9W7BceWzpOKzNkzpG5QgcRi2Nce5+K6NLFBn9M=;
	b=Dcfl9dl4v/C4T+FjFVdZdIJQKfvzkJdoJa9/IxIV3RBcxER0cIL40KRxyOgevbFq
	SxlEDC+d1qyFWUZrr4Y/kRm+w5XhJ/3h3RB+jWSwgwZb2OJLGRLiTVNZ8JV6zJ3KHvh
	DbhFk4u22a9/NzooFx27SqcBtg2IWjDIDlzpfqww=
Received: by mx.zohomail.com with SMTPS id 1766062639753496.1059542236454;
	Thu, 18 Dec 2025 04:57:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 18 Dec 2025 13:55:07 +0100
Subject: [PATCH v4 17/25] scsi: ufs: mediatek: Add vendor prefix to
 clk-scale-up-vcore-min
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mt8196-ufs-v4-17-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
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
X-CRM114-CacheID: sfid-20251218_045730_430292_1A43FA61 
X-CRM114-Status: GOOD (  13.45  )
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

Device Tree properties other than the standard properties must be
prefixed with the vendor's name. The "clk-scale-up-vcore-min" property,
which this driver uses, and the binding did not previously document,
lacked a vendor prefix.

Add the missing "mediatek," vendor prefix and clean up the error print.
No judgements are made regarding the use the property itself, it may
turn out to be implementing something that it should do through a
different way (e.g. OPPs).

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index d72b6ab05a23..a598019cb9ea 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -960,9 +960,9 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 		return;
 	}
 
-	if (of_property_read_u32(dev->of_node, "clk-scale-up-vcore-min",
+	if (of_property_read_u32(dev->of_node, "mediatek,clk-scale-up-vcore-min",
 				 &volt)) {
-		dev_info(dev, "failed to get clk-scale-up-vcore-min");
+		dev_err(dev, "Failed to get mediatek,clk-scale-up-vcore-min\n");
 		return;
 	}
 

-- 
2.52.0


