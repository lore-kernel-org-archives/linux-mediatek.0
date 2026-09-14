Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD6AC88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=; b=lM2FmY+goHeaNUuDdP4WMNRLDl
	WQvfOWVrZ5RcCzCIWiC20cwdA2qQHE8GBs+rEf5UHSTiK3ho4FAXFyu+/EYOho9CZSUIa0Jl3ciTK
	KqJWnojooEMBsAHSSBAZsIJJsimAgK4VnxRLwW5JX9MTX3cflQ+lNCKOARhMQTzroGPclJJL2tenz
	+RsnC7wNhZpNwJE1Zqa5xDmPxmA1yBFzmlQUzVVsTsMmIJlzQCVFcINnjNj7lcKo69bVpjbkOcnmc
	tw5wnmDGLC8VGZLlPwB5pX4Ph3wyIWo95p+zpoxY4P4za09LXQAbMdYf4X/yBv7tRNhD3PS2oY+46
	FhNWvxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618R-00000002YvD-1XEc;
	Mon, 14 Sep 2026 07:29:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618Q-00000002YtE-2oxI
	for linux-mediatek@bombadil.infradead.org;
	Mon, 14 Sep 2026 07:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=; b=OWZ6bGvXbR4jmJ1Gqbjcny0xAc
	aNy/FCByIjdzd9Q2MGzHtkcfboOczxjUFK1JVjvjwv1SSwHwHEeFt3K4xdX7XUgBUU7Vg615GB7Ss
	uzLfKMFqJCowb7wiOc26N4nIuz8eIjSlAITF4jx+FaxWIWs5910XhIwu+BkLBQZGbpFTPtn97mX35
	lwfGsTixqEI9ijNglERtxvbP5wzmmL7Moj8J1HnVqXPdLWZW44YcQ8SeegJd0MQqaZrUkDDTTxVBh
	rDvM1PK13HIBx9+1S49hBQRS/V6f+JzchMov0MD0k67P58qJtitw3VnK6LX8vueMPwULpT4uIJGwR
	lJA0dWOw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x618N-00000005KuF-2RMs
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2dd4b3c752fso28580875ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370985; x=1789975785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=Jssms+F5q8oi5rGyClEj76JgNllhhtkif2DxxtgpSXR9Sy+YzjBcz/RSVCqsz54sbP
         Eecy7hBKT4ipcrelY6THxlpY9yikZf25XcXJdBrTHzP7rM+aakc/HGr7zTYAU8Noh8MD
         +Lhf8LeaxBtX6jYQv8qTGSHSRfSgMTsfO2K9mOyyhhXB5A9zELGkYOXb77/iXjLkAsIl
         TD0VEb3bsXSZxXnXvVbaSDYHZT8kNxTqEM6f/ngj6mvPtvTP407slWp0SDBSVGtxLd32
         YOle1nz75FSMIgBcPzVVHPmQz0TGYKVQTS9UzK6XkFxwkH2uOxHw7ohpZ4r8nxT7y+9y
         KN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370985; x=1789975785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLuGPJOul88SFkcVl5PHBDFHBc0tVdx0/BNU/eqBS78=;
        b=DdOiheK+ob1uR1/At0+iZR/mT7SzrRy2YAXk+9caShGdS1hjD0E0bH30NRWbz7Xeyt
         RdGRWWa5qfEsyhrYvnZGOWN+pmeYxt71OYdzsqHbsA4RTM6EA6BpPdru8E2M9ngpFsnC
         p0D962OdSdZ015lIzeeTLtX/xQ8EUVpQ3mT8NbyuJGBvcsSrTUDP/JJQS1TdE7cZXGde
         y4XdT410JW0Ghaiu/P+/uq/Qp/tT3K72TmrnnyeXajeH8QONB6HMmZKyBLTmBl8JknZn
         oADOK0JS/yM8vqMedmJ6I+4szDcMAQR0/gJDe5a97ycC0pMtn50Qr4CzIyAmIz1q863o
         tfow==
X-Forwarded-Encrypted: i=1; AKwUvBxCX3qnv/2KF491rREpRHCUXoH/Ae4wgPMVI7pdUOgUUYj9eqxE/TrTlKqW9ASOxk/eYMO0zKPHENbU0gfoVw==@lists.infradead.org
X-Gm-Message-State: AFuF++nnFgYcNSRTtMN2lcmbji3SGupyxLsooDzdJiakGNQLbupjrRxV
	xfasV0NhZb+1nW0cf5lwX86idqByZDy6mMd6vD0pqrYI4YCl+i8h0vBy
X-Gm-Gg: AYBFou2oebYjmAO4plP3VsyRCMq+kx5ef2YMPZKxefyw4FTqlyrg9u57M741O07HP8s
	O2MhnVpP0HNT9YKhUHSwVD5kI0Eq3uITGSr42vs9NATrBTHAw2atPh+ubTi/RZuDwfStDUFptXH
	sXfTPhcIbHzBqrqTXSr1rHiKxfrr1zc9mIbgemKXRVl5Ow8/VBUaeMHfuLmKOT7snBj7Xts4zEb
	o0O3DH45uUNyiIYaW/7MSicBGCOPQxBCZ/mJ/IF3lI29BeeYMV56NbASdmTPrQ1vg+8LhsiPVwz
	+uzc7r6yO874Tj1kgDValBkuiRrEYBmIfhf0a3LclZvFNUY7gEI0HWgbRhhwcdgnCFb/PESiYJJ
	YK5SwgkbW2fruNYTk2TdpnFeaCOPHuBDBcjLCbYNSqajN92Xyia3a26nHFu6QESoLZ6H6NQAYFl
	XruFqQoACCDEZ5d5NBnZEm6tv7M7dGSUh9u+ruYN7l5O1FhAiYO2V1k8PVqs0KXIsDq3mGbJImX
	NvTo1ronz5sqsecNaiisNXQTcXmBM7Uj61psRSNc3hrb++P21jBfkb07eZ3/rpTi3MOiXl89M/Z
	Fs1zqJqzroFhYfge3ncvQKuX7Q==
X-Received: by 2002:a17:90b:2809:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39debfa956bmr3527909a91.10.1789370985063;
        Mon, 14 Sep 2026 00:29:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:44 -0700 (PDT)
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
Subject: [PATCH v2 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Mon, 14 Sep 2026 14:28:40 +0700
Message-ID: <20260914072842.24420-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082947_923033_CAF960D2 
X-CRM114-Status: UNSURE (   9.91  )
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

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..2202fed63fc9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


