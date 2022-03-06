Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933ACC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Mar 2022 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xah0Mmf9DzdYcZz2ytEE9B+EAceQRBZUOtyfDP2/EDM=; b=0RotaXm6mJLidu
	1COIXJpOi6q36hDd7En6PgZUN4oXpjiIGVHJua8TU93ynJtrqiaR39i/mbQfhWb2Njrg7nbQADtag
	QbkNwbMboR+7n4sE8cnTrHtXOh/zMChtnon9dJr+BlMD2sCmWdH3YnEadbzsksgH9l2i6qi1Yk/CT
	7huFGm6J/tnudrVR7axRg2AguNHYjTK355A3+jRjqjD5gvHEcOmbLlqoKyMvZMLQmHLG+QiOBPytK
	I303GDYcfNGOKWACtZrgsLSzpQIX9n1+uqnElwZb7NcFdGuqGXyqCvEi79eAe3jQ35UtEZ75bKK6a
	InWsC96iHmlqbzviHosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQopi-00EWDu-5k; Sun, 06 Mar 2022 11:13:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQonr-00EUwq-Pl
 for linux-mediatek@lists.infradead.org; Sun, 06 Mar 2022 11:11:57 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CD7C33F613
 for <linux-mediatek@lists.infradead.org>; Sun,  6 Mar 2022 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646565109;
 bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eWgxfQGmjLVT7Bz1eFmuLhIZ2cb7QEunv+pKuYxowwNvo001KiqSGat7O738RMned
 MLhzSdXDu9E7omGUh/zT22+dKt0KXE5JGp6xm2DzcGaplyZB95EnrE3600BmKzgCih
 mfiMLRJIIjmcaVbaHmYx8Gtz1COUWmBd6GzkaWwlSEAVEbNegmErUYrnoo4ubmWUtm
 H+ROkqWM0gI3cvjx7INML9kqUCt+oHiBt6eXwGP/v9ZSKD7D8j6TQ0T/o7abSOrrxY
 Ze75X9PUgzXvzqKbXDqowfq47F5t9xZWjinv8NLx+B44T0XrQJSlMTivIXAv8tKBJv
 zH67zfKlxbkxw==
Received: by mail-ed1-f69.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so6761478eda.5
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Mar 2022 03:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
 b=pG+nDa5wVkdwYkOpKvuSqVRonoTGUHoi+5LT5tjRxqOraphf6h1cJ4vllqSreMpLK4
 5JvdZsN9Wwq+pGBBjPah8fqXcJjWxx9x8aVnmmApUPKFDWv5Hybum3YUOxaoqAyhCRdg
 4CzZCqWsyLeR5zMhXl87zebdECI9bbAesTbi5Coq8bbReSiUNgRiNBdCdCLxcw2b3Qdy
 R/uda++lGvwobT8EqTRrkeFl+soQdmAA6VzJs8pXV7RRqmTeIhjAJjJYXopKc8Cy4R+p
 LZ2z4bMLXDLHtr42wdhXPDAcvajNv9VGCpDagjRNxNgugefA/jtevEf3Lvpufn1SKxsP
 HIcw==
X-Gm-Message-State: AOAM530EosVWcJ1IC3gqXTegHea3XB80kBJs8ATjCPGNCnBh+enS31+v
 LRgvTlVCH0ZsSVnBbGHRkLszjpodgW7AafXtwoScGko1wuo3NuRAReY+p8QSX4fpqH9ECp5J4he
 7QBB69Q+BCAm6bEqQjh3oxyRX6nFp6VzX98TtsxN2vB2k03jvyA==
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id
 b15-20020a056402278f00b00410d242465emr6368196ede.292.1646565106227; 
 Sun, 06 Mar 2022 03:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW1Ya1zhxY85xcQnirVjPnpGI6XhFX2Sj/phtUq064BY75zEOeymYAnMlQ9+XNNG3HRgb2Sw==
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id
 b15-20020a056402278f00b00410d242465emr6368175ede.292.1646565106043; 
 Sun, 06 Mar 2022 03:11:46 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 03:11:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 10/12] arm64: dts: qcom: msm8996: drop unsupported UFS
 vddp-ref-clk-max-microamp
Date: Sun,  6 Mar 2022 12:11:23 +0100
Message-Id: <20220306111125.116455-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_031156_001140_E863ABAC 
X-CRM114-Status: GOOD (  12.06  )
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

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
