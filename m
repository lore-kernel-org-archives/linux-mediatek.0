Return-Path: <SRS0=XgPn=2S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862FCC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6719B206F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Dec 2019 18:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnAnkL6b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOQRbWcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6719B206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U76zeYs/u8MBl9/w+zFSIeQ3OvEPY52Sc0T1oMSOR/I=; b=JnAnkL6brxMnEpUFJqp1yiT8DD
	BNagumJziyMdubx1jlV6GrE3Q17hIbmjOOdP8/tTkCXe0D+/h8ORMMErRp6vzchASANbDYNoeld6e
	bxYVeq6zdEiGzhhOf4Zp6XmIoNyzr1ifyaF63CBFk3ZspTziMwmPCdVnGEsIIB1K5WQ7nc6X5BMCc
	MOaU6C4icAULG/Fqk3H2gB+gzq78dbtUj68/EWjxjEExwn0JxZX4bOcKjVTp0bET7A8e5AhC2RyZx
	T1y4EeYU0hzfGEynfDRxdkOirJNEckmjvqe9eGPd4Kil/l8OJW4uVjG1P2Mriyl4b0uw/vCUsbrfe
	XOHpyf8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilGyG-0006ZO-6z; Sat, 28 Dec 2019 18:37:52 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilGwF-0004uX-BG; Sat, 28 Dec 2019 18:35:48 +0000
Received: by mail-pg1-x544.google.com with SMTP id r11so16072793pgf.1;
 Sat, 28 Dec 2019 10:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
 b=MOQRbWcFusjgAy4ALA0dRNwculnnf95IqWhwN+bI2m3VphYLVZFzUqdeNUJcfF7thl
 8Oo9SDyajObSomXnWDn4kLV7+lz97x8nR/7HN4y5d/JmKKCsuEl1aQrwGrxxU9hi3YAG
 tjBb4iRdN/pj3HarVM+/KzxZkLjXXEHQI+yH/sRvbCys5nO4SWzv7rqdNHrZiyIl2vxo
 TImjGbjwLoYHAfaIsoFlFP4cRJGFO/7eHgxPe1zcjmgBTBwhWCibX4aYc2ek2vXwbxIE
 TciifP5yqkjOxQ6NYC3r438SclSN9iySvH5xd3vVkdWVNV3WTs5Ssh2mceJPkuJNepf3
 +KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
 b=oZHKQMej/KCOmb0ES4152cRexiA1uuxV/XsQGnlOyZE9O1RxypLhNXrz2dsxgkwjsh
 4RU/8ER1u5q/VvI/zeesyd4L9zrAiS3rYtI87IzLa8dhGyr3HW6GD1wJeUuY0Zg/CAqZ
 O/hYbUe0hsiFoqbL23ke1r0BewGtRjLnsTImG6tM4wze179/221BOGphGEqGDzXqFQGt
 mB6WSg0puPYFkeSwj0abr3v3ANBoOrCqY8AAU2XwHtp0WFo2xRLS/mpUVvNvuDMPylEu
 cMyqtkJ6SbLOeiSinLLVxKy6Xso2u7cgdce3nQI4UXKbNUSXQqAdJCnhyoGLJaABbb6f
 dfHQ==
X-Gm-Message-State: APjAAAXbg/0zNwZ+o2ZIqgkqzet8suZjMKFghktSsN8e8mmKxfS66axF
 X4zR5mbCDaRyRBx2AGRVGE0=
X-Google-Smtp-Source: APXvYqz2FR0K8hzJVrRbKbBnQhFSr/aRNMbMRVtI8SoK2qjVYEADTjjwXnt98+L2VAfYvOqI5TwzYQ==
X-Received: by 2002:a63:111e:: with SMTP id g30mr63255423pgl.251.1577558146603; 
 Sat, 28 Dec 2019 10:35:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 7sm35621652pfx.52.2019.12.28.10.35.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:35:46 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: jassisinghbrar@gmail.com, nsaenzjulienne@suse.de, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: [PATCH 05/13] mailbox: bcm2835: convert to
 devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:35:30 +0000
Message-Id: <20191228183538.26189-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_103547_429478_B95EBDAF 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/bcm2835-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
index 39761d190545..79f93c9c7682 100644
--- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -137,7 +137,6 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret = 0;
-	struct resource *iomem;
 	struct bcm2835_mbox *mbox;
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
@@ -153,8 +152,7 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->regs = devm_ioremap_resource(&pdev->dev, iomem);
+	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->regs)) {
 		ret = PTR_ERR(mbox->regs);
 		dev_err(&pdev->dev, "Failed to remap mailbox regs: %d\n", ret);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
