Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FFCC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o7DUTBMJR42vgO2vo2QRgPb0y3nJ7IjdOsN2T3r+U2E=; b=g+2+YSiZkBLEaeKoRuuWWcmYH/
	CL/lTaYzrOMWMMQxH4MdUHClTXNyLfwexuFgdQ5zGWe22yOeP1RQVRkPDWFqVbTF5mYyhkbFaWQdT
	GdoGgYpWjy2aW+XCmzX4DgyWuo654Vnwz9HC6/ZW93Y3pqTx+eKkz93CrNWtuSgj5L+vFCgAbnS4m
	WJrkzh9dDvlOAtgCbc0BbpLkdawdYzVE7I4f0wo7IOj8Ujp7AJPrRbgAlh4/cTZmKigN065ireRaH
	u+D+R5Bc6wO3EWhPwLT/MJOkqa+uiEr2iImkI5rjOQIXrHQGkEPhpK3j77qY+OA5nz+mUGneaFaD+
	UbFjxOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ymb-002z9z-14;
	Thu, 16 Nov 2023 09:35:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YmX-002z70-2W
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 09:35:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ce1603f5cdso5424195ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700127318; x=1700732118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DUTBMJR42vgO2vo2QRgPb0y3nJ7IjdOsN2T3r+U2E=;
        b=ZspCbeDSd2++4S65e2vT5SXzpj7ezCcAoi2Gbo0UiSZGZ/h3qDPOCSrIHSkaSF6RE3
         3VWT5kafMQy/qvhiTifA7QjZ1Teul09anoxEbtlOz0r/i/MScy0XOUP6lWPy0Z/296v0
         rUr5OWPOziSqPNv6gwT2S1pdgmL0bqI66DwBEUJxQC8Ng4Ma6h0I1MtzzDUgcTjnYmJ+
         5XAX90123yWsFfjIcZ8MJB4yP6rTO/kBb8y2ejY5E3EeHHbGMBFudi6ccd8obxWehbAE
         0OmD19sPKrY8d7hyHVfyHGh1xB7a8F95nHQSyXDqKNHN0e5kr24NhhW3mWBmOOOyhSoZ
         3pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127318; x=1700732118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7DUTBMJR42vgO2vo2QRgPb0y3nJ7IjdOsN2T3r+U2E=;
        b=KHuC+OXpicbkzdOm3KufwiQ2pwB7WKnGHfmbOeEopGQDAWfqXNnh5IjfLRRIPVovPo
         aRcRLKLpiSsLHhKhaAY4NEghI22qtZP++OmOWoQTZ9hA49sstw4HpXA7Im2D/iw4d6io
         mIRWmZk8Aobh5V+lvzwUtLXgGttgkCHUZw5BtH6ef5WASbfNg6pwmCUgFpn4R707Qt44
         fiG1C6aVMNTc7SAIt/wVWixF0gJUBxfwa7dW7YPcagYVH5UEwNjxkKjxGjQbLvnoTD6T
         1KYdp4E4Ee7NkkjaiUVhXcYgl5ApedCiubxrPZVrrnuOoZ9xRqD+/HfwIMg9KBLU57yQ
         aaJg==
X-Gm-Message-State: AOJu0YzUHMfr2bq2DMyyi/jCXBRwBhkjQxxuKR4Xs5nVI+FSyAyaqJQK
	Zvx1M9C0BTQyYSkOaSrYXpO7pQ==
X-Google-Smtp-Source: AGHT+IGXYH2XiiMpAbMFq/OZ/a7DFT1JZat+8oaAUUxvcPTgFSjC1eW1dPzuWDXdcsqkIRnLiNKQUA==
X-Received: by 2002:a17:90b:4c45:b0:27d:c35:7f3 with SMTP id np5-20020a17090b4c4500b0027d0c3507f3mr13936893pjb.8.1700127318469;
        Thu, 16 Nov 2023 01:35:18 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b00280fcbbe774sm1175214pjq.10.2023.11.16.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:35:18 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v7 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Thu, 16 Nov 2023 17:35:08 +0800
Message-Id: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_013529_835458_3DBE0E10 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

Add dt-bindings for es8326 and codec es8326 support. 
Remove duplicate code, commonize headset codec init/exit API.
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v7:
- PATCH 3/4: Completion "}"
- Link to v6: https://lore.kernel.org/all/20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com/

Changes in v6:
- PATCH 2/4: add a patch, commonize headset codec init/exit API
- PATCH 3/4: Remove generalized code
- Link to v5: https://lore.kernel.org/all/20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v4: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 2/3: Change the names of some apis
- PATCH 3/3: Change commit description
- Link to v3: https://lore.kernel.org/all/20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (4):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 118 ++++++++----------
 3 files changed, 57 insertions(+), 63 deletions(-)

-- 
2.25.1


