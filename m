Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CC9C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpQjfps0S/oDfzZUpzNZH+5DOtw3L3usNnO58tODO8E=; b=1R/+L6lyo/QjUT4+mNSXSbrFyj
	GRAWZ9YoUG87RC0ZYWZWd8i8j24MGhUasA8saeqb9tpKDw0renW/GiKMfQdw3udtoh2l8Qx1XeDNR
	tE1s374Vx/7Vqp5YMp80xN2RB+lHMkmD5dQdoixX1eRYaP0u7LHsUgiWmhUoNzaYN5XDkbnEWUAap
	Pb0Ep8cRNqMlTo89p04X329YtskFbmnWtVRUgpJxHjGdcDfC+EBuO5NSW7ltybfLobDCuCpfbxbMm
	lCA8pEk2T3UdrmxQe+22mdQZ+TXk3r6HFvh5XPKjLMy2//bvSoimqg81jq0Bh23uzHOnUfpz1a/+R
	LEd1YWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqX-002l4v-2O;
	Thu, 16 Nov 2023 07:31:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqV-002l3i-0b
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 07:31:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ce28faa92dso4696755ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 23:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700119887; x=1700724687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpQjfps0S/oDfzZUpzNZH+5DOtw3L3usNnO58tODO8E=;
        b=mY2khTPMHYAQSmiD7LaEwtwryMC1ydEMHEsyy+wcI5NEClJDGkvM8zBvYJiLM9je/4
         qqGgmJKI5Ippgaz7PXIvawvUQPT87EBRdKa11Sl7KQ/4N/0ZpjTFj61LW+bS6kZs0z6t
         MZI3RMvGwbWP6BR+Pdfd3/PSV20vaaBhVSNHnubrmQYDwvrFjSovctDc9dC3iWPXIftm
         5+Pdb3w5a6ocD2iAOfI2LumdN9Q55lXxwZRNLSKQ/Y3allLwiZWOlwTWlSYx2Z/kB5s6
         fZJSBiAn63IMVvOYWFFPcl5b385s6a/d76EpeLOfFYzu3M3AgHVNXRZRBz9r3LzeDAD7
         8NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700119887; x=1700724687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpQjfps0S/oDfzZUpzNZH+5DOtw3L3usNnO58tODO8E=;
        b=g/KUQ6qlCmWuSivJGTyQTihzKE6TVvjI1yIYsibAp8ubMl6PlNH9Z643e/+4rsMw0Z
         ghH/QSQQY43BneSVBtNdzEE0q1N7IHXbSJFizZnCNof0xIA4A8TYykBns9b5RDcT6GPO
         NsIu0b7Ia/mp6ZXd/N4CJr+QrmTXzUqqD2dL7HeNrkpJQ/UBaqpmR1CnXUVya+PvGus1
         S+1353N98XEPqaZQr7Lp+nlDlFTmLnXoZKlNcjAOLIHoUAbRqQQnlY29XQIyvE6PnfMR
         XRM9gj9wQDct79xnWpFE3D2jf6is9rTjEFNY10bRC86OwN8uOSd14jmI2Jh5izqe1PQa
         nCBQ==
X-Gm-Message-State: AOJu0YykKTzhS123MgbKP8R10xGPfdF4e92iUKsKJcS/i+1dJjjMoU+T
	zun6eFxGamL8RuY4bWuaWTBNYw==
X-Google-Smtp-Source: AGHT+IHPhe7KnG9DTbzl7JTFAxePSMWgubqc4UWHLHMD5OJ3hDCqSczibaOlHCM3LpFIuSF0wvjHqw==
X-Received: by 2002:a17:902:9a8a:b0:1cc:3fce:8aa8 with SMTP id w10-20020a1709029a8a00b001cc3fce8aa8mr7919325plp.6.1700119886576;
        Wed, 15 Nov 2023 23:31:26 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db8600b001c0a414695bsm8496706pld.43.2023.11.15.23.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:31:26 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v6 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Thu, 16 Nov 2023 15:31:06 +0800
Message-Id: <20231116073106.3757618-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_233127_222567_14D726EA 
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

Enable support for dual MAX98390 amplifiers on the mt8188-rt5682s board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index b40b020695a9..e6cb1bdb9a4b 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1442,7 +1442,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


