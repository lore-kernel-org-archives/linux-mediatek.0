Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70004C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXgqzLiXrvIaHuM1rt9FyNKWnryjml/ID0Eul+9i+Wo=; b=1Gzo9cTkfHlykoAn+AqyWqXc4q
	LiIcS/rDmpuT6OqSIftsG1x2NMbTCrmsrpZ1EDSFl+ZMLeYEreBvbjcM2AoEci1crYeZ1MzUcljHj
	ldF3LtY2DZyAHc5GLWP0F43LRqfIl5RqogWO0QeTz3YPpSrIT12jM7UrgwNVJ699aSSiihbLepq4L
	WrQc3NmxR0leUrTn+elluzzBxNaeYSyQaNVWtP8X4it3FIbOJ25VABkxRY2l3qkHmfA3htw3Bh7/c
	NbCYY8XS7T1N5jCzL5XtPSwUpZbBERxfVWiI37KQfxkMz2bEjR3XqoP1C81DxTxz+V67zbU84pD+C
	OljyeR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CZM-000PId-1W;
	Tue, 07 Nov 2023 03:16:00 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CZJ-000PIG-2J
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 03:15:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso4270711b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699326957; x=1699931757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXgqzLiXrvIaHuM1rt9FyNKWnryjml/ID0Eul+9i+Wo=;
        b=2/92X6ogOjE+YSWKTtl2h513ISysgrWmMM87jsci791DLbZytegTa5DDLU2ltW+4G6
         VVaQJiX5eQSqH8VSUbWNjdZX8OjwKIQdH8845nN3kSZEgkgZ4DZAgDrB3YIZIj8ntSKO
         6z0sl59mIIx+EgXohnB1rd3cshj0lQ/9h1bTEI2zsnFd/IdLn4jpKOvrs7HALJ7xUBJ6
         YwSTtHGDDBJ8wdmBrMd0irLuV0pmBlpUwub5DOQeDCnNvQJOwTjOHt2I0IdXV7S0TpOl
         u0ihIClNoZJbGAouy6XgjM4Xww9m2wHukbGyGvYzEn6MLOxMoXJn+SM63fc510D6I3r4
         aVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699326957; x=1699931757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXgqzLiXrvIaHuM1rt9FyNKWnryjml/ID0Eul+9i+Wo=;
        b=JiI1MBIZNuxSdsGv4v5tyJfXtjZzxAhGW6Mplvkdrb5tM6Kav+Tu3QBD60PvR0JBMo
         oKl1ONatlBflLIumjV+RdkrBHmVJ/HP4XX+Q9Px67a6A/oAuKqxBNmqfC35/Xvi3Xh6k
         qO9VMq20YPtSkieo3kNQutniF5I3KI6tbVzGVvtTJv41NHUQ+VOLwi32DBc6/nN6znGu
         DfOCr77TxqN2bwyaX+MBk6vu0CZwILM0rn70+sT7Q5Ztp4TEHw0H18VqGhuYr2FXde9R
         fZXPVjPrca6hGj7gr9xB5FoxUt9eEp9IBBm8yhYWzDHLtLmmSue9dFK7VhJVNilRQc9+
         HU1g==
X-Gm-Message-State: AOJu0YyJ4l4Y3r9dd+5Vo1V7GCN1Dvj7VtSOebLAQYdvxEOKrXmhBFtW
	2ly1sKh+YXJJHKDle6F+DYVVJw==
X-Google-Smtp-Source: AGHT+IEo7nU/DVUDeg9e9x0ikbysieK8MO7gaPBW/inkvx+TVX6zgih1HIifyR3sMMvxN1sEzi6JWg==
X-Received: by 2002:a05:6a20:a103:b0:16b:b900:2d6d with SMTP id q3-20020a056a20a10300b0016bb9002d6dmr28811185pzk.60.1699326956801;
        Mon, 06 Nov 2023 19:15:56 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c9bc811d4dsm6552282plb.295.2023.11.06.19.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 19:15:56 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v1 3/3] ASoC: mediatek: mt8188-mt6359: add two amps support
Date: Tue,  7 Nov 2023 11:14:42 +0800
Message-Id: <20231107031442.2768765-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_191557_778941_0E9F3D41 
X-CRM114-Status: GOOD (  11.33  )
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

Support codec rt5682 using two amps.

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e994faa3556b..917640939621 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


