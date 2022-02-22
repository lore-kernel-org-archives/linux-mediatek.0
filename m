Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZupr563VlsZdBltNLdjWblVrIvlZ5BakBOVrtZ8ZFc=; b=gw2/QtqpK80j6O
	rf8XkCQYWe9SE37O7InmzjaH+T6aW7OQdFllN+Yu/sZZGtzGJtMG7rypJlikRHB06QoVz7vhhXs4C
	fVC1ETnbJR6YBxfDHOkRfTAh2Ilx/FsEjJV2BocO2dsiPqk9JSbM6uhUVfTUkV3kgEFoJuNghBDoy
	wNCezA4Wg9Wh51yBYWahJxMqj6T7V3yW21qSGJi3HncLZz77zFYKZ1xaaKjc1QF+XwoxSpOn8SMcy
	3R/GbqPfOaxEBCAlThln7vK9dOmP0D+OchgKsVt5jacyLdz11Xnkue3ISARQZsteEoJiCskaXYC27
	ZMsd7N1dLSHKLRSDvM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWkx-00A4Ak-Cc; Tue, 22 Feb 2022 15:07:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWeA-00A0Gc-5i
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:11 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 500023FCAB
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542006;
 bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jo9w8bIUs1C0Izyrk20saT4XLdL7BHlv4MJO36EJKSYbA0Og1rc4uUaxx9W+EuTUo
 4wPFh0kfuXNGy8dXgp5ZOiD9W/nwhW215rvY0Fp9gs2M1S3BHvW5qXsyOzrFQD7yXb
 Pw+5qxdXV67fxHKbKPti8LAekLY/KnbtxZYPkNsmfM05n4+427mKNvzaWqSsB+jlAu
 mbbVwcdS0PymwLrQoJo3AbfBDZG7SYM+SsgrK+0RUf5HdL6h02hMuAYK3DMBwy71hK
 L/eArnBF2h3SjHfp2V+q851xGA0hUZUa8QaIN1RVkQqnPekciMA5+IGfLy4Oc9gp2L
 ZBDKmo++3siZw==
Received: by mail-ej1-f69.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso5865034eje.20
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
 b=cMofrZqd1o85jlrWeCClgxCrU04BkJ108fnZyFrN+wBbhu6B0rVyCPNjX0g8qEC4xL
 F8lSZhcoYlHdk5tZ0rwcs9nTzR0+Ds791ST8ImDXYk8JgKC57N2lIbjemmKqpNdfXKU7
 scxAFmTZsAFAsjD3qRT+jAU78FRPHWvXSIGcHSD5Lo89iHBw7F+vlpFqLoszckEaV2WW
 odlr7V90cSpmhST0+GCiuKVhPk73GoOnnzMTk7zquvVCW2ERhTZmyQKPDmm9RnbUj5Tx
 DJeloBB0j64ZYNEs6A+RuPL8Gq0h+zBDo/kVIUYp3W+FoCYZ8hXDDECTLat/Rit2dSm6
 ET2Q==
X-Gm-Message-State: AOAM5303UI9jx9pEifAwCCXNaiDqYRRuko4SFZisRXcgRV6F/1oEqMYD
 QdbvWd6irBcx8LXzXLtWMn1JGP1OQrTpIwhkM0yi9SWOw2G2I4a6/qtPmNalD7oZW94+po2HjHO
 A06uiS+pG9nPaYMTCfMcbcNlbbRnRH9ri+eynTjO3XoiXLTuykQ==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr18914900ejn.551.1645542003129; 
 Tue, 22 Feb 2022 07:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLi2RkpjMH1XnBpd7ijPxBtJkEM6ya606jWmcrmuPZusdxAuidRgjMaupSJDwmi2J8JqbfkQ==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id
 o6-20020a170906774600b006cea12e489fmr18914869ejn.551.1645542002826; 
 Tue, 22 Feb 2022 07:00:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.07.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:00:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 14/15] arm64: dts: qcom: msm8996: correct UFS compatible
Date: Tue, 22 Feb 2022 15:58:53 +0100
Message-Id: <20220222145854.358646-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070010_378039_3B45C224 
X-CRM114-Status: GOOD (  11.95  )
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

The Qualcomm UFS bindings require to use specific (qcom,msm8996-ufshc)
and generic (jedec,ufs-2.0) compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index fad1bbfa1c0a..f25c68511b64 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1728,7 +1728,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
