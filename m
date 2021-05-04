Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03AEC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 20:34:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FAC613C5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 20:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FAC613C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KanpTDnD/dLZ8cScE9zpUaegQ+TJkGCz+bqpPOh+eC0=; b=cvjkD7OnLqpJ6HKgrZYW6LIO4J
	59O3UozRtYzLF+WmaTVGZSCdY7a5sZ9HsPRkI1fSmuRHknHqWbKlPp0qdeivluE0s6vteUzgF5nxw
	jsZPWP/8e01PIPXUOOxibcC1SmZ1AKZL397DaUdkdP2sNKAZrl172bY5GJV0fedza+7YNGEiG9iH5
	MdQr0Qy6DrOeFPxKaV1GZ2snhrzB27EVjGwz3ZCJCpXJt26lkUyetWryeuQ+7TCb9hl4XJHHViq+z
	7E70E5e+Pxr+vbpQqZjbCPb/H5ybtnDBkVsPFqRnPwmQCNeFvDRWt0sZm+TBtEHqj49n530tfij77
	sms4I4Jw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le1kQ-00H1lH-Pn; Tue, 04 May 2021 20:34:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le1kF-00H1kL-5s
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 20:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7CsCQyKWb4Id6pS3tG1LiHnkyEwh94sHJQJF/VOYB7s=; b=WUV/EQlypvMbLL5iIlRkJ6SenH
 M//DCrVlP0Q/1Bwp2sPVHK8KjesfSybrLDa8HwcmQlJHNMFp9J+WjH28pG9LDBfanLj4706Cy6qIf
 HHO5xnNBHK6eKhe2g7uz6nKACSBS3MRpcuGAgu4mMh4Aq6Lk0xplvgm0ITFsRztSEgpI02UgE019e
 Hx6u1Y9DYls03lK7mb6iMcEhwqpaFMcX80b/EF4hglhwPqAV7L7SbkXmKuI4huyV41D2DhERxutoC
 DNkMnUg8tSsD+ly82Q3UE7ugNzsrJ0aHX1rw07vkTH+tkv9e+IMrH1jVNc4diLo7XojHcVnHGCn5z
 7S9q8BXQ==;
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1le1kC-004Fvw-A4
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 20:34:13 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d69 with ME
 id 0kSX2500121Fzsu03kSXNL; Tue, 04 May 2021 22:26:35 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 04 May 2021 22:26:35 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: b-liu@ti.com, gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
 min.guo@mediatek.com, yonglong.wu@mediatek.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: musb: Fix an error message
Date: Tue,  4 May 2021 22:26:29 +0200
Message-Id: <69f514dc7134e3c917cad208e73cc650cb9e2bd6.1620159879.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_133412_493017_856F871D 
X-CRM114-Status: GOOD (  11.51  )
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

'ret' is known to be 0 here.
Initialize 'ret' with the expected error code before using it.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index eebeadd26946..6b92d037d8fc 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -518,8 +518,8 @@ static int mtk_musb_probe(struct platform_device *pdev)
 
 	glue->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(glue->xceiv)) {
-		dev_err(dev, "fail to getting usb-phy %d\n", ret);
 		ret = PTR_ERR(glue->xceiv);
+		dev_err(dev, "fail to getting usb-phy %d\n", ret);
 		goto err_unregister_usb_phy;
 	}
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
