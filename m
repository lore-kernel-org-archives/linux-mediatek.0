Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E72BC07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6CJA5dq3GcUI+y9bM2FRVI85W9JDgSR2fGmXl0q0cA=; b=NsAzMwvZD6GyySN/f/rKh0jlw4
	Nv9m2HGUQL5ZXccne+xSp7cQ3PJYzP83EHYISVC204b23Bt7IkvP7ifXCBGQ4eUp08JwBd35lOpqR
	9maX7F5ut/irwYU4Yp7da0ITBSwAW4dxxMIg+UBCRUMjBJksmDjf5jYoHu8h6et+5rcIz1BBoO2Go
	+t8Gb9Rug6e6RIlFB4hvVjAYw9wAFchZA0QX7dwozo6u8O6SYm8Iczq4gvnRDGOMIdZMgPRmY0QVu
	E+e4yH+Dlida3tZxmzSUhmiPGo6yVpaLbdW34iWvnlUDnkNYF45NO7rQmWI6XaxPkTfRjABJ75tyL
	C69+pNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bei-000GXV-1D;
	Wed, 15 Nov 2023 08:53:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bef-000GVJ-0s
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 08:53:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-692c02adeefso5959836b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 00:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700038422; x=1700643222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6CJA5dq3GcUI+y9bM2FRVI85W9JDgSR2fGmXl0q0cA=;
        b=Mrb/n7Xmt8vDJAelKZ8Bq6KvYb0laMrsOShqNRCbRXMlOJ3bRmEXW4fU485u19ClFw
         sdAp4BTARWaK79GW2ufZuu94+nmZAXJwp00sl6++BnMV3GI32ApYQ5c8EHUZJG82XKG8
         3Nav1HYuYnhm8DFUNPGiUjIw0tfNDc14OyvxeihJklVU0b0ZfEdNOVJMmX0lWh1J/SbY
         EiZ4Bu+qzSqh8AX2BIZzZO9z2ufE5F6t90x72fr0CCuO9Vv31qoCmTVl+amrr+2ZIugq
         F7Rm0qw4BqQGtGx1+41IB6PD2Uv+52OqHpWZIe5K1bbF3g0TSSaMz3eqxyYHEQ2klpg2
         y9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038422; x=1700643222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6CJA5dq3GcUI+y9bM2FRVI85W9JDgSR2fGmXl0q0cA=;
        b=JUR0vfiJvlR0LOnNPu4HFhLxMcZNFt5jL2MT8rbyB80KU5aU2v5Mhxi0jbAj+nA+r2
         zHF/OTEzxKGANKaIaBA7F8IK4ZK5xPGPvN3HwLoAWNtoAp6wfCrDz3w1COUUTiLy5//R
         LjEEYRuz+JPSGooL2Y9UbpF53d5xPTZ4fUOrX8D7109QsTiQyu0erPcQdCX9TLAoIvYd
         Yobqpyaqss156YCZNcKUbkrBQ5LI/26mLObC08v2ZZudCUMKbRbFT7XoCtNNqDSpNv2Q
         VFPMiQNswCTE7rR+5+dSJTsu2d8YPvD15dKolrpsfFKlfXPYJFCWDly0U0y6w776zL4M
         Ew0A==
X-Gm-Message-State: AOJu0YxWxmuIcKltAl2YpbuZk+V5pvIen+FG94Ic5ESPHtS+dMHtWct3
	NC0jmiqJFUXImYtHqUsny2gLpmQfra+IacU2h2J7wg==
X-Google-Smtp-Source: AGHT+IFGuoW1JYdpcX6wTM4NrX9rO6kl0rtPOGTU/tDdSdI6DvYhZ4Av+8qxxhU0XFt0V5yTwO7dFQ==
X-Received: by 2002:a05:6a21:488b:b0:187:865f:b3d1 with SMTP id av11-20020a056a21488b00b00187865fb3d1mr52329pzc.36.1700038422362;
        Wed, 15 Nov 2023 00:53:42 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090ad78200b002794fe14cabsm8331449pju.12.2023.11.15.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:53:42 -0800 (PST)
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
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/3] add es8326 dt-bindings, es8326 support and Enable dual amp for rt5682s
Date: Wed, 15 Nov 2023 16:53:26 +0800
Message-Id: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_005349_515701_FEBDF748 
X-CRM114-Status: UNSURE (   7.64  )
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
At the same time, Enable dual amp max98390 for rt5682s.

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

Rui Zhou (3):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 102 +++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.25.1


