Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EACC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453A1206F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLpg8Cr9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="z09pplDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 453A1206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pIm6ZOmA18jlcOeA9K6ngrKqdElRzO5VhQ6KwLvyRk=; b=XLpg8Cr9R8taiN
	zB3JgEjsttysdmAczG/dyYmNb08GjJGhmeNE0pTCkhbi4aBTAw8lR2yKua8mMapJQ0MNYnBdceEYV
	by1PxB+sHXXDE2v4oK822pKFUegW6UdqzlQahABq9CfCzh73h05dGryVWQkgiL84EqwzaZLXbYrLH
	NMAJwVfLucD4ZOd8eFcisuyThDl52nisRDg/9XwtYsDVD76sxll7KQKhoNd4PbxXczK5orAlNOKaf
	6I/3vJttjhC4rb0QLX01SLAoqGe2ln5cBamkXjRRV27IxNDqexP6pj8uwLQLSOmocX7arB7Ba7PIy
	XmThQyYMz8bMpw0rNIjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6Td-0004QU-1f; Fri, 22 May 2020 12:08:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6SU-0003Hg-MA
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:07:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id f5so1335921wmh.2
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
 b=z09pplDzbGu8zzHYZwmUG8WYuN5QnZoIThbQYmhBMWEdeanmgiQmeEaOJAAsMBH5co
 Vc9SJuMdt4nXdaLIqtA5xDnvUSVBnfcy8+HUHt+7XekAI9e36/NJH0qHuP3oPkZSLY28
 LxPlZYlsDw4W1ckHD0Es7lqGaXILSlhaTD2WhJ45RQCKFru6rVsyfbYXPtNE6rVrSQRh
 IE0Bnp/5oPPCepTQASBnHTtpJDXwfdNkKtDoTYs/yLZbblVMktuo8Y5utgxPeh07MRaN
 2JzjgOFu1d/xixp3xct7DO4Siv8YXryeMOIM+u9ZZWnonUMTeRGBc7bTnOhr9As4Kam8
 2eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
 b=OFKykYk5RMivsFQE4qFkPU70rJ6Zly4AZ3byC5XTg9INzkMzLziHwawm9OHSm5xPPo
 HRhCe8jWJDN3o27wHAJCfcKQXyptTN904nIqBCku+uL8mEdph14mYpePqIGgG8XtnZH6
 UZvm/8pYU3wL8SX7YWRqagxDIXaA+dHUgr1HOZkeDLRpZOnC6jbrfWEF216MdDE+sYh1
 R9c0XUZAOOoBHR7qfxeSUe4ZO12PMM6Bh7dt8rCwCIXK0p2AtUGZLVAZKUWDSrtN29sC
 tVDVCuZBh+XdqYR+iUb6d4ECXusH10Oc/kvdL8PY4+1HysoEaoTxMsLAk9mB/3hXCnVu
 vCPQ==
X-Gm-Message-State: AOAM531wap+UxGcc0/ZSPej15waOsvNy2P8a/4qWKnn1SWiyDVoXfhLq
 bVgusaoHKqE5Q/hQfHtRUQRMKA==
X-Google-Smtp-Source: ABdhPJw0hJl3cQP5flK/6nQax5Ceb2AK3ZRifZ2de+tpHbVYDyDSC0mU0F2KKkWDNbi4cMfQO0bWhg==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr14046163wmb.185.1590149243221; 
 Fri, 22 May 2020 05:07:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:07:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v5 02/11] dt-bindings: add new compatible to mediatek,pericfg
Date: Fri, 22 May 2020 14:06:51 +0200
Message-Id: <20200522120700.838-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050726_740143_CBB9C94A 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The PERICFG controller is present on the MT8516 SoC. Add an appropriate
compatible variant.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 1340c6288024..55209a2baedc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8135-pericfg
           - mediatek,mt8173-pericfg
           - mediatek,mt8183-pericfg
+          - mediatek,mt8516-pericfg
         - const: syscon
       - items:
         # Special case for mt7623 for backward compatibility
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
