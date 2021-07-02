Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D3C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BD361410
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98BD361410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qGgF8B0QTzVGl40csCXP8w8pwJD2AZzILWRTY/KOCA=; b=IRIeP+6eV3KGBz
	teynXB+WDbEyCliLjxncZlWmlumaWpxGlAnHiQdLC3UlrKKyCkbfjEesCcELj6Q1kvxhC6ttZFwnZ
	Mc0xE+j0y3P6k44nu/n//YlgQNM1sjX7AwnfANRob2kNIk5EQh1Lpf0M/vx/rGTRZfqBAhDuJ7L84
	/dIHQraGJnq9F5JBevir5ssu/INRvXNDP+cq3DQlq5Ou5B+An+Q3VqVcBqm0Nvfv7R3ex+LgrjiPp
	tOfC12fYMKugHfmNffst0JSDTf3DUT5s9SwFyIrdUVSPQ0XJpW/ljwSOknwmGTT/zBsjyHSq5L+5q
	5hRKYbglxXqA8aF3m7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzGKc-002kre-2Y; Fri, 02 Jul 2021 10:23:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzGKN-002knO-GR
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 10:23:21 +0000
Received: by mail-pf1-x435.google.com with SMTP id x16so8509126pfa.13
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhoYD5NgEf4BoTnpIK3bxc26o2f3DMv5QYbRT9lyhY0=;
 b=ei1C7w4C7ILwqSzLafB9/8CxwhsIANZcBJoELDjHYON5cDQwlqXriDSKn2Q14wem6U
 CynjpZ4A2/H8qW9XN6UcfOUHVrH/WFLKZfLQUTilkI84+4dFHoVgtlZTdqnkdZMirvgN
 OLlUmlp5Wm2mrB1Gmr3KYq7DOhdP7BHGJB37g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhoYD5NgEf4BoTnpIK3bxc26o2f3DMv5QYbRT9lyhY0=;
 b=PLtoCDUGjiMz0z6nnkP2Zn6Kg44Ut5VvePAUXdJu8ELgnsiWt3UuVnJCmWSeHSyUp0
 j9eNG5Y0euuTknIdy3L57q676woKsUfNGsBL9oXVkcTg/gJ8u5C9i8x2Qn8MyFoaBxyI
 kQ3Moe/9GYw6w/n7Vo/ruDQ5q4DLhDYVEVCn5eVUEIMuNT9aN+3K32Namv0eMvmbIdpr
 wdYJW6baL/DC0qWSR5yUL3hsw7WuBJKgfqh29GAKeN9I32grKOAKy0AtxzGgJBLWrKjk
 lAUEQPFbwEIV3CvivlscVg4Giv+aABz/niidn2XEy8f9ciKZliLUrM+Bq4Vk8sJIZJRa
 uOeA==
X-Gm-Message-State: AOAM532n279ZOazjjojQQxD9dQ9neekHsrwrh0ypdXjPMf/fOYNTtYUi
 gv63MRsmVzxA6FptVUfmD5pIEg==
X-Google-Smtp-Source: ABdhPJy/ZWQuZSLe/dkNz3Q11/wNxXdhcy1mjRjSeGuCv7THVpU48WmxfkQul3NL4GEqZ3CiA3JC7Q==
X-Received: by 2002:aa7:8f2f:0:b029:313:f1e6:d576 with SMTP id
 y15-20020aa78f2f0000b0290313f1e6d576mr4457944pfr.25.1625221398436; 
 Fri, 02 Jul 2021 03:23:18 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b63b:3ac0:4dda:fdd2])
 by smtp.gmail.com with ESMTPSA id d13sm2863484pfn.136.2021.07.02.03.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:23:18 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v5 RESEND 2/3] dt-bindings: mediatek: Add mediatek,
 mt8183-jpgenc compatible
Date: Fri,  2 Jul 2021 18:23:03 +0800
Message-Id: <20210702102304.3346429-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210702102304.3346429-1-hsinyi@chromium.org>
References: <20210702102304.3346429-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_032319_620073_122A42BB 
X-CRM114-Status: GOOD (  10.11  )
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

Add mediatek,mt8183-jpgenc compatible to binding document.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5e35ecfd21f1b..fcd9b829e0366 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2701-jpgenc
+          - mediatek,mt8183-jpgenc
       - const: mediatek,mtk-jpgenc
   reg:
     maxItems: 1
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
