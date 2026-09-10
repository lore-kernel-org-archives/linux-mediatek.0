Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595ACC79FBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=; b=tAUvgPFloXV8edsbWB+dDffA6g
	9f8T8XMxONR0Qj7AwNiR1G8SjzBjRlj2rkWBFKzpKWWZyuHvb9us9C1gPP28MyfLH2Ejkht504B/Q
	FmQ5YPEjq78oJB2XAKkGKEDli94k2GOY9r3Q14rqzpZOMqpSpiA5OS5AUFpSSaJK7tJj4pKi6siiM
	QIU8nJL9SmceoQSTEbv3q9WwGL3zxSU+X/dR9pQ3qt4rfHc1bTEMAlwmtGFLpYfcwbvgK1QZoz8t/
	yMafBDzgFnOJXVNi75JnijrTxSbqWKNNWwFiVSA7elP6WYcQhH6m/5bks01xAZjp0tlTqDzedQyaz
	3mxtJPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLv-0000000EOLA-2NSk;
	Thu, 10 Sep 2026 12:58:07 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLt-0000000EOK4-2tMK
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:06 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso1126543a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045085; x=1789649885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=kwrYI8FrA3sEgOjDUuCFLMdD3LDcZBCdTMAkGDad4p277r9eNISrm2a0Wi2VIlcGA1
         ivP4Zdf4A8mZpaua3QqXT/sbBz5v2todPyJv3QCPZPIoGO5+U9OSft2giNKTTOqOHOhg
         KhBI0vjvvoDh3vK44v/dKy/caBRJP3GwmeytYssQzCuKL0V/MjNfIJJFRA3Nz6orZgj4
         C8nCx7tlfB+o5Wg6ND9G8f7F+JYpvgUr+QGCZJ1/WIYh5DbxcOPg3AT6Dznannhzws6l
         NdCVphgeYRlQ1QrmGh9XVa7JVm/uqz8XsYDSrUe2pf5SfIlRHdDfhkSt+0cVkV+6bbbp
         6gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045085; x=1789649885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=AQrcZhnfWZ/9EoMmRMTKIMpX+gB0PLQUgCdSOrAaZ40evgniOce6C1yVrvXv5mQq7I
         fYghg0V9rCrXGZDGjfIGWAcU7j4oNDfrmo5en5xGFgsCnhvwqLaY0ZUIMomLYX4AuVaO
         KQ2NarbVU1ijd4+pyHT4iLIHyoWrLpohxPimSySyxvhLsCvLeR0Mv2/bFHQfcv6scwWs
         zr2nJRwlKPnTHcLikMxjSMts7AiLRQoFH8bwDkE7aTVMZa2Bv4Z/wSVSAdo1yiyhnb0F
         S+uozuFIz5MdBRWIkJ7Q9QlvnFEq3KL7KgPD2u9mahsE7IZYhUXnF4btmfvyrN6ilTIu
         GB0g==
X-Forwarded-Encrypted: i=1; AKwUvBz/8MeJeOYrbBcCWsSQlLbgJYOXSyeuuYBhIYOKXoEk6f576wWmjrpUYTh4FTYGqtA4cwSFiePiK/PRgyF/Lw==@lists.infradead.org
X-Gm-Message-State: AFuF++nmV6lJjTpyCj3euVSoUftTbRs3f+OkUaKP9hMgaQxDJNJO3VCC
	C5R5CX+sWKVuArAqhb2S4A3eHF7kFUFJ19SzsuFV/tuL4zO2PF0gpKGP
X-Gm-Gg: AYBFou2UOSQPGXk1TkLNP1qaAemr3MdJ3kRbGY3GDTEKvLaQtkXjLphQKxL57t3Na8S
	che14tdurT9fWwd11QfqcunNwP3Sjnvs0WFKJoM5WfSa9V9PiIfjwH2cKWXWbXLczZ00UPqbMhi
	5ohMxyzbLydPZYngrY68QPc5DlaSpV0PstJRz5BEz6ck8/rrTCofrjyHdQST1dchrzdqYr7FTTi
	LGjM1NyZ/8IoAnL1C0znG9uIlzc3svw4zbQ5N3PeDvXu7tAllZCf8dkEsEP1oWCYEOXrucfCrD6
	PV9yiBL3WYU1SDGXKXCUgw2hYUTRQ+IgPKtAVlUejWmAGQgam6IO1DxbSSlg/REuMs/lnR2fuX3
	0aG254wIUkbCNaTPlotUWTlOoIas8b9h/T6rIb4VWah8g/t9/wnrsl9HGvortDuYR4gaKuKJPm9
	ioE0v7zVbjsVuoh4shZYylTwUOB6GWzW73OeaAmz08SZmMHQKkwOuc8mmJh3Faxqdu1OiT2tsVe
	neKaU8bVXWawsT4oK1Fhlgp44WnOxCFUPT8TY6LfPh7zeT47rREFbCbx2xorS/Aua1wuaptXZTz
	SAU8drD6kQ9gvCdLW6kwGZ8Gtg==
X-Received: by 2002:a17:90a:d406:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39d77b1c378mr4389281a91.10.1789045084933;
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
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
Subject: [PATCH 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Thu, 10 Sep 2026 19:57:30 +0700
Message-ID: <20260910125742.150902-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055805_743588_E3AE895A 
X-CRM114-Status: GOOD (  11.42  )
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

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0


