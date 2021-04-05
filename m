Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B388EC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:04:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 427CD613C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 427CD613C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pO1aPu3U//c/2TtbjzBBlavfY1YdyQgkTM38O8At9PI=; b=nUC+Qf3hseLvPD84ySVT3LJci1
	24aSZYI7bzW2gfhzPXp6+KxZZXMF5jRjymZJsBfWMyCpFmY/f/5g9oR9gsA8OC9/17GiZrcRXO8nd
	zFPGCeNoFOy9bzZkHvWIvgdsbQr1mIQ/0Kj8BO3F2mxP0DkkNf8N9fFVHwYs4d2YyPSBBT65ckXlr
	IHDXRyc26ouHMmg3hZ9UE8EUG7v7MhYI6f6+uK+QAXUFCwsDF1eOP/7svNsArbE4aMyv/Lynhetvo
	7nTDGyP+2FeWlTTSaFRwJH3ysipdUT44KE2jfO6R1L+/rrUDj6dET6CmBjrO9Hl+NoTp3bcC+l9zO
	/AwFq54Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVSF-000XRz-V0; Mon, 05 Apr 2021 20:04:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVS3-000XQB-I5
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:04:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so1034573wma.3
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JoeUTxMIo7LMD3N8t52A8FukB5jFgXLkXXTJN8fbj+g=;
 b=g73AJIK25WP7XEAoyKc7uRpenUTjoxW84YeeUt/evdm9XIRXr69JfRXYFkGMqzV5Zc
 GLOq1FHgWcnsdC99b/QWDG3U5HDN2zu5WBLYCpn85QVnMBfA8sXYpyDCPsAIxI0tLYIa
 XgkpOommHHa+TIbX4L+25NYFLckVmXa+WcFXhq5IcdTiUFiWSp65ukjESs2uvBCel5Ii
 jdG4lRVNtnm6815RFBeOE/lNW5XkI1JajH7PLM4cKaDqqVcPNwgmI2qFUpqHAWgjjE81
 8CPbdEWde5U89020coWs3O8nXg5Mdy0kAGsghHkIzD4h5RMOpJkA2+HtP6qmDRjC0Yjt
 p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JoeUTxMIo7LMD3N8t52A8FukB5jFgXLkXXTJN8fbj+g=;
 b=BtbO9unETn5VArHGO3rmfR4wWKCRUjZOdZcWg0Ff5pJhyoMoexy5vggDh90+vdzq9R
 1hP88xa1gdRrCY4VBCs7MClogaRbobR8kjzue3kMMCpMhyc4ErZPBgHKYTVk9BRCoSCl
 Wq0TAlC/RQt8qcT2d5FMpSPOXBfosmm19AerSoWvvt53MYmGBfjyX7AwidKF3VqCEJlV
 Kl54CVlbAA2yTEr25g2Kwpb327hGfI7R1iDlWCRJntAX13uB8uSR197ohEybiX9FPeR4
 tisdlDMYpuEC3pMd3bkbVACkDSP4Y+0tJg2kxzRVkp9Ytl8/FaiOazM0mrOcTyKu3JyB
 gfLA==
X-Gm-Message-State: AOAM531D+SViCZUUyWqSBF5FbIjm/6q6Fz9L5g2QU/oeJtle5Jp+U77Y
 pAnSsVQZRZ9zLMtF1NeNkzwOVw==
X-Google-Smtp-Source: ABdhPJy+F/Eu8jOmRExeF5RKu7rRF45ePmTNcKbmTRjD6JUofz2BXs66rVi7VFML/IEm1eiXtHzCBA==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr645945wmc.103.1617653038083;
 Mon, 05 Apr 2021 13:03:58 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id i26sm657406wmb.18.2021.04.05.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:03:57 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: mediatek: mmsys: add mt8167 binding
Date: Mon,  5 Apr 2021 22:03:52 +0200
Message-Id: <20210405200354.2194930-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210400_039568_9F238347 
X-CRM114-Status: UNSURE (   8.36  )
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

Add binding documentation for MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
V2: Rebased + fix typo in commit message.

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index d8c9108c3b4a..78c50733985c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- "mediatek,mt6779-mmsys", "syscon"
 	- "mediatek,mt6797-mmsys", "syscon"
 	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
+	- "mediatek,mt8167-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
 - #clock-cells: Must be 1
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
