Return-Path: <SRS0=AdZ2=5H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35851C4332D
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2020 07:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A42206F8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2020 07:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RneTF4sZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kCX+VHSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A42206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fxh6+eSm4NslgXdUoEjPnUJJpAoBalbCmDNOl9GdxDE=; b=RneTF4sZeYastW
	LD3/MdZDt2S9wk+BIpaARQtyVgxPVoaqvy0X20df2gcmN39km+FWOqE/QL6TT4cZfzPqoKNtpEba7
	UNwWTV0Brtlm+gAqehqp/isOMkcCu7gapMr6LPASvsBk1lbXJNXAJkfOCmLwjWzKxlso2OL93xpPv
	O5hNp16SAAfVRjclQflW1/fzHbG1Mtu74NZKatlEsbIxRr2D5kswPJzN40VmjO0+9BkXk56mBmsv8
	Drd9qwj4+SGBuIyX9AANIXd8Xp/9CYEZRRijql0P4hAItxQEUeo5CmzFxniZJ6x3EH2s7N6JGmt9B
	l+e5vnTHhUPYNTemMWTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFvUw-00077O-Sk; Sun, 22 Mar 2020 07:58:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFvUo-000718-7B; Sun, 22 Mar 2020 07:58:11 +0000
X-UUID: 4d1a11276a3e4eb2af82efa8ad4a840d-20200321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0SlVnuKkPvNl1cm3aUi1MmMi33v297Tf8W2wHp9Pizo=; 
 b=kCX+VHSmjz8Oheiluq9K3FRV4n8ws6KT9oEWXJIM7yKyOGUkPeZQRxVrhNLD5OnxV4ROy59Qcgij8wK0QkmwTIix3zIEIEcGOWnY9HIoN5VTsOOOvaqLVsUz0Y24h4t18UCwmFEqxf4zIK4sxIwJTjxicaZpls4HLkNx+iphPVQ=;
X-UUID: 4d1a11276a3e4eb2af82efa8ad4a840d-20200321
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1659629673; Sat, 21 Mar 2020 23:58:01 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Mar 2020 00:57:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Mar 2020 15:55:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 22 Mar 2020 15:58:07 +0800
From: <gtk_ruiwang@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Alexandre Courbot
 <acourbot@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: mtk-vpu: load vpu firmware from the new location
Date: Sun, 22 Mar 2020 15:57:45 +0800
Message-ID: <20200322075745.6133-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_005810_267395_44C71E65 
X-CRM114-Status: GOOD (  10.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 gtk_ruiwang@mediatek.com, Erin Lo <erin.lo@mediatek.com>, Houlong
 Wei <houlong.wei@mediatek.com>, Sj Huang <sj.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: gtk_ruiwang <gtk_ruiwang@mediatek.com>

mt8173 VPU firmware has been moved to a sub-folder of
linux-firmware, so load vpu-fw from the new location first,
if it fails, then from the old one.

Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..89274842e07b 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -46,6 +46,8 @@
 /* binary firmware name */
 #define VPU_P_FW		"vpu_p.bin"
 #define VPU_D_FW		"vpu_d.bin"
+#define VPU_P_FW_NEW		"mediatek/mt8173/vpu_p.bin"
+#define VPU_D_FW_NEW		"mediatek/mt8173/vpu_d.bin"
 
 #define VPU_RESET		0x0
 #define VPU_TCM_CFG		0x0008
@@ -477,16 +479,24 @@ static int load_requested_vpu(struct mtk_vpu *vpu,
 	size_t tcm_size = fw_type ? VPU_DTCM_SIZE : VPU_PTCM_SIZE;
 	size_t fw_size = fw_type ? VPU_D_FW_SIZE : VPU_P_FW_SIZE;
 	char *fw_name = fw_type ? VPU_D_FW : VPU_P_FW;
+	char *fw_new_name = fw_type ? VPU_D_FW_NEW : VPU_P_FW_NEW;
 	const struct firmware *vpu_fw;
 	size_t dl_size = 0;
 	size_t extra_fw_size = 0;
 	void *dest;
 	int ret;
 
-	ret = request_firmware(&vpu_fw, fw_name, vpu->dev);
+	ret = request_firmware(&vpu_fw, fw_new_name, vpu->dev);
 	if (ret < 0) {
-		dev_err(vpu->dev, "Failed to load %s, %d\n", fw_name, ret);
-		return ret;
+		dev_info(vpu->dev, "Failed to load %s, %d, retry\n",
+			 fw_new_name, ret);
+
+		ret = request_firmware(&vpu_fw, fw_name, vpu->dev);
+		if (ret < 0) {
+			dev_err(vpu->dev, "Failed to load %s, %d\n", fw_name,
+				ret);
+			return ret;
+		}
 	}
 	dl_size = vpu_fw->size;
 	if (dl_size > fw_size) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
