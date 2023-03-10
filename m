Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF94C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfueC8Ud+TxsewqPkS/fDVgjDJwxhwka0PgPS2fY1z0=; b=xoHrCsIoKXkQCTYb/RlPtk+4jm
	nsLwoWn3OfTXnirbmSMbgi+BeKGxVg6dPEo3PPe/sOO8+oxfhi+za9Hm1rcbyFCaUKC1mB6M9T/5y
	KeWNW9nto2nG5bASu5Ln+IUxSDBp2UaFTd8/xipob4teDK/7mDP0JGhjeFpc/IaCAWhOar6rfdnX2
	zhdtM46K5z5GO0vpEym8tYr8G6w51qB++Ljba0Q8aGgTpylSkIOxbQJ9H9zLtDkoxEQY/XMUXntgS
	zkpm3HnxkyFAI1kHUGltRHnC4f3uXmdazaZ2cS3pB9DdKg+3TL0jiAM5kEVKpPv1QxnuBOTWc38R4
	gWWCWV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakbC-00GDy6-6k; Fri, 10 Mar 2023 21:48:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYs-00GCcl-82
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:05 +0000
Received: by mail-ed1-x534.google.com with SMTP id i34so26055801eda.7
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfueC8Ud+TxsewqPkS/fDVgjDJwxhwka0PgPS2fY1z0=;
        b=K90kT9LAH347IN7aaGanwpD1pGk+lr2nq1GFiAMOUVwmIajNMd6FSgYobHYmDVe9x+
         Xp0RTAY0qIzp8AoHNjDiPlu+3mDAZfq/Vr8asnGZVsr79W36eaRS8WnYAvQX2tbrOEFh
         2DKmocArpikKUh3AylbFB76+tUeJo+Z+ATf1qkC299jJSQxQ0Mp9SyRFgp10jIAgx6zp
         b9IxsffVZrjR4bh4TiWORGRCvFLUvKkZcmN5ATVcoAIeDj0b9lvAAgcLhR26fXw/4hXx
         xLzxw0tUw9i1/U96VbyETa6TnMH543wkwqp7D273J5X3JKQ6uQjUThg6on6eCTDis43o
         Biew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfueC8Ud+TxsewqPkS/fDVgjDJwxhwka0PgPS2fY1z0=;
        b=qTQzo0FBG+CgyPLs5yzXPxYPJuQ0dNPTapMKSjg4fB42Xc/TypytOGodeZZPFKqOPp
         jggOLz024mzJ8a8J/zpvivUmRGbLVyriLUhhvbmPhz1RxY10iuIEbc5r4Kh2wzPQFJvQ
         nn8l7fohBKGwz/O4XBXPOYotJz59B9sJzNcGeh3+5aO29S39fKFjIjD9vefRQJKhFGqt
         oGahsfa2yVuKGNsFKE9P1LX2+kLwIv+8tZFVZrj9dwFGlW9+4dzpIZshGgH49zW+/NYT
         V/adPxYBHRQXtUFaymi4vviJAxLYv9CpF0TlCojwbpnCW0IHyPgzON2MeFu9YYFtIIBe
         T8Pg==
X-Gm-Message-State: AO0yUKUbO8NL+vqgDvZyR/9n34U3x/+/MEFeml2OgVjoeZyAkj5uHtEG
	xHN7zMxEmgfDo4gNR9aB6v+wdg==
X-Google-Smtp-Source: AK7set/+NUmIgbATpN/GwzCK7LhiB3l9y1iTqOcCxXGLgQn2rcQCH7j8l4FZmoegGAD3sHE0TVBUJQ==
X-Received: by 2002:a05:6402:128b:b0:4bf:4b5c:1d66 with SMTP id w11-20020a056402128b00b004bf4b5c1d66mr22987359edv.31.1678484761848;
        Fri, 10 Mar 2023 13:46:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:01 -0800 (PST)
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
Subject: [PATCH 5/9] regulator: qcom_rpm: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:45:49 +0100
Message-Id: <20230310214553.275450-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134602_342152_F8B9F06D 
X-CRM114-Status: GOOD (  13.60  )
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

The driver is specific to ARCH_QCOM which depends on OF thus the driver
is OF-only.  Its of_device_id table is built unconditionally, thus
of_match_ptr() for ID table does not make sense.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/qcom_rpm-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 3c41b71a1f52..602526669648 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -991,7 +991,7 @@ static struct platform_driver rpm_reg_driver = {
 	.probe          = rpm_reg_probe,
 	.driver  = {
 		.name  = "qcom_rpm_reg",
-		.of_match_table = of_match_ptr(rpm_of_match),
+		.of_match_table = rpm_of_match,
 	},
 };
 
-- 
2.34.1


