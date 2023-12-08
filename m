Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC95BC46CA3
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=; b=kKzeIH8EeZyTqGl+gkExGpTRpc
	SbRTc5Mw2eHbKK25m4kI3ArarCZXimWJBfTMrkrSbkhHsmWITu+vqcTtrmqz4H9Q7u2O+KYX4gBpJ
	5DijgMgwdmcfAxQ4No6lO89TaRvkxm/e8KilPZs1h++o2jqXGEJH/m1k/y+yzQKVpLDMfXRLK2JgL
	6SWyrXZ+5Jnj3QQgHyhFQFsU7lQkFul8BCziulx/Px0y2x8Pxh7MY6KTvPMyb7GKRQhFMi1DhcYMV
	0gYCUBF89/m8WlBVY5nXZTu+s2jqeTR3drpt/xbC4YPuKfT95mmlcEwZi+soaClnuEArKlbjX+TlS
	0LGzWpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzc-00Eveo-2H;
	Fri, 08 Dec 2023 07:09:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUza-00EveH-0J
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 07:09:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so1285288b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 23:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702019384; x=1702624184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=D1VbP7FwRyWUnfBr9YUFs3QiKlHa+vJpqE23lXu6RIRpbWZye465sVCDXZAp3vr3eM
         QWYqGMGdRJNiVOsTUER7SFHTFDIn+2rfTscZiQwlqzbq90hkF6qbtZIRvAY+nXzEPjDF
         ibNh++3Ij9PkZ1xqHrJuOPK1HY+ZnuHVyaFZuSGd4iBhcawnLPgkdWOSeLvnq/+bc5uQ
         xJRHfgBsagS7c5ZJ9WmHhobHLNj2H/tMVYOecXk+G0nQEpeaVPprHErMP3LvPDyekiBV
         PNyP1eCHf76GCe34FnBmxpZS/y6KFLB07Nf3BE+9z2SvhAI1Uiv26qp9E/m5xa2SEBNu
         9DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019384; x=1702624184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=nzMpK60QnzisHwj4Dtjj3Ef7dRc0CIiD9PjS8xlfKGv1EpjyiReEDH5oYr9/41qEWx
         UNU+ms1EaMWxHfb2OsE+vtMl81cDLR9xvw6yVfMnDW5MXLy7qGG53dL1beps+AyEF964
         LvdT94hAJ/sHdguUoti+a5BcwBDU50lcsXCdVyMKy+0Ibd3MQuLPPes4jHSFaizrDmeA
         H9BWJn1/gDjds00EoRP6hNeTZaD8ef2mPXBtge/nTXhl+67z/SeN9z0cBmti32d3Tdwu
         iFeHiLoCgesoSPY8JO6tmPAdPcQxIiFKtfjV0+ooCHDC9YzJTWvfDZgc3gJvh2WGFcAG
         iSxA==
X-Gm-Message-State: AOJu0YxdYzl/e2+q1dR9UAgMbhoe1xSVprdIu7VZXuFxdAC/BXfqYhx4
	TWG1V3qLnKxLAZ+lGRLhBUbVKg==
X-Google-Smtp-Source: AGHT+IHsHTSm2Bu/7jmLgk3YrcJqqwUg30HlW28b2vqp8SUhwfwdY33yw/3CJAX0OZ4ODyyP6JN7kg==
X-Received: by 2002:a05:6a00:8019:b0:6ce:2731:5f7f with SMTP id eg25-20020a056a00801900b006ce27315f7fmr4201058pfb.62.1702019384623;
        Thu, 07 Dec 2023 23:09:44 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000cd100b006ce4b40e7desm918061pfv.90.2023.12.07.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:09:44 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v8 1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Fri,  8 Dec 2023 15:09:30 +0800
Message-Id: <20231208070933.720324-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_230946_131483_CAFE7E76 
X-CRM114-Status: UNSURE (   6.77  )
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


