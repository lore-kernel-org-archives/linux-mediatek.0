Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B86C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwtwAkHiv/D5wLcSr9T7mnpFMf4eU++SFVOZkLs29JY=; b=JPbql3JHIJBSrV
	QrPlQXwewVxIFu/1M8DiQCn1vv7jktJw0tBUvBkIqzQ8YmN3bkGdxQClbARnFV7u5iS1I7ZvfQ///
	qDxTwPNmIKd/pFpRUoq9G2KBjl8+aXHgqUHRM987bmclm58D5aE3B4P/S7L7MbeoZBCH06GTlrmy9
	Z0QLX05gBcylmwu2v+Vg+pFSKMdUPTSeaGg9maDHxuQUqzjufMp1rEjjzvoQY/whHbAl7k/DQZAs9
	14WYZBlVfnhks1HFXO7iu8z9g7GF9Bf+DMEoJbFOGtmmgb507P9nqtH80XB+z+3f9lrIMp7GNnh76
	9KCsUdLT8dfhX9KO6S7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcfP-000Tca-R9; Wed, 27 Apr 2022 08:04:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcez-000TSi-0F; Wed, 27 Apr 2022 08:04:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id z16so954916pfh.3;
 Wed, 27 Apr 2022 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdE5D/NFm6EL4D7kLaA7WFrnjkrixiSgSiYt0rJZh70=;
 b=MGeF7tD52MnfDX/Z/6UYAEgwVwA9Be1BNBo4elYwAPuAiH/DJKVMfjGt+T5rSr7KUA
 xD6PF9fRNjxzV3HEZ5jNQYS1DLu+3X0CtAP2GjQN6WKwOLVyCc/fS7RsXwRA84+n4nYT
 LpDixKzoP+jREpLfkesvfhP7EBktomPjx2KAry7Gk47YVOrndRupDudSod91uqhOFCKC
 0QUfE57ttG/4EZ1UVw9cqyPD8PCskYfMzoi1l+u6S4ePeknt+V4cMSCYrduyqK34u5EG
 FrXcICDtdrtJJGkYgyoWSxJTZsAIwuhNKMhHuvyZMZyBS7lwEZ2ky31ATZ6lOopSP4UI
 0SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdE5D/NFm6EL4D7kLaA7WFrnjkrixiSgSiYt0rJZh70=;
 b=C180K5iLKL4q84OHT6oB7Lw0Lq3CE1datpUvqt8KxseE4sStiWxJlrqgqw8UAPFqUK
 /7zPjLlOi/TPV4TYvJVTuQYVrn4mD8Aaf43+bgV7OUiU45dSU5i67mxHQqNUpXB83zgr
 POc6rN0vsktX0Q7kZTk3UoEknMLO4ZWuU2UDa+x0W7g8pZN9nWH/Gl1myKrWXZa8tvgU
 q52bi96v75Cyiiuy5/y2crs8+8wz47Gpwe1eZ6sK6rLXR51j/KYx98SOJ1qbO7WUA0c3
 dvWTUYaXFroX0jj9tCeCCEFNp+efTSrUPNUO8KWM/curmNWxV5I/SxiNZlmdkBzeqrOw
 RDHA==
X-Gm-Message-State: AOAM530L3U3bYU1yKtI1sb61UZJyhFs7eu4mzvO/pmBl4R7Ka3Op4SJg
 ALIXY283LCZooMn2/EXq3m4=
X-Google-Smtp-Source: ABdhPJz83wCLBKFmPRVZ22y1Us8FE68DAbcSOI5389m6GK5CGqEy+kIVEjJOf03zVCH6+eRXayNldw==
X-Received: by 2002:a05:6a00:228b:b0:50d:3c82:911a with SMTP id
 f11-20020a056a00228b00b0050d3c82911amr15993320pfe.16.1651046667497; 
 Wed, 27 Apr 2022 01:04:27 -0700 (PDT)
Received: from genechen-System-Product-Name.richtek.com
 ([2402:7500:469:f77c:f4fa:b753:7807:4e40])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090a70cb00b001cd4989ff50sm1746750pjm.23.2022.04.27.01.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:04:27 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, cy_huang@richtek.com
Subject: [PATCH 1/2] dt-bindings: leds: Fix binding document for the Mediatek
 MT6360 LED
Date: Wed, 27 Apr 2022 16:03:29 +0800
Message-Id: <20220427080330.40136-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010429_082173_115355F9 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Gene Chen <gene_chen@richtek.com>

Fix binding document for the Mediatek MT6360 LED

Link: https://lore.kernel.org/lkml/YmHK02g1pC19Oyh6@robh.at.kernel.org/
Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index b2fe6eb89389..10f95bf1d666 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -43,8 +43,6 @@ patternProperties:
           - 4 # LED output FLASH1
           - 5 # LED output FLASH2
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - "#address-cells"
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
