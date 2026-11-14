Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5808606A32D
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSuvprRt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRJKy710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/2hjrB65D30vCvt5YWlJ2EoRPo0VzzXwxqoyF2Wo8n8=; b=lSuvprRt6YfiMYpD6/FD1iC/WX
	UclMkI4kMncDgKs+LkKu3tVrEhEm2mvV9n1L4rzqBPjQDpD8/8SkEPAs9+6it/x+9y8s9Tsglfzp8
	Xl6Sor+yiL/MWUVFx/kOFhxJqX87nXHz+az4HYjJRfhWBvRbP1D8dDdpteP9ctLheSH8AvbzXP+hQ
	bxc0NYXdlDGBfCyu62d580IIOm1UQxQx6hp5PhWi42GzcGhvg0i1HmndUd/qAQ+i6L3Rpou6qowKD
	cyvtuDdrEGAOqxJ7hDtMxdnl5ILrWVxrHw8Qh/AOAchRZBtcIxGs7S4NWUcuQf/RqwhlPZnva6KLg
	RiEWPDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCNU-0000000Fwux-2Bsh;
	Sat, 14 Nov 2026 11:57:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMk-0000000Fvzk-0kzP;
	Sat, 14 Nov 2026 11:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3F0745A79;
	Sat, 14 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794657377;
	b=X9w88yv2cVMn690pprbfKgcB9kiPM2Qca4FoSCLjUwAYACkYc9YRwIIlhwo6WTHLkA2g
	 tXG6e2wHbVs1fQ372uo5z4rPhRLObHef5hDFWnuQTAC4CkmkyObcAtciaVes9A3uWFpVh
	 RPRuIhAtx61qkdp92Eyecj0QlZNmqrheUBswdwpZ1h6vHF5l757FrKXJ17NF2yyZsCiJq
	 Sv7F2NhF50UfPtT4p2NcH7S8/xO9f0BJtLq5bfDzgS93PtyMbrCK6N08PjB/WGM96LKdZ
	 O3MswlYuHqNPdrr9MhHY8zHXV/dcmuwmdg2c3/mqHld5v7zq6C+/90EUi+o6c/5c7Ew==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794657377;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/2hjrB65D30vCvt5YWlJ2EoRPo0VzzXwxqoyF2Wo8n8=;
	b=QeIutcXurMmZcBtNSScXag3uEh5ChX0W0EeGopFM8IFWYPmjF/DCcNjTwJ/NBNkR+pnz
	 +SLs1LsJKo9NOlT/uo+IYDFs+9cZA5Po078NvLzSrB5t1KTOsQEqtcaEVCu3yYmYyTWJ8
	 vCATrBCK6sGc7cuP359M04tw9v68RQnGh1K1oHET3IJp0zf6ac51mE++9rVVOvqIFTe6N
	 swBFlI40/F6BZhfxGs9NW/LOc8t3Y+PsxGdr2s7z1OE0WomO+Lh/b9OAX364LY1keNAvG
	 tFXYgdk+PlVzP4eXkwAv0FgYBlV3qOXyIljhbXXK4fMas9VxBAycpIWizoBR3e88Ntg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91FF31F000CC;
	Sat, 14 Nov 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657377;
	bh=/2hjrB65D30vCvt5YWlJ2EoRPo0VzzXwxqoyF2Wo8n8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XRJKy710p3Q3Vy9N2rLX7+O0oSzynf3BvVGFFPy1/U8mHEqxZjqyaW+lXtNO9+tgG
	 msFXEkXuPEnDE/2K9JbBeSEQhYvIzyuh4x6RtAdn8ihXZaschKQ4nMRUA1N+Fnff3Z
	 Fc7iFRWdCLY2ZVA5uQGKhqoHhSuKwILrk/Ko3D3ZNscLe+PiiDCEZ2s49QkMMCa0Y0
	 qwaIlswDHZLPmcmvOBnDeQ83nm+evqH/lTusGpPcGwt293V4rTHXYz/KgxSFjllvhH
	 oabXXb2NMLhZ0tAC5eGBxFyr/MSg/2wUPqrX9/sLZbNfNqZOUDhjC++n+BXg85VrJ2
	 bXptoHXs6WTUA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A895849D82;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
From: Larisa Grigore via B4 Relay <devnull+larisa.grigore.oss.nxp.com@kernel.org>
Date: Sat, 14 Nov 2026 12:55:40 +0100
Subject: [PATCH v11 08/14] ufs: dwc: Sort CBCRCTRL and CBREFCLKCTRL2 by
 offset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-ufs-s32n7-v11-8-dc36e11919d5@oss.nxp.com>
References: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
In-Reply-To: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: devicetree@vger.kernel.org, Ajay Neeli <ajay.neeli@amd.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
 Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 NXP S32 Linux Team <s32@nxp.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, Stanley Jhu <stanleyjhu@google.com>, 
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
 linux-scsi@vger.kernel.org, Bean Huo <beanhuo@micron.com>, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Pedro Sousa <pedrom.sousa@synopsys.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, eballetb@redhat.com, 
 Peter Griffin <peter.griffin@linaro.org>, echanude@redhat.com, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, clizzi@redhat.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Can Guo <can.guo@oss.qualcomm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, aruizrui@redhat.com, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794657370; l=1160;
 i=larisa.grigore@oss.nxp.com; s=20261114; h=from:subject:message-id;
 bh=jFPb09TEw+o0co3IKimWFQwdujSqoSGN2BKqE5DQhEI=;
 b=ixpsDc5UGD5DMWn3XWZWIo71JIdLStTqgwVuwD42MliFUu4v4d8dPwsTNw9xryPPVqxhBXeFW
 B+Cnmgy6MATB1HDgNV7Osmu4wXB0v9u16j7fle2yFFwau9gIp59++8f
X-Developer-Key: i=larisa.grigore@oss.nxp.com; a=ed25519;
 pk=Jpt52sb6ETKTtvWjUzhz5Sv5FjB9AEg9QKCcbpWFx3w=
X-Endpoint-Received: by B4 Relay for larisa.grigore@oss.nxp.com/20261114
 with auth_id=1522
X-Original-From: Larisa Grigore <larisa.grigore@oss.nxp.com>
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
Reply-To: larisa.grigore@oss.nxp.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Larisa Grigore <larisa.grigore@oss.nxp.com>

The RMMI attribute defines in ufshcd-dwc.h are otherwise listed in
ascending register-offset order, but CBREFCLKCTRL2 (0x8132) and
CBCRCTRL (0x811F) were placed at the top out of order. Move them down
into their sorted position next to the other CBCREG* attributes.

Pure cleanup, no functional change.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index 53b523ef59df..1abf2b1deac4 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -13,8 +13,6 @@
 #include <ufs/ufshcd.h>
 
 /* RMMI Attributes */
-#define CBREFCLKCTRL2		0x8132
-#define CBCRCTRL		0x811F
 #define CBC10DIRECTCONF2	0x810E
 #define CBRATESEL		0x8114
 #define CBCREGADDRLSB		0x8116
@@ -24,6 +22,8 @@
 #define CBCREGRDLSB		0x811A
 #define CBCREGRDMSB		0x811B
 #define CBCREGRDWRSEL		0x811C
+#define CBCRCTRL		0x811F
+#define CBREFCLKCTRL2		0x8132
 
 #define CBREFREFCLK_GATE_OVR_EN		BIT(7)
 

-- 
2.43.0



