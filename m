Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B84CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=; b=FfX2QqGwicV2HGdY7OuToVjeTM
	xVJG0cuMwXCGMf7lI1/d9AdryUbE6D3fPo9b7FnS+yPQDcx60iXojkF3zUrPghnZSCtDVQa7Hc3eU
	64EQivH50uQi8MXxgKS2B4ZGKiljwJotg43YQAfL7mheptX9YZ3yVIGNK50fFenHEi7bwzaCm9SEq
	/6vcbq/ODxq4hDicl4OJE4CRzbWEw0E0eXw/TAzPEFgTB8JH+SYxF6TnL55gB7FrCclNqRYkCIWsv
	igc5A8dZsgcGRuWKhg5sjSO0xq/tkyNduXbyqUgyAHaSwUe7zLbtK5Hi/mcCbhvvyAgJZhjztWhnn
	0G+2BECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9b-0000000FJVX-3DGq;
	Wed, 14 Oct 2026 11:28:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9Z-0000000FJUT-1yGz
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso2911288a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977292; x=1792582092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=hXhIB66zDiAc75+AL5GJSCmTKgeOcXLO8EEeyVHOUkrIXTAvSxNX6HjlNiA7+3JJfv
         ANQ41y4vrxiaW8mzvqJZMHRYZDx46XArXH7vVPEc6KIckSqTzqbTwR4WPPrurrJPeFOi
         tOEShJAbjMeK1dw8y/dsitgvEHPOAjZ7upAX4v7uxPz1hSTXE3c45yNGcQvVErRewjAp
         HryK78xer61LXE76LphuD+SQWeCUAFPiPqxNod+huSXjEZ/h9Y/G3xyUeYAsYOjL8HNv
         ydU6MsnH22eiicSKJyerERn951OvI16CvbXblajqeq4ifM4ZawyBW/yTwThLqYnshQUq
         hw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977292; x=1792582092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSpiA1Bc1pZ3CNJpR9diffFZefsIIbL7ZunxNdq/+vc=;
        b=KqwPDd/lCxOSRksJ7Ni/KEj8ZR1IFJvLyi26TW8Rg9FABOg61GeGIyYNhHTsn0buRt
         MgDbKw7eYcgtR3Mtjwyg9/iDjklJPWOmfCxHrLt7TiQEZIbu54LCuZC1QViVIg3FdbLP
         TrKk958LdoA0jeeM5r8No4kdth5aHrTgSpIT7/2/jpJGxWveX8YmZGw9joZn1Isx7aiW
         2fRW8abWN3WU5vsvzxhrB0nu1zIPi9QdSai99UBR49mc+IETotyhzL+6DwaI3c3LArRC
         4c2B3PLs5aKk9GarLoyr72+mZbzKeo/bRqhte3DBf+IRNOAxxGO0CyfwVUSWi2VdHOzp
         l+7w==
X-Forwarded-Encrypted: i=1; AKwUvByqaQV7ma3G9MQn7u4wYVpH7eeEXoF9UwXEKsIlpcWSaK6lLoTt+Mt1kznhI6AmxWBS7yHbZDchCYtq857yBw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKaRYn/cWH/sjAn5rv8BvmPqVI818DmDhE4dn32Nafr/Z7lQ2g7
	FBOHEy5UQll2dk9fpKnXeSjRXXkJzT6scZ1wmNciUn6kEvj71gcIoqLC
X-Gm-Gg: AYBFou0XtXgyLnBfkDHZ1xLEMGFzi441CFcHN7V+SjEbZdFZDDooR1DvHMsC+hfU07B
	3YxVjhIdXhR6tkuX3A+JI2ra/7gY5MIlEBhokVMUFZbdwtjM0HLv2K0ohMWbAOn2i9Nse0hSnYo
	sf+aJqDP2CRzlrzU1abDFI58o+TUyDJvGq8eTdfutaV49AEWZj23BYPZOrjIRD5qSwQ4hEY4Zai
	Og5jNb/P8sYR/K+q+7qb0U2Ajx67jcZ2oudRwNb0mE/Jhx4EbOwoLMSvHxfnr8GDAfP54jCKN3Y
	DqMDq8dSozvrjtIKhB5XSZpxKA5IbBVx4mRs5oT71ax7CsgVo+KMtKXaAKAN376uUAnsoLGeB+S
	D4tHCDqC9swHgDT8esQFENN8SsQrf4YP3uPkCpIid5qr2+19gI5RH9Sb6BxXRvkntPi5hMiVZYy
	m+CY+RPAqXfIozsspubeYmLPk1ZkfU+wxeJs48GXo3fY9MUNy0ARwQMJ3uhuVvC39RVX1Fz8a2r
	TVFvOe9SXrCm3jBcgkctPQauMNfZCFvq5MZL06IeRsSmFuuHszt0DMOVFSuDs04hGM43MGrbRlN
	sbQ3lIvPv/2zsA==
X-Received: by 2002:a17:90b:2644:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ac860e1b6emr237850a91.41.1791977291371;
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 00/16] ASoC: mediatek: mt8195: Fix clock error handling
Date: Wed, 14 Oct 2026 18:27:35 +0700
Message-ID: <20261014112752.683032-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042813_520718_70822DB8 
X-CRM114-Status: UNSURE (   7.68  )
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

Link v1:
https://lore.kernel.org/all/20260925044908.450775-1-phucduc.bui@gmail.com/
Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Link v2:
https://lore.kernel.org/all/20261005110257.50145-1-phucduc.bui@gmail.com/
Changes in v3:
 -  Add Ajay Kumar Nandam's Reviewed-by tag.
 -  Add error handling in mt8195_afe_enable_main_clock().
 -  Add error handling in mt8195_afe_fe_trigger().
 -  Update the commit message for the DAPM error handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (16):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix main clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  86 +++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 111 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++-----
 4 files changed, 221 insertions(+), 78 deletions(-)

-- 
2.43.0


