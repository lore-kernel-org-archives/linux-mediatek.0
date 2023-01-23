Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C2C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=; b=NCEofY597d7FS7tq1O697fD2Z1
	U6YBE8hiBwvLDPdUfAAD9Zygc29Uxjnzs/9xKD69k+FX+dOWF4XBt5AMNhlGEDyzlSirbq9iKEouk
	0hRiuL/HLnetsMsROifHdWCvNznepASoEG0PJxyc1eNd8uH2eZnu55kSdzI046LnjFXswbv5SubrW
	TYc4D8GnZhiWebV+1wClUbLIwxq7WYodUN9dT/1BZdalT0aRlRn6CoI27CEddUw9b1Uhb3gvDWS7U
	JcfGRrbXHGDYYpWf/zmNixL3ih+QFD+5aSb8krJdkZprjfwkMt3fowEudZ9WuYCkfQvi3Sh1rJcGd
	x32sQoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzsH-000ckX-M6; Mon, 23 Jan 2023 16:40:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqG-000bw5-MC
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id ss4so31970683ejb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=MWbFl0fFs6X1J9652vnZ2jFb5SsMsWSMD64p7Pl7ZA5kY5wVgr2GrHACP0hNfu3LrD
         2IAJRdvYJPiiWLjuAl+DFavCiGc/W8kbCTGObhJGSAo3yJQRRO9wJxN8clv8Dz8K59b+
         UWcaKIn7Ze9KzNKcf2/FlvDyNAZtdr4tpzcXD/trVn18QA5lWZaRo3XdeT0se/j022Gx
         EgdYnJZafOhCUMOH18xs4rVLX4cKcQRXqQ1ikqDvK4Eibi6vl3Qq2CkBJtscmocM2Aro
         e2PN4C7FX7CpGq8DPvDGH2cqLr1macm/GZWnQ9ddP3tWXFmzaq8Fsi4IQd7T3npo6MeZ
         nWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5xBfE/ZGOPJTnop+MEy0u8c1qaCOncm13Ltk1p/JL4=;
        b=sQUKK8mrjibNSNAuP38ZiHKF7mDxCujLEuLA425ZdzumoanPz3w+Lla5ZH3E5xCpaO
         JW+RIDTNhSzu5j9DYakBNvDU7wh0ZwZN8rXcTx3+hmXmxQWPeHHikQX1MGbBYy50RCOk
         KF6N0hEa2rj2EGQYlYOuil6gUiaZrzLtCJobazPksbSIsfJFo3oITshCN/sf/AzDQHTJ
         hv8QvjWNDrxVBLdNrckoTNvx5MqpbDSWWGEF9Zn6lw7o3cKADJW6N4fFfryBEYd8FIa2
         d2OkNfJCv+lbxxcc79bhbLr6M/Pi2y9SntWYEbrB3VvhJX1DKk+DiH1TtH7/TlmEgpXm
         m4WA==
X-Gm-Message-State: AFqh2kqanJzuxvKQ/dsFoUHj7D4ZyTx5oe2K4Ul8w8d+u94UeXV+5LcF
	5DMpSfBdA8WICdOYXSvr80DLU6DfBlXOZsE2
X-Google-Smtp-Source: AMrXdXv57ocedntrh5QnUnDefvvhX7pt1cDtQ84oLO85e66RfwqoZWrpEImunNzGF87OkLTwDvcCIA==
X-Received: by 2002:a17:906:2b57:b0:86d:3c59:73f8 with SMTP id b23-20020a1709062b5700b0086d3c5973f8mr26028815ejg.34.1674491922938;
        Mon, 23 Jan 2023 08:38:42 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:42 -0800 (PST)
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
Subject: [PATCH v8 6/9] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Mon, 23 Jan 2023 17:38:30 +0100
Message-Id: <20230123163833.1007181-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083844_853335_B13E55EA 
X-CRM114-Status: UNSURE (   8.24  )
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
[bero@baylibre.com: Cleanups suggested by reviewers]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.1


