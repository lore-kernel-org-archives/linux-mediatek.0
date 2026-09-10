Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38ADC79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=; b=4uNUj41TtFomr3wgdOtuK02qlz
	7F2cckxpo0bz0rdjJ7zN+b6OFxqyYfuvWx3fRJPT0FBHFIA1jq/u6GfH6Ak/mnoUlfSe5++9Rzzhg
	X9KYkBJet8p2y0En29eqcFSKUa7wI81YYSuyDDl5hmKXkH85phKIMHA4v98xLLTDpTrOZqEVh00XY
	SnsPHIhHFoD+H2ODkihnIAt7CbZKY0xP45QTysRaVHHEALLkCRls16/TwTL/Oz152y6JpKiqyh+GU
	sxkebkoPogIVIP63YOz9yqjG7/9MrUabUKCHFOMA0W+BGIXS8ywPXJl754JInx8W2zeej6LrTZ3TN
	h1Yu2Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLs-0000000EOJZ-1krZ;
	Thu, 10 Sep 2026 12:58:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLp-0000000EOJC-10AC
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso2368660a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045080; x=1789649880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=KizNr/Rr3qWYvK7Rf5p9XpAppKxY4iPHjFlDb2ukDV9WI+M3H67MwZcAIVV6rtNEU+
         Fx9GHG4VpYCy+6oa80hnJbVFVKXkcI2JESTwUd1pVd8XFGDaTr2C0f5HE8ix6M7ATMt/
         kwI+hBqvMWCZxwfIA9hP0ai9Pf4ItKBKqzNfa5nuH0p+ZNZiNWdMt+bZCTYFr0X+gKPo
         PAx7t0FToFtmw0CnvtS2rxcGlR6/wLGOctVzHC5IFxoPK1hCSN8X/50UO2zpj5J8p0sZ
         nCwLP6XnYI8+8Q57z9sXqMtNmZFkquhII1Fqfya2Db9WignDjzsH3veGdUpzo5nHdC/i
         7crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045080; x=1789649880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=VNwM0XTbLUm/Tmu4LUhjVBTZQktTK3FWTzeMjnaSTXklsTrWqwdo2jPZNHUMhYeBxE
         /kq2PNTVSKSEZvCdIshWVcjp3mJ4VEEvZ0UDn4CsvH/V6pu/iwndyUvbVakiFmjpjxPL
         r4nqLUR0YB2TIKJjCef87zpShs+uU7EQfY/ElfO+xUO9EtDe51pvMAzon2bFx4hQ4Qzq
         Jf7Kk8Cqxu7Z4meeXVhSU+zP7X5PPTLJBK67kndiy2y1daOIoHKcExJh+V33zc9VJqXH
         tv5yFts9JdGzthCBZqMsU/FC4IXD7jNyHUNx09x9E3i1IuMATSTAYXV8neDSPr7wEXYW
         +y0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5PvKm48Y6GlyR5HYNIOsH0IqgSi5kq4vcQjuaEZeRJ9FIykbGFG/IctNG7BE+44bUSkAcOzCmEQ0pgtBgyg==@lists.infradead.org
X-Gm-Message-State: AFuF++mpZyNBI7HPt2LhZxspkhJpSCtsZYfhMtuTit/6qK7rCWV+RKM4
	3+/gGOr9qHH/Inq5DE7W1NRiePgMLi0IesLNiYaqjp1ZAvwYrMGdhdA/
X-Gm-Gg: AYBFou2iWzLCsTslsSqePiBz1T/+KGuxH1WM6427axhoy3aXLxSDlpAQN+mHoQj+bvK
	ld3acXrTVD/Ne7P6V9xo4VUqf7WUtMe12GCk1gUTnrYPjyBKWFsnHwh/uPRfuaIR5nOgoD7PHDh
	G4Hm7G8L2jXgvkkPGGQhUZf+Z9brv2vg8vm9eZ4AjaB0LLP9LsvFATuhcHyEfQhiZy/7g5z+8IC
	wxCuLuExbJeDH0MDMumo2bllMpQEo5gQEquKZeSPpXOkdKFbHLP7dbZTVzKzzaz+WS7JdaZgf5z
	xIGltBhlyKGmi9mgJwsZBysTZcKuwJQmB46GVjw0v4hPt94s8UvOUoIY827anzJVo71Gnttktgg
	JSRMmRhI3poQAniNAUhYbda+HquVmUP2H9g6KFcqUWyZc8tGtH/Bchs/S9ggy2XmgrgmIPCKxkX
	tXWyedgCayVYGTLXbm1vlpe0NDKImCx4V4YUudDKs4kayZoWBDYb7HsfzoEByWY74N7b33+02h5
	0SH5Fx+sOTDdna7UA4oz+CBUjxfLjZUVZBTvswL9rR15AyFGDrbyc3AIjQ9uETlMavQsgZbeN++
	YzTml5H1g39u+aE=
X-Received: by 2002:a17:90b:1d45:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39bac1d89b4mr18062671a91.9.1789045080229;
        Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Thu, 10 Sep 2026 19:57:29 +0700
Message-ID: <20260910125742.150902-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055801_278565_D0303FFA 
X-CRM114-Status: UNSURE (   6.22  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0


