Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144B0C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T4LQmIvHwLtbJAbzhDPj6uV/AwFsSMKu2kC1edSppTY=; b=U6i5dAnEiM301QVcwECGdonZ1v
	+GztxA0Ar1tSFJZYLFxEljZIRqVrZ5air+UN3BDWf8/EdSuhIHXfA6qPZ22Uf7S0xsLzPX21Rv3ii
	lRxlzIaVIUNd/IwQeOHvOSFldkItuyevjbERYnXp1tPj5cpQrA24fESdGZiJOdmNQEjgS9sEA2j1/
	e/Ft/XrQAsSwhaZl1nbEvDy5xhJw1Kuc5j/6ED1HWeXlj1VONZL+EXNVaOnKcNoqujEmcI9CnW3ZP
	auYIRZ1mLfleegrSkhVrZrp5dFYMTk9DIMWLv7ECLpIt3WI4F6VIKe/c5BjtmJyWmN4GlW9Kf/wWv
	G2S4J8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVxr-006L1d-1l; Tue, 09 Aug 2022 20:36:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVxp-006Kzv-3k
	for linux-mediatek@bombadil.infradead.org; Tue, 09 Aug 2022 20:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=T4LQmIvHwLtbJAbzhDPj6uV/AwFsSMKu2kC1edSppTY=; b=Bt69u7GfEsy9Z4natlaKAshnLu
	oS/7f/ET78MArX9nOoPj1/Lz93yGkRu/Xh07+QXNZ47BoWhKtueDDxpD7NKBPHVmIgErlnPmhiRiW
	HTspJzFlMYvgw7TgYpay6zrLwUPA+VhI7EIAECPIqZx6dmeGJvRBDc4LL94ln+deigDYqeaJ+mH9j
	CY6dfzIG77dEMQMfSQtv0lX4rEObtSIHOFVI7X+Cg+Z4agUKw2A6vYCG4Cac+pp3JMxumXsAjCiy6
	iPr7NqrL3u3PCJbOUCb6HX9FzQ0q4j2/6akt0AIgXiN7aSxx5QgvevQ9RY+0WJTBDWUSCX5GbfsLT
	WvnWJj3A==;
Received: from smtp04.smtpout.orange.fr ([80.12.242.126] helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVxj-000bIH-S5
	for linux-mediatek@lists.infradead.org; Tue, 09 Aug 2022 20:36:29 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id LVqKodyw4sL0zLVqKoORai; Tue, 09 Aug 2022 22:28:52 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Aug 2022 22:28:52 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] usb: common: usb-conn-gpio: Simplify some error message
Date: Tue,  9 Aug 2022 22:28:42 +0200
Message-Id: <7505a9dfa1e097070c492d6f6f84afa2a490b040.1659763173.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_213628_034813_96A6AA89 
X-CRM114-Status: GOOD (  12.79  )
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

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Fixes: ddaf0d6dc467 ("usb: common: usb-conn-gpio: use dev_err_probe() to print log")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Change in v2:
  * keep the message on the same line of dev_err_probe() because the line is
    still < 100 char   [Chunfeng Yun <chunfeng.yun@mediatek.com>]
---
 drivers/usb/common/usb-conn-gpio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index b39c9f1c375d..44c5127175b7 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -208,10 +208,8 @@ static int usb_conn_probe(struct platform_device *pdev)
 	if (PTR_ERR(info->vbus) == -ENODEV)
 		info->vbus = NULL;
 
-	if (IS_ERR(info->vbus)) {
-		ret = PTR_ERR(info->vbus);
-		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
-	}
+	if (IS_ERR(info->vbus))
+		return dev_err_probe(dev, PTR_ERR(info->vbus), "failed to get vbus\n");
 
 	info->role_sw = usb_role_switch_get(dev);
 	if (IS_ERR(info->role_sw))
-- 
2.34.1


