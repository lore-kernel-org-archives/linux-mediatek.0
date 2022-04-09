Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7mLTTG8I/GRRL30lKm7F/oOuQ8/qgQ6jupE/8M4ZNPA=; b=Dju/Mc/uKEQzUO
	LuGWeq8p11uIx1sFpmO7X34UE265BbJT8W1eYxF1R7lfMhj0+66zApMjBNPmJe3yMB4kmlmXfQqMl
	KtpiVcvCrKIt4cAHfYFUoCprnXdirN+3TaPRGWm/9iIaaPbpUCAGqe/HJ0OU0GRpTdt5PbrNp49gw
	wq8qmk+NH/w0mUjpnqSCoYFsema6ClW6Rl67ul6EwyYfTsNGK0PNgzv2NldS+NXtmeovvXYPPwH9+
	9ClWVcCE3pYGAMLj508C8rSJbqaceC2KVYm2XuZ7adEO++vZfwPHuWVdEpkT1He6ABQr6Lfuj+eg3
	zO8VX97ofM+ngNy6z0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd8pT-002sdg-Sb; Sat, 09 Apr 2022 11:00:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd8pJ-002sZi-LI; Sat, 09 Apr 2022 11:00:23 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KbBtL3LfMzgYN2;
 Sat,  9 Apr 2022 18:58:18 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 9 Apr
 2022 19:00:05 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
 <matthias.bgg@gmail.com>, <light.hsieh@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: mediatek: moore: Fix build error
Date: Sat, 9 Apr 2022 18:59:58 +0800
Message-ID: <20220409105958.37412-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_040021_914921_F72D38EB 
X-CRM114-Status: UNSURE (   6.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If EINT_MTK is m and PINCTRL_MTK_V2 is y, build fails:

drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_set_config':
pinctrl-moore.c:(.text+0xa6c): undefined reference to `mtk_eint_set_debounce'
drivers/pinctrl/mediatek/pinctrl-moore.o: In function `mtk_gpio_to_irq':
pinctrl-moore.c:(.text+0xacc): undefined reference to `mtk_eint_find_irq'

Select EINT_MTK for PINCTRL_MTK_V2 to fix this.

Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 8dca1ef04965..40accd110c3d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -30,6 +30,7 @@ config PINCTRL_MTK_MOORE
 	select GENERIC_PINMUX_FUNCTIONS
 	select GPIOLIB
 	select OF_GPIO
+	select EINT_MTK
 	select PINCTRL_MTK_V2
 
 config PINCTRL_MTK_PARIS
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
