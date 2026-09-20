Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC9C982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 05:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=; b=cRgTV4I5Wlx8Koofm7rWKRGWeu
	wL1GxnLfwDabYtBTXj8kgEwSuxEEtnVmcvc7/oqGZ5GVyqFNjwKrXDID3iF2LD9zdwst8GAtA6cVL
	QGO9oB9bIaBqdWVBIBfYpGIy0EiVoKs/aZKvjkKeIwGmC4eK/ve5l1aUTJZ3XvnxFuy3LoLmGjBh5
	Ze/sGz6E6GEQABJ5cRmTBRhxxMSMjukvebah3oXiY/xbPFaG9swtXNS1vSjWj5c9ZPYQIHbswteXW
	1zXIK1i89jU2D9ckvrRHnzq0ziUdD3S/bxTQzyIIvmvkpxQx3kSsrd4gdc819JNHe36qYAmWioWhN
	8wx0d7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9y-0000000Gwc1-2ifQ;
	Sun, 20 Sep 2026 05:32:18 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8A9o-0000000GwS9-29jk
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 05:32:09 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-4511f6a63edso297081fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882328; x=1790487128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=Ks/lvSeElLnjZaD7DDUPo53T/+i4cjQf/RoL5Xo4d4o3NK8isU6VfsSke1FEL8U+Uk
         s8zgPJY3bRGtbk29Jpw/CFOOyzJ8bpnbp6yq939a1NvAh2h3iHAmY4/BKoFvkaDXzW4t
         qjKeO2ONbBLTG3hlZzAlPIvKQNgUwebaLH4m/F5QzDD7uanP+beZsoe54/ebLCxML3Am
         9hPf7nQVA/rsTrL2XQQ2DhpTtrbzggY4lXAoUEUCRiAzf6y8sbcRiQUEUaBSR6wBBOBj
         bZ5OIkK+N8Vewi0pyKc8XhDeWZCrQ+tHjCh7mdNZ6bVqrX07OE0nX5T6GHhU0iHrHWzl
         jhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882328; x=1790487128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=ropjQgHC/FIokIGdna0urniIGKpOFOIcTS/wX1AB2GxyZOPBhFmN8Kuw3KYjv2hmSZ
         64AsfXgsG0ugoaVw0WrEwkghr6Ya47bM9PtDXjYgW/bsYQLZlLRieIB6Pt9myEuNMqww
         1zN79u6jVmdQqX7d/PjuLOc8A1A5a86vwZWSHsZ4CETxSYELKlPAg1yQILtG4eXV5EvH
         jEZs+jI3ZdgOYyDO8dVtKBEbmOZzWwkmHi532qLkri9jeScFxchX7nqh5xLT1X2I4eDD
         ORYcpKgvMYElpOrQpfWjLfFt6PLpbfyG6aA6K9Fiqb9TBhJvmzGVCOpIYPuNkL3rzKXY
         AHqA==
X-Forwarded-Encrypted: i=1; AKwUvBw/Kb7J1fWqBBhOgTzSFk3zNubSJCiMKK4IhOr7TEQMsTCzurSwyxrGjGLvDOiTe0HMv3vP6UIt/mdhSRkDPg==@lists.infradead.org
X-Gm-Message-State: AFuF++mumdP8cVl+ROVCxpoO/mGXmcfOf6jlaLueW7WrEYbTQYoVtiJY
	08/og23i3uEVmg8afRpvVk05o3JNDN/jYBhSNypqGOmcPxxyqhSN62rg
X-Gm-Gg: AYBFou3tJ9CN5FMXyI/2sKCFUqgjfB+fLQiI5K/8jkGr7ENhuT5BRPXTlUpGM+EI2Xq
	sGNIRBhXWHMuZzoO4O/8aIaX3hiq8GiOQwSZuY0FFA9EaeX5EQMDCvV8gYhP/E6N/lY80vD4Ri9
	70AVKnAX5pdyZVF0K1r+mlrcyr5KBRPp1K+i0z5YyFUrmiCUcCOsJQ3VB5ohgWSh6McIiA9CxiW
	pCMsTwDRkANgNJ4FbF27hkYbDdMqk/Y7lXHAI++1IfOQEhV8yH4OKlky71SQeg7AINJpA2vDTdT
	//0mceLDrU+1++WjGD1PYEzHLV971gBagUonucZcbkwLsWh71J087ae3A6xB3BUj+Wk+SiHPP2W
	KbluMim259yC8YvqJNax36ozsxwHUTXtqMEav1W2B0fJkpnJf8PZTdyrnHsDGiRRV/Z6LynKeaa
	ihN/7hbM/zWbwNMI1Dudd9i9tx+q2ykjf+cX0ATv5MhoIvo+vDRU+dRBP3augQVI8D4A==
X-Received: by 2002:a05:6820:818a:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-6ca9ce4cfcdmr7217118eaf.56.1789882327657;
        Sat, 19 Sep 2026 22:32:07 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:53 -0500
Subject: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=9u9PT8EgMhT2CU7ynGTjZXDCJlhMILqp7KosTLFKUyKBrbzaMyv7T6YSoFBmQnoUOssaMtNEq
 wq0GEJz7dXDAC/rXFbTt3HuxJH3iGRrtfTsh2kyNLr/fEKdyaxtfq/X
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_223208_553214_C60395CE 
X-CRM114-Status: GOOD (  12.36  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


