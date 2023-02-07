Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A6AC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nF9vH3eaAbIKV4DBI82H+S0pnnuGeRGAzsQCfTN3QS4=; b=zWavEuj92AnlrnA8hYnyhsNO5Y
	0ZOIrLF0xZeoEA5AkXDDO78op5KCtCO5T69bb+qrzga6Xsc8cpym0K9YoVP6e0qBbqlWQdDX9YSbp
	0ENmCnbCKClTCeG41/fkff/nK8ppr0rngaMAlBQdp+j/0NnCat4QiQST7hy9+AXzectDVKcUXNnUm
	fBWyfzvAMCVu7JLQQeFXlbOUzZbgxAtrLWF8jxA8wx1SVCnjoGAFWT+T/sGDokcVvI8aK3T/IAdFw
	mxhRzOtNCgpXCWzE8ht93bshCx1M51jzuABj6iMIFffcE/r5HrpeDKTV3TTZBBGg0lVoFPbkUzSIA
	ik+GE+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPFc1-00Akhi-OI; Tue, 07 Feb 2023 04:29:45 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPFbr-00AkfP-UJ
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 04:29:37 +0000
Received: by mail-vs1-xe34.google.com with SMTP id k4so15015864vsc.4
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 20:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nF9vH3eaAbIKV4DBI82H+S0pnnuGeRGAzsQCfTN3QS4=;
        b=bJ47yYjUQmEPTekZ8RiGasn8rtdrty3yO15BKJASD1NpFZ7vgQMG9gmpBS5KhcXbLF
         SDpj664sWXFR+t65gRALB8vDPBQwKaawXD2r1wmp8FA+JA8lsHRYjmtqigtLkEdYTWlz
         ADyLL6YzWSEZIW2w2QsH9RHN9OQlO0q3dVLUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF9vH3eaAbIKV4DBI82H+S0pnnuGeRGAzsQCfTN3QS4=;
        b=v/5Xyh6bz4qhtycpeQoKosOxqSFZW8wtCTKWSMqjYPEH5WGc2srfTCxCwcYmoG5Rgz
         renNXwXHFZ/Q+dR616kuPk7rEpGB8yxUgG9eLSFqR44BBfYUzUApxwX+Y2EfGxBC+kki
         pbAsxvd0o+myFWWlDfitTU7yqv2ZgWlPd3oXY1gxs67igPYV3eQBrJjcn8YOOYOff0k2
         zYwKJix9cEUeABe0CxYEJ81weIXsyqJYHnuhOKSD3xQMxI8/0MV7PW7tkmPbw8unSaF7
         1DncNok5CTh6t35/VusInS5GyOrFReQql23FbzNaMY0DNflk+iEdn7q53d7Xs1lQHhLf
         rs9Q==
X-Gm-Message-State: AO0yUKWW2CNQQFghMxEfWuFL+iHIQ0GxVtf36puNAqiSQMLmk5mZvtxY
	q91bHvYXPBqxYDsQaWR4Z6y3iISk60oz6W23GwHliA==
X-Google-Smtp-Source: AK7set8YvobBI3oYuPbBjpEvQTcTwp7H9m+SkAWZ7KEqJ0FihXD8UHvdEcFi4s9T8+P2c7Tlv4z0bjXKUX1R2uRlp2U=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr487539vsi.65.1675744172765; Mon, 06 Feb
 2023 20:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20230207014800.7619-1-moudy.ho@mediatek.com> <20230207014800.7619-2-moudy.ho@mediatek.com>
In-Reply-To: <20230207014800.7619-2-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 12:29:21 +0800
Message-ID: <CAGXv+5Eo4es6XF6m9LQDhHdrFs=18_S-VGGvn4wQF1KWmzGcEg@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
To: Moudy Ho <moudy.ho@mediatek.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_202936_011828_5CB72553 
X-CRM114-Status: UNSURE (   9.11  )
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

On Tue, Feb 7, 2023 at 9:48 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> MT8195 VPPSYS0/1 will be probed by the compatible name in
> the mtk-mmsys driver and then probe its own clock driver as
> a platform driver.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Stephen, could you pick this up for v6.3?  Otherwise we'll end up with
two drivers targeting the same compatible strings.

Thanks

