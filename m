Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF1C98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=; b=FedioQg9wIKMw0OiAyukTqrIWS
	SS2pZ7JqC11+b9VW71Nz29c6MUFZ1uwRLL2k7hP7ESwwmw9H+Pevwm1ibKBHSvp90wfePiSpsf6nn
	8PxeZy/Tm13DajsYymOWIoOQr4LP+FIHvBKwQRv+th9n4vYl1m+KmwtUmT7xEq3jt6UkJH3W+9a15
	sIaIkCbwk1Wt1TEG3mTA2hY0fbnKXZ/7cKs1gzu6Dhu4q2xGeMs2Xxy4TcsykexQpBcc8HKOuMwWZ
	arnd3/7d9LyMIl2h4FwDwVukuooJHPxQzKQemBg8atGmjkzUV8q5RCSYNGsKmdx7rxUaxwAuyyqUx
	cQIqSp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsG-0000000Cd48-2w9g;
	Fri, 25 Sep 2026 04:49:29 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsD-0000000Cd3S-3ZIO
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:49:26 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0af40d240so292160a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311764; x=1790916564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=BE+0rOqjV/NYwoBuRH+UvJ6pgUBke2yW8E73FytsdRc1hNlVMbNzEtX1mxcZ7R5sHB
         nHGiUl6RRpbMD6X6Pv9hmzkfYk2/SN9PY/IBED7FdiEFiS9bFYXEZkh2BbBZvtld+Ao3
         9nCS8QTzO35L9KHcfqgot5Ywfz60kD06TSUjMDGuz/bnoJYgqA8eCmj7Mq/fpjbhrd6c
         bl4p3JrmJdkpqOH+1dYQ0OGy+dQfdNDgEQCzm6TJPWjsHs8PzwxXDTcS1emxbV0ZixMC
         gkpdf1YzsTaLmTzWtjYx95n4NrY23tDgNWiStFiAh35+BRzfEsMCsCdptiVu3Dlm95kw
         AywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311764; x=1790916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=ZKOCZZ/1kvq4nIsLGI1rZuNjY9Po+p8BPHR5S6pUVDG49nj5wyxxDfeb/L9L1HXSvv
         kgONrSzPLE4hzXp2Be1f3/lwyj6hwwjZNF+EepXzoPeHbYf0+G7mf6vtsMlwhAS4VcX+
         Ue7AaAgh2e54kcaNtrs9JE9+8McEFi63Xslv6TRGrtiAgSDrE9SdWQBCNPFhhvuIkIpl
         8gFx7hXRbSu7CKjEaU2iWr0lpnEiJ2qEdkwBlSMEXTCmiD+ZwRBKS+DgVeXiPxQxXXdR
         emiZ6poBt6VHskCkEHkK2pTCKWKDpdpQe29Wvlkfh6mCdgIkFQlDIdBPwRw507njeBOO
         jiyw==
X-Forwarded-Encrypted: i=1; AKwUvBwBZo0/4az+3cv+iE/Kuq14WvwlrSENs8VyCdPXsftkGQPORK5hP4Rq3ltSjBQtSOoQscc0CugglnnIXPLLYQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nd3od0PAliK7t5DWJ+ksbRWMgP0PQudP5UPyN/aH99cixbSH8m
	lZLKtGUVQ3O0duvI2OIS6MkzjRTq7c91tQLA0eKiKWbEXhmZL4ktzX+S
X-Gm-Gg: AYBFou0RC3hNvRE0iQQTa46qkKjwwBLmRP7WX0KPz+HUxCxbppjp86Vsb4TVtprRqI5
	hCUpflUrGPuom9vUbpouBaUilnPokS8m7zTrSqVTR3E9BToJfiJcH1LYg70NxmA6s0Ih0Jbw7G4
	Ayhg55tzqVM1abcsWWcMzfUcOqn9d0s5GfWGAv5/42GGtjtEZducKvuEbAN3dX7Qcu9pRR5X5gz
	4xI+602UClPsq8fpcxc1acyVh/ZZbksB4cIBKNw5nRKQab8HrcX69jvqchvd01nPtEdW7Hm6g2M
	IXktn371D3ESyQoUsCpvBW8pUhaz7JNgZWh+3ejzUXZOFdLxQC1tooPbpVRr79nVLZl+QEVrvvG
	RgiQA0Kd4qFRwPltkVW9F8pf0uqmcnnNu2d7xNE50/+NSe59/kGmbWW30qpA+iD1MEaHAu4KOg5
	n3rTp79hCuO1PeKnpdSN+mevfW0LsynFStIs1C2L2cb2IUXMdlt+jl2Q6crR66YEF7DWMBdoZSu
	WmP530Ccq6ArdZP+rd5XRKF2O46x/9PZNjptWgnBqVG68hhTXZawdjtYvSc7jxgUepkkyJK2kWE
	ljgj+rEOtDGamg==
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr4416407a91.30.1790311764283;
        Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Fri, 25 Sep 2026 11:48:54 +0700
Message-ID: <20260925044908.450775-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_214925_902020_AAAD65B1 
X-CRM114-Status: UNSURE (   6.24  )
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

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 69 ++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 98 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |  3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 99 +++++++++++++++------
 4 files changed, 196 insertions(+), 73 deletions(-)

-- 
2.43.0


