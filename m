Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68418C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wk7HS+JU2o5z8u8D+phfvsWKJzSNNAcdYUjf3Uh+O54=; b=UayDbk1jV40SD/1C7bJ4kCflTS
	ilxsuokI1Rav+L6woPNay7oJzOFpFvG+Zp+mUqUSiKvwOhR/nCoppv8h+7hmKexaJbPznHJx/up03
	wTHuvWM84MkM2s8b3x3kaxKNiyoeUZ1x2+HWR8t8a8IFwYUVDlJZTkDvliIDJ5PcfK12YONYOeHtZ
	j6+SfbUA0ooX5aEk22V11vbydAqIkx6MVHdnWn31Zq91MPWZJ3QRXRHQ+YO+Cv2+pWwKiJiQN2U8p
	V2KxLT6I8ltBVbptUaxIs5uiuXBDFBzKb94g8tH8iHo4OP5wsV5/7k58/k4n963E1z/eU2KXcd4o7
	YUbHsDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakZq-00GDEd-Dl; Fri, 10 Mar 2023 21:47:02 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYn-00GCcl-Ux
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id i34so26055079eda.7
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wk7HS+JU2o5z8u8D+phfvsWKJzSNNAcdYUjf3Uh+O54=;
        b=Er3ZlEVmoHoIsKsxxmk3YiAdjEKW2o7aagUdkvk8ACc/AZti0eUPVtEBK8r4r0smjz
         pB+sZJQgrdwpZYqfgqnS00yJsCXRm4tuxpKc9Sv323GEDDFRnD1x9yhqAjA0TAH+pD39
         /NgNPgn1qAdB2VMocKQHi9RfthoRIiGig5whQaEgGz2y6LGsFtY8/7u3AgHnh1ysTixO
         lo6Fd82XFMyeVBYZ+eAjyGMolA6uQ3qrk/k7hLR6+oBu47T9as0SzNFVZLaPbQ5p0hEu
         xzfTRrmQl+xvZUdIRvF+timC/BMSv6n2PpI4xuBenWLMdJ9K0wzRhzAUHGQoc6i5W58C
         qjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk7HS+JU2o5z8u8D+phfvsWKJzSNNAcdYUjf3Uh+O54=;
        b=nAFDjm/UlyUrHOG9cp2DgcCAALw6UaOmThJlKuY9g1wUHUjL4G3QmjeSgvm7BK+POC
         19nUsXYjjXASPoRCZj/ruyNa6jlwd3+e2oeZgqdZwUaegOIokXBOhDTMYim7o+sgxK0I
         2ygsqKN6VGpLNf1qeP+M3+FXYl9mOr7puPxaYzb9pGQ3Tr/W7iLmjeGQTVN89W+7ke7G
         7VnPnM9KMebjnRxpdTYT+5dELuajA18z60RLAcfLwjOvUu6eq0gITF5vxChAu0mEKXDv
         fifxSFLIMmxvdZMtb9G519BEC7yifuuonf8SV8HATY6Z/Co7pnr1De5e3oj17+WwM/kQ
         +PyA==
X-Gm-Message-State: AO0yUKX++kcOvTQzuRe33XPwR1+OzLM7hpQugRqL4ycWIP9/yMm8nzeb
	5xD+sy3pV+sgSZRP0ntqcxHZXg==
X-Google-Smtp-Source: AK7set+WoLtwDyXQs64e0OH3A2wuyS/PRDS8GfsEZZYgVKRSciJQ1Uv0cpz+JjrSwSdUGQxlZtR+eQ==
X-Received: by 2002:a05:6402:202e:b0:4be:3b3e:c226 with SMTP id ay14-20020a056402202e00b004be3b3ec226mr23145020edb.7.1678484756376;
        Fri, 10 Mar 2023 13:45:56 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:45:55 -0800 (PST)
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
Subject: [PATCH 1/9] regulator: lp872x: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 22:45:45 +0100
Message-Id: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134558_020523_9236EBCC 
X-CRM114-Status: GOOD (  12.36  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/lp872x.c:931:34: error: ‘lp872x_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/lp872x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index c576894c3d52..c3a6e77db4d0 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -928,7 +928,7 @@ static int lp872x_probe(struct i2c_client *cl)
 	return lp872x_regulator_register(lp);
 }
 
-static const struct of_device_id lp872x_dt_ids[] = {
+static const struct of_device_id lp872x_dt_ids[] __maybe_unused = {
 	{ .compatible = "ti,lp8720", },
 	{ .compatible = "ti,lp8725", },
 	{ }
-- 
2.34.1


