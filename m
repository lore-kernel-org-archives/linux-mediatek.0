Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3552DC35DF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD2021744
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fg5YoM8A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ixIaKF5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD2021744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIk+ysdRov6CMhKNt6AGPuTvM6YXOshDVfXBsCRgFGU=; b=fg5YoM8AYA+cD4
	vN98Ndv77kQfSWV6RE34GuNQ89vvO819H3UxSBpcsThLCu50WJIdv+xo1hJw40N3VL3pyiHVfjfTw
	uJ6sSzhkw0jBTTrOOhmHgL12ut7XUFvVAALt8TJK4/klQVw2b2x5qME8yH7YH7kbsdGlGrdfs/1Hv
	XhLspLyZDvBzrEJs4tzAIeywDx+hQ+9TUn/q9HemJbmKW5sJMfp0aB9SKeGHdFGEEYkZYI6d4bzHZ
	9AjLJPSXwVzVQfJdMsOeSYp2qXa38tplA4kKJVKb6stiy3zGSVqbnqmo2iZgKpix/mQ+kxQLi9vks
	WHjqVGU/w4e/06CNEeNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Uog-0001x6-Qb; Tue, 25 Feb 2020 07:39:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Unx-0001CE-Ue
 for linux-mediatek@lists.infradead.org; Tue, 25 Feb 2020 07:38:59 +0000
X-UUID: d7f4aa85d0f84f91a5e42145d6269410-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=B5BznUHUuKJwe4ePhTxbIRuKxxbW9yIzrNyklbjyAaU=; 
 b=ixIaKF5iUKoR7i/9rL3zxMpCYnZHBsxKZWmjIhQ7Rn+ei2qDgsm/LjYbcGybH0sDL44RDNkq3ffN2BYyIkjp49+DlWjK1vCpzrlVjDRZeWlQsWn6ljvEwHBs0Ow5w9ACATCNMEp3qOuyfbMDL6O0QxOkjv8ig+gOvZhTlqV66MI=;
X-UUID: d7f4aa85d0f84f91a5e42145d6269410-20200224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1220809837; Mon, 24 Feb 2020 23:38:55 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 23:39:57 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:39:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 25 Feb 2020 15:39:05 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v3 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for
 buidling loadable module
Date: Tue, 25 Feb 2020 15:38:51 +0800
Message-ID: <1582616331-7702-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1582616331-7702-1-git-send-email-light.hsieh@mediatek.com>
References: <1582616331-7702-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_233858_046461_B1C6F557 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

This patch make pinctrl-mt6765 ready for building as loadable module.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt6765.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4cd1109..c645fdb 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -89,7 +89,7 @@ config PINCTRL_MT2712
 	select PINCTRL_MTK
 
 config PINCTRL_MT6765
-	bool "Mediatek MT6765 pin control"
+	tristate "Mediatek MT6765 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 905dae8c..2c59d39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/module.h>
 #include "pinctrl-mtk-mt6765.h"
 #include "pinctrl-paris.h"
 
@@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
 	return platform_driver_register(&mt6765_pinctrl_driver);
 }
 arch_initcall(mt6765_pinctrl_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
