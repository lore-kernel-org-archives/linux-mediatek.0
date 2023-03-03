Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBEDC7EE30
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmRNMe9uQhPx18OwaQPWYRc4n9FcMIRAAH4hf6qcyN4=; b=KeADLFgmI/cnum
	NmfslMnw+67Mv2tN0oa/xrs50jtUNybSL2V8o75rXHEJ2kRPlwwW6XyD9HtM5vq74ZveO7o0hQHG/
	BNq6nXtipk6iQh+OdtefDOp8OscbLZYstWmZi0n9xcwxabagGG4/rzIJ88gV/M+2hpbpIoKEGueKF
	snbA12Jhg18jMedGWZZ+9XwSQCy56yhJRmVvPGLvPbd/AS54wWZvqZXACNIWUHFg4vmXkro8CzEdl
	4b7MYA0aPN6h2QkFMrGr48Yn1VnESe9ibUEd7hIPKqyeuvIlmF6/OL1hddmLW4/YKbQ1fQ9GXec/x
	XCU5LBgBTutbNnnNkUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtU8-003wr2-4f; Fri, 03 Mar 2023 00:41:20 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJw-003r1R-52; Fri, 03 Mar 2023 00:30:49 +0000
Received: by mail-lj1-x235.google.com with SMTP id g18so773230ljl.3;
        Thu, 02 Mar 2023 16:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmRNMe9uQhPx18OwaQPWYRc4n9FcMIRAAH4hf6qcyN4=;
        b=oAGe7w29PqXPTErtDfdmaNPd5MQYHB5PStglfY7ComjSs8N2hG7wq+5+z93xjdYJtt
         WWygJV4BFoBiUAq+HFJ0Qqq9gl0DJGOnd9ea1Ph8HrH80ejJQgI8O9RjymnIi38QjT6M
         my1+di7Z3Om8gzm+1KcoyFN37yaJiXWw/u7UYqKEeMoJTdKorBMCgY/ovUaQqLsDOnhN
         tVIs5IgFs8KnbBTYp7HdXymvTgct5dINk8X7WYxfIMZn4OzIMYBpVGzBJUeFKMOUd4NC
         urR/AbilVc54S3bZv7bj9KCR52IbYv5eoJuvBynmCsJ9nEGjppTBYUBxenBsmOXJ94Qc
         ljzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmRNMe9uQhPx18OwaQPWYRc4n9FcMIRAAH4hf6qcyN4=;
        b=RYFDaIZjkm1+S9jZYlJmGLWkEjpIUGpX8Z7zYuwvqL1ES4jdokyia/LJ4J0T0k8jBZ
         OyabF1eT9xq1BQ10T1Zmbvvzfiv0Vl7s6FLh5BH3L49l0fwgc/QgUMs2QJX6PLPjVknH
         NtgCoiuoTCMSsP/Rzw03XD4zmd0W1G2w4SqG20gsb+yDeJxxxIEetp/OS1djw7M5uq3f
         gkLum8a17a96nalSonjkeaCEQeqBnqAZagxVAgnOiC2MWTo59WGNmFcR1atR9bshXoyQ
         O67tJDu96G33AuNYX+Y1RTRjjFdUOCIkwq3S456VxXUCNdopAx2f/fvY4QBW3HGJZ7qT
         wabA==
X-Gm-Message-State: AO0yUKWCuzBEAWhPiO4vUT99+ZYGOvd5ysxyrtAbAz1kJUoUV+T7HGL3
	K+fQc46riz2z03JvrRvs60E=
X-Google-Smtp-Source: AK7set+q/isAOSFwsejBQ3iOOjFHAocAnLxyNF7IOw4sMbmZaOlhR0EGbJWoBis7w9Yb5i12wwb8mA==
X-Received: by 2002:a05:651c:b24:b0:295:d633:7401 with SMTP id b36-20020a05651c0b2400b00295d6337401mr3149851ljr.47.1677803435256;
        Thu, 02 Mar 2023 16:30:35 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:34 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 17/20] dt-bindings: pinctrl: mediatek: mt7986: fix patternProperties regex
Date: Fri,  3 Mar 2023 03:28:46 +0300
Message-Id: <20230303002850.51858-18-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163048_244841_81529CD9 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
mediatek,mt7986-pinctrl.yaml.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 46b7228920ed..e937881210c5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -72,7 +72,7 @@ patternProperties:
     additionalProperties: false
 
     patternProperties:
-      '.*mux.*':
+      '^.*mux.*$':
         type: object
         additionalProperties: false
         description: |
@@ -256,7 +256,7 @@ patternProperties:
                   items:
                     enum: [wf_2g, wf_5g, wf_dbdc]
                   maxItems: 3
-      '.*conf.*':
+      '^.*conf.*$':
         type: object
         additionalProperties: false
         description:
-- 
2.37.2


