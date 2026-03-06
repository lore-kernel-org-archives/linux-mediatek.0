Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30720F0182E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=; b=Od9KA+O15Ivh4Mvsp/FkrqE8pU
	p04AZmG0ALBmBB4KClPic7GfdE9O0b/ZHSmHEGcPiYGLXT606YEN6DwJfQlDxn8cKAjewlPJfVNyu
	BJUslvt//c5Qw7tz2DYxJlUGZu+xocNw2wMHnSgJp3sjLTAQz1wDyrOfJ+Dhbr2sAZpoXNiUjmrBP
	V79s9sM4wYwrdfXjQjTnHUjNKqxGRwBVn5mgRVgGGskJ4Y8e/eSMno/yuIMMZJxGDy9DWUIxvByte
	c8bBpyOjIp6Unb8c0bzYr7B6bg7tptSkZY2KxcL82NIIhIzYtPrsvwAJBplXd1Hck8L9KpI1HQeXd
	w2n26WKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwf-00000003bO7-1FyJ;
	Fri, 06 Mar 2026 12:06:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwc-00000003bMH-3h4Y
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:06:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2628208f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798773; x=1773403573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=;
        b=YPa1Ax9GFkOmShmwFFxOfHwSCm2CmTXXSq4aDgJdoPTMnBHmPNPXswEeH4iOsTnjJM
         owEMRxs54/deeq3g52BK8X8A9rbUy8u1J1uorQ7P+CQ1CHlOv9ne5JX7+VYK7vyRqelb
         KznWCVCQS0uY188UWiEP45qh0LmVi4LkAxtKSM/4jhJB8oZuxiz6CCKqyTLk2MU0c2Tu
         ttMth3hbGkV2p6HvubuCwUIvc6aUDexd6FfeRsPaMzHymgWAKWU1syyBBBDRloJBAFhP
         lWucHvCMEY9ZipT9BGYXTxHKbiTxYmcQE/VvdkrX3+t0OLRMZ5culwmcV++IwQYtKt1d
         mZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798773; x=1773403573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWHYFXyM7zqNoEaGGLabRt6WO8B9aIWRMhobpXYX2k4=;
        b=kKmCZxfktVwm1Z+7qJnVO/iwfH49Y/Al9oqtuY4VzNVmphhQhu3sVChH1rGIElyuI/
         1128SzoFxCq/9HVEubnpzcySpVkEP2VLECYpAC/PvvRTWZaDKgXGMkI5vWsrMjoY4VUw
         4VxDlfIefrfqSb5rNyhPowf/XoovE9nd735GeiVbxri+4zBP4YMqrlTuzn/JZWedOico
         1RvbnIqSkS2Uo/zlo+bopRNmyUBvUCDoRegFYMl5IW1Dw3I0IDsXwu0hhCbloxn1XQbI
         uokAsuGXp3KMvAWCBD4FGfeTocBXFYFOVcZb26NVwgX3GC/wdpLbR8XB5Kt89t7CuBYJ
         SxOg==
X-Gm-Message-State: AOJu0Yx0GnQ2KmYsv9KHwB7Mddhy9vjD0JrDPGHgL60YXAMC46rUnOmS
	WqBXBpX6tzGcRS/8LJp8qt+93tOkKuNLQqVrYsvK5OFfhXqBEhJqzAPrarsdVCHF
X-Gm-Gg: ATEYQzwLg7jIWS1u+EOpEgy7HvnBjT/JX3Vvmd7510imQypouY0ZxWH4ELgzeHgfz1D
	pWW/4qjD0VsxScg0kTLtoZp4x4XfLrHhoaz5BoqgkajVcAO6UVcqjnfaO3nx0UxijRtru8PJj4c
	AHYPFDaCjunNWerCSAy8mSpAmeE8LbJr+Ipk8v4eJdxqtE2RROX/HoqQBw7xersbpO2vlHeq3va
	d5pKUF+SndcVgalSK84t3sxfuwUG2phHbuTaA8jbuYwkPbwPXgG7aMa5kAIXVLgC/vHhDAhnB6L
	FG1AjtMjkkQfBu89LP9SxzSstZ12UdVKLcycCKVpgHHeBsnWWtpI3OQj8g93XhlwbQgTz89Vx67
	dg9JOznQtG0RJO+zWqJHozmTSk/Ra3m9zupv1CaG+4ucH8gRJGuzWJF9uIp4dOPChSqwzK+yBxP
	4+zUr4mkA6TTODTIlSfq+Q4+flkVnOzw==
X-Received: by 2002:a05:6000:4283:b0:439:b912:7391 with SMTP id ffacd0b85a97d-439da34840bmr3145089f8f.10.1772798772610;
        Fri, 06 Mar 2026 04:06:12 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:06:12 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/7] dt-bindings: regulator: add support for MT6392
Date: Fri,  6 Mar 2026 12:03:06 +0000
Message-ID: <20260306120521.163654-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040614_936175_86A9E83D 
X-CRM114-Status: UNSURE (   9.20  )
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

From: Fabien Parent <parent.f@gmail.com>

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index c358b2f8059c..bb1456d01ba9 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -100,6 +100,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


