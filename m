Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3725DC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9136721D91
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HanG48Le";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LOOOW3X3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9136721D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K03OxR6RL3I4DA/B8IMOdlc+8RS2FQ6hw6giJ8ZExlA=; b=HanG48LerVL9bETZxAqBWCaHL
	TV/hfMDvbEkT1+Rg5Axf0YdNjp/W8LscxC32s9nZ4kMT1uIRB45ZSkCeWaTMCkXcR/g6iCdYNJl8J
	wuCMf6hOlTdtZhsZXohQHrrT/sR2xk32pEUM//GZ6q6C/aYABqlUo5jLgnbM3KxhhNy+foY3WWMtV
	2/P4M5S1xR2aQ5IvwEW5M905ddCzgGCszmf7bpK76vofyd1huLo6Smjy6VTyc4GjitpCEI23Dr63b
	apLqim6jPIos6HecxZyp0gz02zC81bp4B6lCwtgpyD+8syyAkkirjs1tRkEUY8NdEf8eHzKwOVasX
	0oIeXwsGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhct-0003SY-1R; Fri, 25 Sep 2020 06:54:39 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcm-0003Oi-Ru
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 06:54:34 +0000
Received: by mail-pg1-x52e.google.com with SMTP id y14so1708781pgf.12
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 23:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdE7nLvEFj18RV9A2g392hZIV3ihv+vkUnf6hZyZUiI=;
 b=LOOOW3X3ilRxghcGS6kesPqVSpVDVzHB+wJ/pOrMNeujL2vcH/fbrSTfaTjDw5vAjT
 VK5mCz6OUBRPj+obsf9HzaQt7++4c8INP61tk0DmPbOf3C3CuwsYaSz+myXOuf7KlyaE
 ynLNjxG1dydzIlg3SUspITMegtmEZA8OjMIOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdE7nLvEFj18RV9A2g392hZIV3ihv+vkUnf6hZyZUiI=;
 b=GV1f2KtUtR2X0+YhPSy1znisnr4HYsq4R/jyG+tN0IfwGzf2pzYwS8OhtcCSV6Wsit
 B9T4NP+m2iIiLH6lvXcfkehKBv+UQN0Y+5KIfCcYKRK98s6qd/DODNHAwHgztX+p/Oig
 q5VZAQAH8Ny0WytVQxQTbpchHqNNDhr+P5bG/ymLpgt4ML+hPM6G6skGmcX8LPL7lsy8
 2D2Pa1yiY2Yh/hDXAogXWEW90CVFv07WbCfyHhlzr4uGC550rs1ZK+RxTk+XtCK8pf92
 mWOK3Y9RkfAVlC8N/Ygnr3nbEFZUqZrqRgVIyKhf+bXMJb7CZuVPyI7H6K4uPV9ifM+N
 78LA==
X-Gm-Message-State: AOAM532mvOT5DN0KX0aotNwX7XQO2PpC0t8R+GneLJ8s04P5KYPyLh6s
 CbF9AG0uVovn1IqijiuAKL3Qiw==
X-Google-Smtp-Source: ABdhPJxeXe/jApGVyUA65xnQpVIAMUd3AY9UUwRBr8ghMbWnb5Si2clEbVRamnuUhqstE+vlnH9yEQ==
X-Received: by 2002:aa7:97a8:0:b029:13e:d13d:a105 with SMTP id
 d8-20020aa797a80000b029013ed13da105mr2777875pfq.33.1601016870507; 
 Thu, 24 Sep 2020 23:54:30 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:30 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/6] dt-bindings: spi: add mt8192-nor compatible string
Date: Fri, 25 Sep 2020 14:54:12 +0800
Message-Id: <20200925145255.v3.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025432_965180_CCF05F56 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 spi-nor controller support.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 42c9205ac991..55c239446a5b 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
+              - mediatek,mt8192-nor
           - enum:
               - mediatek,mt8173-nor
       - items:
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
