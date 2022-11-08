Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A86C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cIWzy/pZAl1x+ApNoSm4PoSG2oOFf3vuv4Pauolz9Uo=; b=f72hHqQNEmZkyDWIkOQFbrJAgC
	/2goBhAeFY2NMs5TCVDofQNY5oQ/u7WMxQX3lD3vL7Bkiib+fJ+IYf7d8BYy9kFYEtaOefKefx5cA
	N27bYyi+7u775Sw4QkYc+MKKAPNXzYu5NNvrLtXYRlUQX1RiMWEyoHStPiP1EMd1cnoTOmMabn+ak
	1Ptr2ge0mPdOzg15EJ0H8UhD3unriICSIiviU15Cm+OiGTV8yv98zF/6pGHPl992xeYjIvA2ooB9H
	l5VIOroshtskB3AIYeQddLS8IVWOHq6YAmDk9M8me3K1wXjVDsZSK+g+cEvQe+kFX6UkZAYYooUiD
	K9W0McAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLCO-004DSd-Cj; Tue, 08 Nov 2022 09:47:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLCK-004DHD-GH
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 09:47:14 +0000
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N63Ch4rlSzRp50;
	Tue,  8 Nov 2022 17:46:56 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 17:47:03 +0800
From: Wei Li <liwei391@huawei.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<huawei.libin@huawei.com>
Subject: [PATCH] dt-bindings: pinctrl: Correct the header guard of mt6795-pinfunc.h
Date: Tue, 8 Nov 2022 17:45:29 +0800
Message-ID: <20221108094529.3597920-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_014712_805368_DD27529B 
X-CRM114-Status: UNSURE (   8.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rename the header guard of mt6795-pinfunc.h from __DTS_MT8173_PINFUNC_H to
__DTS_MT6795_PINFUNC_H what corresponding with the file name.

Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 include/dt-bindings/pinctrl/mt6795-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/pinctrl/mt6795-pinfunc.h b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
index bd1c5a9fad06..dfd3f6f13e0d 100644
--- a/include/dt-bindings/pinctrl/mt6795-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mt6795-pinfunc.h
@@ -4,8 +4,8 @@
  * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
-#ifndef __DTS_MT8173_PINFUNC_H
-#define __DTS_MT8173_PINFUNC_H
+#ifndef __DTS_MT6795_PINFUNC_H
+#define __DTS_MT6795_PINFUNC_H
 
 #include <dt-bindings/pinctrl/mt65xx.h>
 
-- 
2.25.1


