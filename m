Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5F4C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:34:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4151610A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4151610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lY78Agln2qu2swvmDO6ooSyWJqokdSrZ3CzF/Gn1CVM=; b=MmAAMIV+bDQO3/IwG/HGvNDtt
	R4fX+o4ChwjXbWMY8xvpP7NU7n0TKEyXu85Fm6VjU1t26TFVg8wG3izPAiKBoqB7YKdTaP/VPGscK
	jZq8RnMhRTU8D2pYMtsCDWiEV8Al/50Bv8OQAxp35PxYxmjQ53SHm+GePuoMzsg8QQjvLAb3ru4Ne
	6o32We7YroHi39lmFDRLpcc8+drIE0D8fTmpO9GufGXF46UeEUk0FPEHyyYaGvazIXcL1Oiv1L461
	YYCw2KESMy+MtWKv25X2D/17Qe7H2y2mx104Fv5TiE3iL2xsg06xgdl/0lv6Bt09Hl+TmxW06QHGs
	EkWH1agfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOQ1-009LWS-1M; Mon, 19 Apr 2021 07:34:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP6-009LIH-6Q
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=h2PEGOMW+3gpulsJ3q1pOUjCBVZvJJtGNOmv6/kS2ZM=; b=rxJm10QhGqsgK5FjTrNXOc1sgv
 fAwT6xPEGUOzqN8riDA5xnHCEz746Mcf8PUgL7na3xxrwfzAtxFZq/M90PAye2COaxu0MMc866N0y
 iYL4NbYb16Oo7owrSl63Gt1tNtwKTOaExu76dLdBugPvND2iPw2FfAzcqj+xUaomBT50lUgiXq6PH
 e4/nAuojFiaafEd6uND+noqk9dXuDF2WafFFLXZl5L7dBSSrAN9dw9iZiP9bnyVp+JD6oPzd72g0l
 0HeYNC/2L62fHKO+YrzffVUhl388G+lfksugGUThFXrztHxeWCTFBgMSGYaKd3P2D0SEbGuvns5Cg
 ICo8W24w==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP1-00B8LJ-F7
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso6264736wmq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2PEGOMW+3gpulsJ3q1pOUjCBVZvJJtGNOmv6/kS2ZM=;
 b=yZHvSB3fef3HnnFjWGamiYb5ZJjeXp8+WDU0fFLeest0MXpgvf7sM6naMALr2nV3r0
 OaVPutnaC6Y7Ddmmw0/Ke6QAWh2+uBV+Fwb5WDwwTFBRdN/jTEoeIPOvXzfhd2ftDYLG
 p4QCyFiYCMyseJOfmQdvccFpiNSxKQdqpwI0ryCF+PrFFYv0fbR2Oesb9EqmMjDgir5g
 hlpRH0/NPN0gqyreH5u1gXnl+PC9/j2r5bSL7m4IUvDaG9yFQMCmo6910OYdz4qChSDf
 mRdH/h9Oq7HVAmSWeE+JCikmPx2UFoRPQpHwOK/uJfC9sWTpZGtLLaqIuDh1XzIznzT/
 9LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2PEGOMW+3gpulsJ3q1pOUjCBVZvJJtGNOmv6/kS2ZM=;
 b=IMsQy1crtsLrzFXtnvQ/VpgW9pSB0OY4wi1AHkh8+wdCByW8X0EY86Nx6CKGOMITAM
 0wM0TLSDg/lfzTaU3PvV8XFgkbRPGjKewjMlFm/8CzpLHYCoKf+ozO7nFFr5bnMCrG91
 U3srWVFSnMt4aKjekk8adf6eny8DkNzMNwqBJ87vEGi9YUo5gLFDrI/RIn7Db1eboxt9
 6WgdBV1fzkzieVvM0omcimSPDMREia/r8hK1x/v3G626Nt0a52EPVyES/77Tlg0coRyp
 Qa1JihOxIcUHLbR+8ZbclfhH1G2StxuFt/8Cvh6KJJRX2PfmyNHw0oB0jPHqJcPyXYzX
 vcnw==
X-Gm-Message-State: AOAM530um+WBtnMd+sUj+lzbHktWq5dsH+i8k8lMJQgSP7brZwI2/iaL
 bisqDeEOxs5v4Zij5ibhZrqGNA==
X-Google-Smtp-Source: ABdhPJwWOVRcnouCxuWBQ/lQ5ASbbEd+ynjH8QI7wycxaKzH87nIRpFgnrsrwB6ZhQ7D/YYr/9AhDQ==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr19913634wmc.90.1618817581576; 
 Mon, 19 Apr 2021 00:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Date: Mon, 19 Apr 2021 09:32:41 +0200
Message-Id: <20210419073244.2678688-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=weRuGrIrSCS/7E0z7zGXTfkieqKmo2b9b3zEqPhglEk=;
 m=4OhWpDRl3EWsKo2xAbHezHdcGoUrsEeovaOubbEbqC4=;
 p=zKmvMzMsvi/UJaeb54phx7cTaLZasyaFc1SoAWluN64=;
 g=bc9c5611c788292574b503426cd53c1df4c9afa2
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdHkERAAk+N
 +2dE9zUrVcQjhb8YopX7VKUMGbIIP9PuZo9jpMxJOiARMjBObXYlVFKIabe6tjTwGJOmdd7UJRCRN
 Q5arXTAze7ZBggM4NU9T5iGkUf8q1PCfsfKWVKwpRLAe517LqsBICviVOlivfrokYS2wrD4y6YvBJ
 fuisd9b7iwfSrPSr0bUkxCdrMoOwasYUrsLDygxYcQeE7++YZnBjVfdiiP0G05ktzUdbxruMOOSN1
 Ox3hrMIKqujAGnSaqSi5TXssVrSUMU9R1qb9nZ/M6SEEBoQ8+HNRQDAM2NfDGqy0cNoCVUzvJ/Yt1
 r6D3xKSWFpzqKXkQTR8tdpTy4wXeeLJdKdZnlNXbpyNCdTAGKZS/kAbul8/TMKRdWwBr0hUYZlz4I
 nq3NdEkJOq5by7N2JZk2dzXUmxcmvzg7SADvoQRBhi4TgVTo4Z92XMDaX3dcjErqWARwGw7mUhSMZ
 yuaVibaskfGYgBQbKhMdft/+JMW/HA5SB9DHhDKZLsyIa9emSThNz94R95xeJ+xeIEcQFWrwBvDS2
 gRMT+iay39T04/VYfwkq0RJxD+9Bwz4XqWH6awDvAlprJmQRPwGnUkh+3cQUjEIMTTSfU8uDPbECl
 03oxBby4nmvDVtxMFk5jb/vDz+b12P3pYj9ZBYgM+IrTEETFaVALYE0F2LmFyDaQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003303_514951_F399F395 
X-CRM114-Status: UNSURE (   9.27  )
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

Add mt8167 SoC compatible to Mediatek hdmi, hdmi-ddc and cec schema bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,cec.yaml       | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.yaml      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index b38d8732d7e0..66288b9f0aa6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-cec
+      - mediatek,mt8167-cec
       - mediatek,mt8173-cec
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index c8ba94d6908b..b6fcdfb99ab2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi-ddc
+      - mediatek,mt8167-hdmi-ddc
       - mediatek,mt8173-hdmi-ddc
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index 6a144faed682..111967efa999 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - mediatek,mt2701-hdmi
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
