Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E059C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SiLJUSDJPEiwUcRyYgG9IhzIobpNTw6nwSCUfBk4uA=; b=kO4BBUitKsgCw9WhZQsimzaga6
	Pl3aad0QDOg6GNRhoE6lk86k8mr0C2A2Fi4kFViEN8QgFiXlM58QIS3/7+uvGs3tvZ0OIA2Zg5jPn
	ErSceiKGiANyK5DiNObOFH5XbS+qqmcPWFBYbQkdhwZR8rPTV3ePySD53kvw76BDDcb8Xg9r3blcf
	/kj7D7rR7D5O73R54jEd5gnawoKt9ATGUwcfQsZFdPpsvLxSOd7z0ATniS2NpRl2R2+ds2xcKl9cu
	4k9iTGwdd2Suv3mFbMVqB0jCil7Nd/dxvWthTUv3ogPRKssmETKQNh3C7Xp93DN5GOUCl/b1eoryO
	d39GA3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XL6-002lJB-1u;
	Wed, 08 Nov 2023 01:26:40 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XL4-002lI7-05
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 01:26:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6ce291b5df9so3957334a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 17:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699406797; x=1700011597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SiLJUSDJPEiwUcRyYgG9IhzIobpNTw6nwSCUfBk4uA=;
        b=ez6ZmeIuoDu74l78uTnQyxW6WgGweazQpmJPPL+OeghwLpNDPN9MdTuna/vi1P2EC6
         siJ6PZpGNPyPCrLS7qGlmtTVrAsZtynFdKAHtfle7R5xuaKarfy05XSumWzz6midDQVX
         AYn9pM0rGvVvO1feLsDrXIlp6SjYBAiGOjPU80YWQ3+V0KL2wjbsoL8G8ly1KpL2zy5/
         gUaHp26VkycNLSZIYKiTwQ9wo5EAjeZc0r5d0f5jUd1xqfvIBz8SWr1dJqZP946Hc5hP
         x5aEJ7li/rndcXdHd/D3uavOAgnHSs7tFjWP70PFwdncVMC3APXy+zUakstSVwiYgML0
         Gqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699406797; x=1700011597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SiLJUSDJPEiwUcRyYgG9IhzIobpNTw6nwSCUfBk4uA=;
        b=kT1UsbO4xp9nvxXg7AjrHfVG7HTo1WmorXtz2+TAV1q56V2AQwdjUgKlgmKM8ucfAl
         AEputd3DVM/59J32Ss2EfvoY0Kmffab6XbfFzO1+UrqhLGPKDbfH7hVYkRN4CZI+eRkp
         cUzAO6EGt/y4PgDJVAiWkTf+GLsnRve6hjOLqXqTMZdQw0Dx0lzwWoo1XQcn/vX7tkJV
         ero0rav1LLWSwavYYzd3qmEFgCG/vHv1Y/XvagNo7wWVORfWRyckSTWs47ggwMYVdILq
         ovFWWjUzXpBNM8qDhEsgUeLmL/Lnh0yDNzuYGLAdqZ36KkBGsNPeirJ2GZ27dTY12kFV
         tmBw==
X-Gm-Message-State: AOJu0Yyt1TZul0ILn10j6OkxkLRNnOPucF3Z5frA98ivWGen5JOPsHK8
	sg75jsGk3hQCJ3L2xlbSKCSf+g==
X-Google-Smtp-Source: AGHT+IG1TxlhL3TtLFaeQZBn42HOgBQwc1TatXKxW0BgjspTjLVIuoBs4Ry4AXaVGHML15Q30DBlJg==
X-Received: by 2002:a05:6830:3d02:b0:6bf:1e78:cc52 with SMTP id eu2-20020a0568303d0200b006bf1e78cc52mr575386otb.25.1699406796902;
        Tue, 07 Nov 2023 17:26:36 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id h7-20020a62b407000000b0069323619f69sm7966778pfn.143.2023.11.07.17.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 17:26:36 -0800 (PST)
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
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Limit RT5682s to only supports dual channels
Date: Wed,  8 Nov 2023 09:26:17 +0800
Message-Id: <20231108012617.3973539-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
References: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_172638_075133_A365E0D5 
X-CRM114-Status: GOOD (  11.81  )
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

Limit RT5682s to only support dual channels, not four channels.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


