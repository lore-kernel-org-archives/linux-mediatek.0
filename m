Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4786CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=; b=B6tnuHuprcrcOJIDD6TF6nEFrn
	AnqCEra4l0j21qofNXGxxAvwlnYocmy5OQ3L5N3Iv9CEx/B66R2CrTaBLJtVTmItSscfp0zTysI27
	HwhGQmNzh4xwko6B2sL3AEPVAzXm8QqN3Lb0nLsO+WdvXaYayJ+tpJSAmC2o0/LR4kp8dQ+7/KFOV
	WxRB3HHSQtibihe22hlDXje8sI0rE5otqdy+tIo7Iolgh/fHoTLusLMqEACE1l+yt/TYkoyCegHgn
	WL+vSxyXEAMHNC18zjVCER31vmP6D9FJx6SF1klXXihhxYjyRua/KC0q2IAJwEIYFs7gMge7fPNFY
	bHJ/ujfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dk-00000000TaF-1ZgK;
	Tue, 06 Oct 2026 10:16:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dh-00000000TZR-1PQX
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-88834d30002so280724b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281784; x=1791886584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=eANorSAxRI3t9p056K3TxzoAGQgh9Kqzm2yvAzgRf2JHGuugK5isEoCHRUZmEX+6M1
         hNrq522o30llh3QlmHIikUFkYXmHi2FCjlGjODgBE8PmCSAh+fZL1sJQNZnCMTRUI0ng
         w0tKj2dHkIFtGPFJ6VTGWsd5VVzTBZvrd4CKSqjYlUJ8+HLrW6G9+oVEnCEOs+EuIiNn
         bol0vQ1Wt4pD/2KkQ5nGfkBhB1zoZg2NC9xpm/xXVcaHT8qX6d5a6exLzTaUei0vqS0e
         hCEaCqC2HrB7jabX0TfYpvBouGsjYjk6OhcH6lzf0KBwSlVMhZNgFtAInCzHYASWULvR
         dlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281784; x=1791886584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=Mv+oM03u2lfBfl76v+fPJsLZvb6A6C1qaStidwwpnOfYvFKdSyim4Z2UPEZOlhN2Ox
         6bxbLjxqeaqCKLqe4YfeG5cvtrmGjLku6s8YWnp83awTc1Cm7f2iImeN3gvuaTn904gF
         W0/VzDaL83gB6WSIaydCTVeYC5SIrQxQrkB/5EQQPReXb0kC/h9G1/9TRNDHhAPUN1qC
         eDJoXb9TOYG03HGYHfW3Ntk1MbX4jrmTsVwihC2iUvWXe+wddplYpPqAUhQPTfvIhW/S
         n5v8k53CFakhiIRfSDjZWCC/dHXd/7OFQbJlitJvHI4nZvjt54t6jNXzaMyaGdCwnypJ
         VvxA==
X-Forwarded-Encrypted: i=1; AKwUvBzm+mgx5SHRhTNXT66gPMkRonC99d8q+14NJ0k1DJ3Cdc9hTeXB5MdYaw7wxLZBBVg8gTQPeqRhIpQOywk+lg==@lists.infradead.org
X-Gm-Message-State: AFuF++l2/1TZPL4zfX+tXUtpb6HTZqQwT+CUYNfc6WLYLGqpURrn2PiR
	wO8dJZd0paFzuFVbAdS8Dv981z21HvG98QTUDNprGCx+Gttbo5JQjPmz
X-Gm-Gg: AYBFou0wf4QJ72hnKrrgTbzVa0m3BClPF74ZPihOsxSTxYaqyQXBe46Yp9TO4VxKQ2z
	JjEFDE5wbtp+h+CJrDZM1HLmaNymyZn6D5PknNawcOK8p1tx2N1dgrcekfFH9wYngO+NLPc++3w
	LGlK/N76HQjc/TAJ8fV6GsEgwlZFwZUDyCxtfSTGXwY9sHZiSBHbLo9GzdXFim9Fz0fxDePasZW
	TEtMjk2M2+5wIffwTbgJPe4Vc9WBpKq1SwU12seZnuu6viw1I5LKUYujebD9kkVbqSu6MNQHrsf
	xmweBhCWitl5DjJPrttn+zfKzfpukdoVbl06JUHB94Vc1Zod541HQqJgRnTHFfbmvxhquCTwkSf
	fFF6k14gpIlpaI+rNMGw0dRAoaNvihqFcBGk3AnAYUaai0D2QNp4E13aGYWU/HgtnJ4sCBATNvX
	/o/In27ibyLbIllL7Ke6MlcfCYRqLp1jitiIxMEq+/prV+NKf0Ya9a0SUksZPb8JSzAUrwS9ngR
	3AVc9xDjW1icmkSyHjUZmmrxtI8K2J5mvxPXrUcdMszUPXAl294122BnsMR9bSIflfq/c3uog+I
	jaEDtkk/eNqLMtWbasZKjZ1w
X-Received: by 2002:a05:6a21:511:b0:3e0:da23:874a with SMTP id adf61e73a8af0-3e1246e1ec9mr796494637.18.1791281784146;
        Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:23 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
Date: Tue,  6 Oct 2026 17:16:02 +0700
Message-ID: <20261006101606.54079-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031625_371051_A558314E 
X-CRM114-Status: UNSURE (   7.17  )
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
  ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on
    success
  ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
  ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on
    success

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.43.0


