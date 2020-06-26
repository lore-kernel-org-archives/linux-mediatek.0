Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDC0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FB92158C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S3u1IzWW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2EBCVQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FB92158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YZ7AlPjMM4nWCvJieT8yck0rcfVkki+RZcJlHI9zCw=; b=S3u1IzWW3PxlRc+zw4fehloVd
	8zer13IEqT+M6Qx+MJSuAcs7fhhNOF18XmtrCSSuuU/IP+Z05toYsUXLKiiUxCgj1WrY7ZXU3kDwH
	aY1WG6GNrC2eKZqQoPXC0MlwQhG8+7k+uLLeZXD0y9uN9hWCcEswUe8KQiGK9hGz+V8Cc+FwizVvI
	D+MG7T9MiuY4WkYs4n+68ofuBtIZgNFT1gBAS13XbJp0dQuRVn1Rn9dVSSrNOajNmRC9uQT35qkpV
	L3hq0sqOHYLKAtqJzq97qhwO/WeqnZfcvso+HwdacvBQhzhZl8ucFNj09DC/bB+BH1jmCmy/W1U9/
	ftWre016g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol10-00035A-L9; Fri, 26 Jun 2020 09:51:22 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokLh-0000DZ-Vr
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:09:01 +0000
Received: by mail-il1-x143.google.com with SMTP id t27so2862765ill.9
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EK21azx3U+MX6plvAOsvSL8DWdtKiCwgYO42rwHtnU=;
 b=l2EBCVQRTZ1GvNRGorRxQ6hXJXjOjoDGYnvKhzHO+DLJU7s+7wLVA9NsIXmu6asZzH
 13vUknQpNnorfz87qepVpXQWBbbuLj6lQ7DY+7mES6wDd+PKKguz+rNMBemGCHtczyDV
 /KHM1hjyoTXOmFIO5dl3tV+SR6IWtz608dIx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+EK21azx3U+MX6plvAOsvSL8DWdtKiCwgYO42rwHtnU=;
 b=I24VAb/5Zs0t4MZZ++5hzLWSbaw7x8RzI8QDaM9Y7prIluFIEMTF669qmz1tMamvvy
 yeHpkOhVv0puMinwcjeQHi/6dxCG3hgE+r/EhsZ2mqFznrL/Fwq9z6geEOvMulgjcEZp
 G7CudDYfm7Zs46U3JtHjU7GTW8sPQe9wG2TG0I3KgrzhAbt6pnoG5npCAIYXrh/HxN3+
 QzWcVHXKIePZMxp38XQiWuWAwJJu8YyCKJV/pCu8F/elIwcpzMXx9Qq4IhbTSh5V8Qd7
 gLirp8A3uRgkiJLPcC4sbMru+S/b9gJzS1GUo/qvfMwhuU/9pOjf9QVJYBdxreSqEWxB
 1i1g==
X-Gm-Message-State: AOAM5316h/GNmkOSxSXbZcVnKl+/GRh42ZehwllVtOfNb5LskLyrtsh9
 5Hg0h/AYn8lFAf3Vcp8mCcey5C/fdRA8YQ==
X-Google-Smtp-Source: ABdhPJwcsLeI2i7wvAzzhzjrDVGLxbJKSHWqgsBFUOzN0435v6V6qxxM741pfFYX5NEcBlUADnWc4Q==
X-Received: by 2002:a63:f1a:: with SMTP id e26mr1742157pgl.80.1593158759096;
 Fri, 26 Jun 2020 01:05:59 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:05:58 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 09/18] media: dt-bindings: mtk-vcodec: document mediatek,
 mt8183-vcodec-enc
Date: Fri, 26 Jun 2020 17:04:33 +0900
Message-Id: <20200626080442.292309-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support for the MT8183 encoder has been added, document the
corresponding DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 7aef0a4fe207..8093335afecb 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,8 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for encoder
-  "mediatek,mt8173-vcodec-dec" for decoder.
+- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
