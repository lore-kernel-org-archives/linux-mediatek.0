Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB69C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JZ+d4keOM3Q3zQN27hdiAOtmuIEuYd9JoJG8TNKmKg=; b=OYAxuAJ8K1C+NYEYba4T8vpLqV
	8o5x3Ac+/6/gFAluwh0TBKMBSqr2HiEHdJAyBg3saJ+3w3rX4g02NXtdyPKnknQt0ed99l734vUb0
	N0AbCoJ/b+JBSeVEAwvJyICxzWwGppP4fqk11WfGSM0ttrosZZTRgMbqsthssAR8/9ThxE8bnjv2K
	Kl9edhyDq64/5IyxBiPjtskkxB0PGq+D8hzw7PbohpeskRvd+/PeX0DGbzjVJszLmsuxIAXGPGYxc
	rngDdJ0noxatu8Tbl4TWqmYFQbFtKoQZ807qzQ+nmPmrS3f1N0Ja7STfb/3vMjFIWv0MIr2HoLzZJ
	q1gZJigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8iT-00Fu3j-Nf; Thu, 23 Feb 2023 10:20:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8iR-00Fu0i-6l
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 10:20:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eg37so36473460edb.12
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 02:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JZ+d4keOM3Q3zQN27hdiAOtmuIEuYd9JoJG8TNKmKg=;
        b=n7vK1uti/NJxOe2l5pgWT9fnzleJ4H03NITi75Q2bs5brLlwGt6RsM+ucCorwglL9U
         hX/eV5362EwCuFAcSZYB/qUT/5AuR+Ae2z/L32yPCdKtA8hzuYSJ94QQ6a+cMa8bDbrg
         LjjTw8FC8z3fmRp4qOCpQZmosXXb65XVuQgtjQpKH95GCYCbJ5pHKwWg24lQpWJfjxND
         pcqmEfmhueC7JrByWbZlaorKfQ+CAiQZ5r3CkxdFR7eGh6sQEvF7EwAecofYDqlSoY6e
         By3NtLox/iaZcp3cF4l/k9nLgPxZlXnIg/eBvvlJIjP0ZJo2n69bXrNwuSGMS7FZzjP+
         CniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JZ+d4keOM3Q3zQN27hdiAOtmuIEuYd9JoJG8TNKmKg=;
        b=iTVU+lmkImBV4foFwzmHQpMJ1ytRXp1qrMS2ZJjfijFoyxqLVy7kBsopZEJs/80lix
         Bf0xM8GvytqZaruKR1GHBGqLnaPR3uyCz0AL4wHLyCZFgv0+6ERCI/KteuFs662W5TOi
         jeL/pSsJcar8eEbzWbilPu3KE7flJClCI4E2klMsHrwFj7MhsRZJ7u4DrAClIfEmDipU
         yB5vkhSYfDK/CEe0PxHxJy7dHCGkQ6DTHo9CGKzFBxNw4eiAo0QkKkbyCQ4tOADgzMrn
         5b7IHpEhUnHZHxipVhWgZRtBdwSAjirSW35lH1OUjUCacznVv59ekZ/zhTOKCFYwpvFe
         C8sw==
X-Gm-Message-State: AO0yUKW1q9j8BUuVITf3SwrMpkYB8rR3Btsn8g9viz8gA4mvi1K1oqKl
	6VFbWLgdsOa3x6oBxa1HEcW4Zg==
X-Google-Smtp-Source: AK7set93FtHW6w3W7U3tQiQ6L+JtvumwzgUUgSyJVkmq59feUx9y/URkmGf7hA4biCkBF+LMcfgelA==
X-Received: by 2002:a05:6402:b2f:b0:4ab:4be9:5dcf with SMTP id bo15-20020a0564020b2f00b004ab4be95dcfmr10929013edb.4.1677147639370;
        Thu, 23 Feb 2023 02:20:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m21-20020a170906849500b008d269233bd4sm5010633ejx.204.2023.02.23.02.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:20:38 -0800 (PST)
Message-ID: <ffa1d5ff-3046-95f5-062b-9833cc4f3127@linaro.org>
Date: Thu, 23 Feb 2023 11:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 3/4] dt-bindings: clock: break out
 mediatek,filogic-apmixed
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <177707569882ff308d375aae3e2936a60ea483c7.1677089171.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <177707569882ff308d375aae3e2936a60ea483c7.1677089171.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_022043_309183_D7F3AEB1 
X-CRM114-Status: GOOD (  12.42  )
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

On 22/02/2023 19:09, Daniel Golle wrote:
> The apmixed clocks of MT7981 and MT7986 are identical. In order to
> de-duplicate both clock drivers, start with putting apmixed into a
> header files of its own, so it can be used by both SoCs.
> Propagate this change also to mt7986a.dtsi which is the only user.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  1 +
>  drivers/clk/mediatek/clk-mt7986-apmixed.c     |  2 +-
>  .../clock/mediatek,filogic-apmixed.h          | 21 +++++++++++++++++++
>  .../dt-bindings/clock/mediatek,mt7981-clk.h   | 10 ---------
>  .../dt-bindings/clock/mediatek,mt7986-clk.h   | 11 ----------
>  5 files changed, 23 insertions(+), 22 deletions(-)

Same comments as previous patch:
1. Too generic name.
2. Mixed code with bindings with DTS.

Best regards,
Krzysztof


