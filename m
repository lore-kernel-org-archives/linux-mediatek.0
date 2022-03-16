Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB1BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+nnNUDnBrNtg34Flia7bfuVfMZKHz4QmpflQe5/zdwI=; b=R7zIlnGDlpN0Gk
	qXEKHAfYNinTW5rt7yMmyszlACk+sHpIf7kb88hVOHF06fcerCMm3G5tUEW7HOzi63AjEO16QaHbW
	4IZh28VfjGUFsy2WnN/xRZN0XM62B6iBnoALth37WVzSCWmC+8wf6ADjSlTzM9jRn8wD7PmwPYq79
	FfgLUgiyodpL+xbUxe7EGkNdHuYJb9Ad3oXoLCY9NZEY8YipC1TWd+mZyutpMvv1PI8tGNcwDIYXH
	3OmLtWF3lM+XmnKoZ0MIXkGSGh1b+Ntmyh3S6gfe7lmQ+tFMcEDHG3lIXCPtVyjmBYSIsgenODCDw
	nhpUqtLBwsXjPVPm1JlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUPJ7-00CCiE-2D; Wed, 16 Mar 2022 08:47:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUPIe-00CCa8-Gy; Wed, 16 Mar 2022 08:46:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id t2so3068038pfj.10;
 Wed, 16 Mar 2022 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=o2a1XLIA6SCc0OXj4X5fM3NulfHLBIGjv/KhHaIx6PQ=;
 b=GNDL68UBBmY9vm3mPI6hh9CD2lRNaMjHpLpzwJYp4vN18zMrNfL27bTXmeAheLjH7Z
 ecZl5cZJ34sM/UeT0NIJxgjzQOAw/qlejEiRiv1+pBxV9tsO461LciCvRpMAE2cgajjU
 z830dTGPQ+ZAvvyzvy1Pc6UbLiLN4rDNupCRklX8g1Y4zE/SKTxak6T8hbT/v4ZMp5+G
 7C56/ec+oJnQXcXHzmPbWmj0/RrwPCU9g+oQa37G6Uc0V7OIwplZH4PiV5Amn5HO9P+F
 qKbi3nrAxG9LnsTuVdfE069vEEzlbTr+1ysYmMF0qoA+svztQ6fDMkHJcE4m6sXMmDEc
 fueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=o2a1XLIA6SCc0OXj4X5fM3NulfHLBIGjv/KhHaIx6PQ=;
 b=0oiC59XDENS+fCQxiNwHTrfsD7bRZ/OdZ47ail6HMKMqmjbyeTJEVGmfwAT8pK0ES7
 TkUugY6fFzMTkwPxMlxG69+qnC7N1HPnR364ErfRryygJ0RYitSgQADuJbafDu8+FNVD
 7OFm0fI0mVAXBYmIgF6PJ+CVTErZGfcbA65InpudL53XVGOOCtXHn0t6Xe74xWNdqtJz
 bOs0TaV1fIhcLJkf7fc3NgPhGKpwztH2J6vYeAiCAf24f8MpYvQVSCO5H2SFMF5uptFQ
 qYJEN1TL72Lvye5MQAslOm/kGZZ0gtzO0HdSrLub+wejNbPZAcX6TIzQupBDx+VVh8gH
 SThA==
X-Gm-Message-State: AOAM532tXJKvpnnUn/oR2vuyGYs0Sv+ETDMMJPnWTdlSXC4HhG9WxQvM
 EySmr3Z9OhhuaHE5TY5+xbY=
X-Google-Smtp-Source: ABdhPJwcB/cDd4LmceuZ9xTWzG6XnUJNJeFpS8VorH67V1q4Tm8M7vPqz5CjVnvFBNjLjZwice/4BA==
X-Received: by 2002:a63:5751:0:b0:381:4050:143a with SMTP id
 h17-20020a635751000000b003814050143amr10698013pgm.410.1647420391500; 
 Wed, 16 Mar 2022 01:46:31 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm2055283pfu.120.2022.03.16.01.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:46:31 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 YC Hung <yc.hung@mediatek.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, Bixuan Cui <cuibixuan@huawei.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195: Fix error handling in
 mt8195_mt6359_rt1019_rt5682_dev_probe
Date: Wed, 16 Mar 2022 08:46:15 +0000
Message-Id: <20220316084623.24238-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_014632_607531_F6BC7633 
X-CRM114-Status: GOOD (  13.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error path.

Fixes: 082482a50227 ("ASoC: mediatek: mt8195: release device_node after snd_soc_register_card")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 29c2d3407cc7..e3146311722f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1342,7 +1342,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 					      "mediatek,dai-link");
 		if (ret) {
 			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto put_node;
 		}
 	} else {
 		if (!sof_on)
@@ -1398,6 +1399,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_node:
 	of_node_put(platform_node);
 	of_node_put(adsp_node);
 	of_node_put(dp_node);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
