Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C541C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cz86229kpxjimBlkSRv07hEbPwUvMedMouQ5kP05hHc=; b=onvVSImyXO7Wca
	PbyQP3LWt6+MSKR8pdjg0bjLT98UrvIE8Uhr6iPi90kcEldeCVHJSf38XHWv6HkpLivhuHqkVi3Zr
	bxjyVs7rg0wKMoDVv3DWrT1mkT3fwoLv1hU9Ij1KryeKY5H5JKGO7eVGsQKl8X/2/8F9q3rmM2phd
	s2KODoCq1mXGfDTF+ALNXVuNqvmczJwIBeno+RWBmjtbMEOTelYqLwq+bOx8jNWmmJFtcfndcVhxI
	V5cRVCZjzUeBbH7hxKHV5YW0GaUpkLyu9DtkBndIbElGvtQf2lvEUgFj7ttWFH2O+bP/uVSuxy6zg
	XcRgW09BBcLmt9eyqrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VNf-00FgGE-LZ; Mon, 17 Jan 2022 17:01:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VND-00Ffx4-AG; Mon, 17 Jan 2022 17:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06429B81142;
 Mon, 17 Jan 2022 17:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0D1C36AE3;
 Mon, 17 Jan 2022 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438848;
 bh=vqm+l+et8fHmf+ZDrFYxAyjLbW9sX4AdX0B4LSjo1aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p1E3b/3atEdyXJfPNyWoAjkL1drHzsh96miZe0YqvLW1Doe2SfoCrWh3h+YsxVFkC
 3MryI3OHEV4634h0UmyzJDUpLPbMauAUmLsQMPGiejpVlxOma1/B7G66zhHEozNhHq
 8wMjcKxiig4Kdb5VW1Z/cM8zv/glXXLeu4G3WN4aCRh09myy7XFqU2apV4ksCP4kny
 01OUGsZBBnqB8Qqg4nneAuzcVEiTkGd683Z647N1qM0MhDb+qQcvZhj2nMXzlovVDR
 RAjcBqhakjBuujX7J+KAjzrQAEOiUUsagHqxkbIqZoO8Fhc9XkgLCBneyaHeNK2/Nv
 H8YdDjS3FoWgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 43/52] ASoC: mediatek: mt8192-mt6359: fix
 device_node leak
Date: Mon, 17 Jan 2022 11:58:44 -0500
Message-Id: <20220117165853.1470420-43-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090051_526466_CC055A86 
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
