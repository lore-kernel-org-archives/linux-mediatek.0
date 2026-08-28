Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CDC61DBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=; b=eL4ghPbLzfuuiF41+6k06NzZHY
	Wv/TK7hGmitzusCZPrv+zWQJVKDUL8FA1LXy+XMIYuB0jZ6hiMMDzz1p9Y9C4g40e9GhPWiyxI+9k
	4NqDJyYd6dMP5110JfyAgvajXEQdahzqzgTCe9TX91gRYoSuVq5OgK1FsIKh+X3juA72Oks0nhjet
	YKt9P8PFQLLoOf/gYztHicY0RLvamG/Oaym6jWdoWWIkMcBQe82wElSSjkSXiEg/5gwWWLwkIY9VW
	DRrgfSr5ssQQKIbRa4c49/Xw0FZQOg6bkwd0bVfgyLS4dyXEmqEV63pQo7ws1FdDPxRc+CwOpbWG6
	z5eUoHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzon7-0000000580y-3aUt;
	Fri, 28 Aug 2026 05:06:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzon2-000000057wK-0wU7
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso4386385ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893567; x=1788498367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=Irw7bDMPCtb6uaudl6UcsAd9/DJgI6f1ZCzGdPXrvpC71fprhxFfUUIMk967ugMZ6a
         PDBk91sow3pa3FpcWYKZwFCeRLoeSw7gW0H0fNoLqPjIQf13jS4IfMDXC5ke93Uufeyz
         VtIxK1/avy5YltDDBf+dEWezJKxALwjQvT2FUeCU657nKqjlrne89/Ej8NHhprbjS2+b
         Sb1LJ5ayPmgNAD0kJNGwBx2js7ynVeqxDBkwMIv5I7jjCMv0i7NRAVqvP6lGTf4XH2co
         vY98oM59sqpSeqneAFIi2WZ3OoV4c3ztTSoq7YZ8/aZJroO105Mx+Flf+lTtoHnS5L7b
         30pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893567; x=1788498367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=QI6oBLEt81THlmhagmOO7vWooRpHwXwja40zPsieN1cqV3tKNSd9hJ4s3BocsE4AEy
         yJ0vbScICjkbVJsFPT8IHHBi1PLol0pujm43x129uyl7OwwcgEYUl9CbZuboHmlssvXv
         C/0OLEsiuO7/yo7mOFcj58VC5voQ3f+Y1mLkYCgMrNGOdJ+2eAN90Pd3kQlfJnnBT6Oo
         Dyk6Xyvsz4c/18noZI/lrm6fO+PbffwXlb9jW2qloIlQnIDqfZQ9Wr4YhyNen2d0gkrq
         YnMhhywhiyef+qyczHPuMUUlg2iXCz4IEROvmhBzRxZByB+Qgir2c/jSBcBVlnBB3g+M
         hrLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbKpuPoyQrPxpqANMk0mJvvxQNld16YmSEOhY4nw/LIUkfYhcuKq008xx3UBdrYvO+0jSAF26hJLi+rIyDTw==@lists.infradead.org
X-Gm-Message-State: AFuF++lCz6IP7pFwJmVDlrYazbhdhqzjQuZR+A9cU4Hu8BJ8Ko1Lum3s
	QDSzSfYRn3ZgjFKWxlo+p/4opWtx214ekeX/cHzZ3I+eJ3Z7ZCAQgyLY
X-Gm-Gg: AR+sD12Aqop8nW+nNqTAwQ30B0qHGks9WeF38Ti9yRVDwb5F5SDU7CmdnOzrv9okRKp
	WfgKKtxTkh51TI69Br/hVHMiHgz322VBMvMyYYYmKIuuMy1rGbO2dgnj74Jh15iCKjHz5EiFlbJ
	HMlimZeDelyW6qOL0WIGQIQO4ctMxZtl6DfHmpd+mikoJ34kmnTuCQsdRK6gyZ8XOpekJxQwdCr
	0Fb0AqFm6zU/cjxJ/EJ1rHP0xshWmpVA/Ngft6uWck5WZkH2G9xFk3Rk/JFbh91Ejeo1FQOhPcR
	lqs4d5jN1w45KmHdFu2dixEHEGx4dAbhFZldFMd6LKgpw2D/v7f0JnIt18dWuOpYV7im/PeTNmH
	4ghjCLccAHV91S+3Dbewtv+JWHgFAxoJNqBEEZ5y0YjEA/Y9eUub1u3ZzF9p44N+LuVMECxJAM5
	xElHqWUV2QqsTdu55dPkHQ06mBed8pyHYDlpBLR6J4rwZAv82+ddgCEfVJ//B9NTh5QeudxEfWb
	lQE1nzvd+d4oWA8ztVukx7ti5IVZS2fB+ipStRD0TsCt24qyXJvQq/uPOt/c64Ca3Tw7ersx4Qr
	JUPxyA==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr8743391a91.14.1787893567319;
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 28 Aug 2026 12:05:25 +0700
Message-ID: <20260828050526.590761-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220609_717396_9E17EDD8 
X-CRM114-Status: GOOD (  10.60  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 43d5898357dd..c67424bed329 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


