Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F279BC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=; b=jjrsrtgeUvSA9fj+4WHIKAfoy3
	umDr7+4JdmPPegtq+BXIiCQE6v+/M+LhIMMxEWJIDHHbzFAg0zUYMnavfrYpPiUjVEaG9Nkz7Vs5j
	5PUVqnN+xgFZ5ByRmiVAxJ6TT0HPJwRs8MeOWX6mzsIzx7c2vNwbnWWNgCOzJN+t2qyAtvpw3VDR1
	SZVkMxxlhGy8wcpnJTGJsByaI8lo89dy32M4f6SdDadvD8qWJAJLMJ/xotLMVY5K3blCvyrK5okuM
	+1gFwPzC4z/2MisaT8xqNqZkk005x5f9NJxiVmrBn2Z84T1Et648V4Ladum4rCibR1JH1PYdLCM6H
	0cX2s0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEG7-00F6jZ-G6; Wed, 01 Mar 2023 04:40:07 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEG5-00F6iV-Ov
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:40:07 +0000
Received: by mail-vs1-xe35.google.com with SMTP id m10so18009215vso.4
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=;
        b=X9NKtJL0IJE82T7Th8Dk6OnTlE5QS9XjUMbMbMjCtPKJScjlgzMi9tRe9haNk5I/bp
         a9RvGAstNTzMucSeHKPPx8MvbmVGQGR1s+LPQiX5jkKZ1ObsOwdQPM7QJwwkqXqXun4D
         Mj6sb9oTp0PTfWd7kvnK46taN4Ed/rdZOW7a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=;
        b=CWULZo1TrfpvDP/4lTWaLA7WHA7n7UQPIG0L3BOCAjaq3ErMKtVHPiJMeyfo4YUd3F
         ajuyf4NEL42rzoBmWEEGpYXpnNBWpNyrPo98UPr0mzJp2tVqOolKibqQGpxq3vUL2GPe
         WAxstdbwZHZ6Fq+QumjKwYdorjeRkVyK58mvRNJDtTFpD0H9BPGz+eeFG5YHICAwJeRk
         Lwt8FQc08/LnVa6lgqwyaOgSY3RhlIGuM+XFKOJh24CqimzK5lk5PBMTpOXKDN0+yWoA
         xIZztI7dcvw9R1pY2ESMPd0hE+EWRItLP53NomdOJ0FLCuTg2YTcsHBbAIhcFy7GF3DX
         5baw==
X-Gm-Message-State: AO0yUKVYcoq00HKKv6Q+B36vwn9rEJ3Ndi3smg444GLaSzwIaaBQAYrs
	eRHXTfoXLXbEBC9S83yriMxZFQTtkYmZVKVQgXAqvQ==
X-Google-Smtp-Source: AK7set/20vPvgEB8su2PX/3Zm906cvBref6o6YCdNAAccIVwSoFTAxjK0qhveIlYt8n8nLOyXZEv8bdecjorFvsqMyQ=
X-Received: by 2002:a67:f9c5:0:b0:402:999f:51dd with SMTP id
 c5-20020a67f9c5000000b00402999f51ddmr3423652vsq.3.1677645604447; Tue, 28 Feb
 2023 20:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:39:53 +0800
Message-ID: <CAGXv+5HF59-QFK-CTb=JLLDb8_J-JrgbzWHpmNWKR4JqF2O0bA@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] arm64: dts: mediatek: mt8183-evb: Couple VGPU
 and VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_204005_823912_FF6CFE3F 
X-CRM114-Status: UNSURE (   7.02  )
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

On Tue, Feb 28, 2023 at 6:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as they have a strict voltage output
> relation to satisfy in order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

