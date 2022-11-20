Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807AC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RNDe7PJi0Vvvvu6jCjNZ7PvIE5H9BtapmW13nMNVFo=; b=QbWJxVGvxXlkDC4ifJEABhTkHH
	cdemsM5wUaiO9Pjje3dTvPCqUXScKlpkO9aQp7coMze4JF7sogBl3PvroUIPOOF9iaNNWLF4lSELj
	lxgzTmZDW11vjDACNeF9TPBQjnecP6oSTRNZj0kVOoiLyGtMuLaTsTwex3YypoE7Nv1/6+t0suW7x
	fPZJA0ysjX78xU9h4h5I2N7s5u2LbOBGLUYIqZNFpBqAHh0SsqLMi005pGbclzcbfd6ZkZDyzloZM
	WaIw3SQ1uq/M3LtudAOTwxGwx9xBAfkiekNrNWL57jykiY0X0JC76ruHROUauI4OJ8unE8TtG0om6
	e542TPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ownQq-005m4M-0a; Sun, 20 Nov 2022 16:44:36 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ownQg-005lvH-47; Sun, 20 Nov 2022 16:44:27 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-14279410bf4so9542848fac.8;
        Sun, 20 Nov 2022 08:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RNDe7PJi0Vvvvu6jCjNZ7PvIE5H9BtapmW13nMNVFo=;
        b=vrMiMYn7IA9+PR+ofy8DfAzrQFRkkVKYpw9lilOSFz/Mgx9tlvq+kt5WaVg6V+fceO
         3CQmSt9R97Y+Mx7fBEFwGCrnDv/Jvh701CBr4BNzCkkcYI7iDoWGvcF5RWztnfQe3eJV
         NWkwqQlbvE/UFgIFqI21yIFwwUGzimPUhbXHMjBJw0C1QfVBAB9/vAirtKUEcY9pzcPG
         KUPNvMuH2DHriONlgtfDFUiFo+F5mHSdh3XcXdw49FDxALHEFYA2/nfGL4D77TioF5z4
         xUWhU/hoRmDTaOCHxDrsHOhKNCwn/Dg5Yxb9/cR8ANuNXfFVZFjmQ9Hl8L+vERzRJr5b
         7sLw==
X-Gm-Message-State: ANoB5pnXP/QarrBArNVI1Wz6WUAaT6EC1HeoZg2lpvpiFw6j7JMkJVdQ
	EziDXnSTHrE6oLeLcfmImA==
X-Google-Smtp-Source: AA0mqf4j5kGAon96lXkz4r1HaXEn251bNG+XBFyEskhKVT68GFyBgPHGFIcwsws1J6lrB4dZm+cPog==
X-Received: by 2002:a05:6870:c352:b0:13b:66b0:3ef3 with SMTP id e18-20020a056870c35200b0013b66b03ef3mr210242oak.210.1668962664837;
        Sun, 20 Nov 2022 08:44:24 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
        by smtp.gmail.com with ESMTPSA id s7-20020aca4507000000b0035a81480ffcsm3437647oia.38.2022.11.20.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 08:44:24 -0800 (PST)
Received: (nullmailer pid 3181600 invoked by uid 1000);
	Sun, 20 Nov 2022 16:44:24 -0000
Date: Sun, 20 Nov 2022 10:44:24 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>, Tianping Fang <tianping.fang@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	linux-leds@vger.kernel.org, linux-input@vger.kernel.org, 
	Fabien Parent <fabien.parent@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, 
	Chen Zhong <chen.zhong@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 03/10] dt-bindings: rtc: mediatek: add MT6357 support
Message-ID: <166896266368.3181509.9918929389784534787.robh@kernel.org>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-3-8210d955dd3d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v5-3-8210d955dd3d@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_084426_181416_5B7A7C84 
X-CRM114-Status: GOOD (  10.99  )
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


On Wed, 16 Nov 2022 13:32:57 +0100, Alexandre Mergnat wrote:
> Add binding documentation of mediatek,mt6397-rtc for mt6357 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

