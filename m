Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF62C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dqe4tA01u8D6zg7qVVNxLh27ygPQ0D7vH2s6WJVZu1g=; b=DHhbC37YH7hE6d8lVNvH2RF1nB
	oZhBAyQXY463+FRTxoGauLIsDAYb0rEZwLEtdC7uH+aIdM18xx1u23shZ21XTQa6krcsyH1KFUJRj
	//C7Q0L1tOwkHpbhkOP+82FSfqkVo0ghLOwPccnZRnyHG4E1swNoFzPyU4YyuIkhfvEqFELF3NsQW
	kURWoR9Y35BcDK0/XItSBbMC0c61gY6bTN22rHdJlQ71kgDzsVYxIsReFf82gBDujQyXkbW8i08qt
	SXf4bE6mtSN40Nwd/YkVVKJPXRJCYz55QIX5uOrtCB+q+ATCJlAsFC3+zn5oNJoxkK34XuYJZULjG
	ubuaxgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxJT-000JGm-5y; Sat, 11 Mar 2023 11:22:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDi-000GZw-BC
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:17:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id cy23so30640650edb.12
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqe4tA01u8D6zg7qVVNxLh27ygPQ0D7vH2s6WJVZu1g=;
        b=hs+KTaByhaRR1Crrvl/6b7Pi+5fYgw3OGDij24beVPHGJ3OBSZd2iaAtQvl435zoEz
         TIAJ9/yjnEW/vbI+fI5bN8m0Gv0bfx0pJTDZCvvL/7YiwXCdftTPM9j1an+cfUzwjXpy
         eeKWWGgAuRlTeSjhytqdKpzqpWEz+bYEM4w8xux4YzWgsMLUxbQTMzP/6ejxkRp8B832
         jKK65FakobFYuKa47JSpRFPgY8SdUGaHFWWKuJIG+tEY+A79f8xkImbMyPeetoZGZNVQ
         /qK1WGpBdfEU2vtexd3E1Kj1odc0bHgoXMoxEAnImUg9RaSuYG1kxkO1HJDqnCfPGg8n
         wZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqe4tA01u8D6zg7qVVNxLh27ygPQ0D7vH2s6WJVZu1g=;
        b=xyohj30jU3/Xc9ZkEZib4YwimIYPzO6t0vVMFylQUi72RRQ/GOxUMkKFiwX6fwm+P4
         RjFz9Rsx25SGYuh8enAxB5sSQ08pwVKys/wECRW4FL/cK8U/13GT6jcpSz0+v5ESfS1P
         oJDGLXdFWCShJk+55YePM3XFGoKq+n7UiyiiqvbN7q/56AzNCEZcQwddIeVdbefNPc4j
         zXTzNKB4yT9hItszKxh2tPdBvKxt8sP1+DkhuNs/M2XbOAYebV7vjZ4MuuaPoiiUf4EN
         tgMIbA3CdmXwy+B+YCl6dMt9bylq1ZZjdLdlIs088ZhVn69LT1yAC13IchI/tCyrV7dw
         +mdg==
X-Gm-Message-State: AO0yUKXFMz6j2ITeFPMhTcMlAdUcC46fOzeIUG8T6vxrJTZL+iPEA5+d
	YMbg57Q10ciKI5mXksPqd1t3TQ==
X-Google-Smtp-Source: AK7set9ps6Xl+ULaLLmt1Jk7XfUchILOeDp/mCfvP03IeYFsPT68lmc3NmDip9szz/n3mavp5ht89w==
X-Received: by 2002:a17:906:1515:b0:8b1:279c:82c7 with SMTP id b21-20020a170906151500b008b1279c82c7mr27776179ejd.50.1678533421024;
        Sat, 11 Mar 2023 03:17:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:16:54 +0100
Message-Id: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031702_456232_56993609 
X-CRM114-Status: GOOD (  13.86  )
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
matching via PRP0001, even though it might not be relevant here).

  drivers/i2c/busses/i2c-mt65xx.c:514:34: error: ‘mtk_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 43dd966d5ef5..59eaefe999b1 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1546,7 +1546,7 @@ static struct platform_driver mtk_i2c_driver = {
 	.driver = {
 		.name = I2C_DRV_NAME,
 		.pm = &mtk_i2c_pm,
-		.of_match_table = of_match_ptr(mtk_i2c_of_match),
+		.of_match_table = mtk_i2c_of_match,
 	},
 };
 
-- 
2.34.1


