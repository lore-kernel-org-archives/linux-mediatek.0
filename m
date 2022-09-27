Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4FC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=; b=hmQa1ovH8Q3UItR8P5BwdW8q9v
	UBuaPSEE7zhFNLHwWiAB2GevidKQhgwRah2+7bFjcQyObzrJM5A+Unk73mVdKWF2mRPNn6JHu7NKw
	BZMp3YfdPUGRt8QETMoIGytqH34qbu3C09YwO8nnCzRxR+aUnXabmgbiSdLkonwTTBgn947mAy6/G
	7k0bBKDWkGMdvPULaap/PyKtciW6bwkx0/x2dC72UOgjCXBbVEDO7QN6E1Dd5ugtUjwMM1IllXvYS
	y9uefroUKemCv5mz4UG7Wmg93JIV37gq/os7akA/UGcUaB0lDX1MAlvTiZcbbGDvadamWxWCrWQAX
	xS1PepNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAnR-00Axid-Ea; Tue, 27 Sep 2022 13:38:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odAnO-00Axej-AX
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 13:38:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id u59-20020a17090a51c100b00205d3c44162so2422080pjh.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
        b=zu0LDMWaZ2IiyJWen0shu8EVhyMeZSD0OIiKtU1o5V962A7jwSkPn4CMMQ0vz96Vth
         tmuzCaRlrru7doTeuXHFqIBlelgapdbTo80FoYEtNoYoaEZL+RORowAW5TQG758voXAB
         /qK4nyJaMel2BpXPOS+vQr8yEpETmpuh9xmFJL3bbdiLCPx3mFskJioDlySfvlYLDiz+
         5l4LD9rzPtofDwJzV7W1kwC3nRoiXAq20n8O9pp9eXpfcWtVB3QDe/+q+6K/KnMeAnfw
         i0uPy9j1+kZk4vpNwuHSzu0wEoCWjqtwlybaZfNOtus5P9tVWa7xP7C9GRMIprbloz4T
         aSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
        b=Pt+YB9Mvq3X8tRLbQ/olFQV++O7eE62SZmQZkXASVPx0AR/3Yqi1TwPAIxYfNGOoZg
         Pw2KpacXLomp/xJ7HQmO7z28y7vDxPDIBwbqiksFIlj1YreunciTGAaScEoxO+SB4JWT
         GU2PhPoFRVT7ms5SGRODkTRAAH6EN8m7RXfqs+PncE6zLz3KekoLRBhDvQjWXuy6dHcN
         SfJIMGVLVvVvCothA4Y1XrPBsEWEvMYwoRD7GRdRn/v74MgoUxO6S/cefPuUf0fQIWVn
         PwWmhDQdA7cQi0dyB/QUG177q76NeCrlAs8YKpRaLhHxmz/42bqgHG7rVm3MmfsCnKQC
         DI7w==
X-Gm-Message-State: ACrzQf01c/FKaUvI4YsCJ99PfaTi//DzWHr8zQ0bLGZf04E0y6BVcQTl
	ew7xLXn5qYqdhdkeYv6hIxCICMa+Yc0fXjlPfJeajg==
X-Google-Smtp-Source: AMsMyM5rGXrkhuQrQe7LgcjEDdTHK+6y7t6lOaHNCTQ9hNJXjzQRFavvC9zWHs1/i1ytYfodZBY430bKtOUYXAKndGU=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr4550660pjb.99.1664285925438; Tue, 27
 Sep 2022 06:38:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:38:44 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-16-4844816c9808@baylibre.com>
 <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
In-Reply-To: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:38:44 -0700
Message-ID: <CABnWg9twi6inBOeLY=BOQ+o_CwbSW=L49_A+9VMy0L6vbokhXg@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_063846_392587_3BEAF3F4 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, 22 Sep 2022 09:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 630a4e301ef6..91212b7610e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -15,7 +15,10 @@
>>  #include <linux/of_graph.h>
>>  #include <linux/pinctrl/consumer.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>  #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>
>Why do you need these headers in this patch?
>
>Best regards,
>Krzysztof
>

reset is used for reset_control but regmap and syscon are not used.
Those are leftover from a previous iteration of the patch, will drop
these in V2.

Thx,
Guillaume.

