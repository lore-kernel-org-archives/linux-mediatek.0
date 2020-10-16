Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42BDC43457
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E1920704
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fcc+5EYK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OJHthVY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E1920704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8sxspnN+aLa4t2Y7jimIDG8yHxO3l0sOL9B+JmEl0+8=; b=Fcc+5EYKpbkBhQ7K7+6N2UWYUR
	pJQrCI8lmQl0h854N3XwHN6snf1nUvvMbu3uftLd7CTR46LX6FERFNVfOpSiHxQqST+bcNfPOYkZ6
	GwdPk/kNL8cdAfozhP8LQ04WDmTwkkmjr+n2BMNmjdNucblBWRMw+xg9IKeXqil1hYXjmhkNIIpiW
	yfXVvugTHab9i4ovJ3iHrI+NjFWj6y2tgVr6MTiGT05P6RjM9IERGJpzTrvHcWt34Lyj7y5EOnyUC
	9tPwouC83wtxLCXO51HzkDKRAHPUh8uQGIqCJbwhb24PoGm0XXVgJXyTnuofY9q4ljyF3ge3A9dav
	Rdq5GyEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTNV-00066A-5J; Fri, 16 Oct 2020 17:18:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTNN-00063H-Ol
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 17:18:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id x7so3810274wrl.3
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Oct 2020 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxRj1doknn/xUt9dt4A+Dfj/59qnD0jj+WzuGpoEtw8=;
 b=OJHthVY2orfEBGnmd+zroB7jVXNM/DeKLqSGVpZ237xx+RcK4Jce1K71EzuBXxveCB
 ntVMlr1EDOvkacSErILmcMMQ/8Nt1oC8Vl06ljz5KAqAzgzrm086j4KdS/LqFgo3XlOH
 UIiTLYE/P9oOl0U6aivd+z0xxMLbuPEwfDFxjNINSoBeZ5AKFpWKpx2nnYuOO80jQ7Rj
 dWzRPk3XLh3FKhAJlOHVy/+fY9t8gQuQviL02bQK1Ew8kAngA1Z2GIjFbtoVyKE8JSUj
 RwEx4mNmjXS+DobDktwxFxVmyIcwuUCsTeVT/2MtvdjC5FWo0sFMbL2rLyV+8f0Y2qPm
 Ry6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxRj1doknn/xUt9dt4A+Dfj/59qnD0jj+WzuGpoEtw8=;
 b=AZlfNI/YGj1ljUQAV9SPA58KGpnxfg8kJLHqlBydgsX8druACL7IT+iCFk4J1PVYme
 tO60WLS9muuzHn37h4T5ALBfAgBpBDryFy8iWIT8FEZT/U9PcTWtZLvNA68fSGaIruiN
 voE80JDNYtPFyOeLzF2VA1ZIF4ijGwqarYnjK/OFa6qvEWvwO8u8+PK/iyrgASCgg5ND
 XGnq4QwpZXoCN5CZts/ldbgeaS6iQk1W8CkcAfk8B8NGeogDBFCGZMBMcx1cd2IYoDzF
 40OCblYRA6BA7yDJ1a0mTrU0hg3ghZw7c5Lrm6jZSb6AitiAvMdSUJZTcUBq6b4FJbQv
 GZWw==
X-Gm-Message-State: AOAM531tTrBmaIyPDqducE/HOfe9AQvqCG7rwLPl/M/TtPJzh1ZEBAPx
 tBp7c2M2YBr8fEhKL4qJzmuxlA==
X-Google-Smtp-Source: ABdhPJxMMoIjZdN4eGMUPlC37fq6cmHIzrXVd95AulMRGp1cDZLxwZQQ6TAKQp45QX+vpzgJvkntmg==
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr4887656wrx.278.1602868721280; 
 Fri, 16 Oct 2020 10:18:41 -0700 (PDT)
Received: from localhost.localdomain (211.163.185.81.rev.sfr.net.
 [81.185.163.211])
 by smtp.gmail.com with ESMTPSA id o6sm4177162wrm.69.2020.10.16.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:18:40 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: nvmem: mtk-efuse: add documentation for
 MT8516 SoC
Date: Fri, 16 Oct 2020 19:18:36 +0200
Message-Id: <20201016171837.3261310-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_131845_973102_5730DBB3 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for MT8516 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index 0668c45a156d..ef93c3b95424 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -7,6 +7,7 @@ Required properties:
 	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
 	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
 	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
+	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
 - reg: Should contain registers location and length
 
 = Data cells =
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
