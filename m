Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3ECC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=; b=TGkyJ079fA12O1zfTBhmuMSdg0
	xHm9q92eE8K1KILbPa8aQsnxm5yGgx1vlt2I1GRXuQmzYDv0yagbuLswDUqsltKEOLYxgE8eciQmd
	VIcjN+rfE8uFtCfIh+a4jdeaKLQHqje0gzYoEx54TERs+rrzrrjyjnNQH96CycAEZSADUoYUZjOk0
	ZkeR7NaWy2bhFCrIHN0jhA9GtwUEC+ajH7jIeaYRIzpclQtjw0YgS4wcXb8LsIjRK71Y5S0fK9tqE
	Iu2voH437Y20FrzaxdRx6SX171/FM1e4YC4dm5760RpqGzbcxB9f2YojwOQVFChAstJwEln7bjPV0
	2NCTm7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1v0-00Bfcx-0Z;
	Tue, 12 Dec 2023 12:31:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1uw-00BfZY-25
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 12:31:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d0b2752dc6so48917275ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Dec 2023 04:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702384259; x=1702989059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=LAW93pesw58qYaRkeg+zyYx7sXlll5INpR15Qa9DWTMB7RT1ZwfCibsm2K+G2hmssG
         E5SvgoUe9z02XfU50Gi329X3QjgCMTu0cveDyDnIHRSzWUgDcsRAfp5fiGcHd0QNEoKB
         mBJkHPgkRc+gDF2Q5xmNqRdetsgjYn956zOeA8H/JCjmvzoglfs36XpQizEHhLIyARPn
         JZs8h3QHgCdI2v5joCchDt7E+HMuFJwDrFjnkqwS310+LZ0dx8BRKBDisolL7r1BUo2O
         NDhdaZ/VE3frQl/o9HTlEs0lVbpuo4sdmjG6QYIN6Byf1ayZaPXN0PQzCgD7BQ3xD05l
         BWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384259; x=1702989059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=jUR20qLzk3kWwfYkbbrtAygcevlQnExKl7rTN1OhvroUTgK6F00OXfLOZDZQyxStJq
         LwQ/OQx4F1N2MrgYRFG2zMU5U2QJhbI2GB+ePvjaCab+mfkJGmEHbIVmTwAWfBH2eoOS
         iDOq6vrXnExHvQTTK/BDce/rIDxMI4LZeGXpsMCEFMN7CvSLK+fI94nGmIYfDQU/7vls
         M3ppq/cK0IOds7Kjv4y/QLfnidKaTohoa1DIwwpFjDjcDDQYJHraqrJHObBaeCybjBJi
         5b7SLsd0AyhFEIzrEvVpQQBWGb5FR5I5fitb+7i7B2jrdoKnw8fdK9iLmC71nIuRRf2+
         kOAw==
X-Gm-Message-State: AOJu0YwaX7VXTrMtwzYv3zkps7Rso8nWoWgG1uqnohS6+YCQPwKD2qoL
	W36fKUd6AhiqWErXZjMF/9SNDA==
X-Google-Smtp-Source: AGHT+IFU9pkU+zSIJxSZTuCh+xEhEUbw/pYIMBMqlqIDsVlUDvgUNuGnVZcwWbSidghtupmjgmjpPw==
X-Received: by 2002:a17:902:6806:b0:1d3:3eb8:3691 with SMTP id h6-20020a170902680600b001d33eb83691mr480195plk.6.1702384259076;
        Tue, 12 Dec 2023 04:30:59 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b001cf65844874sm8517471plg.45.2023.12.12.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:30:58 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v9 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Tue, 12 Dec 2023 20:30:46 +0800
Message-Id: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043118_688741_2E39C7A3 
X-CRM114-Status: UNSURE (   7.22  )
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

Changes in v9:
- PATCH 3/4: Add comment for MAX98390_TWO_AMP.
- Link to v8: https://lore.kernel.org/all/20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 3/4: Change the #define ES8326_CODEC_DAI macro definition and filter the es8326 widget
- Link to v7: https://lore.kernel.org/all/20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com/

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
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 125 +++++++++---------
 3 files changed, 63 insertions(+), 64 deletions(-)

-- 
2.25.1


