Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B3C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFuZCHp6RPG0OZ+ZcxxiWhSMU9E34XF2yS0NNOUPKoM=; b=B/GuxvMxYK7P9UxjO+ShQWsmcF
	45PR8FETWMJmoImU+iAULdBAkoV5hE9Ca9voWwjL3kFcyyfZCvJgVZCGBM1LCHUSta5VARlBx00u2
	Cr6DPLbR0KNHBwzGOCHF0iR2vK+WObQs2st1KnD89D7Io6JckloCjox/Jjxif625g0syUfFjLUIKB
	ttYi4b2gc8vjYNfNp8dDgQK973BYxvZkm7Mm3Y9odeTx0CDYYYTsehWcV7KOo7O1SZbrupjePf9T3
	kqV42zsS1KJRF20aMInBms9NgWCFn8L0tsfeSf3UMZzFUCrVAaWZb33HeudIKGRkt7VSbkDNVfFkN
	O1IsYQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSaj-0012uW-9U; Fri, 28 Oct 2022 16:52:21 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSag-0012rA-6O
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 16:52:19 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3691e040abaso52387707b3.9
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JFuZCHp6RPG0OZ+ZcxxiWhSMU9E34XF2yS0NNOUPKoM=;
        b=fqPTWnUuuck0bAxRjaW+t2+TNbmZRCzTB/mgIBtEByZSJ5rEB0x+gt6p8YULIDMmIo
         QJd/YrVYMoP7ZmrNzykTvlYWJUjGde5jgd0lm+NgNhmAwMUNAjRhhWb0JCULKjglLPfI
         wSGtrvHKTq7jeAxq42+CL6FCbx0fKEugliZOo5bRuV1bL5tVHZkgBVdVH6E3A9TidzSc
         hcpyvVGDtcA7tJYS2ah5C5rRuFFhvszme2WH8clxRaplmpfCF3VL+fdfZ2s2HLRWl+HA
         eL0/fWb6+IjvzUNetxTZuxNR0qANnOSnlAMm0ogoBoTpJZgN7DGrCjlPJ1gI0B2moZLk
         7clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFuZCHp6RPG0OZ+ZcxxiWhSMU9E34XF2yS0NNOUPKoM=;
        b=JbTvRd4J0f19RuQcxYb/zY6ixSsJ7LcN//n0qSBDHbe/1FVgAAT7mOcCV9lOM5UoIy
         wgiNjsc6OPjhX8lL+tfJNbamdKxEv3oXGCal98nRHF5qGWuj7rknUzqLsNvJj3bcqo+n
         aiepeavM8m/xSYrq75AVA9BY8/esePJiTajk/+tRa0HQKBdnwXVeK50y/4HYToF8yJ0l
         CXsGppJbUigHWQ00jc4SXsCy4oJKgHuClnIMT5ZIJuaGliO5stbmpPLxsZ9xvKdUxlx2
         svFfTSJAQrNf3e3hVhqFBowWVj6tJOY8jTXtesBokfJf4NqJKxQ1TNt3B1hbjbRZSPml
         fwwA==
X-Gm-Message-State: ACrzQf3ul8mdum3rSOEETamO0mETpBsDRVLACFs3Kln+rv3+RfTiIEIB
	FW/qomnVu2ucxWN4nIYAuFW304RG0opMf+s0f2lmkA==
X-Google-Smtp-Source: AMsMyM6vjerUWgxxTrEsm3O1K4kgea+m/v98N6LpjqhoWL/YTXSYhqV+cegvXn3NJBWoYQcPrP65gYAr7BtftOd8w7I=
X-Received: by 2002:a81:4f89:0:b0:36a:f09f:73fc with SMTP id
 d131-20020a814f89000000b0036af09f73fcmr312625ywb.487.1666975935785; Fri, 28
 Oct 2022 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
 <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com> <Y1wApOeV7OoQzkt5@sirena.org.uk>
In-Reply-To: <Y1wApOeV7OoQzkt5@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 29 Oct 2022 00:52:09 +0800
Message-ID: <CALprXBYf-V=gidvNpoRraPdJgdrYaCoCcJPhgAmx6UX5wUXzxw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095218_280957_E742AEF7 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Mark Brown,

On Sat, Oct 29, 2022 at 12:17 AM Mark Brown <broonie@kernel.org> wrote:
> Also do we really need the of_property_read_bool() there?  I'd have
> expected that devm_gpiod_get_optional() would be handling that for us.

You are right, it is unnecessary to use of_property_read_bool() there
, I will remove and send the v2 version, thank you.

