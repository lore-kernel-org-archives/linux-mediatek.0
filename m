Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E59C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpcudo7gJTTbbuTXM+JjARhwoG+S0cT/6fCk8EgJ3Lc=; b=rrzaCrCCPMpXSqlz8qMOOFU+XC
	mDZJcmf/Vv6pC+F8v3DL1xtNAyvxxe8ACyHapLwLs0H7freUma1slhrRIOzb1AFkMBWd4wNfYUJo8
	3aGAp9xondhGIAJRFBCWqiXbcz8T1R1iUrEG8ya45naQ0ha4MRM7iVj/uTo/TcVUo+9MszsW+8Dnq
	AJQ0go61MKty+DziJLKuZvZ8SXNeAzFJ5UnR2/ZcqtAUCx3gGrsW2tvc0fK4vRUzARw190ccZtdG8
	N5ELgT8XduqU4nYL4WI0vYBEhaNO2eY/DrpNQRv1IS2IMmtWo/jL4tcv2hK282wlCKQOPzV3Ew/8Y
	8fhaxfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2Wh-00AzJz-3i; Thu, 26 Jan 2023 13:42:51 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2WR-00AzD9-Gq
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 13:42:37 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id x4so2001457ybp.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpcudo7gJTTbbuTXM+JjARhwoG+S0cT/6fCk8EgJ3Lc=;
        b=NK0yPEUk/K6ONN9dNsc7JvUHaQ170Ni3OGZnighVNStfLllS5t/BteesuDgU0TUPjq
         1JibIBpLF8B3H1QqiDDXr7Q2PvxrlVdt/PFFLxLQLlJNmaMMQUwl/4FFyDSzzGZDieKV
         iL2rMydR6smmLgq9A0pnwS+2Qv15DqPrzx0oquj/Fdj02FgmAVcSvQrLcdw6GuzV6+CZ
         lpN/PSxKvls8df7RSa6ZFYyCSlf513RU5e5D4rLwxCUoF6w6NQrFlcf3Go95U6yWnpcL
         llWWxEfozzz30onyyGQpyx2Rz4bw2DdH7F8h8rRFdb/UMgmY6UUSy2yM0EBBAn/3Pcz8
         y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tpcudo7gJTTbbuTXM+JjARhwoG+S0cT/6fCk8EgJ3Lc=;
        b=3vpLMSLMeEdlpzSdFdV4PNsFR8M4levMaZi7xcQyflkiFXOTM6CGQbFep4lrBkWEWS
         U0F6tCFUoe5aLkjDkPYyw5dsqaqQaVxYIvLERC8Yda6ztY9sE4VAaK0qj56e7QRv4D9j
         4QKg02eHG6jRbuTzCn+WaYFwUXzAg0E6nrRMt89b7i/uTunCJCcZmPUTO9WNI/NcVvfX
         flY+q5la4Frm928c/wwaQkvurHfP6WKxYznLbd97swKjohaDusIVAFIMKCdRsPrQJQiz
         nmFanauJO+J8KMcLdrTJXQ4SlGjE26Sm9cnSSKn4VjOYTSP8M0V5tyqmUOgRAj2SWGz9
         YDfA==
X-Gm-Message-State: AO0yUKVq3H4MoLtCgxR1aBCLqk4sl6NurAWnTXNpqf/Wpb7x8QTzVR3f
	bQSSk0lfsrdphOFBTfv03309L1hOMzoKm7ebKewUlQ==
X-Google-Smtp-Source: AK7set8QbLRvblkAO9Y2WdUOE4AoqHwyG/MzmEgbUt/H7gmbHQ71M9dyBUWLCRrIyD1+N2KqvKysQXtvT1Hqg9ksT0M=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr750152ybd.24.1674740552288; Thu, 26 Jan
 2023 05:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20230118062116.26315-1-Guodong.Liu@mediatek.com>
In-Reply-To: <20230118062116.26315-1-Guodong.Liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 14:42:21 +0100
Message-ID: <CACRpkdZeRPaYN2aN=kBskkLJ0VjFCRZc8ccf0bBW+0sposVn7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the drive register definition of
 some Pins
To: Guodong Liu <Guodong.Liu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Light Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_054235_600761_D8C6E33E 
X-CRM114-Status: UNSURE (   8.44  )
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

On Wed, Jan 18, 2023 at 7:21 AM Guodong Liu <Guodong.Liu@mediatek.com> wrote:

> The drive adjustment register definition of gpio13 and gpio81 is wrong:
> "the start address for the range" of gpio18 is corrected to 0x000,
> "the start bit for the first register within the range" of gpio81 is
> corrected to 24.
>
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Guodong Liu <Guodong.Liu@mediatek.com>

Patch applied for fixes.

Yours,
Linus Walleij

