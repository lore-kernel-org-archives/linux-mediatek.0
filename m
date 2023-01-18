Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A964C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 06:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woicIWywMPyEsGfjzqeJZVmpu2C7tQguryCnNThhvE8=; b=F8uFJRLXqCLXXCvyPizeureHK2
	JyBJXMi+np4TOQJKPzL0r37L7xxYWZbFgWuKLjpY5tbAtAfdjc7GHWh1dFV/n4erL0v53mUgsdshg
	8Jlvf08WK5yhHzVA1VhZmtPHQMDcOMU9w99kHqQWlkFYYnGIEXEhIugb9K7VYw3RVtnxZ4irejNSt
	upzPT3X6P1+GujIevsjoZ6ZXGYRXQbFzLNADHirKiQ4krAyFpguMrJhM5Sa01BHwOGJfoFJs45gei
	hrq20Yu++XDnSI00xgz7vyllVRmeR5MLAknjmc63y0OzDa/ngGVvDOb4ld6TfsYaEE/2aYITNNBBr
	lxpGA9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1pV-00H4OI-Oi; Wed, 18 Jan 2023 06:21:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1pA-00H4FY-NZ; Wed, 18 Jan 2023 06:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=woicIWywMPyEsGfjzqeJZVmpu2C7tQguryCnNThhvE8=; b=eKyD73SKsGv0PHqv79R4QCUjJg
	i51azXXdj1ijq2uFz0qzFu74gaBD/zg+i0eQNzIQHaFtTx2KeSD8B0myNvp2GFRVdtSDmR5Fp4sF2
	Z8CgvNXvkipbP5RJNDBwAXqvX3IJoTFOMk83lzycb+c8Mn/M+U/KlNZmVSrWY5bLmUCF5gGAsqiIJ
	R+7wm9WV4KUfiDXFS3o5wbGWNA0O8vhRNpOcVG46aFoGLGQu1NQbKB/54K7EPq4ax6KmbthzXlrfu
	lVu9lu9QW7+4COapE1qM5NulzAeTkuPC/foTxL1R6kN6fhRZgZJLImZ7c+uqD8RVXsznPQaHGK2lX
	z4FFXqEA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI1ox-006B9u-08;
	Wed, 18 Jan 2023 06:21:17 +0000
X-UUID: 4efb09d896f811eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=woicIWywMPyEsGfjzqeJZVmpu2C7tQguryCnNThhvE8=;
	b=JdZLevugZXOLN+C2wShJ69Re1kJjMBfPHhXlw5HfJDOhmqxyViXHuoAHC/XBRfcovu+R30bstILwkMRkFsMqqLghTAqjrs5/eH9vTcIkFCKEqF+1oLBnkvqLlZnLVXP7nzIaJyjeMs8EPm0h1Vjg8b0M8JXgycRFqfzLRfHSPPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:cd284b90-969d-4ce1-a0c5-b7d37897c672,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1cb424f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 4efb09d896f811eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1202574650; Tue, 17 Jan 2023 23:21:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 14:20:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 14:20:40 +0800
From: Guodong Liu <Guodong.Liu@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu
	<Guodong.Liu@mediatek.com>
Subject: [PATCH 1/2] pinctrl: mediatek: Initialize variable pullen and pullup to zero
Date: Wed, 18 Jan 2023 14:20:35 +0800
Message-ID: <20230118062036.26258-2-Guodong.Liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
References: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_062115_801166_D458CEA0 
X-CRM114-Status: GOOD (  14.32  )
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

Coverity spotted that pullen and pullup is not initialized to zero in
mtk_pctrl_show_one_pin. The uninitialized variable pullen is used in
assignment statement "rsel = pullen;" in mtk_pctrl_show_one_pin, and
Uninitialized variable pullup is used when calling scnprintf. Fix this
coverity by initializing pullen and pullup as zero.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration
dump via debugfs.")
Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index f2ce3f626dd1..e736c1610f3c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -635,7 +635,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	unsigned int gpio, char *buf, unsigned int buf_len)
 {
-	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
+	int pinmux, pullup = 0, pullen = 0, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
 	u32 try_all_type = 0;
 
-- 
2.25.1


