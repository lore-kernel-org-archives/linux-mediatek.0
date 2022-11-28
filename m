Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C7FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlT6JqjPReHXe7EcP6Bm9RZ1YVa4h6RI/hRicIEgKs4=; b=GJzpnMZluCGL2jBUfQimHt/Pmv
	1/y4pVsGs1V6K3RQBvvcfkQljZf8EF3fWKZ9aT5/7+UqgzqTTpiNi9LtP11C8oWJKTyObgbPRHq/+
	fCagiS+54jrvtaouC9NH0qwIetX+2NvwLo++3V88SBBPnGrt/EDyzdxBf0M1qzWO4xQXAvb3gd1wu
	2R09Cw3wyg/RdNZ0jI2wrAqI16ETDuAMVbUKo85BrsEr6dhB+5h+g0vMTb8zLJk4S7IhXKF6oyzfa
	YHMmA3t3NDyhLFN0IkL3I7sP6k1cuNOSs/rLcZzrH7GhjB69W1yVORfTV3zX+hzV77vtra6fyAbhR
	+3Xr5zXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZwv-000Qw4-Rf; Mon, 28 Nov 2022 08:57:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZwj-000QrO-LL
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 08:57:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id vp12so22728462ejc.8
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlT6JqjPReHXe7EcP6Bm9RZ1YVa4h6RI/hRicIEgKs4=;
        b=62u2Rfj+8hqBycQ942lIdMJxOmRUxzLFS88338/bWaX64SRCze08nOErchZZjD79e9
         jxBkgmmaQb3aktcKJuwqGmxQRHDn0HXvZJXpscXmgRAEUMeHLbrHyPMYJW/j82zk0XYp
         6gsJAbx5GUzNoNIIq6D0uaEI3LTbltrvXUIxmJkV5yRRZ5FbMm3Poiyu/RsHYa1lRF0T
         zAL7YK9GDAm5n9zem/EG7R7+zkUqLeAThB0+xci9RvHt6jIf1rQnf3D7tTwsSt7O+pCo
         3ZZJhl8mYjGanyUk4utkZbvWtSfrwXeyNwbLSF+ofpay5bEraiGSMglDjxaUVeB5Bns4
         WJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlT6JqjPReHXe7EcP6Bm9RZ1YVa4h6RI/hRicIEgKs4=;
        b=Du/pI42IZBPsbqjZJSjClkQ4PHUkYRapPUi1OJKBXf6xadRQkGJHT0i6NDjnGRcgue
         nKhtZgjvq5yfno2r2HdiQ6WwqAu7beKpuXYqdEyajUgqV2rW0N0NJ5Air3Uwnx1vxlEX
         A9gIu8mezT4CPgH1H3WumflsmKBsYKQwVrzsJ6jRIUqtkipukEmkhmkn5xZwNnSS20Y1
         sdmd5q1TQKzk1zSvYBcxcbWM0A6VTyIdTElO/vb8tNMc9mTvO6gvueotflbjtBWcxD7P
         dlEKHz7g+6NngR9bU6k77I92fgPeBrd3aNU+U/AHuzsaC+UI3R/1icnypL62lWXhXfEp
         j+Sg==
X-Gm-Message-State: ANoB5pnkqtvWW5tO1mCAskp8ykA7RjqXEMEz1WK4HuK4OhQtXdH+TDvA
	qId0NXCFSC/UBL98f7s3YhBvRD9d2ascTmab74B2RA==
X-Google-Smtp-Source: AA0mqf7iybltDA7hXJL9yAT+SXbkybtSOfTzeliT8SvsSM8emlSdXZtrfN5+duEiN2skEXcM7mCKyxD7tFoNefo+WI0=
X-Received: by 2002:a17:906:7f05:b0:7be:26f2:909f with SMTP id
 d5-20020a1709067f0500b007be26f2909fmr7248255ejr.86.1669625817752; Mon, 28 Nov
 2022 00:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-2-4f589756befa@baylibre.com> <f7f0753c-f0bc-b87c-b99a-8b1bc3ef40b2@linaro.org>
In-Reply-To: <f7f0753c-f0bc-b87c-b99a-8b1bc3ef40b2@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Nov 2022 09:56:46 +0100
Message-ID: <CAFGrd9rK184_mqpPmHsSRXyE=Y3OxaWe_RaYBh5P1F-aOhPGvg@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] dt-bindings: rtc: mediatek: convert MT6397 rtc documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_005701_707126_6CAF9773 
X-CRM114-Status: UNSURE (   7.90  )
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

Le dim. 27 nov. 2022 =C3=A0 13:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> Regardless of it, Rob suggested squashing it into MFD device schema and
> I think his proposal is still valid - you have here only two properties..=
.
>

Ok, I thought the conversion was worth it with the latest changes. I
will remove this patch and write RTC properties directly in the MFD
schema.

Alex

