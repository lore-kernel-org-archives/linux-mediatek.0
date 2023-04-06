Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA00C7619A
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ssWblcSDEtP5/IbtmhTlYPoFgkRPg3gz4Y2wx4xj5A=; b=kDOKNMVAab1YlgjrSa9V0LJ0e0
	wIebm5ic0S/CSgWwo4oIhsg1dy8u57Dr32xwx9u52FFvv35eaPTYZMi+y58MmMEBCMPEiaQO39HRH
	aInWkR7LjV9KyExLze9HuCHpPylnk5ZoAhiTTO52nw+TzrFFhgBZ0iAoQtYSzb7WsUlh2ILFzSK2j
	9t1TOLma6kVsSq75RDv+u9T6FdkgEHXw3+SKpinQ9JiUyAyscYHbdfoy/7WldaqqhMc//Ri87aH4R
	tJW5kKCr/2TR4+gMSL3hCcoFtEvxnarT1PCcZ74x7B2He85T42lMDPLDX+IH+y6UyOhUpPsZG/gYi
	XJit7svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFaq-006AID-3C;
	Thu, 06 Apr 2023 02:43:20 +0000
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFan-006AH3-1u;
	Thu, 06 Apr 2023 02:43:19 +0000
Received: from localhost.localdomain ([172.16.0.254])
	(user=ziqin_l@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3362g2eK004176-3362g2eL004176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 6 Apr 2023 10:42:09 +0800
From: Ziqin Liu <ziqin_l@hust.edu.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ziqin Liu <ziqin_l@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-svs: change the function IS_ERR_OR_NULL() to IS_ERR()
Date: Thu,  6 Apr 2023 10:42:00 +0800
Message-Id: <20230406024200.3126080-1-ziqin_l@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: ziqin_l@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_194318_002396_E368C5F1 
X-CRM114-Status: GOOD (  10.96  )
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

nvmem_cell_get() will return an ERR_PTR() on error or a valid pointer to a
struct nvmem_cell but won't return NULL, the check function should be
IS_ERR() instead of IS_ERR_OR_NULL()

Signed-off-by: Ziqin Liu <ziqin_l@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index a7eb019b5157..8127fb6d587b 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1726,7 +1726,7 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
 	struct nvmem_cell *cell;
 
 	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		dev_err(svsp->dev, "no \"%s\"? %ld\n",
 			nvmem_cell_name, PTR_ERR(cell));
 		return PTR_ERR(cell);
-- 
2.25.1


