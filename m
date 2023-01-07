Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09C9C54EBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Jan 2023 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iWqmgQf0ITiBcZh6JNhizBnvL7irlNgfSV2PoqtxyOw=; b=fndI2DAYIRRVxXOL5dG+NChkG9
	wi1+80b4nzPvkS9AbZvk2phnJrA+JXc7PfwMnb5W+zHXkGU6lZxfIEPSR7MbIdsHmyWQ3V2GAf/gL
	CVUuE7EUxUYD/p/xTTo+SSbqKN4mxpe1kqlF8JRW0Aa2SruEOptN5YdDud1ou3BfcpJnpN8wkFfPN
	JR5KO5YR1opkUAwTADyIWNZmrNDxuYMWXb2N8zR0GryYvl/TPC7QPTmqgFZ/wJfLbk6ZlGLE8Pjw9
	zXMWL7p0xJnOAtJUyERvsTa9pU4MbkOBRh+Ih5WpElATy/UMb9TzWKFcJloVlufvpzP1uIegToI0Z
	78/gkpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEDTt-007tVz-Fo; Sat, 07 Jan 2023 17:59:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEDTr-007tUv-82
	for linux-mediatek@lists.infradead.org; Sat, 07 Jan 2023 17:59:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id b2so5065376pld.7
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Jan 2023 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWqmgQf0ITiBcZh6JNhizBnvL7irlNgfSV2PoqtxyOw=;
        b=wMIOyxfyvHuC8e5Aj6CB86Nw70h9LBzXvBV1QA9bp/cj6fSM7QyfknVz52mhPEPidk
         a1zsQzUy5Qq7BA4Ks65U5UYG+sp3s+EBb25I2XDJ2dcahqqjpM60S5LbDLZfRpx2MeFU
         W7nfaCWOroj4S4MucO++lqXNHZVD+7BdFUnEzq659JgK4gdHmWhnogPQqXUkmUxBgp5a
         Ua/h1lO+/UUDk4aU/llV3Dk9KtpcdmChz7iAN5oZkUagA7INeCQhFf3pz9/QqMnZ5Gww
         FlwN4i2TSMyEqfdVC6acojXTwY3qO43cpWjfuEQnQa2sYVZKFU4f/Vp8pm576XC0SbMc
         5nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWqmgQf0ITiBcZh6JNhizBnvL7irlNgfSV2PoqtxyOw=;
        b=Kuw3zftAs0MIJogZyAz9N2TlXHDWNFjdNVfubmtOASGpFR5JmeblBxiHCpZTdNaWbC
         n2mYqey9OcjknSyOFMShN7EMnTXkmzKjhwxFNEZhBrNfmXwllU7EAmMA77yLwDmMwqpS
         RN830lE0uXGSFrR+L4qmu27tZfk0hqEFdHmHkfjCTGo3NCDih2ihSzZ4Fiqx0Wt6tEsb
         /iLx/8bMDDs4LWEbg4aHzhafxUQ2kLpZrYD50S/5mj3IHkBGkZyUGIuV0deHvvCXaR/G
         eW0LxlI3IEhMFlUD50bKXB6yUtlb0vU8HyCAnVgqbMiC+z99vRHuft0hfXQ5Q+JFYnSc
         DIXg==
X-Gm-Message-State: AFqh2kp5VuXOzmqv9o7dJ/TsH650E8gM+7uy6LBQctHMQweCGSAaOaUq
	iZxt6efaXkBqFfDOQqwjGr+9Sw==
X-Google-Smtp-Source: AMrXdXtVpHJdVOh4RfHSJOx0P/jtbPc2ZkMWo8tGt2ZaF7BG1czvecWZCiKuu3acIhIcAZwpeKeMbg==
X-Received: by 2002:a05:6a20:1a84:b0:a7:89fd:884c with SMTP id ci4-20020a056a201a8400b000a789fd884cmr66257655pzb.11.1673114380551;
        Sat, 07 Jan 2023 09:59:40 -0800 (PST)
Received: from localhost.localdomain (36-226-16-237.dynamic-ip.hinet.net. [36.226.16.237])
        by smtp.gmail.com with ESMTPSA id g84-20020a625257000000b00580978caca7sm3102886pfb.45.2023.01.07.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 09:59:39 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	tongjian <tongjian@huaqin.corp-partner.google.com>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v1] ASoC: mediatek: mt8186-rt5682: primary_codec_init() warn: missing error code? 'ret'
Date: Sun,  8 Jan 2023 01:59:33 +0800
Message-Id: <20230107175933.12973-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_095943_523371_F5F2A7C2 
X-CRM114-Status: GOOD (  11.63  )
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

The function primary_codec_init() should return 0 if dmic_sel is null.

Here is the warning message reported by 0-DAY CI Kernel Test Service.

smatch warnings:
primary_codec_init() warn: missing error code? 'ret'
...
2022-11-02  141       if (!priv->dmic_sel) {
2022-11-02  142               dev_info(card->dev, "dmic_sel is null\n");
2022-11-02 @143               return ret;

return -EIVNAL;?  return 0;?

2022-11-02  144       }

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

---
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index af44e331dae8..b333950aa3c3 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -140,7 +140,7 @@ static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 	if (!priv->dmic_sel) {
 		dev_info(card->dev, "dmic_sel is null\n");
-		return ret;
+		return 0;
 	}
 
 	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
-- 
2.25.1


