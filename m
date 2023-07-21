Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8438BC00528
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=; b=MhZnb6aOcggnha
	jZsiqQiEvMrBlkofyqRVUYP1PiOtF3FbRxDvplv4b2T127enP6k+y09J5WXQ/TvkYI6v4MqqAJSbF
	DeMjirv9q5tdLsNr3carJwYK0wAoBi7g/kO4Fl1tSlOOCa/mgeFmveZF/z+d8RbMVLnsHchZKMZGQ
	TgoUaGslZt8gPXkONKJKHlmVY1RCQc6WMwVEE8QsNO4FFGpQgPiDpXKiSmqiWol938K7Pw5R+DNMV
	YfBvJQeIhztAhAQST4LOFQEspkoffbLHx0K1YnnLzWWF1wFKymy/O9wuBAmnJXYW6qd+PpWOzP4gj
	2/yAhjDVYXrTtdi3E21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlWA-00DNPJ-0G;
	Fri, 21 Jul 2023 08:29:42 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW4-00DNLM-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:37 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a40b756eb0so1027730b6e.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928175; x=1690532975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=;
        b=RW7GYa24SF9OUtc1EwYBobJChC2NGH/9ryiaix+d6Lb7prlVSNmtW31odoBZ6MdhLH
         xGf7HcgZhS4CC2qc338kcpffmjLxhCqX7S0PN2nGX253i2MbmLXJM2aQLiaav5rxRzXS
         lkoLYnuPiwJNtT85A02CwFnryI1ZJ+Pyk2yuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928175; x=1690532975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=;
        b=FsC14ehKPYlIimiYTg425eO7tGR+xy8C+dHcf49JjLB6RcRFvFY5faAHxEmknx5ev6
         FwraVb7L9fz0CKkqJZgjWePyL5R4JZFqViwmLkg1vWVvfwAS6/49rfwelSHbfkM5niCK
         3U8xZl/hC0mPt37ApronZgNl7ouPV8HSyMuHfLYWEVtKJKhClORMrNjYt/8uBGZwxHGy
         kuEqsWWofVwNMDrCG85lKujcjg77YKtH7zk4xDO11eBGMWV+0FKUzscNSCtSxBti4jHC
         tomVmXWD7XMDdF55eep3gjeDnY8EXRL3IkBlTZEzw8AmHC4nJi2BmEzoFfTqGIKjB7VB
         5o4Q==
X-Gm-Message-State: ABy/qLaBvDsMMalsYUoL0erGhXxyvk8LwOxqQeo+wPPgkFY1673QvG5c
	hGomVLZqG/iMTlgxpGAbzgheNQ==
X-Google-Smtp-Source: APBJJlEaH+ytBtT6CWe3CshSGBWY3wUzqSd86sdwBGEZQQl0EkYUmpQfwwK3cbB5v7Sicgp2RjpOUQ==
X-Received: by 2002:a05:6808:280b:b0:3a4:350e:b213 with SMTP id et11-20020a056808280b00b003a4350eb213mr1139687oib.27.1689928175257;
        Fri, 21 Jul 2023 01:29:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND v2 3/7] regulator: mt6358: Fix incorrect VCN33 sync error message
Date: Fri, 21 Jul 2023 16:28:55 +0800
Message-ID: <20230721082903.2038975-4-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012936_415923_3D32D318 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After syncing the enable status of VCN33_WIFI to VCN33_BT, the driver
will disable VCN33_WIFI. If it fails it will error out with a message.
However the error message incorrectly refers to VCN33_BT.

Fix the error message so that it correctly refers to VCN33_WIFI.

Suggested-by: Fei Shao <fshao@chromium.org>
Fixes: 65bae54e08c1 ("regulator: mt6358: Merge VCN33_* regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index da6b40f947c4..b9cda2210c33 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -661,7 +661,7 @@ static int mt6358_sync_vcn33_setting(struct device *dev)
 	/* Disable VCN33_WIFI */
 	ret = regmap_update_bits(mt6397->regmap, MT6358_LDO_VCN33_CON0_1, BIT(0), 0);
 	if (ret) {
-		dev_err(dev, "Failed to disable VCN33_BT\n");
+		dev_err(dev, "Failed to disable VCN33_WIFI\n");
 		return ret;
 	}
 
-- 
2.41.0.487.g6d72f3e995-goog


