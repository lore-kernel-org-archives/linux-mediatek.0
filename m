Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8532CA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=; b=YHUf+ZEBknpfhD0E+u+0NFEt2S
	w1XgH6Isloenb70TNHxzstnqpP+wAA+rybmEHSFiivUzoJ0So1UhP6WI76OGF6gbaeGe4ze0FCjq6
	KRmGrn/OS1d8Rrc1kvhSNjeWs5zjt2CnW/AExOoVfXLy08GD9v/EFnJd8CwWQcHE4Karh3rIxNDrB
	FGBd/q/S71LCzcKhI/mj3vPC0hNhdrRETJEZ4R+QdNTYVxNamNUCbCMMgrbnvyooMhx0xYGaFl26m
	lIc4kWSzG9WZ9af8ZAlFHJ3VMhmbq+XHBEUswbSM7UBQq1KNX3til6MX74yXCjnRp82YOHgCGBd87
	UrEecnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2EA-00000000TtX-3T1O;
	Tue, 06 Oct 2026 10:16:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E8-00000000TpK-2d9X
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso293090b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281812; x=1791886612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=qdpKQ+AqGnlWJkqmRkt1rWK1f+RSHqv+HpJ6ydGY3QjMPwbaRawqnSBvown1xv9l5h
         GMCQNj3FGwhN/BUPSd/nPM3cyRzEgs+7PZQxP/lpmwTl2EKNn/nGzItkJ4yha82JfdoZ
         1GXpTdBuZ1yXjZ74SmEg9vAOwoHCALPK0tE5R8g538iGEGPK1Ugn4joPFr9fnMLu3aM0
         vN/kGglI5+8EVVkhfMHT7bVf72ZEz7qXUpbKWrwH+clOt+r3tkcFtW6ygsEJZfS3trFw
         dIvHBfFjSwny9xjm/qat1dQGeURoz1BvztgPUDPm3553c/yNzHnLl8Nd6Ut1x9Esir0M
         9hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281812; x=1791886612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=N4WzetDD1NFvzwqE/Y0qUBbSfmovTjJI7Gibc9635cCIOtzB6LN+meVklirhbQKmFE
         hxZFr22cnEwP60c96Jcq29xkL3PoaTphMN+OaIl7W17Z3/53grDF6eEv5W1iD9h6Wqss
         NetDIEt007NkDuCljstQFDKDZyatAuAky5f8LiLx3TFbQd8IsaEElPjrHbQ9d3XHzIUh
         njhT4/0T6mfzWQcBSApfdpSM1pHSg3iWB5gR8J5/I6+zxDGUcfbMod4A69rZajuepi47
         AObso+8xOxhEOZpVFpbqlBjkwmutJflm1V5PCGE2moN/gGi50x3nh4quqLvzOOZlEiJX
         zUYg==
X-Forwarded-Encrypted: i=1; AKwUvByrpxssjtRdVx1poxNyJTstpTFwiI9NFfCVdNXdVwtd0/oH8z+v6xLG7vWUJiE1oHQGZuSrNjeYvr9tf8cY/A==@lists.infradead.org
X-Gm-Message-State: AFuF++klAlSG4Nh7FSiQUtVjmbBoZqbYGbHvaJ+GT9qtWAe8eNEzY0Wp
	USLsmHryGBZfvGRjS/ReG9FXxbOQ035hh2TA+tRL6wuYXhVe39PT162H
X-Gm-Gg: AYBFou38ulUS3/t7oZ8HD2X9iLtuUq5aVC2VgsUonQP31BGdL4Ed4MUDOTlmS3JWccS
	e0lwSEnvK714js4FfMNxytQcP2jJStvFhewjbGdSAACnZVXxR+ja/i5YhM49fELa+kUU4WPJuyS
	do1tkmyNLVkeU6o3NaUJH6aS61ggAUVM5bllf6sHnkaxIdBqtywaxCjOYZQm8zX/DtMXJWa/erK
	RcKqATMKSD+72Az2xCPU/6bRtCCkLDiUwVDzMC3Wbnj2pp74wLMJDJGj0jyNfntDezF6670FNVD
	iWDrs5v0fIvElcgsjLfFMNxaVZzURAVUpEELNoN/vuLv+ReooSNMFnUMuOgwlUkXzE+3dzklwn3
	/WmNGVXFGCmU555yYyRGfTkNdRSJS4UPSsuKR/wG9sX726xBnzl1TbXWeb4+hWGlbrEp1P1EtGw
	GlZLT4RsLUVU06EKhD88t8TQ7usY6KK+ivCA5Ixd7jPtXdX1D9pAbzFBg7UWp+GnBxKOBRJ9Bw+
	wImL1WHpPZ+UrerKEMvItIbyQg5aa0IACS7X+g9fz7y0MgRGa9Sip9liqAHLnU0s415OLH8M//z
	JW9vmfZzmncxFg==
X-Received: by 2002:a05:6a00:2d88:b0:888:add:a74c with SMTP id d2e1a72fcca58-890db797184mr887589b3a.4.1791281811950;
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:06 +0700
Message-ID: <20261006101606.54079-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031652_733593_C8C514B9 
X-CRM114-Status: GOOD (  12.22  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


