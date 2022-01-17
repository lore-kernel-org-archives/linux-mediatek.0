Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cz86229kpxjimBlkSRv07hEbPwUvMedMouQ5kP05hHc=; b=iOS81XRpy9PoPM
	5Qj1N1dSkLioU3flUEZfEC13cVsSqwtT9uB0zF+f0qgLhdVc5sVMAcWPcc5T3/l/9DXLChtpsTA7H
	9gXb2lCJVfY2BtwUdza/YvSlqywcJJ7n/19YOmDC2Mor5StdLwodU3Gnpli9mAkku7Ovavla8YI0B
	tvNiaERJGY4QoImWe/3eFzVaaMYbE0ZH8xtID4O2Q0cdFPaabAJHiVsdzyraaB54M+R5n9AGJ2Lpx
	fmQpxhhQpoY4DjbibtQ5Uogdv8bdbcbj4pn+bJavMK3wMKsqE5C6Y+Z7OScSr2vb5mptm/OzJa3CH
	0O76ogsMwENc9UjTZHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VV0-00Fkli-0a; Mon, 17 Jan 2022 17:08:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VPI-00FhNM-8b; Mon, 17 Jan 2022 17:03:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EBE3611E0;
 Mon, 17 Jan 2022 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7E6C36AF2;
 Mon, 17 Jan 2022 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438979;
 bh=vqm+l+et8fHmf+ZDrFYxAyjLbW9sX4AdX0B4LSjo1aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BgvvEl/SJ7qAVQQNbiah6dLtl3gBWqsbBgWd3eXW4tvY4dUcd6aQNKHuySqmb9qpz
 BCopNtxgTgsSScBlg/3hX2GLGb8XmbQdUJP/t1dWPyf5Sn9UEn7mArVOtomnu6y6Ak
 UoVssy9HB6rxfb6LqgarfPBF2es7+vUy/jP1SpjIL/X6TxxsOT6iAR+U8W8bgPVZJP
 zJzIK7zKIkA5KhV72b6zODyHZxizzbL7DuJVRqVplj9DoLBsht1+r6dacFo9Nw8r8Y
 rEC9CdvuyMJo8dR+uK65zuXE0f2EuJ27uXxwNs9XULhD50IaZjPul3YzZQW8UIeqJJ
 IKGHYZ+5ReCXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 37/44] ASoC: mediatek: mt8192-mt6359: fix
 device_node leak
Date: Mon, 17 Jan 2022 12:01:20 -0500
Message-Id: <20220117170127.1471115-37-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090300_377371_7AEB9DD1 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit 4e28491a7a198c668437f2be8a91a76aa52f20eb ]

The of_parse_phandle() document:
    >>> Use of_node_put() on it when done.

The driver didn't call of_node_put().  Fixes the leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20211214040028.2992627-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133951b70..24a5d0adec1ba 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1172,7 +1172,11 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
