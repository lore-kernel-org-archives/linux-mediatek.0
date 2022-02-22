Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AFCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkNxhKiBEk7ff0npq+444KQUuYA2JsTS97riaAzGVzA=; b=cHaTG73Iyt2X9f
	CiAaLUeYAuLLiZTHhFs8AL3h7Rw6P82cwqJJ8UVEqfLUqQEOiffV72rVyS2oUwVoPtQFAemmgu/FP
	9Jcyd8Scii5D/AYdUEpTUYO5PnLBUSq4bB0QQHgae3aadb+kKxAMkQWPdDseuM93XAr5i07OnOhz4
	WhGIAR3Acjmp9ErQxJj1nCSw//tWSiY+hVQm2H+C0P0vubuzyTZMFiaqERo3OIlbMEBrUzxSxo3P7
	ExBR5fjZNbSU/aMHgYqs8cL0mo9b5eluRpeImKQhPjN+FlygLqNUBa0VQgcdHBUnuDI4MoLYHqSPG
	AF7sQGu/BsFWGg2AHy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWkl-00A446-Nz; Tue, 22 Feb 2022 15:06:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWe8-00A0Fx-ER
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:11 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B5BDF3FCA2
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542006;
 bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Rdy5IgroHscYIVGFB2/xRhp+CT0/SgnjZiWGmaHpKCe7Vg5++z1SVwH3C8AKYt3fX
 sX5lZoOj0z0PjC0EXg8mKmfxhBDoIOYFwuP0Yd00rWdFkj+Gy+4qUzH39H0JisYEVZ
 7ZjwlVxfFBQuo00my9tAwkIiTgvisuAKzqzq999VOjcHoOwd+fUryWYBIMDIepJPLo
 Dg2uPLX1hqO+J/Tbdv3kK4ByFlCCxNuZAAZ8GrP7UejwPYrB/1SRGyT5AtPEPHI6pz
 wZbwt6BZh0U/SWhN8w9qy5ka4blUROpgdxXh1cfeZ+k7/Po1AizcIYfRCz9HwRfn1O
 1R5bYqIxDvgqA==
Received: by mail-lf1-f72.google.com with SMTP id
 m18-20020a0565120a9200b004439214844dso2850579lfu.9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
 b=KdoUSucQuYzNIXXnYWU41ZTLA4fXNcUUPXo9JNvJwIu1R+S0WuWDi+jibzSl5L0PTw
 M5GV1MNT94Wbebwj47XQPEEXLzepjV3ZaEgngPJmcnYJlxE4uLEFQHN+6kxLdkGm33Zj
 FdX3Eve016g7G36W7qg3NExqFiWmdYT7uJzUTaWzIRZQMkmnI/soCK7eK61RRERvEUUr
 FnAYwqDuqjoFO77YgyL8s3rwWJ7uwRrkdpVJLXl1abQY2J2CSIVZKY5Te1s/XRnqljqY
 biPV3EX0s96GPvdE8Oq4teIklJwQmPwhtC28xRGQeSkQn/x/CGLUzvqhyEZPa/rkuRiJ
 pEFw==
X-Gm-Message-State: AOAM533IQ8YoqUQ+JNhPTLY/7IDxWorPQngXrYAfUGBRzyaC3PN+tpeQ
 aWCo2SuHAcYNVfgeofZnDI/2qe103luPgrDLG5n9StS1oUKGR8nnaEly6Pq6kOk9m88z/sHcCpj
 qqMhg2R01uYyD5XOhf3NS0vjnLun3MjZiz/jz/iIwyY/RhzkuGQ==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id
 x1-20020aa7cd81000000b00410d64eaa31mr26939020edv.167.1645541995667; 
 Tue, 22 Feb 2022 06:59:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaJdWHb8xk+e2xSEaK1p8tjIOgBKlnOjh9riknUovYkgJh1fsrFc3SbrR3EFVhnzBs85hG8A==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id
 x1-20020aa7cd81000000b00410d64eaa31mr26938989edv.167.1645541995521; 
 Tue, 22 Feb 2022 06:59:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:59:55 -0800 (PST)
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
Subject: [PATCH v2 10/15] arm64: dts: hi3670: use 'freq-table' in UFS node
Date: Tue, 22 Feb 2022 15:58:49 +0100
Message-Id: <20220222145854.358646-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070008_636782_19B16562 
X-CRM114-Status: GOOD (  12.59  )
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

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 636c8817df7e..754b3a66ec0d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,8 +671,8 @@ ufs: ufs@ff3c0000 {
 			clocks = <&crg_ctrl HI3670_CLK_GATE_UFSIO_REF>,
 				 <&crg_ctrl HI3670_CLK_GATE_UFS_SUBSYS>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table = <0 0>,
+				     <0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
