Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE2FC7618A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcJ/60CiNR3l+Pd6V0GQSncdZhxdS57tle43QWwe+tY=; b=LDtVudiNgm8V/eo5hMqwrOdMmB
	ntg6Sp3LOUkuC3m9zHkj4DwGxhAe6hpREMwOhi/DeUnm8HDWj1nvSq6Azrla/c3CIaitAC4oC3LU7
	hIrQV6XACP0uq7immEcr/DXw2coPKbbChF8yUT/Tczo5ADaWP3c0q0BNeJPpbiJ5AxYRFhYWSZiGO
	MxwhPkziWeujQ5n02lCtFnygErhZ7wJE8LPMKRnJhGRbiAEgNsqInV7VoxeEM4eSW3izB38hF3MvG
	G1ULB93eQtAon72NziE8zgjmqz1meGBKck30Uz/aecd1CMzKjSBNVpL6//hY8nX3zuxslN8x/vSWW
	P+Umx1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakdX-00GF96-J2; Fri, 10 Mar 2023 21:50:51 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYv-00GCiU-AV
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:08 +0000
Received: by mail-ed1-f41.google.com with SMTP id ec29so26103493edb.6
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcJ/60CiNR3l+Pd6V0GQSncdZhxdS57tle43QWwe+tY=;
        b=wkkfav1K6M61QRhE9V8HY3ENf7gq/aljitkY8HA9KCHMp6A433meBOCen87OiSJ6M8
         3e95ZBhcHaY6o5VcOer0bVlf1lwNkbZfsDvIgHIiQFIfq3fR40H8rTxSPAll1MtmelJp
         /nrjCsgPZY+oYIIVXjeHeYpe9dCvXFnnS/GyYrSeBE+Ky2hL0Cw0Id/iaZmpDLMJPEVa
         q+8tEux3GXXER2cyV3ZjznAn4dDdlCBxC8NitNLVSMU/dGT/IOzqQj6lrYwi6h2ztZHU
         QZE45HawckDcvoICrRTu7dlPKwEtM0HnNYtD8dgR+W7ya4Y62d2texKEIalbJ7c4oonU
         +PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcJ/60CiNR3l+Pd6V0GQSncdZhxdS57tle43QWwe+tY=;
        b=h/xBk+9TLWqv1P5v2ipzofG7+0Y5Aw72VN7TUv0QNy5jO6AL71/v5KcvzqPgQLjg3x
         JZ20paSgXafTTegKbXepU7cTzG3iBJ4WulxQNHsLCwUOaJnxuFBM0zd6k+Lr6RjGitH5
         3y6oNyITx4fJ2QNsSEcCflaJ/t3iGFIRp8zPDyQo5dCElParQQ8/+v+mk/cYILceCdh6
         XSVCbh+OKHrfbgoq8R6OjugzQYSZ/ePws9RxCcpxjDjkgJRhQ4QOzkffm7WQAM5n1JPV
         IBBBsLzq2yHQRPOQnXUZz663SYtyoUj3ZcEy5b+H0Bo5IU8IHYGYWkE6yeorM2a8CsAz
         yqCg==
X-Gm-Message-State: AO0yUKUxWlNC76xv2mCvoMA5/OHoXSWp3x9OAe76daKSIABRBv3/ZWzZ
	aMD6t6sbTW+R1tx7bebvNZu5fw==
X-Google-Smtp-Source: AK7set9OWMBah+XLayBu0sHj0HkkG9xbD8r5gmAQE2k0KYWypz08rz5B2gUGv07SfC4WtPbAYwCNgQ==
X-Received: by 2002:a05:6402:654:b0:49e:1f0e:e209 with SMTP id u20-20020a056402065400b0049e1f0ee209mr4078070edx.10.1678484763064;
        Fri, 10 Mar 2023 13:46:03 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/9] regulator: pbias: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:45:50 +0100
Message-Id: <20230310214553.275450-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134605_463792_0E06A69E 
X-CRM114-Status: GOOD (  16.10  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/pbias-regulator.c:137:34: error: ‘pbias_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/pbias-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/pbias-regulator.c b/drivers/regulator/pbias-regulator.c
index 4eccf12f39de..4ce06072f3b5 100644
--- a/drivers/regulator/pbias-regulator.c
+++ b/drivers/regulator/pbias-regulator.c
@@ -231,7 +231,7 @@ static struct platform_driver pbias_regulator_driver = {
 	.probe		= pbias_regulator_probe,
 	.driver		= {
 		.name		= "pbias-regulator",
-		.of_match_table = of_match_ptr(pbias_of_match),
+		.of_match_table = pbias_of_match,
 	},
 };
 
-- 
2.34.1


