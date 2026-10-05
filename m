Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD7CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=; b=sHwdnACqQwHdulUurtUoDKIPV2
	NIGkZ8BB2xl++lXHcsfsFpSZeHZXcKZUjNZUMIlzLMB/28qyiiLU19KnTFH7sQTwI6FpTXDL/7Z1x
	9efCg5KCWlhU3rWkpKO7P7G6hqK+KpSFjAjCBkm96oGFt+pXWqrko2Q6WRDNfNwIrD5mCGiD3aMpO
	1185ciMUrOQKmaw7eO0WVE7jThlStVywfnl6i7BVwUJjb+jDbhlyS2u4OC2ZMNbvti+pgtvOx8rIc
	aroxYHiL4uEP5FyJvyXDRQwN8GHznGOeMaro54ewrUvhW0ctZol+lQS2wTLkxIrE9El1yplqLyyrC
	hiEE/GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTU-0000000GGkr-33G1;
	Mon, 05 Oct 2026 11:03:16 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTS-0000000GGjp-3Usw
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3a813079a55so179802a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198194; x=1791802994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=fxoxE8pWnW0MAKkNRF+uO3JB3/s0WLgFikfKH1xBWE6ekmYqfi7cwrpVn/E+LQDAJE
         EViEFcg0LwYWIHbD8ty+V0TesTnMQeifg7RYUngz1eP5hAMb3ZtFSvEAnrroLtvfwqiP
         TqQWfocOCvjsnz5cHr4Ar113MAg2eouz+arzXDnTSH/pFnHK5UD/gQ4x1oWLMXuimIjn
         HJEsGbvmOlDOIsIXvTiKxteFx3ki7FJX8ptAmhJQ1AAEx56G8ShqlqAWcMkaDyLUfUuU
         uo+am64q1p9rtDzup6zbxx3Stxik1IWT8zrweRzfIhlidDXsVAJi+mh+fAtYvm17WTfL
         NHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198194; x=1791802994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=l92trskaASV1dXcXmS4mbp5sS4x5/kq3r3MurVRKKAjmiSJqJnL6TP6gYxlCw6vmh6
         ksEVPsLkLopUSiNtp+0sSzjKJS0GReVu80Z1RzyD/qYI4jvqYuawVW+elaScX2Ij+3I8
         V9UxZiY8UWMHlyqk9+ILa5V7A1vn6ndzkkIsfjyrWgoLsQ6X3g0sHgkEC20pVYeZP71F
         rjqzCX5eyAsnKxl3825hPnYWgcfFFUb7jMQZVjg265Af01n43wZLG1jhF36ykzsDf4j4
         QuKBPt9qeOplhlGGvWeU2Q5rbXF9+cZFAB7dLKBfWlFLUlCuauWFqdyDAng5Goi49Mxc
         1yVw==
X-Forwarded-Encrypted: i=1; AKwUvBxPZZhNQLcdIOZ2HfdeSrZ/tjtJ8i3/Vd8291grdyTg6sAuj1FlM0bnE+HAWh6GSSNDPghSW/jV6BlbeUKE8w==@lists.infradead.org
X-Gm-Message-State: AFuF++nraZe5JfNkmUiEY24IpS/IEoja2ZhS6PGXitER6JdG1BA6biQK
	AwJS59YRuuw6jTRdXCfucYhEE3kCxRDjYJGYj3+ldRxct4LM7ym6WT13
X-Gm-Gg: AYBFou0/WjhmF9Aj7hHQVSAdJGzTnck2SSHnnKG5o5XHsFSD3WXl+7wkhXoASyMnHG2
	z5gwc2BP2i+UW47Wic7L7bobEYGxxRcetgHKsslT8FV8g5bn6pArPW4CddKM9F02/aNlWJV8Vq2
	dnd910oD44QRZ3VLwMXCwNp7kCCBlkEKeb4sXwRQI1ubh/UtKBA8HPtF6oQFRbjDlwljFvoLCuF
	djcetaOPCFmjmG8pcAogPig9ZROQt/DggnoyF4pXyYa12igjHojfG9hRkeyCa+F8lNUO9iswYBD
	hhQyRDK3BjaAwLKWAn2o+LPe8vuFfuj5LXUSHmwDfL9tJlZJW9Eo6X6SL/Qnm2wHaIAOS3iFqQc
	zLM3zeqMLGg9F/xrxu7YfQndgatluzzvlKyly7NL3DaDSWr1Fxk6rHUED7Z+4T3rNerWhnA5Ya7
	4Rl2kPsW+IrTH7yXeIzCDoX1fcyWLUiK6571/FEDyhBM5ie1siQodLzk7KIxqThHjOL9vgYykD3
	mFq5T/FPPeiSvCYwzejzEX5h3GUf8uL91jrpNCsulEZxAOxXKcFVBwUamkJSxgUQLyHCZaRbgPc
	TCoTmcz27LE0Yw==
X-Received: by 2002:a05:6a21:70cb:b0:3dd:a9a9:3967 with SMTP id adf61e73a8af0-3deacd7c65emr12182287637.43.1791198193691;
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
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
Subject: [PATCH v2 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Mon,  5 Oct 2026 18:02:43 +0700
Message-ID: <20261005110257.50145-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040314_886306_E8B5DDB6 
X-CRM114-Status: UNSURE (   6.55  )
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

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

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

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  69 +++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 102 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++++-----
 4 files changed, 198 insertions(+), 75 deletions(-)

-- 
2.43.0


