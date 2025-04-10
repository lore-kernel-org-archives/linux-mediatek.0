Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76891C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZqNfAi+04JDzS8i8KxDrCcT3cnP7PfeBF726kyHLwk=; b=BzQEUYDYn1RRvo
	ekLXCKT/8t5nHi+4muAxFsE0x46sY5BNG0m9vRWHhf0BYdUhnoBF0x7whhR4opgW5hRfuYG618UIo
	Q5MYWpaH/a1moEd78tJD3Eh2059gS4rxVmGC4Yccb+VEjq9pdiW3cZFc7N7UdPvo54X3hxqauk5JE
	NQ240tfXuookOJLSjuDiGv4tMLwOwwOzGAtPJT+eCDdKqmtanriB6Iqwt+XFh5ngNvjaiuuSNXnOP
	nFlZx9YHoxXWU1EcIpnCheig3O62UukzE9Wt2E/eF0VsCahvgBLRa/AmvDBritEIPsyp4j9L9vxsp
	WVd+VK4jbwBRsdOAteAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tAC-0000000AtN3-2B8v;
	Thu, 10 Apr 2025 14:45:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4O-0000000AsKd-37nX;
	Thu, 10 Apr 2025 14:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744295995;
	bh=8jM0GiTANEpN3Vvw34YI8E8ETk1hl9c3ELCXlQvppCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EuLiPLHYqE/fGWVcqYHo1RYKTffLc8Pdb2+BnOHQU9QYtaGWYjs8AowpnMbL+A53N
	 Z3lg31kAx6ADFxhbwgOlIeEpdWp7gfqF7xskNMBEfkRcTGP4416oBJUgt0aGWOl3MW
	 YmtqQFED+JIc63F/rzKiB53XVoqKtvyryszOo9MS9eYBNiwf+9tXo/ogjsrd8oSF1Q
	 SgUoIOGD663S8pxZUJob9Jc28eky+95vXSue+jApT9qN688ZuYoSBFyBtDfbLn4Qz+
	 gLXgtLg/qkVIPLlALrzaJak1lokXKM3uC+CEF0kCBpyT43N3//4TJ1Uh6rlq+UeZyO
	 /8pQkZw2Laj0g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A08817E0EB8;
	Thu, 10 Apr 2025 16:39:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Subject: [PATCH v1 2/3] pmdomain: mediatek: Bump maximum bus protect data array elements
Date: Thu, 10 Apr 2025 16:39:43 +0200
Message-ID: <20250410143944.475773-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073956_961321_47497167 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for adding support for the MediaTek Dimensity 1200
MT6893 SoC, bump the maximum elements of the bp_cfg array to 7.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 2ac96804b985..7085fa2976e9 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -44,7 +44,7 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
-#define SPM_MAX_BUS_PROT_DATA		6
+#define SPM_MAX_BUS_PROT_DATA		7
 
 enum scpsys_bus_prot_flags {
 	BUS_PROT_REG_UPDATE = BIT(1),
-- 
2.49.0


