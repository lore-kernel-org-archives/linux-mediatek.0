Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0377EC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:50:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7351B61355
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7351B61355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=baudGJin/lM/EajIm/Nd1XAeJq1d9x0NUg6FmBOMUyo=; b=UytIBbOxL27260PWkzgPg9Omj
	Y2Cs2sMefbbExRlOEuTZpTIyCcfALk/AhSe/o9b+X9e9QHqIv6Mus4rzjOEzL3WDsMtuaenHlQ92p
	XjqP/dnXpUPNF4wG4ZQgtndiEbs4ULUuh4J/ZxJ2EFx7GqkVExHt0L9OIRB1cXEa0Mss1ZkHqFynW
	Yh2ZyDIzDDboUYO5jQp5JLVCpYfcarwdj6rkcB1z5rf1p5xT5D215xUXBNuCH4VTNvcIFcaDX5JQX
	+k0wkIAEakHlA0Kq8few3yYgLXRhIImOnVIqNs/jwjyWpArX/1Shmhm1tW7aUxfWSRRaDmRXoNTxo
	/kviSyxkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljG2U-00334Z-KH; Wed, 19 May 2021 06:50:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG23-0032yl-El; Wed, 19 May 2021 06:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IagDgK6VgohJO/pjzC4dK8hthBHmtse7C3hsDO+Xxy4=; b=ajRgAE2dqh8S5nH77NAs0VnZIY
 wWbAQL9nmggqCC4lNFt32TcnxSFaLpiDKtLkQzymHwe2J53a+zW2LNqN7AVXqdwcdfMbvFVrdomVG
 DnqLx/Mes01DYynSd+wt3lotf5EHvJOubfsd2dja7p50GM1zKh7eaBzYQZ4P6f3pwhQSXrTk+I9CK
 ZA+5dzArgLLyVPKzM/Z7dQez/Lda+wcvfxhjlReYqtArlnEAHc8NBJohPW8iBpoURZkwjLklxrk5S
 yKmMLdjnqCYjRAV//6QSESmvC5ueu7QC6hykLbYWtUqfDOrxG4MCeW0khSFv+EOEU7qqDO05aIagD
 PYrx6rkw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG1y-00FC2y-O8; Wed, 19 May 2021 06:50:14 +0000
X-UUID: c990fcd723274a2fa6bca917237269c2-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IagDgK6VgohJO/pjzC4dK8hthBHmtse7C3hsDO+Xxy4=; 
 b=XExFoxgy4ad9I54h/LSyBsH9ufctEdHTv0vVmLCjjDV9BtX67Rro8cKluda4dzUWHvrYGZ1WQLUH89SNcA8k++0o0cpU57fZoPVSe5BOTkBnpyf33WXmmgJ3JO6i3+Vvsv1FqqtEdFaAW38B++24VKpTISP/vSbnjP2ZMVmR9i4=;
X-UUID: c990fcd723274a2fa6bca917237269c2-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1972636932; Tue, 18 May 2021 23:50:04 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 23:40:03 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 14:39:54 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 14:39:53 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding
 <treding@nvidia.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Paul Cercueil <paul@crapouillou.net>, Lee Jones
 <lee.jones@linaro.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/3] usb: common: usb-conn-gpio: use dev_err_probe() to
 print log
Date: Wed, 19 May 2021 14:39:45 +0800
Message-ID: <1621406386-18838-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 730A46FE6FA82AE1E7BACAD98544DE91B3AC4C7E7FA83417CA21920A6BC81EF42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_235010_816668_357F0C99 
X-CRM114-Status: GOOD (  14.83  )
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

Use dev_err_probe() to print debug or error message depending on
whether the error value is -DPROBE_DEFER or not.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/common/usb-conn-gpio.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index c9545a4eff66..dfbbc4f51ed6 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -223,18 +223,14 @@ static int usb_conn_probe(struct platform_device *pdev)
 	}
 
 	if (IS_ERR(info->vbus)) {
-		if (PTR_ERR(info->vbus) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get vbus: %ld\n", PTR_ERR(info->vbus));
-		return PTR_ERR(info->vbus);
+		ret = PTR_ERR(info->vbus);
+		return dev_err_probe(dev, ret, "failed to get vbus :%d\n", ret);
 	}
 
 	info->role_sw = usb_role_switch_get(dev);
-	if (IS_ERR(info->role_sw)) {
-		if (PTR_ERR(info->role_sw) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get role switch\n");
-
-		return PTR_ERR(info->role_sw);
-	}
+	if (IS_ERR(info->role_sw))
+		return dev_err_probe(dev, PTR_ERR(info->role_sw),
+				     "failed to get role switch\n");
 
 	ret = usb_conn_psy_register(info);
 	if (ret)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
