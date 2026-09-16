Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06804C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=; b=0Ej0UbAklfLROd8AbTpF5lzagb
	wa7kAUxdS/B442TrlGwJitYVuSgpDW5SpLUW1ZcY8EeDNlrTSbJQ8j1eVNo8Wj3RpfOFrcNztIXW6
	HGhwuGf4q7Hbrrv0hy0IPKd3/7ZzQahzoqH47FLCEPsVAkvkifs4/iObWtodlQCmYYk/OkBr1P/N5
	9YHHpbctxyFx503QV+Qx2fg/rt5MtNsUJ5LyqGjil9WewLg6tb4qHK7AzuiM1iVbWVztNmZbyAoEU
	nfuHrdew8WupF1837gPMYb9t95ia+4rLcLG5NWZdK9cTQhU8y8ePxFOU/LMY/bS3z/UkDVkOoLPp9
	m9onTBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hli-00000008LJi-3Cgi;
	Wed, 16 Sep 2026 05:01:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlX-00000008LEm-0VgB
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=; b=S+FXs/hIR1QfwduFikSEuUar3Q
	BrtQ1eJXbXwlwsqSyoHnbcJSVXs8VfJOnOq9LiTBwi01BtIw4fkM3UwvmeIo+8nnb2LiuPUx9mMvb
	KnqbCPVGG0y6M5OHDK3gENe//2n6hgKiYvHHmdJOUoK4NYX65nC2QdzaM9CwW7FPHE8ym8G9l4kt8
	myzi8hL4WJscPfqmVhM526nzIkS5PoWV0N4M3yciABG5WJTVcgtDJyo6V1WUa3LZbm2Pbw9d/Seiw
	+2YEazgs3m9u1Pqgdzxj1VLS70Z3AqcYLMQSCWeuulP7+74mwgyAaO90VRQyerQeDDy00Ai4W2WPk
	j1IBLecw==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlT-00000007UJ0-3LvY
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:01 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d20963so289500b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534858; x=1790139658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=sHv8Ol0gB5iQwfSw8U8A1aQMsCG5kYqy8Ej74EStkDOaytHmi1SgRUt+pT2JSOpEcG
         2YAQlatnWcFEtV9tEdl35eiGYcs6pS9pKzL88Ohw0p7NYf8iq2xMN56bMlQe9sPgPTy+
         S0b3a7+UP4VMEXuS3fAHEMGoZt+bGKhILg2eCWGMQag18wKReGqG0/CvLH+W8YJONgNp
         tZPuLrsyGR7DulIzcS8rkVJnxRkb4ukZ0Mb1fMIuRIlcLcv8tIKwTXXdlcnQ7XmIpzkO
         mz8CIoNAtsTpiQD7vshyg6MLZMD3RNXCHFQDPgYamnyPbW2VjZD7U9saw14ySoqc99SU
         buYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534858; x=1790139658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=QMr0dCkiDlGu+XA2uG2rKTuYZ2McOBXBVBpOFVCaqgqhF8FN6uQWijXJdYjeEnjeVm
         DeCHululBkXNgR2IazzI5KZy1vWL1hmLs/oMQVWKs00n54Zk6b+Z2c1AFUa6DMR7L6Em
         9o3Cs1YRyIjKENQ+C06Gbd5ZiOaZIjtzSfy8wm6kuYxo5nsvzNHxoDJc7Hj0+1eZDa3P
         YF20jo0Vw+XNAlHy7Okt+A5ziHf7ADaHFleRgO2dDQzu7zdWkf3jlO8SY74rd7F2KRFx
         KLJFFcScT+G7PkhJUX30GWgBqiDtarCtsV1y8WHCgBziDVw5tP1oi1xpcuzGjPICYS5o
         9dGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1SAkDPDw2fCcqI3XAN7vOn0nXVXiJx6Q4ov91WV+lJrDgj8yZV7LyOxQWnRmrersBJN6e2wlPcEYBDYbvGg==@lists.infradead.org
X-Gm-Message-State: AFuF++m+0UV1LXxiJu52F1HlwjWcwvWc548X0c2TFELg8Avy+tk4jhTj
	F78bQR9qJ/iokEYZWmqTQyqVEAnjU/aV/6ymKwcv0e57tyQYdMRuEusv
X-Gm-Gg: AYBFou2LfGtR4NnuPRm3YYcLNHM9Wrt5LobzvxDl/HCwFdtTMvR83zcpl5vLw95YSB3
	a9ZsyirKWOtGyjkj9MlaDG8bd90+avjjwudvpf0xuaI3uHLPPo2rGG+hb/1hwFupiN4F7YDy/oc
	ThTWk5k6/yl/HWBgVeISR8EQtFu2zXRIycYRHdU//csY+JD2u4mXPvor7jLHVs9ILfK0oAbHXTj
	sZJyXsJNnpZBFifmAH6q4sEC/mHuicoewRkGEQacmFYU6jYX8HLKGSV/qXkcjzt9P4Q4U6zwOyv
	sAWcI2L9RqiBl0hotDa0lXIjW/3uq92sNHogqKNtZDEcA+F1JqXki+YpT2taJ3s2WDDGf4g8kcu
	kHZDQJfsIu6xDQCJmNxyoGWxEy7d4TBbjg8nUkTZ7Zu0WQMwTai4Xys2XYD3mnBLaT/QQatwylH
	OnOfqjwGDxBvMr52guTSOSc++Fd62DOuGRmh/4rIdNP6mkhhzFksETRR8NoNZXaSbaZj9SRqE7c
	ZXonH5ckzy/JynRKSpkNkRjPkVK+ngKtvaByffZOtXszl5hcTkIqB/wHXUUsqSdJEoJgVmT623L
	uSBy6fXQYU3YKsM=
X-Received: by 2002:a05:6a00:908f:b0:864:cbc5:b8dc with SMTP id d2e1a72fcca58-872378bbb6bmr2333682b3a.10.1789534853419;
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
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
Subject: [PATCH v3 03/12] ASoC: mediatek: mt8189: Validate MCK ID
Date: Wed, 16 Sep 2026 12:00:10 +0700
Message-ID: <20260916050020.14575-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060100_183248_02965DDA 
X-CRM114-Status: GOOD (  11.23  )
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

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 56362c4756c9..7fe9d01006d5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0


