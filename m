Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF779C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmhZo5VNLi5fyIfm0Ikx5I/XDPVkL1i6Xe0lCAE5Xe4=; b=XUboAUon3GbvBIHGuJTBvUCz7Z
	rQeiCCEJN06m/1M9gAmj9i1iJILTz6J7gvm8O8O4QKIKvUwLJbo/Jwx/CZhH81ZrYmMgO+Xh3xYMY
	fMYNi+fQ7VGsvuEXasLi9KHABcTg50l7q4vQ6zOasUKVMdqBW4tDRDOvKucCwHm6GUq+lZ3x7nNhP
	ScIXAXYX1IPosnRZ1eZdZRug6Rh4CgeZtYbWMPO+BV74FvHwPzu5EYEEHedz2FMzPKwksNCEvvFrY
	hTVSosbFNSLHT8uqrAk9URgVKT33mOGYhvOKdBQxuQ0Pnr3gNA3nkbUqEfjo09xIozxgV2vwI4uRu
	vN+2yYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum6g-006yeI-L2; Tue, 15 Nov 2022 02:55:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5q-006yKp-Ij
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id m22so32850840eji.10
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmhZo5VNLi5fyIfm0Ikx5I/XDPVkL1i6Xe0lCAE5Xe4=;
        b=lt1TeCblLWzyNRJWdCRnEDaMwgzWRq6ybvbwqFkB3mXXLuqk/kJ2j75Du6ojxhrGMy
         I9ERoqqLtoPzBzmrv8PTYKz/eqJkRxbezyNn57euaFpPpI+gxrU842m+dNHsHdTKwmuh
         wpfecPaE9/cE/0M2kedPIGnyg121YaLiipBtXDag0Iabo9n3pje2ce9PpYqaqohkK/1d
         nL4+4wMGlziEHc5GKkLNXQZGdIr/Z+KQByzdvBmiJFmHKigfYK82PZlSIOc78hJ82yZ0
         mJIvP/N4tmelIgqNt55sJij+Uh7ecdp07lHkL7oQjeeiU4xZ3A2ZHwN40sh8bxOFVtbC
         hgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmhZo5VNLi5fyIfm0Ikx5I/XDPVkL1i6Xe0lCAE5Xe4=;
        b=o9GMj9/eTcxiGmaX5oFVO5kuO+Ughf/3q7f2iRrqIk/NbX/8qn4139aSiASswXHw7I
         gLZVhjiDsvLL9GeylxgPkT/0U39i2FKyTkNvqH9eBW5chBXAQEzAA7f9Ed6Ft6AdDMqb
         4tPyzQPjBoMgOCDiwwGVtG+6aw9hwAwJsMiKoeJtgq3+YBXZcV2qX8V/C/VZQFX9Fn8V
         CC6FSy4TDZV3N79jBh/Jrb7HIQAW36So3wxVuauDih1rX1DngnNKewb3MPdRwp5vTktL
         KDj0cz48N8ym1r6YyoL0t2MjT6KY2ScrNAcxKPiG5baN+yDv0Ns+/aiiN/h8sJX0G1qO
         gxyA==
X-Gm-Message-State: ANoB5plvwScxZAhDaSCM+Yr/V834UyMGfZL5DCJI/KopcxMVK3N/C/ZN
	UKF5wcdMFAK/yxuc748GWDL3JnSD2JZhaCKr
X-Google-Smtp-Source: AA0mqf70M/ZlAtqMou5vdxsPpWOfSmgxc00ZXs/FLJ/+v6DQNDrithpPXRrKSjRJB+w29dS32pj+nQ==
X-Received: by 2002:a17:906:4f98:b0:79f:cd7c:e861 with SMTP id o24-20020a1709064f9800b0079fcd7ce861mr11911192eju.339.1668480873211;
        Mon, 14 Nov 2022 18:54:33 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:32 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 05/15] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Tue, 15 Nov 2022 03:54:11 +0100
Message-Id: <20221115025421.59847-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185434_651799_731D55F3 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 80750b0f458a8..25934871a4d85 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.38.1


