Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2STVppZvRp83Sq8io2ebkfDNV0eZrqcxPbepBGFCudk=; b=oNZZ+h0FoUzGUu
	xizMw/mDJRzzkaSMog9pzALgsQXz/NIQLdY0Q/cTFPLiLi/n2/taNeSdZUEdPDVYay22zy8vFwFiU
	l5v7X3oRW9GRISAyaZeqQooV4VKdTwxGt8878BtJE6mdKlyzqOB2vckbBE/gmCertPKF4BG3XNEX0
	PV6b5DpqXzkXHFS6N0oflP/S8/2vXJ6xuN60t63DN54s1bLRwRZCy/5jntQLcqzgETpfmPTJUA2RY
	5SoI2VGC1zutTtRu9AWaStz6icGZbrtZUft9dRxDJbUIEEWg5r3SPbkzGy+yiLd7hgHEPcAXPubTs
	F38dUlQ0zB85nd4bV6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZl4-009u9f-R1; Mon, 31 Jan 2022 16:42:26 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZYA-009rbz-FC
 for linux-mediatek@lists.infradead.org; Mon, 31 Jan 2022 16:29:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id i34so7659513lfv.2
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Jan 2022 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZh/zXsVY4uAw4/AoKKjhBJR9nVYvIppvpnGf+mWz8I=;
 b=mTzZ6FlxE0qbt7TSt73c7QfPJldMU8vWNZ+3ldqYN/P93Giw3E2TKdHaAgCGWtMahT
 VvLd/nDAX+nbQMF3UAwH+Bzd3FxtZajWAZi3dfrEQFCimE6sqjmuM0JPeKP6FJ96dYW4
 IYO7+PEsV3NFg2ODRvVJp9ERQbHzV9D/dndbQaLx30SL86d/nOlWS6anxv9/NIAznmdR
 JJdyeGnPGExKQ5XtW7B7OsQnMf/PPjiisXEO7gholaqw/mhUnR1aGW/V7wvXkN/kaw9P
 maCq4K+9LJwLSsHGS3BYiBaOdJ4rw6HObs48AnfRrMqRJasbbIjbMGG9lJWr466bdEse
 cPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZh/zXsVY4uAw4/AoKKjhBJR9nVYvIppvpnGf+mWz8I=;
 b=NFTTPeJvF8aRBrpNgyim+9YioAT2XRJcvHa7oXhfd2cHUNQxAGfHNyEL9W8YV9Ehlc
 KTbl9NtRhPAt6NoXSPfMUhy6cP/6butmj+5owxoqu9MUNxngxgOW8w3PcANhkBIMWaik
 HTbB/vFeXS4sHO9Kj83qHF8tfVQUpLn5mxkIMwkt/OaRahbQlvgyREIS3wbf9uxXLqzb
 f924A8xN54a0V7vk8P2x0Fgb5MMlpSrVuNDJ922jzuJut4fx+kRcmvQzsypjTZ4a7v9f
 jwuhmTWBS+dZR3CLeOjd5fGrQMblV4qndtyrSWu0dacv0AD+pv/cxgt0qvIpfWZyrxoo
 3QUw==
X-Gm-Message-State: AOAM532VwuEYWTZazBa1LQ8msOpk2yssQEdweBuPLRs83nog3+FDxaht
 f5xIKvGkZgtrU0li7Oi+fykEb9kVpQ7jNFOSuGYqdg==
X-Google-Smtp-Source: ABdhPJw8ib+uvOkPrEkasfdhGnzwKMTgUNCFIN1bKijxICPIscdKUZzvisWxeylcVzSJ0tQ16+FpFbwvVDmmHk6TsNk=
X-Received: by 2002:ac2:4c08:: with SMTP id t8mr15644982lfq.358.1643646542435; 
 Mon, 31 Jan 2022 08:29:02 -0800 (PST)
MIME-Version: 1.0
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
 <20220128062050.23978-5-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220128062050.23978-5-allen-kh.cheng@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 31 Jan 2022 17:28:25 +0100
Message-ID: <CAPDyKFo+cnMUdng_d=c5eRytUx49+KWCtrnHh9m9jU0syJ+hhw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: mmc: Add compatible for Mediatek
 MT8186
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@chromium.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082907_481730_E0BF5444 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

- trimmed cc-list

On Fri, 28 Jan 2022 at 07:21, allen-kh.cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
>
> This commit adds dt-binding documentation of mmc for Mediatek MT8186 SoC
> Platform.
>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

For some reason $subject patch didn't make it to the mmc patchwork.

Anyway, I have picked this up and applied it for next, thanks!

Kind regards
Uffe



> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index faf89b0c918f..297ada03e3de 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -29,6 +29,9 @@ properties:
>        - items:
>            - const: mediatek,mt7623-mmc
>            - const: mediatek,mt2701-mmc
> +      - items:
> +          - const: mediatek,mt8186-mmc
> +          - const: mediatek,mt8183-mmc
>        - items:
>            - const: mediatek,mt8192-mmc
>            - const: mediatek,mt8183-mmc
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
