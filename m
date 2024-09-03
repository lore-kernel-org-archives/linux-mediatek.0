Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612C5CD37AE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4UOKHEylYIEGBqf3S+grGaolQ/HjizgMIUpwljT2RA=; b=3wCIXzzPDDRE7m
	LK04npxZFjIDtIkNKnAUeoPs6f5QjnDPkIvfvvouxd6re1UnSEnSBGIRQ0V+RYia1p+DMST6goNCQ
	rdzttKF8qB2XzFTBeg7FJaPaRTQYT4qJBeiKeAl7SCbuU0R7VswgFHr/Q9xAm3kdyAZRtJloo6nLJ
	jSz6Xq4RLkzZBKWXCD+WZcDAy16Mb4ZGo+TO2ahoeF7lExpd07oFcKeiSUiL7NfYhiCr6PjjD1hmK
	b5eTeIe0JfwIEfzif/NEL84Y0CSYhr3ZncyJECbC5e8Df7HP6xUGJQvyfbZyEqErOdY+NsG2C3pB6
	0SD1JrjXhG1VZkz6fBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaQX-00000001qGP-0JpV;
	Tue, 03 Sep 2024 20:47:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaNP-00000001p42-0j4A;
	Tue, 03 Sep 2024 20:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36E08A43EA7;
	Tue,  3 Sep 2024 20:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF13C4CEC5;
	Tue,  3 Sep 2024 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396226;
	bh=gtQyC/y+R+KiSt4qyRBmXQZX240IC8QEuMrx6eyMMXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HQhU4IZe8AuSVYax1xuyS0kkAfZswbE7jr7PdaW+P07QyZwfIS7KePSfsW9zLpEtB
	 G0/zDGAVgq5DhF1sx7ZobvVhaEjqjGSEhZkFldUIeaoXNix6r4EDQOlcbPUoG4o+TK
	 g8DLLj7TZOBrP+tZUv6VSYOHi7ZZlvOY3k562WfKyxsSekHKBRJkqK0sD3jDnHOXr3
	 HrBsj77WM1AtxjfketUpvCEGhNRtV+tUjXe0xIslY8HF23kqzVcStWPvUGoAFLxi7a
	 y7x603EWM9SMDidb9zK1cqIWNZND5b8VY7jBK2PVEzN/laTCReMGROY92oUCl3OESs
	 mMwT/5hBDR/YA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 02/20] ASoC: mediatek: mt8188: Mark AFE_DAC_CON0 register as volatile
Date: Tue,  3 Sep 2024 15:23:34 -0400
Message-ID: <20240903192425.1107562-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192425.1107562-1-sashal@kernel.org>
References: <20240903192425.1107562-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.48
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134347_302558_6B9E3C93 
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
index 5e14655c5617e..11f30b183520f 100644
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


