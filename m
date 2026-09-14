Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E950DC88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=; b=LX+lj8ePDc9qTZGn8E5X+5yJ7o
	bx3zLrseGmwcy5N6oLDkbFC5jMQQTqQzSMnrS75dDixY/aeSYw6V0BPdeVLF6WowDOg8Nc5OSAmfm
	guNaxJESvQ82TvR50Ms8gkmkMpBOv5fAWhTEL+EVs3E5iWtZvJhYIg6lvvLG0PJCc8BfdwxbsJVdU
	dOIQ31syE/DpbQpW2oBOZpG7d8nncfPFLbV4m+FyKMsg5BOYJuHklOdaxw9N4lT8RvZXpm5dpjlJ4
	b+t/vuAXATjGYLT/vnPNNRExGdmOxLPvJMGRwO6gHHRnmgN9Hx4dK2EaGA4LeERyczdQSmM3l6usi
	uHBj54nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618f-00000002ZDi-3HZS;
	Mon, 14 Sep 2026 07:30:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618V-00000002Z03-2QXG
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:57 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3235726a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370995; x=1789975795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=Oxh5KtI15mHLfutWk+oNPhcTTufJHvtesnDO0zlXC1rKbCwg0EkOd4sxafniP7o+0+
         UWjjIgDVJyq7N6nke2PMlsbOPPatRhA7sQFreXyQOoEFBii0ca38IL0wRxweSD5XuWNm
         +0PT/0vZA7gi1Ragzm5qm1vCSuEmyy+Am51/ISbnFAjHzca5mllBy3lSgm3hm7Pdrn52
         unXrw612vEHUFbUc8Fxjole1UrGBlCDWZtR/07Qk3UHfHWFg1gv0DT+zWGeYpN31cFUd
         f4jCNG5sXSSMg1E1YHFypCy4T185Ed/HAtQMZeqKVND4Ip/2Xo2FkPQRkFYEtogaCWze
         bb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370995; x=1789975795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=SPOyygTgN0sxMSC3RR7QMO2X9plwNxVmBEjlZkqmlq+L4CPC7X8xi0Rsb1TZ1KNbmx
         fij0HB7F6ZL5qYMoAgpD52WJck/cF7eMnj8o8ffz40OYiDYxYNb4IgoZlRM0JdVgaHe5
         NT8I8aghj5+hVz4c4muE5YswhckRPVKnn/XVvqCKmBXzcnIp17dg+qfpbJ+w0P6awBlG
         oqtzEDxgUnfJMEUP/u1n1NG2SYCl7dlMoc38eDlri4Si5KI78JemleBD15rPEtYviKhO
         95mlvYGdD0R8BNJTdN1IybGKin/AGgCf6H5RW3U7W+WJg7JALY5b11YUp/VWSIQdQc37
         vS3g==
X-Forwarded-Encrypted: i=1; AKwUvBwfuGfoOOF9K4YoobN/0i0bKII6MpTEj42gUmGZKmBsS5DGCHQY06ODb4NGh6rHHb5Tv3ZDhIDF9GEgk2mUYw==@lists.infradead.org
X-Gm-Message-State: AFuF++lqSHXX75HiVlGfoFtHZVVCtTiljRbh0Wc56KSgl22nOBGRCsRG
	Bilr8gYSPu8nFITLCFaWhPYR57sUCtu9JexeQ+moD8y9ANJyAiyM3pXR
X-Gm-Gg: AYBFou1+eonj6AumokL5nzXh7DhAOw5Tkm+4Y9R9V999lIGWHm4FzkT0fnT0Gvg1TYg
	fcqXeqGeKfbEigYzs54a58x59pXu17Q2OMq3jS8c+KA29nFroh+JvWhY7yLANpN+4LYMM3V6FOa
	oBjzQlNLt3O0iMDOhpNCeTQibuVfFIOXp6LF7TEEUVHS9rT8sffbdjaKkAI6utKCzl4hYrf/TQA
	5fUOTTG3GbocAkupnSihlqxZG9Kc335C2JOePTrfalSQTKZtmOZh7gSIvAtqy7zMNVDJ0SR8MlG
	l0JbqG56nZEKubzcIZeLYuxWZVydU5lgJfiXATNLaauR1iBbAg4hgA2TpZSLhORYastQxc5Eh1X
	C4M6USNSVivKcWz+WjM4jDrdUKTY2AGOjsVg50STHc6HGHJKtntf0GxzIk8P5F5oVXmC1RvWfzS
	tkjPgqCt9KdAocJ8Mjw9guBO2DeDx9Gt7n/oqxKlaSq5j1yCU0SaOt1H/FNBZMbLu+uOyq+QINX
	iyEf0S4BhDa8uxX6Tfs22nen+ECQlB38/ILu60K3OwO2kmBagT4Lo6Ap8TrglrZsKytauN15n8n
	63pgWxP6XfZVaosqFahbRBzGHQ==
X-Received: by 2002:a17:90b:3884:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39debf6ce65mr3151063a91.2.1789370994682;
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
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
Subject: [PATCH v2 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Mon, 14 Sep 2026 14:28:42 +0700
Message-ID: <20260914072842.24420-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002955_636575_4E383054 
X-CRM114-Status: UNSURE (   9.35  )
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0


