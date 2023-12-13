Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618BDC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=; b=iJeCnSLw28TRTuoHxkEhlEEkrI
	Q7d/lukYNTifEnLOR7ots8NGK3xt7Fdt0CfQ943YhVZ/DsyftFjUYTGZt5qiYnKEF5WeVuCaId0CD
	vKERqdb+DCwo/0diaE/jX/uKfugl1F4LLyCfgts/zb/FczY7+E49ZuIAO18NPbMLHEDsd5IN5aeKC
	YQdjVNjJB3tzrU8Ft/AOzoIiswjYTBDd9ArMud0uegdn4i+AVl4EpZbzapFejZfTRSvldngNOT+VU
	EftKPoF14ZssR+cjWO/Uj00LsnhrKFhWHvsIJ//NPBBmHyHlfbPzqMlGeuxjrtx1o2/oaDmyoHs7O
	IpqzhTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNb4-00EV6H-0g;
	Wed, 13 Dec 2023 11:40:14 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNb0-00EV3d-2t
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 11:40:12 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35d4e557c4bso30089995ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 03:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467607; x=1703072407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=EZPVXEtVjESI1wkgaJHWSTvoX3DrLMfXtx1rhK+3CMs9WAoD0hYFPky9OnvWeXnIeA
         or4PtWPFPLRSk8W5O0eOCMhFGQo/sRDTznqVgHAY9V/48NVCGigg9PyHbBjiAfZ5QezH
         L3YLzBOrT41ZsD+fBnLKHbOiz96Yim5GmWLyZ4od29gYNAR0X2nnhcXQiXrJaa97duPu
         rVtWuYpvASlm0ASEmmkYiU4+nJcY0IvbxqsL19aS3L7LzHdF4Tg2gHB+IQjeDwcIk23q
         gaL15OhLmXn6KlF/e61HrPXtqN8ychzo9x49+HNBbWsHQ94zVTxBl26Pwqu7hK1p67M9
         3Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467607; x=1703072407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=vje1eHjOI7i2lqilpa6ubkgrG6Rm4eguDC/7ZrPuYXs7ZPuNPDVvscNh7nTwjglTfQ
         uBRYM/4NQN8PvGqKVLERmqeLvsJPsMH9nHhF2iFNxPAh9kOl++YlQ427FcUUBgagcTI0
         /jGjYrc7cis5hX/Pm1l+3vkKm/bbaRmewNCHE2rtjAsm+/tjoZlmfWG15a7WCQbqcpNy
         Pp1g6Rd+MW4PLq14zc3UnlHaMqIASZ5wU+8rym3415hicTtfccpmlrTS1dw/a9cBaibt
         C7KdvH1ql41rk51zDjOQ+Od2pbGdHJpITGscc2JuTNa/aWSAqALaTzI5u0o2e8yZtGkj
         UBOw==
X-Gm-Message-State: AOJu0Yz5rPBj0kPb5upM/np/y6cAq0tzqTRc6NeoPkhBBFXwdGf/VRDg
	wS20kZwnZXhzvFhUjtESKDudqw==
X-Google-Smtp-Source: AGHT+IGGyRqBeTDdNQ7HGycNQHOaojx3Dzjx01n/acJiFtPQlEWht8+O+/tfXna6+MHjMz8iHq9CZQ==
X-Received: by 2002:a92:d150:0:b0:35d:6220:ac8b with SMTP id t16-20020a92d150000000b0035d6220ac8bmr8780918ilg.58.1702467607093;
        Wed, 13 Dec 2023 03:40:07 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:06 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND PATCH v9 1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Wed, 13 Dec 2023 19:39:52 +0800
Message-Id: <20231213113955.47668-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
References: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_034010_955464_847F6847 
X-CRM114-Status: UNSURE (   7.50  )
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

Add compatible string "mediatek,mt8188-es8326" to support new board
with es8326 codec.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..f94ad0715e32 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-es8326
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
-- 
2.25.1


