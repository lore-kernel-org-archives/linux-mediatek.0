Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525C9C77B6C
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isNsv3u/WQPEGUOOn7ipyGSt/sVwBsBoCyFZmevpR+Q=; b=PzBy1iMYfalh6XKVIVlmgawNXr
	j1QD8jN+czrkds5QfXVm899sOreZaFz9YK6HR/NsowDClhkngOjiGDONumHj/x4WOw5rUEdQHhi1k
	BNFI0/K3Y5yIDAoP4TryNiEidaQ22rR55w29VJIDX2k64nJbS4HJVrHaLqrVnESX2Dm2ZK8n0kaEB
	O1GgqR6xcn2Gd91Yw4s14ms3/RTaXVvhpWE1Bpv3bMuTynTNgS651T9Ly/R/saoomQgdZcoVeW7LC
	tYAJBF2yF7FrSJKGOalOK5q7RZW774rwoUW4eq8Nsy9Mdh96kf+aCHABbqSTjfNrxTTWLcsyyQ3CT
	UBVsTf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhk-00GMYC-1m;
	Mon, 03 Apr 2023 19:19:00 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhg-00GMVd-29
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 19:18:57 +0000
Received: by mail-ed1-x531.google.com with SMTP id y4so121601423edo.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isNsv3u/WQPEGUOOn7ipyGSt/sVwBsBoCyFZmevpR+Q=;
        b=oSx1/Bg9t4iE/8RYMxxAqE2JSP/6d8fKHXSEznlg0X9Wtd4TQT4nsqJC3BbBXU4PJd
         VAzTteCSNA1+kz0wmDVcOYWVn2/i128zqERw5e48FtoiMEaa07vr916bRe4hpnGejuHS
         KiqsyYQPRyxNJuBkpnIvaotRKaQAn9u6wVvANC+Dl2NV5xVqQ3pOJJvL7jCw9TkAraHj
         QoEp+tO8zMzTSNS9xJ6z2YPmznG8Gu56fL9IOeFDgZPrcAFl62PHyBO25D/ac4PNfINd
         LQdCGuJzRULst8sTuNbd5yhEyjyqTQ77Nl749wZYfYpdVDcbj8HE/VlkdxXPyzBrMAC5
         z5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isNsv3u/WQPEGUOOn7ipyGSt/sVwBsBoCyFZmevpR+Q=;
        b=hrd6p6+RRM6Nk+lB/0epR9YtR+Z0DfFdBhUvgPSoDTw9PDF7coF4BFzWMmFe/etlBT
         f9n67fydgbbsTBDvi6DhSdBJ15/JqPERdedQmjEM1xpk75VV08pACypFEggmS34Bk/Pa
         AoJTRiAJIKl/GlkDRE/AYrwcHl1H8/fFYXAB8GtLSRQQvVW8BL0XXd+1DCpL1Yibpjm1
         OkcbazCU+nP4qkf8wLOb44QSCdXK7j4Elf4h4E8wJ9DXbpPAzYaRXL0tJ9zgkWQZnwr3
         Op2lb3b7VNeQCV6gvxC41qm08LCrXBRNzLoheJwVGKfzYQnF7CL1o16oG7LAAlqVMAxS
         H3rw==
X-Gm-Message-State: AAQBX9c/rpXhgb4lPWLe8ItEvouWztOeEb2t0r9C5X48wAD+3kRS84ya
	aLjKhXa5WDTrYSgF+vCEZp0DkA==
X-Google-Smtp-Source: AKy350bEFlIs0Zt/epbZLmsUfrkUJFQ+rThFaH41NpSM7LltpP6Ks3vxjZ12jWv067Ir2NFzU9VXSQ==
X-Received: by 2002:a05:6402:2045:b0:501:d532:d84e with SMTP id bc5-20020a056402204500b00501d532d84emr207146edb.39.1680549535263;
        Mon, 03 Apr 2023 12:18:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: usb: ti,keystone-dwc3: drop assigned-clocks
Date: Mon,  3 Apr 2023 21:18:50 +0200
Message-Id: <20230403191850.374839-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_121856_702262_072B2B14 
X-CRM114-Status: UNSURE (   8.68  )
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

The meta schema from DT schema already defines assigned-clocks, so there
is no need for device schema to mention it at all.  There are also no
benefits of having it here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/ti,keystone-dwc3.yaml         | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
index c1f0194ad0d5..9252d893f694 100644
--- a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
@@ -34,14 +34,6 @@ properties:
     minItems: 1
     maxItems: 2
 
-  assigned-clocks:
-    minItems: 1
-    maxItems: 2
-
-  assigned-clock-parents:
-    minItems: 1
-    maxItems: 2
-
   power-domains:
     maxItems: 1
     description: Should contain a phandle to a PM domain provider node
-- 
2.34.1


