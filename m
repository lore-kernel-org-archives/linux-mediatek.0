Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F64C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oe1gfqWTX+Q0KEBS8s1SWA9EA/32kARgcQdSr/9Ye9Y=; b=mTh9Hw9vkyAx8c
	Z61HG3I4NnnMvJAn+OG2+nzSQ9asOyuHwNZ8seHjJR0x8auzLkmus/rUpIk4z3WdnZe76j+KBh3d6
	LK0lO1q35zMaKbZ8G7cKFQZd2zSInpKPMkoLZaGwS7NZJF345sLvSxw/8LKlk6bqcb1+IUPegUE2P
	8x54d2Y9/uci0g77I50wHgFJR6SHXEVdokFKIV/gOmJpCwOIAl25NyrA/MrUDJuvsg4XfbirLvoSe
	1ECmg9mYgZPX20qPn3lR1dEJBoMfCKcpE6gV2csi1+toESGjFxBbtqzO/fzlnSRxa8z1IqDrg9pV2
	rmN1DOhThMWHXCM5l7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw34M-00BJZF-4M; Tue, 31 May 2022 14:42:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw34C-00BIzQ-LA
	for linux-mediatek@bombadil.infradead.org; Tue, 31 May 2022 14:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V0mir9eT63DKpCuSFhXy2EQ9q6hMHk3Lk25p5hkr1WY=; b=D33c7afqQQq70G53V7blkAW6Ds
	QFKByLbTX4Ur0P2VxDQPKGifvhm4FirZKEBfWrsICa8l7nGEIK5+ryzstonWsYs0DKSaJmeNaPFUm
	463TtAY6joPd+ZL3yqpatJd+3e2lXv8Jor0zeh12LpynpU+vGDUKQMw0G1PdHqVyvIBrn0dYZGKf7
	MnxpxgcS8ToXIsYAMimSiBy5bnAnvNIYbwXgxVoTfe3SqkT8asC8EU+x2Vh+O22zB3gM6QnrR6SU+
	ExwkrWxqwkPWK8ZeVplHWRUc3oKp1gw6Mn5v/Ef/YhWd0oU2AX1Fl/cKdUZP4FSoj5h3mtlhaY8vV
	3C2ZM9fQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2H0-003Sh2-JG
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:51:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id r129so2784468wmr.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0mir9eT63DKpCuSFhXy2EQ9q6hMHk3Lk25p5hkr1WY=;
        b=dgPXuSTwBJUbGqXppjZhZZZOomCBtiDDRzWdJYbbljs4aTyDRm+Rc7yvBXo99ZlOUR
         U7mwFug0gjhRtdGOHx+b6JtR/f+n8/zxm2PDGTHjIPz/KhJYudpdaSA1BwC3X7i3s4Hr
         HDaavWH9RbL8wPJaZbnSIeRt0gsaiINZnc/ykOQ2BIYBBEtJ2fIb/S9kytfEqSzP2NbH
         qCSnSlzdfu5UlZu6g48e8t4J/3G6v16GoWLx/irJQpEzoh5NlHyGsJfxl0Gw80km5oQv
         3ZY1xvrun6xC9e4jGwbOr1PrJsdJ5tEYLvd9Q7LpqBKpPeYigH/lFh3JFg3igrkvpwyS
         XUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0mir9eT63DKpCuSFhXy2EQ9q6hMHk3Lk25p5hkr1WY=;
        b=BwMVAu8NvdyGl//AAEn6FQkrfdCObtNyxiPDg3eZdKlEI5Tp/0M7TCHaTJe9XWwBAj
         SOCRNd45vDH45WWNsIwgq9uf7D0aDDAccInGIHjyWKVHVXA5Hl9GM5PvYG95ycXTobjL
         ea5Pt8hHZwpd8yR/0ij9nJXLU/laNCidlI5/1MijRu5ll3Qr+zEn3CKCrZjrdwloCqOl
         yAP1Li/JHpIIQsFIL5MUG2YT4Pu8PSbAk1F64vjR3AY3F9Kfi6TbscyYNaGD9h+tfMBi
         QQ2fhjHLhFYQacXU73IQUXBUyqMsOb3dYBdxY8TYmcN6pYcCW9PMRP8582RFcnUBoI/M
         Z80g==
X-Gm-Message-State: AOAM531kJ8TimwX20/jUI15zKPp/wmplTv0JN1qbdUsnCo7gapO6C7fn
	23wegW1QJDTX8z8MtfCd96ky5Q==
X-Google-Smtp-Source: ABdhPJzCiszx6tFF9AeRKTF7WMnbdQGjSgr3MjgxoHordumIGouDeHTHRrvMyk2Xvt9rX9h430+GnQ==
X-Received: by 2002:a1c:f213:0:b0:39b:ad32:5e51 with SMTP id s19-20020a1cf213000000b0039bad325e51mr10808986wmc.72.1654005060973;
        Tue, 31 May 2022 06:51:00 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:51:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 12/17] dt-bindings: phy: mediatek,tphy: add MT8365 SoC bindings
Date: Tue, 31 May 2022 15:50:21 +0200
Message-Id: <20220531135026.238475-13-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145103_272818_69C8E818 
X-CRM114-Status: UNSURE (   8.65  )
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 7b2e1bc119be..4b638c1d4221 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -82,6 +82,7 @@ properties:
               - mediatek,mt8183-tphy
               - mediatek,mt8186-tphy
               - mediatek,mt8192-tphy
+              - mediatek,mt8365-tphy
           - const: mediatek,generic-tphy-v2
       - items:
           - enum:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
