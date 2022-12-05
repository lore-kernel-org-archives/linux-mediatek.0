Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21629C47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eJf8i7mbE4W5KmZ65ut7au95IAJO/5SeyyJ7PBLcow=; b=4PAJXIJPHmXLKeZu0EjZooijKo
	Pmol3gCZb1iUHgnqpdvPupWpONpdGwenEyrSMcXJWZL2AolmXHAJR0dy9pcMoDySq5e6Nog7tX1YZ
	JvMgfF8reRkCT6oT3fDFFNqfmm82BHXummgTtL43NdECsQ5E+P5A/wQUmabNCJPCLfndHsWwSuX+p
	NrWigcuiUM5xiajLwTwvPWAoqeemE6e9DXr7k793+GcjssN/TBLV2UQeXn9Fyiu3tTZCu85bDXBTv
	5nNeURDWfjyx1FTN+2Sf9/ggnQhNYJONu3sd/4uofCGcWOYK9xgu+OmchxkX9d5SpndPBCqAuqjmB
	81MmXCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BKQ-003ILD-Lp; Mon, 05 Dec 2022 13:16:14 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BKN-003IKC-O1
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:16:13 +0000
Received: by mail-pf1-f172.google.com with SMTP id a14so7263673pfa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eJf8i7mbE4W5KmZ65ut7au95IAJO/5SeyyJ7PBLcow=;
        b=Uv7EkCEhC+Tbfxz/MbW2eaSXDzrwPtZXT9eLOIc17El2LKdo8oujsNQuNQICto/eDy
         YPO7h5rhzyxQ/69NLU5AbePOHB4YLicaAlKfi83WPy0tIeCGqwsC2MhujfaahPNP3FxN
         AY6mV97HU8ndvqVt2fjzl43B6594CpkiibIeac6PIIa1HTSeGTSV+kSewyux21SsPrJB
         S3dL8seLItwfoG3pam162oqqP9F9HkZI5/hAwyl9OG4TGSHSJQrOXYJWXQFYUF2E8SjD
         CG4dsyFq7KKUxnnfaWYoLsGNonIOiqa9Vgl7QVwoigwYOmF40dDTY7DYXYFNKNNeZwE7
         w1mA==
X-Gm-Message-State: ANoB5pmKl1NDY6paf10q3qaahx/JSIDUXOfcpc65vkuaFqgSmA4T8ik3
	FZALOtrLz5H3kGapV5RMlp4CVg==
X-Google-Smtp-Source: AA0mqf7cuZEWFKflQSkI5L3ytUqAJesB15FOOlmdmmqL/kbAzYcaptcZPVkjel2Bw6FR7Aj4Wy6qjQ==
X-Received: by 2002:a63:4246:0:b0:477:98cc:3d01 with SMTP id p67-20020a634246000000b0047798cc3d01mr52742551pga.505.1670246169869;
        Mon, 05 Dec 2022 05:16:09 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id p7-20020a625b07000000b0056246403534sm7923917pfb.88.2022.12.05.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:16:09 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Fabien Parent <fabien.parent@linaro.org>,
 Tianping Fang <tianping.fang@mediatek.com>, Flora Fu
 <flora.fu@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
 <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Fabien Parent
 <fparent@baylibre.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
Date: Mon, 05 Dec 2022 05:16:08 -0800
Message-ID: <7hr0xe56uf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_051611_798088_8F18C7EE 
X-CRM114-Status: UNSURE (   7.82  )
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

Matthias,

Alexandre Mergnat <amergnat@baylibre.com> writes:

> This patch series adds MFD, PMIC keys, and regulator support for MT6357.
> MT6357 is a MediaTek PMIC very similar to MT6358.

The regulator driver (and bindings) were merged by Mark.  Could you take
the rest of this series via your mediatek tree?  The input driver (and
bindings) are ack'd by Dmitry.

Kevin





