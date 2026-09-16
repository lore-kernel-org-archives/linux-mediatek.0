Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A74C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=; b=NhB2NiS3zDvjn0nHtr+RT12rPL
	lbTTRw4dKzOAJMMU/Yzvl/auEKk/cR83PRqtCc/TsqnkDc+RdZV37rG+3DtQgJPlNQhoeRYsFT+JI
	J9/o2ehGNxV6BUVBEXi5zpiSbsYBnFfmewyr2qvBgdeusy9+O/iig2RSm5e3qydYEp3p6kUzk11FV
	zLbxhAhny9hMnUPVAxlJsyfw3zO9HGZWZgl1z3XWFQ48WaCcj8tmW6rsNbH6BCnmQzseOiYliHKcf
	1qPqK/S9JYliMdKCRJX6fxrDHLNcGuDp35nFqdDjrknyqhtqrN8+cm0dc+aIxqDMM3rDXPHJ8Zmls
	oR5TIJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlD-00000008L8h-1ybH;
	Wed, 16 Sep 2026 05:00:43 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hl8-00000008L80-0CRH
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:00:42 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d20963so289301b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534837; x=1790139637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=YnBN2OrlH8aRelc7fTmiBUdYtuSwOBrobnTjt/N16yzse/UyUBP9Zee6/XwLbPBp+V
         jEADoKA+dwHDHBs4kL1xRobvSJ9xjjqbkMNclBmXr0XhT9ylqDJo/pT5vBq9JRQ6pZGr
         lpoTyQExz1pcUVO2Ad5H6kQ0rkcvh/4T1K57pajY8XXgSbQAQVRgQOcRH5/o2YDRAOLD
         f/cGoFy9erEnDg+eCrmCzZApLSWzYzTHQ20f95aVTiEIzOU9/U6EaT1/PViehKEq06Fh
         H+6zPNMwGlcNLyth/dJl/YIO0iZHMHB76sdlVo0GZ8tzDcdAaTFVj5vWMKc0Se+VqSqy
         8kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534837; x=1790139637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=I3kHiyrymRsa3obOI5YFi/f6VyBwp9Fi0QFKOrPF0dsFCC/YkznIrOm/XH8SUUgtyV
         w/l/aHY30qYiNKzWXgxTvzAnh/Z1ZyQc7DMaTRr+TYOm23vFYCG/crZwDCx7stQGClVL
         24SF/ochFINw4ZXMdpAfd67DANRMQSjDLDA/QUGZpchdpgUeNR3FtYbqYvasRWVbcgb4
         +K6fA7GOoaVBcZMsbiN1OJD9vAyVCMsOL9BislIfTMe2F+Z9repQk99Fq/yo16jFjaiL
         1BNqTAPlN1ldmeyVoRddVSmGOcrGgumbbOh8bQhGXWznlv8EO0jnHg5ay/iDa4PG9T2r
         Bs3g==
X-Forwarded-Encrypted: i=1; AKwUvBy11eFaoISH3/IG+fKwZe9020ROJCRqQkQRCaLzK0TIcyS6YMt3K/ZCoZk9aPnkkIm4iGY013iA+t2S9N1CfA==@lists.infradead.org
X-Gm-Message-State: AFuF++klFXio/lUMV/6op6h9ufGWojzTOdBjImv3AacAp+GlhlGMszDj
	JHpMT4p6eKR+T1QXE1/9k4e22IRMlRkS2bfOCkvQEmAuUM1pL7HpUubI
X-Gm-Gg: AYBFou3ZkB7Vq6ood3f3NS08zr9uwSM/GXhgwaWBHSOKBddO7FOME13iVwc57ttzCFW
	1rlJXbQbi3vy3JrPSQSqXosXsPEO1nMdyStczGlUyywa9aGkDWh2E5kry9GrKSlPUdRJqjIiPKh
	MhiwvJug3XJJeYwVb4xsp1u7W32Sm31/aOGs5dwAxXwQzvzBCuNePy69A3vL6PvC8vzf9t7RxVa
	jIdjWUMAQTf/utXo8GIvNLyZhyH+UAWSKBmDxqZoD2hCtmc79Xd6BKlmJLzEZz7VqPg+gQHSWoj
	b1CZyqJOZbB0pEIKSeEghzYY7MJRKE/NUomf14xZhNSRfIRp1xhLxtabHKKuZEaP51uYOgPxarz
	UpwkA/iNwLbuwrlqdOdfuuDP3AAVFTJkVnApaycfKH16eeNwLU/pvPE/t15PuPHqfGWXTwYujcz
	qE0CIn9YCiLGH1MnGRn9MgIH9hg9ONxhjEx+KpTpgPrDYlUyWWhZrG9/gh3GwSZpRsXol9wuV4Z
	gXByZAjfZTdO0WAcz0/K6lXnL9KxtmmJ40iY6yWGOkBW6vW/sROisvidcopNNmNJOweyYp9NaYs
	N+y5a1rBQhTqBqZm
X-Received: by 2002:a05:6300:6697:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd5f44a0camr3248100637.9.1789534836913;
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
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
Subject: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
Date: Wed, 16 Sep 2026 12:00:07 +0700
Message-ID: <20260916050020.14575-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220041_488865_6BCB5A13 
X-CRM114-Status: GOOD (  10.85  )
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

In v2, there was discussion about checking the return value of 
regmap_update_bits(). While opinions differed, the existing driver already 
checks it in mt8189_afe_enable_top_cg(), which is used by 
mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.

Therefore, I keep these checks and add the corresponding error paths for 
consistency.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks, 
   making the separate patch for missing regmap unnecessary.
 - Do not pre-initialize ret; set ret = 0 in the default case throughout 
   the series.

Best regards,
Phuc

bui duc phuc (12):
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

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
 4 files changed, 154 insertions(+), 62 deletions(-)

-- 
2.43.0


