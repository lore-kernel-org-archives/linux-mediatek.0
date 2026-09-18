Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C49C982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=; b=oPI1Wdk4AYHgsRKfS24yhMqEdM
	c4PvfxeNIA92RrPXZ7SbNmWijZkxnzbIQ3RukoEq3oPGgwf0lQV/9ix/2awUFrkLNFuMSm8iZxPKy
	MlcQ5K/yHqeK9hgLUzeUawCU1EEk2oNabXJoWXMO9N/2VI6BKhXVzx2D39A7RsK1R3kF2f3JR6q0a
	k2t5njC9Gky7Lqarl56OqoNVmkmhnmN2dw3Q23EwYWmvrHMEN/mr22gLoaEpq7TJ0iAex2tjDpbuO
	5feyUbwSBdsVJzQTAS6qfC1SicUbh4gjUxNR4Kc9UbqsgdAvcqZ++p89NoLPGV13giIq+Vl/GG5R9
	TyuHuIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpH-0000000EauY-1hnq;
	Fri, 18 Sep 2026 13:40:27 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp7-0000000EamA-06Pd
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:18 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso433502a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738816; x=1790343616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=U37AA1svhxITsyO/gkpMkccf4nTGKZ1v7WV4nflwYrav1YbVGAcPgFgKUMk6bvQyZb
         yxZXnFnbfkK0kN7gQMnuKftm2+EgFc3Dvbx/ddY5W91TtbiUdREToTvvQGdGvN7EJyYe
         j9rqKjKtrnzMBPSWxJk9DHuA0K5t2BIKe+acm5zlWJP6UehT+u/lNWNNTcLx2aD/5KxG
         RHzdvH/DRv1UdLnQYrMmeto6k9n3/RYKMjAfEvMtf1WhK+mhKCFN8YXtOdqY2B504g78
         1AhRN5iNpsvmw4ckmRtlgogGSUCCcMZNFB/kCn4Xv4ccOJsw8EB5nIMiN6ER+TzeXap/
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738816; x=1790343616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=I7wPP+by/rKtUjVq5wO1l1abO0XDsU+iddWS7jzGpQtCdstgH0LAY9jVXNInWan38h
         NWowHtisu3G6VIYHf3tWYaR0rFrIycQ9azphyk6/MCSW2Z2hTlrKEcfbLI2AzZyMIePK
         5Vh1OoyoVE3srRpaFgqHXOU0uTLcJDMy+uNncK2u/97c+HSh9RyDe7M6mEtiugMqo9CH
         r2yiPxuLgUKMBw0qcNWiS0wpYsaKFqiU/wbXUipfbzBc0dXZn2/E4tHLSnrdRDliI3aO
         IqfC8eEL9cdaxOSLCxvpmoAOBjUSSR+XzbfeVeoM766ptAKhzM0fdtpfxAW0S3YpR/UL
         fqVg==
X-Forwarded-Encrypted: i=1; AKwUvByRPEKRqcPxdAnq0EINkXpCljDiuwfgdy8ZisZ4pz1nQ7mxSDDr4beHhSUlK2EJRixBIfw3bp3V9r717gPiCw==@lists.infradead.org
X-Gm-Message-State: AFuF++la6UDeOoxs4vrdk20nesw8WwIYPHA9EjteN2l0x0jv8IygHQQi
	5SKSfnAohviy9HHp/gl5+IioKct+fArKCZO9itGz0V8sFPKxoyTUeN28
X-Gm-Gg: AYBFou0Ztz6MtduHvddh7+0zn7/K3OD1NtdP9tk92w6bsxzIfYcwweZprf5OivBnRaL
	E02MmXim0Q92Xs9ly7W8GweyLDakTKHcYa7md0JjpelM/p8uYDNuPj6eoCDP9NFRaMw06jMturS
	F9JfgB2phL004vZ+LcLh4SH4T72IGCUyHuxko7iwgtcOYluSALX/OlAabLJF+OZMStIyHFxgkRW
	oD6ugIApXWDc1TMd+DQvN2fpIvPU4hmr4qGWYrpF28XLnOzit6dKnZOihZv1ME2Xwex/GF3A9w0
	1U1EqqkfXLgg7CWg1GVlIIz+vcripwYTVMQag7YNdt0NG1GnDBJzY3P51PzW0XWOhiCwkCJqSqT
	Vd5Eg6tLvRBuiV0SYf5ZUw3RLfUftSebxCjANI/1saVijnWwRFQf62f2cNvug8JSv9c7xac2m4n
	XTDqHxUvoz466PkpgE8LX4bYZ9mREkxkWjqVYIcTfx9ebYhcu/aPWC5A/QYsZRCc2bNu8ZRpBaS
	NNrFr1oB5J/U5BVJCNs7GrRs0apT2Gdn8b1vIcj7+GtZVICmX3fTpOHa7jiHh3k1uFPrB6vA7tP
	GuJscSW9KY9RJg==
X-Received: by 2002:a17:90a:e7c3:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e54eb2281mr5551712a91.23.1789738815772;
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/15] ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
Date: Fri, 18 Sep 2026 20:39:03 +0700
Message-ID: <20260918133912.133799-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064017_131416_469039C1 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, mt8192_afe_gpio_request() ignores the return values from
mt8192_afe_gpio_select() and other helper functions. If configuring
a GPIO state fails, the function still returns 0, hiding the failure
from callers.

Fix this by capturing and returning the error codes properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 74 +++++++++++----------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index b993ca2dbd7c..ed6dfdf2589b 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,98 +208,104 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
+	int ret;
+
 	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
-			mt8192_afe_gpio_adda_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_dl(dev, enable);
 		break;
 	case MT8192_DAI_ADDA_CH34:
 		if (uplink)
-			mt8192_afe_gpio_adda_ch34_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_ch34_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_dl(dev, enable);
 		break;
 	case MT8192_DAI_I2S_0:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
 		break;
 	case MT8192_DAI_I2S_1:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
 		break;
 	case MT8192_DAI_I2S_2:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
 		break;
 	case MT8192_DAI_I2S_3:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
 		break;
 	case MT8192_DAI_I2S_5:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
 		break;
 	case MT8192_DAI_I2S_6:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
 		break;
 	case MT8192_DAI_I2S_7:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
 		break;
 	case MT8192_DAI_I2S_8:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
 		break;
 	case MT8192_DAI_I2S_9:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
 		break;
 	case MT8192_DAI_TDM:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
 		break;
 	case MT8192_DAI_VOW:
 		if (enable) {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_ON);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_ON);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_ON);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_ON);
 		} else {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_OFF);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_OFF);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_OFF);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_OFF);
 		}
 		break;
 	default:
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_request);
-- 
2.43.0


