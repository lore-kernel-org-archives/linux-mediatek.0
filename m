Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89755EFCE37
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 19:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=; b=ak3Ce0cKnqTgQg0us9wdkrXAZQ
	mceyitDrkpiYd0tDXFGcLsILuldYVdNI982gryZuHZ49FEX1UQg7Y7IlATNm15h8DTKkBWz5o65P4
	hu1qH/FKWM4GEPQQ24jVaRr9jeM3bMVz185Atu4bSteO43T2pLB5LXoQFPiQtZNV6yxebI5efYmXf
	Dp1P5fDUPBONEwu3mFfzOh5OlVEdxX0JOEK8qcG8RDV07rJujB940rx3EA/x/2zBMJMx/HM+nulbI
	PmJDfGoa0AtY/NR3e06z+4iRjPGTAw1wTL2GxaGfDFXFL3GNG0H1a10FKBpbHE2VbHiuZaP00rMUT
	JnBiZrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpt-00000000OYA-1wIc;
	Wed, 04 Mar 2026 19:24:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpq-00000000OVz-26vW
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 19:24:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8273e0fb87aso4076412b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 11:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652281; x=1773257081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=;
        b=kLJT2tdwzjgxmGMDBPyeGbYnTBgO2ir6j9irOs0DHZ/S4jHyE30iiRvTD2swHpFGu0
         BSAz+BXnYz8tgqq3xdJVh3+01LYWnff3E5aIunNmitJ7PdLauiodpuuMxrTWj77s9s30
         JBb0rtmxGeRczwrEw03R0TIDw3ugP5FtIB6E4CW9y/1EQrfuDf92PFgXddTW7y2zS4p3
         VtJTESs1ehFjvRQc/0wbWOHtjra/D/Ua9+2jvxR88gLVXZyKBcRRGe5bQDAtcUEYz49T
         RrgjFLMxv3jOdkKj3PjJRHsOjhxqkOwMJKHImpFXaaSXuoiKVVnsWsdxAChwRzkYySCX
         HuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652281; x=1773257081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ecl+MG1Yo+TiJvae6jV2u12ntROXHec567OXIz7U1Qg=;
        b=IXAB5gCiuirWNsnmihHtZsaPiMQRdtTh5Vk0IyTreHCEVnBgxjUobBI9Fz/XHJJC70
         StCUQIKbiqXNMT2Jm+2RlRUApFTz7koxBYf+h3g15nhC1Y3lhHctGdms9n6AKg4e8YXk
         4qOIwD0l1WFYMqJL+qPBy6tBb9SdARfBhOJ5UP8rYDkW2wf1kn7bXoHrXgvf4PdrmXZy
         78Zxg9y0qzCg/OpETXdRE2/DxAPZBsqS7/BvhuoC9WA8nRyQoo3FE0T6mOPEUpz3yGCv
         21GXyVeVqzaLaSEX/4hyP3P4LNaOxudIEzNUEvg4R24Tt2+Cs3tw2lGwERPw5/o1FfOv
         P69w==
X-Forwarded-Encrypted: i=1; AJvYcCWos+sp2jDIFVitsltAV6YHGzCX6mFC0I9pxlc/DhvPR7p04FRniIFh5FHNfFVBu07+yIZr5t2ElEO8HVhMAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIwwhclf9hL5LoQcv77ekLEitpdbJ+THvYEmmGHTcbi0+eL/7
	IAqugmPuGtR/BeeNhjl/iviQhzkHFcxMRvDWU634PfZ2JVe4bo5oKOnl
X-Gm-Gg: ATEYQzwJgJZ10twvCdqsTHQKYos9oo3tYk0ZDvFHGm7vGle36f91gHyBRYdVJreioNJ
	xjoldtKGYdvKdBDMyy56gSU3EIZS+2S10r5WPaFcdfYdqfLxXXVOhCb7WG8ZTCqk6WrM70jrqMH
	dC3KpjUVFEdUIczbtosMZHQEGKrbx0E4RddYQMph0kJfkc0Yh/siY8jMLfthvw5uEzb7AOz76tr
	OXl9mwTAterM+2XGzjt39YURZmxJ7jlzZQ8Cr4Mv8oR13p1sGhOHzfwJZFTa/iRa/6fHqO8oqzT
	ez7+aEV4YMYSy0d4fmCErKYftqEzoj0SQfeKVWpOYa3nHWj7cxMqLu+tBldAD3tIQRLWXPz+Noy
	RgjOiAVeydJ3cr7TWGxNEpV3ffUiv5aDmnIbrGe67bmUNkMxVmqDoO0rsmY4tYM9ZLXqR0FNpmN
	RSV/WozH39LAovUgdFehvq63FrJ+MzD6BAOmda/KTeKsOKTTou0Ss65ZAx/qSCBkozmQ1Z096pM
	C1MCFnf1JMSOgQgcg==
X-Received: by 2002:a05:6300:6681:b0:393:74ed:7dca with SMTP id adf61e73a8af0-3982e1ec076mr2703298637.37.1772652281462;
        Wed, 04 Mar 2026 11:24:41 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20233563b3a.16.2026.03.04.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:41 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
Date: Thu,  5 Mar 2026 04:24:16 +0900
Message-ID: <20260304192417.818211-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304192417.818211-1-akkun11.open@gmail.com>
References: <20260304192417.818211-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112442_555030_E4B300F2 
X-CRM114-Status: UNSURE (   8.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the "lenovo,blade" compatible string for the Lenovo YOGA Tablet 8/10
family and add compatible strings for each board
(B6000-F, B6000-H, B8000-F, B8000-H).

These tablets are based on the "blade" platform, featuring 1GB of RAM
and powered by MediaTek MT8125 or MT8389 SoCs. Since these SoCs are
tablet-oriented variants of the MT6589, they are grouped under the
"mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..69dbe389515c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,11 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b6000-f
+              - lenovo,b6000-h
+              - lenovo,b8000-f
+              - lenovo,b8000-h
+              - lenovo,blade
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.52.0


