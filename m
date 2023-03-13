Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD5C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT2oLy5xFYDKklrDL9H1QV3B6NDWG41BsEllERkvJLQ=; b=UTU2wW+nTE6sDb
	YUa2K2I0oAKaXlT93SuoY/tTbR70M8H/Yf3ElVguJE157Ncw3KKqBKFoTlzep+rgjGBl4UrFDhMJW
	9oU7ianBBr1XEPDRYoFDNOJcxLTat4xknFXOH8L0Q7/qwizGKa2q21VAA1pyrnaYZ7xxjZLuPrnwD
	7cyU/67evim153dSw7AZTApK+D4px3CCha/fAqjyumhgZz2QNv+7CwNyftFHZe6HuwXBW0hVWD91T
	gvN/BPPksZT4Bmxpt0kK8aYE2XReK0s6zD3GqHmaLteuXFORipO2rltwWUf3MHlZF0Tozp1CufV5t
	SH8vG3buYmHaqo70xX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpPO-007pGB-Hd; Mon, 13 Mar 2023 21:08:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHZ-007kjr-Mv; Mon, 13 Mar 2023 21:00:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id cn21so23869920edb.0;
        Mon, 13 Mar 2023 14:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FT2oLy5xFYDKklrDL9H1QV3B6NDWG41BsEllERkvJLQ=;
        b=b4L/dI6UxOp+1xOw7wipdCZycTsIXOTyl5TihDRA83a/wKmp9RKXdDkiE1PudpDk7i
         Ljud0fu2w/Qj78cXewlHVf+Sj4KOi0lhqHEftssS2wgKgW+aBuj3F90K8VF0inLC2AFc
         Bu2aWFIeBJqdyhY2Ep1j4AX/i/ZWBJvy6WlPCB88YeDp4LjCrdQAtU/X7jMZphCqYnAN
         1xWrW8dYdR9aZt8mgNEk5X7c31C8qfghmu/x0mwteYUQICLsG2LkYDgS+eJ9hD9/h31z
         Hquk2vM/YuS2QsC6ztC7UKXabU+j+cPUlHZXxRHpfaAlOrGO+1qV1kV3M+DqUoXH8jCs
         ZjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FT2oLy5xFYDKklrDL9H1QV3B6NDWG41BsEllERkvJLQ=;
        b=wycM2dwGB3FYL4bUZt9eHoMy993LEUhmRU2WBSzGmpKlcAWgsjp7dfu4ie9KS2tn11
         jd8Gd5ZvDIeu8D6UBWGeMaz9PjjhXk2DsDbnIUBF16FHq5/Ou8lHeuHJovM9WkvBBD4+
         3emmRoCzYZNdYMVD5bHaaYETeWzzCBu+UnK+eX+LB2Hg9yuo3Bgb8rRmrShjHzm5e5uv
         7+hR9COKcRXKNlmDY2HOZrB+0e7nmVfz+FHiiheELy+3TvW1OaYe9KUmJeoQK8+W9JiI
         hSn9fC4nk3PyuPYYHRZtIP215I9Vk2wbz4EPbSj/FRGIrfVTtdmbt3xtSiBDuYhUVuds
         6g/Q==
X-Gm-Message-State: AO0yUKWhtHfXgcOAzt5IAJ3CXMqQ0E8C9EaOORaTL/S5buHTO0MPd/c8
	EPSFg2oAp7vtgrCnnew5PbI=
X-Google-Smtp-Source: AK7set/Bk179OhlZ6F2sRo2tcyDbF2gPTQblGFOVfe7U4X5Cp4w3TtAL2B8dAeJbMQhD9VTjihbOMw==
X-Received: by 2002:a17:907:6da3:b0:878:50f7:a35a with SMTP id sb35-20020a1709076da300b0087850f7a35amr44708274ejc.72.1678741237136;
        Mon, 13 Mar 2023 14:00:37 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:36 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 18/21] dt-bindings: pinctrl: mediatek: mt7986: fix patternProperties regex
Date: Mon, 13 Mar 2023 23:59:18 +0300
Message-Id: <20230313205921.35342-19-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140041_375184_8A24D333 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
mediatek,mt7986-pinctrl.yaml to be on par with other schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 31c36689438c..0f615ada290a 100644
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


