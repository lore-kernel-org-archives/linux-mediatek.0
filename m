Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72732C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 03:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+8ldVnfwWvEKySue1NBZbOVVNJjIghVmLHpY3RJmxQ0=; b=iRa8OV0QZvWn5t
	lLme/NCbKWCRe1IDiy6tKsJSLo+9Wsh9B7qoUyS8qgKvlyP2JN0TK5iYdSwMD02nRxWSfbVbRuET8
	eFEyOYs0EtfU6yEx0A5AnzWdBcjaRJoGqPJUD7n/dGyCd3oUd2vevL4/cXMJFD/wuApw9nT4RS2pc
	QynDEXyGKM/eDtD1NhOGsO91Cupsfyj5A05octzOQb7prgyqKIq5NfZh4iHM9rOFTUVAnJnsrarX2
	nuozGM1e+uFydY1ZihHV5vjZ3QWB+Q4JnUSnGoUz/xxtMObPHE3P9of9+Fom9SwDMmBXd3mF8lsTv
	7t40Aa9w+xf/ZwZh+0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fYZ-0026YZ-1K; Fri, 07 Jan 2022 03:04:43 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fYN-0026X3-1g; Fri, 07 Jan 2022 03:04:32 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso5286829otf.0; 
 Thu, 06 Jan 2022 19:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBar8N+1gW94C3fgFMqpUysSc+AeI/hjDEO8pXAcURg=;
 b=QafVxwXPytXRfzSv10HQDy6EH4GHUylZ8t5L4Hess8V4tg776/FL0uOiBeKc6WHXix
 eR1onV25Njef2c/6Q1GuvhGKdI4VVLWtaZOWSrivQ/LYRRgKv5WI2AW75IyI9LTT/6U5
 IO03vczZhiurxjZ0dA9Dpv6bpD2yysJnLpiHQ6mq5HrZKDGuIFeTD4GsvILYdLlmJ6lS
 iryzIxsYR+vOzNlP/60zKEzE1wnzI6Y1mfzLJTZ8Kz0UXSm96PxbN+0sEGH/121V8k+Y
 4zTv6konUX+o3p9UVOI+8gY1MXOKLkXasY9S/eO3jXIwnicyj6gr6T9GR0udbegQET0s
 UPOg==
X-Gm-Message-State: AOAM531eUistRvN3rEnZGIapdYgd9HVO6PwOajyAh3Ayq3m5BcmuS6vT
 YTd1RtVtNHo3zT6AQLwifytiJscPtg==
X-Google-Smtp-Source: ABdhPJzttxN24jpI2p+TdOXTWAvbQK6w0JRyEjAdIzTeHDE2eH/HHDwVvIRge1Nv30K0X6SqEy9hcQ==
X-Received: by 2002:a9d:6b14:: with SMTP id g20mr3065468otp.37.1641524668136; 
 Thu, 06 Jan 2022 19:04:28 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id k11sm692385ots.22.2022.01.06.19.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 19:04:27 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: mt76: Fix 8-bit property sizes
Date: Thu,  6 Jan 2022 21:04:17 -0600
Message-Id: <20220107030419.2380198-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_190431_111976_45AC9DAD 
X-CRM114-Status: UNSURE (   9.44  )
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

The '/bits/ 8' notation applies the next <> list of values. Another <> list
is encoded as 32-bits by default. IOW, each <> list needs to be preceeded
with '/bits/ 8'.

While the dts format allows this, as a rule we don't mix sizes for DT
properties since all size information is lost in the dtb file.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 1489d3c1cd6e..269cd63fb544 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -191,9 +191,9 @@ examples:
                    channels = <36 48>;
                    rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
                    rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
-                                        <3 22 22 22 22 22 22 22 22 22 22>;
+                               /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
                    rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
-                                       <4 20 20 20 20 20 20 20 20 20 20 20 20>;
+                              /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
                };
                b1 {
                    channels = <100 181>;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
