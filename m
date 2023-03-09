Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129E0C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=; b=4S9dKYs+DwJerPtblZRkiIPcQc
	Rs+56yHm/NI5EsiT5NjspqckmMXSpwvMqKTLw58OQ0FtGHRhW5b0zgAXrEjrKGPJ1UfQPuck/aANR
	CxWvvUtNXlQYvXukBvv3MV2rCAKp+ixMLBsPuwUI235SykaA2U3EZg0mnxZkwnoW6KqySxhGlK/6/
	HqPsRl6EBNzE7lyFnPidtRT0goKw6lcdIB5ZbScxhhZYZQEBRNITGFYRzps7O/tuCp5SoAYAqsXxR
	aGjpb/58Gp2+XBsL2RfPWGlt2gN43YKl8SYgBX6fUc6dfzdx9s29BrGa7oRbnul+NfJOVwBkHPann
	+rFXFojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNv9-00C0jD-6J; Thu, 09 Mar 2023 21:35:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNun-00C0bS-1q
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:35:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o12so12643294edb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678397705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=;
        b=TIl/6CQjvSe4YeVvY4cH6nV4V3PGDBL5sVSS2OedjbPww9taZoGpOPUNznjXflof3O
         9ELuphT7XRtnzvEHQtPjNucUPk1fNRtQt+5bupz3jYBwW2Fl0CGYdi8T6j0cJWHjczb4
         SzKbUiLoZeh+2uXMsnOs1vdxP1mj/6etFSodRoiVRUNSzP8A+Eo3uRsiMsOksw+B/5u2
         JhdnK/ZGPELQ8eYlPaC57jfkbUgWDpQndn2dktjEynHr+E/R2hvpYD6c/RwtCZlIJbxr
         Nw11h84dUQ8lhyJj69mqvQeqlI+yoBNGRfG6J1uTIJIwcTBDi/TugVZTyJMf81CGTyfl
         mxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=;
        b=t+FWVp1pHxCU/uzHLV8tJVuRPof/DMulyxnw7DLQ6DRf3FrcYHuU8J2RmHBZNl+3HH
         bUzb+M9E5nCczcOPnm4Y1s5t7MFLhte56Xjt6OclJTVLHY3URqHBputFBXpVPCXPMVcW
         FfW72RQns7La4Yqn8CyiTSqWMI+o12SGffKqteedATP8kQH0KqrzBlvMwdd1EPG4QTZg
         ojb+Drhwu6e4AZzQI2f6kcYKMoHK3aCM0b/7saRaueTVxX8hG9Z2XJDtIvZ1SnUtiZxI
         m8R7guSm6iQIohDxpG2kCcE/Jzqqfc1BHoHt0VRytMv8/9M2utVTDYh09gJU8Fx9zaPr
         XFlw==
X-Gm-Message-State: AO0yUKXghKIZX4pmQ3oZfCs27Kd370t/uIQWRzdZKVia3wxO3+T0Bt6+
	/EoWS/AHMLCb44CcBcWL1peY8VTFRZT6eyZ8m7E=
X-Google-Smtp-Source: AK7set+jVjANLAicrQHU3OMzrMX/odh2hvLIfV3/Xo9e7u17cIrpWkfMHBv2UrKmn5EX1/IPQjS6jw==
X-Received: by 2002:a17:906:1289:b0:8f0:4a90:a764 with SMTP id k9-20020a170906128900b008f04a90a764mr92340ejb.23.1678397705156;
        Thu, 09 Mar 2023 13:35:05 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id 8-20020a508748000000b004af7191fe35sm211486edv.22.2023.03.09.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:35:04 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Subject: [PATCH v11 2/3] dt-bindings: serial: mediatek,uart: add MT8365
Date: Thu,  9 Mar 2023 22:35:00 +0100
Message-Id: <20230309213501.794764-3-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
In-Reply-To: <20230309213501.794764-1-bero@baylibre.com>
References: <20230309213501.794764-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133509_124051_AA6F5E7E 
X-CRM114-Status: UNSURE (   7.34  )
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

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.40.0.rc2


