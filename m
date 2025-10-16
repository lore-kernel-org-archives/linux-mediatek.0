Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC760CCD19E
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqKYMqqQwg166HBFvWGr1lohoFtGyKjc7tuyv5xhFJQ=; b=CjUIinn86rabfFnnQIZXF2vZ5+
	DrLj4eRSkwyRdk9SLf+Hg6EfBeihBFFLlgav9e6xMTykdeVfT9QPXcA5e8p2dYw2RKP0bS0eNmE81
	Pvpct6QhjkfVdXbBnYsakGbiKQCPiARNoRnzQPNzY1kpVgXmRIfLkHVIMR1jCze+U9LfpEvdv4oxv
	qo4igRWTsW3z8isvYu+W1xJxk/Asr8txqKW7Z9UfP8rkKdywlwuL+G/y3G5xUGvFfcNhEaDI9RMUj
	EUvm3GaAuXlJUAA5TJmewIcJCQ79cKqqXNeA5e4l4lag9rDXoVrne63gJsBttl0RBRALAc10wza9S
	UkSAyjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MlW-00000004gRj-1vha;
	Thu, 16 Oct 2025 12:07:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MlR-00000004gKj-04PB;
	Thu, 16 Oct 2025 12:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760616434; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ms13vYBfTMjoO1HAp2qzfAlaJj7fGx09/nN/6oBhVK/gqsAQWijJxphtE4jE2QK8BDziV5l13Oj6KmvII0toCWqdegt7+i8aFbT2Jp1eFKavIBjaw8NfQ/0lF+0X2465yoHGioO0FCMGttP30+wzjJbt1dFOcjLdvcMipuirzX0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760616434; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GqKYMqqQwg166HBFvWGr1lohoFtGyKjc7tuyv5xhFJQ=; 
	b=DQLRF2IITJH7wg48oKwTAOHDhzCLgJnEwutvNKtFfUbbwSFXm99AZpp9Nz7k42/nKWC0r0O4Eue41mzdORnPvTF5yP9xdGtykdbRx2G4MF1zvCH5YueIRuO/IHNIgF4fJIYzfB1gkGh+4wyoNnnD2GGIZzWVlze6h2r9EZCURmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760616434;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GqKYMqqQwg166HBFvWGr1lohoFtGyKjc7tuyv5xhFJQ=;
	b=KUqFRsGHHbHdAyNduyeRrVB+7MkRNXgaG8+axbmKFVJfl0cHMuZnYIEMddbLhShI
	MwM+41oe9xHpo7QCtB6hcoPL5C8jY7PBwzwihxI9zosq/uEeAVZn/Rl8+zXlGCyuePw
	yvtYMNgiv8bIogaMlaeB1ewUYhm2lq8wz0WsLeaI=
Received: by mx.zohomail.com with SMTPS id 1760616432172550.8290009089878;
	Thu, 16 Oct 2025 05:07:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 16 Oct 2025 14:06:45 +0200
Subject: [PATCH v2 3/5] scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to
 mtk_sip_svc.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-mt8196-ufs-v2-3-c373834c4e7a@collabora.com>
References: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
In-Reply-To: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050725_164738_AB0A3EEC 
X-CRM114-Status: GOOD (  12.29  )
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

SMC commands used by multiple drivers need to live in a shared header
file somewhere to avoid code duplication. In order to rework the MPHY
reset control to be in the phy-mtk-ufs.c driver, both ufs-mediatek and
the phy driver need access to this command.

Move it to mtk_sip_svc.h, where other such command definitions already
live.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h      | 1 -
 include/linux/soc/mediatek/mtk_sip_svc.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index 7d17aedf6fb8..d627dfb4a766 100644
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -11,7 +11,6 @@
 /*
  * SiP (Slicon Partner) commands
  */
-#define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
 #define UFS_MTK_SIP_VA09_PWR_CTRL         BIT(0)
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
 #define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index abe24a73ee19..7265ff2a6e2a 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,6 +22,9 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* UFS related SMC call */
+#define MTK_SIP_UFS_CONTROL		MTK_SIP_SMC_CMD(0x276)
+
 /* DVFSRC SMC calls */
 #define MTK_SIP_DVFSRC_VCOREFS_CONTROL	MTK_SIP_SMC_CMD(0x506)
 

-- 
2.51.0


