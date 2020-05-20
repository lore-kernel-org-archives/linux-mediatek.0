Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC0AC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EA3207C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DhPezMoW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="MlZFmJDy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EA3207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pIm6ZOmA18jlcOeA9K6ngrKqdElRzO5VhQ6KwLvyRk=; b=DhPezMoWp2NeS6
	4UrYDZD2kVEw9V5OErQhNEeYrzi+5+fyOC6dZCuUV2iay/LwwpKTZPtATb4y2BXF+Rd6fp4ofcV2a
	hYLTzOOmo2nVjCcFt9ldL7HKs/WzKjyxEYCdM/qwdBGIMqL6cU8NYLde+1nrhrqZ4LoGgMy8SIjoZ
	W0VpAGm1m7y5lKTIdclNEc/65IIwjUPUkFfotQBgUeZRK+W8XZ7ijhVidIuVR6/zA8pyEEckP4Jyz
	yNJdBhxgTXbw0hyxoJF/MMalwMgPshvhGsX+hrK3f0nr1392jtcGjH2DifRmuu5jOBjk1SLbe7wve
	A7VUi6mwhexfRfM4XMnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbMs7-0007qB-1n; Wed, 20 May 2020 11:26:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbMqt-0006sO-Rs
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:25:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id e1so2761006wrt.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
 b=MlZFmJDyD2RZ0Ws/5qF1VLg+XZqBfCrw5K6YfU6++Rjm1khpRCp2qSfB3fktDPddjo
 SIh9uNo9u5rfZE1ob3KokCrgAMAhLPTcLIK8eKdJWkwBxUHcT1oeN6lBdchQAAZUmWUm
 iv3hO7QiHeYoeyE5g4oOcw7e2gZ50XZzRDFrUggoPsuCrmI/HD2umiHSiQWTwo4qZPZL
 padqQ0vvTzkXV/zWCUj6CeVwJa6DNj9juCzcolT0I3DdZXpZMhYPRXpBho3emdf0EZhL
 ofy9F8wr+8xgzSBC+TUvDDIzMq9i1jojRdCeCqEnCj1xBbsJ0A3OgTxz+jUdxV655lt0
 qvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
 b=s5QX+ifrWTTy4eLOwVYDgudF0zNDy73SZVapWYI9VxyrvtInrPAQiVzfiPlebPDOl+
 HFO3IxWr0jyZVODnRkimEcDMq+ZnjunXVEw+zCDKir+WSHT8Y79HPnKTogLwuc3P1G3V
 NSoexY7K8T2dTkpQ6VvSbUuInysP7e+fvtfvDgUsaQaCOSQ2qrVpMqAomlfaegtbHNFT
 TXeN5ZJONQ91pQ/Kc7NICkjtWhJ4FPJuI+rWtYkkkbA7b2k5Eo9YxSBCW4Z0SjeOFNgY
 SViky7+/z0bPwl6SHLXJRzkYNKcUZxfzPdUkMb882DWyYhyDTMLRzxU6z2YF/ktMUG6e
 nxKw==
X-Gm-Message-State: AOAM5325M3r39iJ0SUukGb0vRrpijFwEEPC089NfRn+PW1jyZ7SE6pnJ
 uBmoLD+Dn4oBBOkRT2N86NscxQ==
X-Google-Smtp-Source: ABdhPJzP2SU8b7Ejhx9OfVfAUXunYJXKq9PtL2lhB4iCfhl7vIH39xSNcZZZPhsOwqd7i2bPARRi6w==
X-Received: by 2002:a5d:61c3:: with SMTP id q3mr3723732wrv.405.1589973934414; 
 Wed, 20 May 2020 04:25:34 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:25:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v4 02/11] dt-bindings: add new compatible to mediatek,pericfg
Date: Wed, 20 May 2020 13:25:14 +0200
Message-Id: <20200520112523.30995-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_042535_898861_2A5C3507 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The PERICFG controller is present on the MT8516 SoC. Add an appropriate
compatible variant.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 1340c6288024..55209a2baedc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8135-pericfg
           - mediatek,mt8173-pericfg
           - mediatek,mt8183-pericfg
+          - mediatek,mt8516-pericfg
         - const: syscon
       - items:
         # Special case for mt7623 for backward compatibility
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
