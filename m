Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AC8C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5927613CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5927613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Y/AXq023pxGiKswZqc8pxI/4xBDbx/EzC9Z8U6QjcI=; b=1EaF9pdveWvgze
	C7dAVqhcPKYmM8FBgOZ6E3zqOoPMQfAYfCHHa+ypNHAxg3MhC2YHXx74aRbQW6gpalvlBDBEj0lzX
	Co1JKxbjJbFEjxsqejHhLxqs3nT+pPzNYLlLli+REdxo78pMDEbswd1HBQJZK7BMXOTt+qx2GF621
	kKtOP905e1PzlyIJHyjNSOsdbwx07DAZt/aDjyQgzGOq1JmE030WXKd4n3jSSaqqsanNqGvTS2cYm
	s6sOkVeeQ7d/qeXiCm/VL9huB/v6hPI22h60JkTJaOcJYkRt73MYC+q2BXA4OvO4r7FQe38mRySuB
	tYEmae1txAcc+2MecDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfDZ-004zcz-US; Fri, 11 Jun 2021 11:20:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfCz-004zNu-JM
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 11:20:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso5813606pjp.2
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+TF/AKS432hY9gR11OMft7K70W+Hrnb7AyCqWhl4m9s=;
 b=kzB4gw24qhVUKpuUQIjKWomf8BIdL1Fg7KnXflR1IuODTngrvXRCM2ee7VG4kMIYrx
 FraXhSHmF4qCxX9316LNxIUAEARG5YyydibAzknTNpQHsZ0lQCJ/H7FppmO1KHAOqHAC
 1RFGe9fvIDQfXctM/31iLKVAGwldADJ4YvoOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+TF/AKS432hY9gR11OMft7K70W+Hrnb7AyCqWhl4m9s=;
 b=oNN12df4vWZa+H+BGy/UpYoCbLJ6Wt51cK0UjMr5UGZlKbU2fW56nzWrGbVTabvoBh
 FnOYq/3UK4hyK39gqbglop3w2UBhdkIshSI4DodGUZGrBB15dmuCqD4toZmODxj1sGZT
 3gOCjpvtY+1Rw9Lb/fZyYDHXxlcpEXcGxoRsqnK5Wd3z9gQccU33gWRmF8oPCEivEQzA
 2NuZrMEG0gxbpMJeBKLHZVzoD9bhIB/yjynrtKd6RgsPrywXfbEviT5xv+2dFpr5gWr+
 7LqLpEIxRSAV645Ifnehli0UcnXlLuTcVb9WhWKBRgUZCmuNdhdYvfSzHq246YTrdTJp
 Rb4Q==
X-Gm-Message-State: AOAM532PU39DIVkCdW363rkaV9B+afxJ/Ag+sGLQhT4uJqU+kBO03sQL
 yh1ASKNNGhFtmnWMH7EuBDTn5w==
X-Google-Smtp-Source: ABdhPJzhyiMKNoEeS0T1XF+LkKWfd1mMcozpdh1MQXRAbZevrhSbdTNkCMSX0EPOoKiVskph4615Iw==
X-Received: by 2002:a17:902:b909:b029:113:d052:9e27 with SMTP id
 bf9-20020a170902b909b0290113d0529e27mr3437886plb.73.1623410416401; 
 Fri, 11 Jun 2021 04:20:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:73d3:4412:54cc:752d])
 by smtp.gmail.com with ESMTPSA id y5sm5177189pfo.25.2021.06.11.04.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:20:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v4 2/3] dt-bindings: mediatek: Add mediatek,
 mt8183-jpgenc compatible
Date: Fri, 11 Jun 2021 19:20:08 +0800
Message-Id: <20210611112009.2955944-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611112009.2955944-1-hsinyi@chromium.org>
References: <20210611112009.2955944-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_042017_671696_CCAD101D 
X-CRM114-Status: UNSURE (   9.00  )
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

Add mediatek,mt8183-jpgenc compatible to binding document.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 28f26e79fcb3a..e4e791d76cdaa 100644
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
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
