Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAC3C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D8B320789
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wSgU3SK8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ho/WCQgs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D8B320789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X2saPiXYC/AnDFb9R+hVUFniytGDXoKRagz2VE/8sXQ=; b=wSgU3SK8rcZ0FPm4BwhWAihks
	2c5UtODTwjmOeaSjKNKR/I+2MDusBIEsrK2SLooAXEvR/GYAgr85KgARuKYUmidtvBgoGa+aBZO8D
	mW2Nwvsrh4tXjmEtbpr8Sf08elbjp29HMUcB+yv5S8Ekjh8r58AWufsBx+MIUx6bhhcyZJAM8VfKl
	pWoL6SUSr+rNgl5B1uKlSRaABct/SwqO2O5MzzdrvCcm+wSf+kriM4KOmL4k6jRXD7QdIN5V0oIrL
	SrTXkn2QuGlLU4ZGHxt0IkW8ioZq5PY0ngy2WTCqcj1GTjpiCUsakOfyrxTRgR+vjrm3skUiOG7Ew
	qdQcRIewQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBoN-0008Pi-54; Fri, 18 Sep 2020 08:32:07 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnr-0008Bn-PA
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 08:31:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q4so2776552pjh.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2020 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvN8pxwgE7chvCn8eA4GpYEwznUZIJ/VvKJ2b3Qxwd4=;
 b=ho/WCQgsyP2T8AA27LL0ARkfh0DQbo2WgLWH5gjFVNaznwRwo+t+ptG595Pu6YLKGw
 qhehK+iBJs4G/tcDQjcXcOnFdqIanY7E/JPg24pUtibT4vfys6d71/FmGjVFn0E0Mzgh
 hpmCCmwd6/MU0P3i5PsfOmM00Dv5mJszaEVeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvN8pxwgE7chvCn8eA4GpYEwznUZIJ/VvKJ2b3Qxwd4=;
 b=MzcRtIhiaZk5W/VBaNYAqwXx+GEm5KBmDlA4JAjiQBPXmplU3yiqjsW3PYGO3M/y7U
 dcEg2Tddu375qF6ZjY28mbQZ/v+eMjS8Ciq2NThAkpFsGB8qvXw8NOin6mQfuePH4mAU
 lrvFGyP9HqTtDfVQ80JB9rIB9/nnxLUjWDmyxY1H+FU1JBu7zqgP66sg8Sy98LzrfiBp
 UnqZH/+0SdIGWudUN/MNxmkxDeThe0bRsaaMsCV5oIx8RrWImfzO4tEX3R5s16UStbf8
 WQITVYDsHE2UXshmReSQH7vT84DtHwDBYFSgb3sOr5tI8yl3P9p1Qcb8wIi5wID+O3nS
 3FlA==
X-Gm-Message-State: AOAM531gQag7fr7VUvR3LgDw5VYsCSCFKAvqKGjDeFhbWZT7kBWtqcd9
 OR9JahZmXItnTA8p+pIEkttpQQ==
X-Google-Smtp-Source: ABdhPJyawkWvCG6/EAZZzyOFtimPgIC4x1PEVJj+jcavaFIrRX3LyKeVJ3w44lldJhWt/SyimTAQ2w==
X-Received: by 2002:a17:90a:764d:: with SMTP id
 s13mr12124753pjl.58.1600417893754; 
 Fri, 18 Sep 2020 01:31:33 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:33 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: spi: add mt8192-nor compatible string
Date: Fri, 18 Sep 2020 16:31:19 +0800
Message-Id: <20200918162834.v2.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043135_894537_E2556570 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for mt8192 SoC.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
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
