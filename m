Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB84C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b27ADeJw0sQV/Xt4cNIdx1eEb45AnW86O5xM1fJwQn8=; b=aJhHhnMXA5luxovCriPSw9q1AS
	Ltdh12DSAW3/BRQ5x23J/Qs700VSa/Nf2bcgrI65L8N8dW8aQY1TlYu+TGGs3pcnrVhPiSvudPC4F
	yfvKiMy5CAowyMFbEtVUdyTmC43RdngeKF65Go5tBXX9hQjAcshc5Iw9Jk9EQD/bmsx8T9j3CUAAT
	l0zJRaWhKTmRHYcHBajHcSpJyCBsXKChBajFqvKehuxuT02AAg7Py8qvR8oO/NZSvlZ9yikLNXo1S
	9nFegiBuL//2/r6+HiCv4b8BQfdoFArknfXn8JvxrwR4kvKccKKsBS19Dov/C+1SAowtb8MmANuhV
	mqRyCfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyW5-000000027eC-2xyb;
	Wed, 19 Jun 2024 16:50:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyW1-000000027dG-1bi0;
	Wed, 19 Jun 2024 16:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1208BCE2058;
	Wed, 19 Jun 2024 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BD11C2BBFC;
	Wed, 19 Jun 2024 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815829;
	bh=EfufO2Llk9pumk0C7f8PNAltKODZ1xHc7rjQM9qwOCE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZvRnMDtM5Po3u3vmvlhVVCBMXI01AdLFQWgapf97FHWRFLfs+578RSoV/nOdJTPtj
	 5mnoGCZLc5l9PeMtUrC5gwb402zLklh04AvlRs36EKxIAwEmglXdRb84+Sb0/TwvSK
	 cxeAxBoxdzDVTdLZ/a9cxhV4Qy5bIs91IUe+LhN0sV/wI9sUdcI1lSbhGH2/wOUP5d
	 0r95HFKjqdFKqSK/QScwRk8KhdcS/JsJTq6rcAZGqh3giIYlB5D9fEbZnov+ybwujv
	 4a6/2WLpTZLU8PqJG5tua+ACgkKEGDDnuSIvg0JPfxrQLRB/v4DV1Rq4TCHDhYUXmH
	 FB60EBNc8XwIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5376FC27C53;
	Wed, 19 Jun 2024 16:50:29 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:50:24 +0800
Subject: [PATCH] soc: mediatek: Disable 9-bit alpha in ETHDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-9bit_alpha-v1-1-13c69daaf29f@mediatek.com>
X-B4-Tracking: v=1; b=H4sIAFAMc2YC/0XM7QrCIBiG4VMZ/k7QuZnuVGKEr742qX3kbAzGz
 j1rQT/vB55rIzPGgDNpio1EXMIcxiEHPxXEdma4IQ0uNylZWTHJNdUQ0tU8ps5QoT2A1sZaASQ
 fpog+rF/s0h4d8fnKZjrGP9kUP7CmPbpgEt6piz0dcE3UOMk4iEr7UjSL+NBgZqR27PuQmkKWH
 itg8lwr7irFUEnBNRes9pwpQPAeLENN2n1/AwQtdJzhAAAA
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815828; l=2248;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=iFWhQ/l8OT7lINIvtBNo7lMXyTigd+l7pk0Z9HnOTR8=;
 b=5fOrKi33gu2tz5LCPRmVxBETuDsDJ7q3F5v5c8dLfS73sIguoLBp6/9YqHdMFi6FzFcejXbCC
 py8wLZrEWqyAHrhF/yJ5vjYhCP+35tbSnq4QcNMXtfbjYJPMCVir82X
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_095033_902320_E49B1B31 
X-CRM114-Status: UNSURE (   8.78  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

When 9-bit alpha is enabled, its value will be converted from 0-255 to
0-256 (255 = not defined). This is designed for special HDR related
calculation, which should be disabled by default, otherwise, alpha
blending will not work correctly.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f370f4ec4b88..938240714e54 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -236,6 +236,7 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
 			      alpha << 16 | alpha, cmdq_pkt);
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(15 + idx), 0, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
 			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,

---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240619-9bit_alpha-39fbb99acc3b
prerequisite-change-id: 20240615-mediatek-drm-next-ad601b349f23:v3
prerequisite-patch-id: fdd0efbeca41c69c6fa93a5e49a2f16b3d2e8ef7
prerequisite-patch-id: 24bfda7b207bf9698ab88c7233d9168187aa54bb
prerequisite-patch-id: f2ab4804bbe54091a89b310c2ecd4b65fe031137
prerequisite-patch-id: 26bfe746bda376c070c23c72fcc25949e396d952
prerequisite-patch-id: b0b1589f88a9067b93a1e439e1db9abbde96e9e8
prerequisite-patch-id: 14603755fd2d5b6f0ef8a7843e118d0e8d27f57d
prerequisite-patch-id: 86f89ad0a06705cd2ad2867e9409da5610c9d228
prerequisite-patch-id: bd0b091709980bc6e993055d78573f3979139662
prerequisite-patch-id: 2f4da7b628f9d1f03e045b4c8f04b53eeb133a03
prerequisite-patch-id: 9ee1d1b3c69dc6ca828c21fae9180d2e9b5cd4d5
prerequisite-patch-id: 5c1f57bc1bd2d56061c2b927c9efbc9dad36ab68
prerequisite-patch-id: 05443d9f227599f0784da4006c4c983513654087
prerequisite-patch-id: 694abac72844a2b9753453aa514f9485a47a8f32
prerequisite-patch-id: 99f314c9dc697cb78c57d1311dfe055204b9e7b8

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>



