Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4042FC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:46:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F5C613B8
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83F5C613B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HzGioIR9TE0sIWHYYPOKPuIiWif3IhrhPGOdNFhdIeY=; b=HXEAHrPcBG2CgQ1ae/3VRqCkm
	1T/ABaWjXWLNHFEMA6I3QScXRFixnC8wy7Lc2LumrCkBjUCTmzJxilhIx2Qfcdg8dkP9B11DIz7o4
	ryOlevCkiU8gHGUWRjlZtJtWtpo/OnRMaNkehIRKlIs166toZGQteLi1YOK8UNLMxDayH5TujlIMn
	5ag3mUBHz+zNylJqZMRdNTqCv3Crq5EuQIW2nimLGvIa72Nk4JEdDuBViiGhOJnHbKih6ZXfjUfDx
	poKX6k4ojfLh/vCrtfGRYhxHvAPTAm9YAZnVyk83qwVQxmxJFfsG80rKYg80xZctW5/QJDpi3jt3f
	OEk+RE8bA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTk9W-002QGP-RE; Tue, 06 Apr 2021 11:45:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTk0Z-002Mvw-DL
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 11:36:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id x7so13843013wrw.10
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8P1R0vOoYt+iRLp92hKy4ER47sIrroX6pk17J519zYo=;
 b=0K2AIi2IQdb5pGIrrn10xuntiCkPk55XqsYL3mys4hDU3VKZhQpfOosx/g3+Klx4uV
 TFsbFZzrR8pxinBxmTvvH5PxCBheqHQjMHi9EsUm7ljXSQTzDBqOEl2K8B9VOMIoG6lj
 c4H43xx9TlG4zuUvpaB4K6rISFfpI63gYH71NBXpvFaXobCA4EXYbvM2JvWABLzGfV1D
 q8Yfk++i/VJaDIDgBMNlZSa/nJcNtV3e3uPG+l+iB5xEKHR6RvvNz3doJxq1j3PBfawo
 rWGyO1YcBurBAB2RQSR5xgXFuEKiKAlDaczu1vEK2v08g4NxatP2qCkCVmgvyQ5rjEpR
 c/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8P1R0vOoYt+iRLp92hKy4ER47sIrroX6pk17J519zYo=;
 b=Yom1WebBfhRNbyQve3DovG7nIraqA/ZqCCMQA6DpPCHyGj2LxeA53Q4CVjFV78CRkQ
 YDFRAsHSFQvJ4T4TUSH0CWpJ282gUDTJqONpEcAYrgAnHBwtgcSi0rawKkvtGJJHDkVo
 uhsIaBn+vKdAn3UxT5vSJ9/Q9/iHZor51tRJqLkpSY+YZC/tgR4K3uxaQ28kOZr34ZkE
 iqtlLTgMqgX5Ix8pUJ4QFYYAbng8Hndjj+ufpbZwtxhZ+rT/0swZKbkBrXVlSgJMeIjX
 CLE5g8PNTQHZjnDLvWgZ05YcnMWHhSaqgWW8i2srCzL5WI8AuRp78J0eRC0AhzZTZQwM
 dLTQ==
X-Gm-Message-State: AOAM532uVY28zytDeFdDpqVA1Du383dlXUedTbJ+6uX33narJV+r9A2H
 bzXBVvrrZwdSrAFxAtRV6AOz0w==
X-Google-Smtp-Source: ABdhPJy5ttjZp/FzT2SOjuTcZRTy3ru48FPTj495+Gc5ocBZ/liZRPJ1hrEFxiPl5jG/QXOc+E+91g==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr34993104wrr.118.1617708994692; 
 Tue, 06 Apr 2021 04:36:34 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k3sm11880735wrc.67.2021.04.06.04.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:36:34 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: mediatek: mt8167: add iommu node
Date: Tue,  6 Apr 2021 13:36:29 +0200
Message-Id: <20210406113631.2675029-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210406113631.2675029-1-fparent@baylibre.com>
References: <20210406113631.2675029-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_123636_077800_08BF1B88 
X-CRM114-Status: GOOD (  10.33  )
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

Add node for the MT8167's IOMMU.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2

V3:
	* Removed unicode character in commit summary
V2:
	* Remove unneeded cell-index property

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index bbddd4b22d3e..9029051624a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -170,5 +170,13 @@ larb2: larb@16010000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
 		};
+
+		iommu: m4u@10203000 {
+			compatible = "mediatek,mt8167-m4u";
+			reg = <0 0x10203000 0 0x1000>;
+			mediatek,larbs = <&larb0 &larb1 &larb2>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
