Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F72CD37AC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyKEQnFkcag8aZaR2fYnPLcwFNIGlvncddmuQATu9Bw=; b=p14xFlFMmsI+YA
	LITw1ZoMG1/UR67a8eSIRJCpym5RyrPWMRizJOspN0KkudrMM1xIWVGvDxcu5IycWc3Wg7wo8kXWA
	YIcn0nNXvksbxCTYxp+qoC3okhEphRLZd0lEbS7mf+v6+tC02McBZYplBU9JSw00iYXk6sVhosMue
	kLWXc1IsVYgUM+/hG3kg23mLPHASz76KM14QNnUuf1Cw0oZFy0hsh3rzxJFwWB5mYz1c+8SuP7u83
	hS+ulXxbwl+tFJipm384b1SW2b+QPvUE9639XYH6md6Nv5Ib7JhjRVkgnOUzAfcmRPgu23UmXb71a
	3ZAK1W9Wcpg/SNb7eG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaNZ-00000001p7s-0dSB;
	Tue, 03 Sep 2024 20:43:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaLl-00000001odO-0b9u;
	Tue, 03 Sep 2024 20:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B94285C56F1;
	Tue,  3 Sep 2024 20:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB15C4CEC9;
	Tue,  3 Sep 2024 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396123;
	bh=f77a1LdLPhKYcoJ9UhrtcEXRimOa6g5gNGHE4f1mX7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0zxmjU9R9qHYTmD4lWdb8R9J2QcxNt3y2i3ulRoVsJrYgFXDcnqOyYXwWI2ASxRp
	 ELWstUDXBhF0ZplmpiqGNQdHWO7jM/IuqsgexFDOdzQMTEfNHke1jxxx4MTJsinG1J
	 gxDGpGtYNxAwYScxXLX6rnx9FLosd/ZqVWdoQeObqx2pq93U3ZD5nwB0irbPkjcFl4
	 XDeJCOfQcU46SiDMk9tLYnBf3B99XI+S4uyI8Rg/Sj/BHwu1alHQN0u9s30jxW+TnI
	 15cgK32QDyKjGxqxyeKMsqyhMdY3c6RiQf/drkUCbhyFzU+L9Qn5AZKY2I2DzK1YZi
	 De+VyLqJBo/7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 02/22] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
Date: Tue,  3 Sep 2024 15:21:49 -0400
Message-ID: <20240903192243.1107016-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192243.1107016-1-sashal@kernel.org>
References: <20240903192243.1107016-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134205_338655_71DECAFA 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: Sasha Levin <sashal@kernel.org>, kuninori.morimoto.gx@renesas.com, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, YR Yang <yr.yang@mediatek.com>, krzysztof.kozlowski@linaro.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: YR Yang <yr.yang@mediatek.com>

[ Upstream commit ff9f065318e17a1a97981d9e535fcfc6ce5d5614 ]

Add AFE Control Register 0 to the volatile_register.
AFE_DAC_CON0 can be modified by both the SOF and ALSA drivers.
If this register is read and written in cache mode, the cached value
might not reflect the actual value when the register is modified by
another driver. It can cause playback or capture failures. Therefore,
it is necessary to add AFE_DAC_CON0 to the list of volatile registers.

Signed-off-by: YR Yang <yr.yang@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
Link: https://patch.msgid.link/20240801084326.1472-1-yr.yang@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index ccb6c1f3adc7d..73e5c63aeec87 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -2748,6 +2748,7 @@ static bool mt8188_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_ASRC12_NEW_CON9:
 	case AFE_LRCK_CNT:
 	case AFE_DAC_MON0:
+	case AFE_DAC_CON0:
 	case AFE_DL2_CUR:
 	case AFE_DL3_CUR:
 	case AFE_DL6_CUR:
-- 
2.43.0


