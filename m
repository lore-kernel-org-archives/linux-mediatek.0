Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F366C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MHqfhex4k1JTsYeEXGwpls18ioPjTIAYp2acOWIwgpo=; b=czSl6FJlcLgyugYfccKZYhvovP
	xcEZA29PuukrcN0kICy7hoQj/bh4lUnJgTJAu5FinHE2NY8wbY4vWT0OtKqbZLGaNChH16cWiJGDX
	ou5C6st5X/atQBwoCVa+j58tP35OqSjygo7vnni/rGDgeIGcinN/q3fJ/PvqEU+5JF+4y5bZR/WW9
	Idfx0OkjQDWtdFf9qu0opckkk2T1hlemIp34R6QwW81GKqIVigHr5rhGvjSrtdiAilf65lbkTf24r
	uCerSmy7SQ0H9t61uFsmcAEs8NGzGkrKbFFHlySLDvrTn9FdUNfoDeARwoZN84QBC9ePmd/pkCdJF
	S+h8I0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3v2F-00D1Dr-0A;
	Tue, 30 May 2023 08:48:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3v2C-00D1C3-1i
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:48:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-970028cfb6cso816800866b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685436527; x=1688028527;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHqfhex4k1JTsYeEXGwpls18ioPjTIAYp2acOWIwgpo=;
        b=jWN+niVahYUW4XDuO6u4d+X15sRRNP6SJBklfervz8Tj+qXTI+jXKJ+uQM7EcZQvDB
         7aYOkUoJhTiiHkrPR1+Tjnk3vmJiiV7J29hC56MkxepJPprIzQk53KUerZwrzBPAY6PK
         z8fbMj5psQ7L1lzIGy5m5ybnAGq9V0H9019phHEnsMkU0JizrpZaGwvwRYU8+G8v8TLH
         dh0VfcpmKDFtAHx3rviOnbpKTRY9W9UTXOMN6bfOarCqXKlRQmb2lCcJkyhicXovGBlq
         u3JqSL16vqcDRk/x11BExLTf4Amho7k2reV2m1V9o+P6Lblw0KZ1GSxyBac8zlfSYz3c
         rdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685436527; x=1688028527;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHqfhex4k1JTsYeEXGwpls18ioPjTIAYp2acOWIwgpo=;
        b=Z9wo7iiDFT0X7/sUtMgxhUb9JsAQ8KXIg90NWdC9FSkECFiVEEfwYZRKS+4RI31GYF
         6PG1wNCB6HtEyY1h0EVrQvAtWJkoqsa4uYxqvrh2iI0Qqe6SDFfCqLssCVcvhR4l3MYU
         0qWqmcNRpQaV51rJ+ouTWlw7y5CKCcwYY9Avjj+wc5wu8AzSEpB58XboS8QuRaB5lKeI
         gjAZbHJnV7EuR3BqQCHjsegkZH1JQ5FTggKvwL4OJc/u8kaIB2+NOv6giUREbg7AXP6K
         jF4jWZgjPe7MOdaI13lVwsfnU9g5rKWCAmptwA8Wg7SjZMz29+cTlqUDlujjRgQZLi53
         +t9Q==
X-Gm-Message-State: AC+VfDye1Wr9DOOhHgRPNjDhGQhZCvUxc13ISVFPdJMUal6nnKkKWxOl
	hkDNBj/srbWZH44WC4zrPs2dRA==
X-Google-Smtp-Source: ACHHUZ6TKXLrgG6JwuYw1Kzs78NP4b4Q0MqE5vN2rgVaizDAED6lGqcpPitCI+esTvabbTHyjvPpow==
X-Received: by 2002:a17:907:961e:b0:971:fa86:27e with SMTP id gb30-20020a170907961e00b00971fa86027emr1524138ejc.16.1685436527350;
        Tue, 30 May 2023 01:48:47 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b0096f675ce45csm6959686eja.182.2023.05.30.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:48:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Tue, 30 May 2023 10:43:07 +0200
Subject: [PATCH] phy: mediatek: hdmi: mt8195: fix prediv bad upper limit
 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABq3dWQC/zWNQQqDMBBFryKzNqipWuxVpISMGc0smkoCYgnev
 aPg8n3e42dIFJkSvIoMkTZO/A0CTVnA5G1YSLETBl3rR93pQXn3YbP6n5l5V4Oz2BO2muYnSII
 2kcJow+TPCNtKLHMnp7FGkuk6HN/H8QdvJZG6gAAAAA==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_014852_573619_FC18396B 
X-CRM114-Status: GOOD (  11.89  )
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

The pll prediv calculus searchs for the smallest prediv that gets
the ns_hdmipll_ck in the range of 5 GHz to 12 GHz.

A typo in the upper bound test was testing for 5Ghz to 1Ghz

Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 8aa7251de4a9..bbfe11d6a69d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -253,7 +253,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
 		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
 		if (ns_hdmipll_ck >= 5 * GIGA &&
-		    ns_hdmipll_ck <= 1 * GIGA)
+		    ns_hdmipll_ck <= 12 * GIGA)
 			break;
 	}
 	if (i == (ARRAY_SIZE(txpredivs) - 1) &&

---
base-commit: 9f925874281f7e8855855d6210d6e29d844e4307
change-id: 20230529-hdmi_phy_fix-9dab6eb42ef7

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>


