Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D7606A74D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bGQpai4T;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RgDBohw6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=; b=bGQpai4TcgrBJkHZCsofHEpMAh
	s8er63RXk/4m/ZqVCLVtZrEJAt6Rf/xPSZRsaTaUl0MdiwbPrnMLQwu5rTiMYzuHBTRLosX/cyHug
	a5wZOnmqonziJm41J22Mw/9JI5PiwX65xUGPTlEPTiKKYW3AbfXJeH1vM7gX2K6TRr4+6g+1mCXaE
	Rt3rtpLQ2X2xMlGIjeyJpNfZF1RrL9QB7U5eZ/Hpnd3pUzTNpNIZ//xM+atV++xjbcyF4lrhj4+EJ
	URkXezRMdqbN70TIG7zTunZUR+F6JCpncRinKyJ0GtjDcOvSJN1CUiC+BD+D0ahI75GhoTpBuLLnK
	OUugrwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQltZ-000000043lf-232a;
	Tue, 10 Nov 2026 13:28:17 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQltW-000000043ka-2Get
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 13:28:15 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-3712b6d9843so1739781eec.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794317293; x=1794922093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=;
        b=RgDBohw6nRFvJ4tcXfd0er/rm6V/q5gr7t/XbY+37Xb7N4MPFtBxtL1DOOQatTaiOS
         VXY2KsvlsyGTMc+QFpZAQpsqYmwJT1IyrLOAzhYAqGP2YOoyKG4Dljl02ylwwok0qVIK
         R3Qt2212AGuiWQGxWV6TYow+ArMTWp0twRb7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317293; x=1794922093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMp2nKVz+I6BoGQGvRzv66hb3JZ7XdiXU/KpflrSMGI=;
        b=05Mvl+5VXcFVBOqFKj9jBgzcPcAdJd5QXxC7fO+bkicAVBt5FRzfQZiHHC7jEODfbP
         9TWoGWaWK6cCSZNkZ671CYeVH/wGKY4WX2MPtp0YdP4AIxIiOJObHjd5nFk5WbGiwQ41
         97JnC5xf0crtbvW+5zj5ZNYDCdYyWrX7gwsOrEHGHKr/hJDVAvp9K/t6vfGA97UdWf/y
         edQ0aQ95nGmYeooj6ssIsEsPvFWq6jFhJztw1MUrsD568rLWOpp1XxnqT8h7Vx/rTEIQ
         lfOlf2lot2GwuhqLAY5cVBy4jzQaAWM5o/XE2CavybEmC7WuHqtyT/Z6pQUxbtDko3NH
         Wjww==
X-Forwarded-Encrypted: i=1; AL+hErHxZb2uNsJg8kXVgDZfx9T5N8OGI1QacMMsnugVFj2crPH9gSeIDL70uNKIEcbS6JLpHu/0VgydVOv2tutKPQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8v67Qxxmny0OV67yTwMYH6GS600iWFldGQhDZ1wlcy3F2rDkFb
	lMRPGDP+V73+M833MEmq3a7ResgrCCNT1LRAyAjyoKIqL0mobpLEWWzj5JgiJlKmZw==
X-Gm-Gg: AYBFou0Yg2xqn+7vb/8nhupWDN674vX4q0G/PwKEmLoMnMAiEiG4NGjj9mmBl8B5NGP
	/cfRQFAybzDCIwKgCw1bbd5kLjyPJe+IUBUiL9MwyXStwDAmQmq+zu8OmBukUFyuaAUCM8gbl9l
	NCzRU698phT8fuwbmMjbguEla84aGcOyJQfFZtMcoWufsOuQf8ipAZYsVScU3TE/mioN7YxSU6M
	TyA84WBFodhR4iZev1eyvpT+hAhofcYhQQS0ftAZSp36QI4zPACsP1jeq2N6rsJ77LgPqtLwijG
	dDOuSlT/hOWb46X8SPB4LuveATez9jUffQsrVZ9gB5HuT1QUW1OaQ2+IPS2iiksrcLwCxq2LlUk
	07ubD2Rojz3Qy9ZFXoFuy28S0twwvTPHahTLPMU7nFhugmKAX86VZAQi7/rBPexLYEL2CrfdyIU
	As07d5NWmiZ2/IcMJZ3wM4JpS4as3Ge+g8qAHrVpElu3drDMy61WUSGlqAGqRvj/NbCpiQXj0Yy
	pxQOl4Eq219o0PMl3pldI0skW5a2CGbl3K6vmhZIG/COSla5RSSNjNeWVSyGZQCudvR+e3yAdEj
	/GQC7wqK8NYhbXGLb3gGbyZ+N/ptKGPxI4iykya0LZu7oCeY+u/lJMb/EE0=
X-Received: by 2002:a05:7300:fa0d:b0:36e:371:8255 with SMTP id 5a478bee46e88-375197c460cmr2832222eec.0.1794317293244;
        Tue, 10 Nov 2026 05:28:13 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:d9d8:9bd:b442:5671])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-37520cfe07dsm7516417eec.20.2026.11.10.05.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:28:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: pwrap: Use devm_of_platform_populate()
Date: Tue, 10 Nov 2026 21:28:05 +0800
Message-ID: <20261110132806.3119114-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052814_633611_165301C3 
X-CRM114-Status: GOOD (  17.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most of the resource management calls in the driver's probe function
have been converted to the devres variants. However of_platform_populate()
has been left alone since the introduction of this driver.

Leaving the child PMIC populated while all the resources used by its
driver to access the PMIC's registers have been removed or turned off
makes no sense. The first step in the teardown should be to remove the
child devices.

This change is more for correctness. If someone manages to remove the
pwrap driver, bad things are going to happen whether the PMIC device
is still registered or not. If the PMIC device is still around, it is
left holding onto a regmap that was torn down.

Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and MT8173 SoCs")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 90677187c3b5..fefe7a41da5a 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2592,7 +2592,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (IS_ERR(wrp->regmap))
 		return PTR_ERR(wrp->regmap);
 
-	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
+	ret = devm_of_platform_populate(wrp->dev);
 	if (ret) {
 		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
 				np);
-- 
2.56.0.506.g506a7eabc5-goog


