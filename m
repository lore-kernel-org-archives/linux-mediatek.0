Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27D7C6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 22:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=; b=tcLRBwmctYdJ2uxuXdufGCLe++
	rW23igWF8Cqi8ncsym+CGOGYQcVTBmP6cuRixtIYwnDvij7WUDXH0n63rN6YJJdDf20TaLPGurB6s
	EVq+1IhPX2AsBt0pt3vFJxccJzDIX42yBlGm9dXdi/89XU0OujqR2M8vLzcu1s0ie/1Ntna+gF65D
	F8+zFqoG2/80qdkxEcXCHG7TBDes3GV5kaE05RXf7tnMVDqvJTo+kdDEL/1fkdgR4QdZ/0ccizan8
	rO5Wx1KhgbmfHUUsy2roFaudzG15aGax8Vg9U8Ibo7ONAxMEVji9RQsvVBBuVRkqEZ2WcU/KUbvvL
	drbR/rTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUq-00GTXy-CY; Fri, 10 Mar 2023 22:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUl-00GTRp-1Q
	for linux-mediatek@bombadil.infradead.org; Fri, 10 Mar 2023 22:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=; b=TeAVf+orXvTtW3eqZEIp/0G33K
	c/2paVkGKA10sR6If2VS+c1irckXLHbJGkmqojcUjC1WvhJhR4JTm9L616Ec3/eTKqBRaPyy4TWVu
	L0LMEQeDkXPVqQ2lCF3OyEXXoFBTYE77zH23+wL/ber9y4UB6vssN+O0lwSmLSF1IuG9Va4+8paKp
	ueK2k8qd93TB+j8w+mPobFouVqslQC0xWo5IYuaAcKWBdEEqNGDkUvbtjNtbmYhTobdjGDftfQbse
	PRbsnLuX/n144hXXJYn4guENy1pBjqi/ii5Wg71++8NUvH0DCtDSUrlHiVJ52qMfiarGB12fpijYO
	vDuDDDGA==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEe-000apl-0o
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id s11so26457939edy.8
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=;
        b=qaM3ve+wW6Gt6rptzeOJgI7fsp/Nf85KO2ZcgbVSiZvSdKp5Lr9KO8TDlnRG/o5Hy2
         TrgRr1jPBZGmhTO+TmX8f1piK0XT3kowYscmhQmvRScvGE8MZQdZBAsFLcZ2WF54WtRc
         0xO2YIPBIwQIHXDxIED7dRCrxLgRUUnTgunX0XIZEkmmqqnTUWtEOPRzGjHnp04BTRdI
         TssZlvrynUkkWzqMaRdxZZ/oBOMtbfo6eg1I3yZ/9Bpp3iBqBTjMxv6/p0XVZmsFxs5i
         m8j/rIeHeT9kW0DgB9tKW9eyd5uxzp0gl3HoqYAGC0GtE6t4DwGguWLoOW5e7l302rbF
         XDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=;
        b=A7KXs4+hnEPirkwsFbgAFY4etsrybmM5fTdpQhrLxontPGPck6QuzDDM5j4nkFitAs
         yrJCXAsyX0/3ly0ebh2qjobjUUxXKVVswBnzW/cn3t784RlDriDgcRwkJdT7ozVhF0rv
         +dWFDTyylZ8fq/7cQEzyMuJ7jGq/yQ6uryN8wdMhybLypcZ/3QausdN9vV5Vl2zqPdXU
         JGsT6AHd3bS/mdAh9OZI8Z5eOniV84VGssSXKUTCk4HfsGENnzNnQN+pj5YfyDbbyWoy
         Hzn8tE0WdM5iFZv/0ud6XsW9XeNX43HnpemPR1p3noDMtJT6iM7XRPKMv+izzi8q+09E
         RaVg==
X-Gm-Message-State: AO0yUKWtCZ5lkPhZlAzD9g6AMHSID/Be83gbrYKSx/L3hQqbmgrqHovR
	VbGKIhyzw+HUKmQbxAG9/db8zg==
X-Google-Smtp-Source: AK7set9jp7Yps5gdDa4xVZKk1y8Nuy79LZJ+JZ57vzOOBv4Dpd2cWsCrZ/AoIk5/8nmVVUyC9Qydyg==
X-Received: by 2002:aa7:c489:0:b0:4af:6409:30ea with SMTP id m9-20020aa7c489000000b004af640930eamr27406591edq.19.1678487351312;
        Fri, 10 Mar 2023 14:29:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/16] spi: pic32-sqi: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:50 +0100
Message-Id: <20230310222857.315629-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222912_662170_5041F5C3 
X-CRM114-Status: GOOD (  15.28  )
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

  drivers/spi/spi-pic32-sqi.c:694:34: error: ‘pic32_sqi_of_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-pic32-sqi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 4c8493f34fca..ca89e6d22fc7 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -700,7 +700,7 @@ MODULE_DEVICE_TABLE(of, pic32_sqi_of_ids);
 static struct platform_driver pic32_sqi_driver = {
 	.driver = {
 		.name = "sqi-pic32",
-		.of_match_table = of_match_ptr(pic32_sqi_of_ids),
+		.of_match_table = pic32_sqi_of_ids,
 	},
 	.probe = pic32_sqi_probe,
 	.remove_new = pic32_sqi_remove,
-- 
2.34.1


