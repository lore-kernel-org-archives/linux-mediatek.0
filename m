Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8AAC38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMnhXtg85D4KtwJwkPkhLvAJp9rd3aoHLilVGsPoiao=; b=lBBDpWgrAbH93mxwWfJeTGXltJ
	vEhgeIdHxrIg6BCoVf+8aTlmLjgVm6/v3Rwi1D2oR2YcHJMjY4qBzn7sU5wLxFM6piTrZk4Dfsa8d
	b6v8/ICY2eOz7QVnRFozrInS7v3KIqjb4pMbZR3isRdoZSQb8P7OF9SlRmsMeVaFBa0cKPRZkOb0U
	pFzNjIiqFQ1LGj4Rnb9iefINO9fUxFTkJgjO0L5+OWkHyotYzdezwigU94In7ICNOllBaSwcoaQk5
	KLimgrTRg/NMyuszgj1TH+S/WQZd4Bn8cI1Cqr/JILUA5Mb+Eo1YvYf+hQtBQNFWHEhgKbAlXZWW/
	RKY20OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzsC-000chc-Eo; Mon, 23 Jan 2023 16:40:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqC-000bsF-KR
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id vw16so32017502ejc.12
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMnhXtg85D4KtwJwkPkhLvAJp9rd3aoHLilVGsPoiao=;
        b=tbuUVPAWxwQkN/2kAW56UBHmw+ME9ICCY9uDoGdA3IKsA32JgEV68bINSCWVCE25Oc
         zmtTJfVy6rvbX+QB708xpTHcdTA9y91xCkY7HuZQ54eJ7X283uODiIjh1nlbCjmL6J+A
         0MlXYCFRWWKT5NFMutCKcZCCVxEKjedkM3VivDHTPy9fz/KnHKtybVenux8Cw2h2UqzV
         lx1z+Zm05haFWDAHLuzcv7i/x+hQdIIsdAGNBo/hX37zSumCuR/AgkMGhtJbPf+rc+GJ
         v6sQ+tZAZpzVWOh8iZt0M2GDLNqvP/n+EO1oNliPrQAACbz7gym4Ouv1NfjJePwbzbyi
         fGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMnhXtg85D4KtwJwkPkhLvAJp9rd3aoHLilVGsPoiao=;
        b=Vm9+njho6lhKfjE0RYzQRJ85e6URmEm32ogxO5svQzpXzH52ecZpO5cNdjpLAkD4Th
         xs17jjbn2djaX0DTvNI9wiMSs5ABrueeklQGdrjRG3almoyYtm4hCVyOiOtuZip+jpUt
         tUSC9mzuta4ILEZgATRhT94UMpIzCpMxOr+RVfEOb04WCKQnQG9J2zyvh8uvnnn6NH0T
         2oCpmERbRgGNEUikRxuxsFx/Xh/4gOfKGseqc10ZPSKcqBfs4gSQMQvUgTcqyf0VrCY1
         voIahny+peTzm/ite8bV6EPJ6Fff71G+A3Vh2DO6FIz6pT7dwA1hj+GwRjxrljRgToWh
         RJ/Q==
X-Gm-Message-State: AFqh2krVbdj5uoTGKmlsyejLPgcPEDsOtc9uB6zPQKEDlVnd+FppR7sX
	N3mQrllVgY9cxfF62KEpODktYPtwPIEtDxd9
X-Google-Smtp-Source: AMrXdXt8zeUfGlwgG5ONfXTt4dt9Q5KEkOp/A8qjBZ+PcwRcIeZFWge1bnr0YXpj5nF6K0GDyLbwXw==
X-Received: by 2002:a17:907:d40c:b0:872:af53:a028 with SMTP id vi12-20020a170907d40c00b00872af53a028mr24562227ejc.61.1674491919166;
        Mon, 23 Jan 2023 08:38:39 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:38 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	andrew@lunn.ch,
	gtk3@inbox.ru,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v8 3/9] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Mon, 23 Jan 2023 17:38:27 +0100
Message-Id: <20230123163833.1007181-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083840_710446_682534DA 
X-CRM114-Status: UNSURE (   7.46  )
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

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 1b01bd0104316..7beeb0abc4db0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.39.1


