Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D24C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=; b=Hc3mmCutZMf2s/eOP9tx+/ZljL
	CL2L+bvs/9P1x5b9sgAQI4J4VS5NX6S14nsaOS7z+1MTQ+ILKfo3b6juNpqSN6u0hy/HL44c2+Vsf
	Fo0rtCau1cpdQTkZmNet1bUvgWXtJtssPDtF7pI2TSYCINioqk7rpc6bCB8gcGCycS5XdQedSknbp
	tX2cXQEBAzGPk6M0ohT/ajW6T2ugsmrBDnj4zmZ8l5/zhj+9y11T+AAIhnox6CWo9aBTMEeiQSV4s
	IUo8kWJc7xRvhlylr+uwXE7c8215X4Z/5fSGM3uaj2mijTLaYVdPNpBtHNLN1tvDinzL/u7D96aLM
	y3JiSVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNJ1-0000000FfA2-16A0;
	Tue, 30 Jun 2026 01:30:31 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNIx-0000000Ff9F-3O4C
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 01:30:29 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c998fd549a8so564963a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 18:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782783027; x=1783387827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=YGUyd6NG72Vc9kNWbVpe3xdPguCCF5Tr6jtjf73yse1yJL96s7zuH68yZOcY26yLWk
         G5bHOZRCuv8qGJ+/JEBa+Z6ep1t/dnmRKNgRM8OzdPB06UDrMT8y7/FSMBgH/QCG7VYY
         LwDURdTr0HwPZmTwt6khjc/7CSvkdPuOOAyLwK8DYpS2KZ1mGu33n0wL/7AnmXpUDMHD
         Ongg974L7TSLobVaeX3L8z83+w9baeMeua2icWWC8zedOYcJikQxA9TVEKSZmpqxLndn
         5eH6lCAdz2FcdFOOcBySy58aQf3T06CUiMbtenC18Nr5AEs4afVEqgwnxkTWLP9YnwRq
         kBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782783027; x=1783387827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=tPm7p36Awyyybm/qnIPb4wPS3/e/mzBWVFrkXZVMI9N4LnfOMWI7HIpUWkiRf80OnJ
         2UHap8MpD2c3B3oC2pNKVVmM6QL6cG03xroinaf38xnk5McdEhya0Zn/aufZTOQzk5wG
         pkaJXftevyo/JBx+V0v8Id/xpzFF2EALAAoLZ4TJnlGeUWSJ4Z8qSl5DV0TwiSPlOyul
         N/PKBIPe6SRFHLdpKpDyi7HN+lPqYfruPMDiKDWRCyQMc9/RRObqZNFYLM35lwB7ANcm
         6p3hskvhN3ZreiLJRVUVOOKNJt1EQBWH10Ul/EcrQdvetKJPMsfaZmt0cxTLLb2hMkcM
         waYA==
X-Forwarded-Encrypted: i=1; AHgh+Roe0QGiHT9aeweiY6JPDIBN6YVRjZ+XE8PlskQytBXQeypTft3A5uHwyUjbz7qbXt0lRwQKbxEbbGmj6g0exg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46/AosTjFWtwLo8CluPzvmj9wNPPrSbQDoqv0rI3xyCqqadha
	1iKsHjcdF2oBDb4LiX6dkjYOedom2ToFtCKBFilLayoU7bj2hiZk+fVoSZ6fHjnW
X-Gm-Gg: AfdE7clpLdpWMlFq4yHsaHbtlslgHwjMyfCB/xzQJlUIktX0RVXp/GzT5jP3O0Da4op
	7CDyFdnIEt1ai0EseeRQjehd9HpyWx0apNn0Jjav2sBvhwJb2dkxExDHp+t4YF8+Jd0+uDpk6dq
	AOFqMPSQlzQQhsWm8qfRBgetU6Tw3QG007AIe1/M8NlvDkfcUUW2BldrXWz5yegvmtDpUoWY0UL
	e7kzUYPjQJcm5L3iNssfL9MePSi+4pQpQufUlLqzsB2U0oxJEtqy7DjRDQwsGbJG4LhYK0Jo8p8
	idZ/I0Vb41jMtb4xiJvaDa0s0VeKtuNWdBNWEKrkHpLxgPh//cnwLQQJFLo+7jYd31MGMIMu1Cb
	BwYdtCX6MYqzJACyuzTEYbnoplAKuZXO1Er6R+0eWHdW6J34maBuSZogwghUIl8z+NnUy0nf+H5
	7c4Q3pt4tdL2VeAx5lfgim4V2NcA8oNWy8raWR5NCKJAQ6wVw/kEp+xBdd6TBbpQljYsKVrbhzX
	vrQivJ5uA==
X-Received: by 2002:a05:6a00:bd8c:b0:845:259f:8925 with SMTP id d2e1a72fcca58-8479eed8083mr1234602b3a.6.1782783026718;
        Mon, 29 Jun 2026 18:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm681063b3a.60.2026.06.29.18.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:30:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] ASoC: mediatek: mt2701: add COMPILE_TEST
Date: Mon, 29 Jun 2026 18:30:24 -0700
Message-ID: <20260630013024.1500623-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_183027_849612_A9913CA6 
X-CRM114-Status: GOOD (  10.67  )
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

Enable COMPILE_TEST for mt2701 to get extra build coverage as done with
other mediatek platforms.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 4af7bbb58010..224746e7664f 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -7,7 +7,7 @@ config SND_SOC_MEDIATEK
 
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC driver for Mediatek MT2701 boards
-- 
2.54.0


