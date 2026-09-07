Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1F7C79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=; b=IaP78zdYrpocPFyWED2bHuwqSg
	tv9j2PRi4JyisRUmrQiEda5t96xhL5KQMlVAPuAfukN9gGv6rcYjNVNXmwx5q1Yez3ewRAXJvZxys
	eEbEBXyLUdD3tcTnFI7oObQTepcP0wcB2OsQQVj9LnB1fQfn5lg0ls87SuP833iIt18gnAnA/ntw/
	BLrFY5v4nOaZGXeNM3kdRhgH0hNqSpyBRuRA/LhFFpY23SbECOtga/gnp2Bs/ato8H/wQb6tt0XG8
	8HgXa46cqs103t9hv4MhWJhWgdWLP3Y6Iu/FqXiSI85Z8aQfBWKz3XA5IpMm7GncdD4kCOr672clz
	LsUWZnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4a-00000006kEf-2akG;
	Mon, 07 Sep 2026 12:03:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4Y-00000006kE3-0xxx
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:03:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d944747d41so36491355ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782617; x=1789387417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=aU/jbznuKfEhWN8MQKi822KFabZUmnIYVBwMmCb1GgKWBy+kdR8WReaO2387+lGnpG
         eDQkfmKFiuoCJtLhl8pKS54wz7Q9qfFnwQRyw+4NtvUXsVndpxHStR5sysjliCSxO1+b
         OAGevMvG+5R5Pm48/SiwMjMop7wK9VmH2Rev8CcJlAm+29bBm0J0asYDWP9DlF/4lCsH
         yqlYKYO4tbVp2cx02Fws3wodbs5qX+sZtIKeyPBpfQQNCxjSaqdCWhZ7vDTk2o1i3YEr
         HY5/otuxgG161L0BOFWPvVzlU49Eb4wTh0JjEp6Cprp6g9sMWXUoVy2bE3DGRS+h0i2l
         9DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782617; x=1789387417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=W5fSNpYSe7kRqcu27mz4UmBQVMPwNB49I/ueVhLJuGaXZtxr61Mmm4wNQIMV0V/J/j
         GkAx9NmNJX4lH+7n0xNOOHpgJg91Luf/uIT3Z7bJKQASMBRAVpYXR9/nVmdsfcEJAnxS
         9nNxVqA9/ylmkxTC5XqVwKH9PeK4DfP1nffvUcZBa4UCW5SCYIdcyVnxcvg/h2P2yz+U
         l1uST+BLsDlXc6XHIuA/0tA6nyMApViI6QXvpUvfvqmg4OUV6Y+XYs9QESP9hHZzCo63
         NRbN2dKYlkuitbHvlv/IuZpYs+cTV+FyMd2i07+uAPT7Aw64DTgmXKZvxXULNU+ZlGO/
         1peQ==
X-Forwarded-Encrypted: i=1; AKwUvBwv5um3xzAI+HM0nuvNHugzh8tx/THhUzU+GYeC+XVtHUbMIyIlqoHpVnhqwEXxgDNgG5uGRcdVk/fB/KFpBQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mVimIxVxTvyXGKlTlDucnE2hSZmVN1Qz4lKp+jRCvol7Q5SCAY
	4f2Zo2DuvvHo0FeOGZQ8nvNxeIGJ+IkiQFrFL9J6ArrSpN+ZG3RHYLKE
X-Gm-Gg: AYBFou2tjqLOePYrsjy7g/rrJOVF1WLKcBkk6qQ03vMcAq4NuG+CE/IHuNJM8JG0aYp
	iEPJolwCK46IrQE0ZCvGhT9GPnQmamPl1dQGmbWh1LYYKJaDfotU04XBsn6s2PqTAbmVC8ji5Tl
	UMXdV2UowncblnPznJ05C1YuC6n0R6t5WPXXOam7kWBOp7LWFiI71O/HiuUnOxpuxumHLu1is31
	dNPhcDBH6MxUdgulLVu0dg2sEjGqfIgV+l1h/yEu/0yIwRftC444bPNYGlVZ9QKPLZlmk/n4e2y
	XuvHp06zFL+EXowPEnUrWAAVqESSo9sAF0PuNeoMYpx6VqPfeJ7QBi6h5WXSWIRPW0DSedKKbAQ
	mq1eTR2zDgJ5ejLK35AB+agyaf4AkBAN7MWVZjDVau+1kk+Hr2nxLmyN/h+QRMWldueEMkLsunK
	DvujilRxjpZgpVBpXHGXeg/gBkPa0Tp4cGI+8CUKzjITq6xg9i4RaAHC2q2LZTeHOKOeo69x8Dm
	hzyPqtoPNIb92WX90kLC4nfoA9vvxUTt4P0KuMYuk2Gb873Na83F50r4oXS/QLH5TbaDRKT5z0m
	aLdg
X-Received: by 2002:a17:903:19d0:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2db126346b3mr282743715ad.19.1788782616991;
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
Date: Mon,  7 Sep 2026 19:03:03 +0700
Message-ID: <20260907120310.135693-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050338_272148_11900CE6 
X-CRM114-Status: UNSURE (   6.75  )
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

This series improves error handling in several parts of the MT8188 AFE
driver.
Propagate errors from clock, regmap, and runtime resume operations,
remove redundant probe error messages, and fix clock cleanup on
registration failure.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (7):
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error
    messages
  ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register

 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 115 +++++++++++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  34 ++++--
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  12 +-
 3 files changed, 113 insertions(+), 48 deletions(-)

-- 
2.43.0


