Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF5C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4PdP6WMWUVs/TeYlDNhMKNUMGDED/B13OgREMxFMgY=; b=kUThxa50TvnM2U6OLtTFdOK7wW
	Q1qiHVmOAnCEyCh9Y8SYCctvAeBPe3dqROdgiL/wo8j7mTpRospE/O3L5H5Iie7s+Qpq4xxXtU9p8
	0HNxmBHMCmfxldmYcVZLtQs0b9SsIvn/r6UF9Cl6BXaU/WXzZ5AOFj8wAiz/Uo9obXwPiGWoiFnwM
	WUpcxNS7GfYcKwAeStwO2mDRIeMvBOsuv88RKkIl5ldyiQSiPiHx5GweU6g8jPQGnAlyS7AGQxQDB
	R3Iy5rsgLUbFgbhmea3kaxgPEJlorxVtQzVNBylwRIfC2TMTJ0Br0z0qk7FyLRu6I+kyjFFQQDTpb
	U4VH77bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgki-006CXF-QF; Thu, 18 Aug 2022 14:44:08 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgZj-0065S1-0G
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 14:32:48 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3376851fe13so12576027b3.6
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Q4PdP6WMWUVs/TeYlDNhMKNUMGDED/B13OgREMxFMgY=;
        b=xHsVBUejsifubir7I9ujOu5L7D7Gctd4kp0EcAGnt2NOCDvJl/VTImRQGl89bjg/6T
         7aBot6xRY8k6Je60qj9TxBYr45y8cnIiPAqc4smkamnZwMkjokv6yopWH2J4eOaRrVL3
         Ej/yjOFAP1cvBjrnTtfHB9IFdXgJ2awAhMraCpO7xUg8LCoXt2FK8JX859tnIwIBGDW8
         EVEKNrVWK4xfFzO2BfiCgzKwFm6SjXFwZnVuIXh9bUaeNrzl0N/pIcooPlZQdeehXxV4
         StUvn/bBotX061UWdKMESkYJ878gzg74y2BoHckho8kP/CAdmynJqnVpNZQvN4KuAHMH
         +Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Q4PdP6WMWUVs/TeYlDNhMKNUMGDED/B13OgREMxFMgY=;
        b=5c9hUsRaHT+zsQpQDZBRgqU+eBtxZw89Rd3eDFABOGMbmCwlGVe9dPIZHbWxpNIst8
         H9nyiKUH8NmDGanah2Od5YergMUfet+BulAdnyc4I8piM+jo13oWUHVpuhL4DFYsmE7M
         etW7tEwjMcNLZGDFNiIxiUfJSoBhB2mpFLRbulc7s7VHa619n57YgPiWh3gpxGKooU4T
         xTT5SN9EtdbaAz9bXzT6QW74PxK1jDrAOq2NM3DYBWgDqLvpdJLCogypOyP4drrM4Pba
         9k1zqfqsqOE0JFRmPYWVFQ7vqzJ/IGd8csCgzPJ7JqZfhHcVhcToG0aUiUmrmmLsUFhZ
         LlZg==
X-Gm-Message-State: ACgBeo1RlpZe4X0SDbn4aaZl29jOYsvTYSx/KlXlXfMGC5LXACvCGWNI
	D56SZOkIUs/0IsQom8mNKWhnfM09+YyyAPruyiXcOg==
X-Google-Smtp-Source: AA6agR4AEclnoudYoF6VfykDjXrvraA0qGjn/GeXAkkP873Ycrs+WwTOAD5oEu/HVCUK2JaGonXuFI815FumjWyTljI=
X-Received: by 2002:a25:2f8f:0:b0:68d:9cf4:1e4a with SMTP id
 v137-20020a252f8f000000b0068d9cf41e4amr3219470ybv.38.1660833163595; Thu, 18
 Aug 2022 07:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-3-bchihi@baylibre.com>
 <18164de9-ad28-939c-a802-69647fc65a37@linaro.org> <CAGuA+op3tFL6M=H2rzAB4DJn+7ve4W5vUuRc+zBrq7zQY2CX7w@mail.gmail.com>
 <3b4fd920-1f9e-de43-b436-85d73cf12f8c@linaro.org>
In-Reply-To: <3b4fd920-1f9e-de43-b436-85d73cf12f8c@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 18 Aug 2022 16:32:07 +0200
Message-ID: <CAGuA+oozeHkrRvO9iBYnPYrxq=1KcXcabji4Mjt_cAx-darWMg@mail.gmail.com>
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_073247_123293_BCD801D4 
X-CRM114-Status: GOOD (  15.50  )
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

On Thu, Aug 18, 2022 at 4:08 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/08/2022 17:04, Balsam CHIHI wrote:
> > Hi Krzysztof,
> >
> > Thank you for the reviews.
> > Would you please explain the meaning of "Rebase your patchset on
> > decent kernel tree. You seem to use something a bit old"?
> > It is rebased on top of linux-6.0.0-rc1.
> > Am I missing something?
>
> You Cc-ed me based on old maintainers entry, so either you did not use
> scripts/get_maintainer.pl or you used that tool on some old kernel If
> you used that tool on decent kernel, you would get different email
> address. That's why I asked.

Thank you for pointing this out.
And I will do the requested changes.

>
> Best regards,
> Krzysztof

