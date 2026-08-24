Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB07C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=; b=e1UD2TScAq9Iln
	LymXp4AUWRgfEfnDurxabysfho1xv7Sp5fKvscXeq3+lLIuwTtnODwLJdu0cbD15pGY5XAULPZO/a
	SZBt98o+okvwWg/z2OkD23zjX5thScIExYgzbZral2ZZGL5tiO4PZSuJX7UZU0XboHyC+J5lM160m
	1rl38jANtuSqUfBsbtkdVCO3rVaUR7ndIIqfk+AOCYEfWvJvwbGUAZT20uto7mn8Ll9iFbssWYdhK
	HXJPgf9G+w+/noN3xNqDy4zDVP4M/QzEiEsGU98qIU0QbrqICb9q61gbFkxLzBBVjRLF5s8/wWHvS
	ipF2uUPV13wh0MUyZHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQjM-0000000GHnM-1SU9;
	Mon, 24 Aug 2026 09:12:36 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQjK-0000000GHmI-1Ng0
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 09:12:35 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-66c71239c48so4462711d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 02:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562752; cv=none;
        d=google.com; s=arc-20260327;
        b=hMywVqTMu8U/TI+nPfYFFnUO2JHl7BT9kEOyc5ez6bDXliZ18lXFxBa5QpcAcwrWws
         SAzhP9ku1NX4IOvKS0f9Y9XE6JeQoCglq0oOpehJp7UBCZDJZibJTZgTOJm7E1mk8Q0q
         4+6/mX3/9YLiJ2+euP5Huk9IA0Awr309EGTGLHU44qfKweiSlwoEIRldG93bHjUbHBvA
         BIrz28jTTgCNu1DIWHVGkBePy7TMCF7rOt7AvTElsdhbpVI0NU5zv71UVNndKvpLC3ba
         a/Yg0l8Mx1WQmced6FUkRcpwbBNavzLqra09OHGSB4KGWz2E8lAWylqU4VD/lBIxFLfp
         c/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        fh=gS0YDMwy+Br75bu5mzzI0LKElOiL4ECbxAGhfzl+JJM=;
        b=eyQidynGJC7ucAAeUj1JTmdsKV2ImvKmv9hPI4g8W4X+MSTaajS57pd3kUJ/0DCsTf
         rkfUIzdtSvoqDH2SFwe6MFkC42Mnhg12P3uQZpOl+OY+eYpYMqWpO0HJGaUqc6nnmfPp
         ZBh6AEfBzt3GGIUbZGPWohoLzzddZfTCo3oWoWnb5JwlVJbUwJr6+v0IfK3tAvdz+O+z
         qHPx24FThXjdvX31sCQOqX6C4YbWaCvbwaP0mqA+38MgbWdNMpPFgtoMKanQl/7D3C2E
         xDH/xSIIY8y/AFkctgIv6id8uv4jrHZwb9MmLP35/jCv5hdxh0japUHGR7wGXrIWad3D
         tVmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787562752; x=1788167552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=Etl8xhJLqd58UnKYMUYNmrEVBFIEfRC96idPMb1fcoG4McG+6ZHVjp5JCjeR88ByI0
         snm0K4KjW0PUhy+wYGZxDGYI+plkVm4zS5h6gDG8oL3Iy9BASGilRBDs7Ohcx3UguXBg
         8ege9zYcIlAXv7NlNDHpwX9R+TYsE+xqzXyro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562752; x=1788167552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=adSijR0+ChTPz4s4n5EkVVQcn7KiMk1oXrwOtO/UnRM/0cPIP3G15iMlC5rrrI02N7
         9dRaduwnEnl91wogl46zHehNu4Cae+IZNSrFLL7Rn1oaqecI2zuZPpNi52DRTKrYvMFk
         B3kMe9IWzGgIrsE8qhyPBIstdXJYlN0vsFlun6pRZAQvHY2GerpeMArLq8rtDWVI2mYG
         xuROOebVO71A6bsx0Y3cX/ztubTbYZqnYZpXOgE1MXpkpL/x0g1NcqUCiU5FGcxEJ5Jw
         /qZnAxuXP/bC2Cgi9ncOHU5UZNUu3i+YoX9J3QJUJ/9KMMnz6rU3LErrb1EfRzhq8TuQ
         /0Xw==
X-Forwarded-Encrypted: i=1; AHgh+RrlhNYIIT82UDwZA+ftf8kMi9y4Z3Fg7/nXS8CXi6JFCkj/GoC5b9nMOnKkdLHJ0SAycJnJIQWhrhXWpMyaDA==@lists.infradead.org
X-Gm-Message-State: AFuF++nB9QCDLAMhsdrtb3onB0KUxv2RQF7/X9dL07JVKRvQpI/9PODH
	1VdXOum7ezCJRms/wN5CjfAimiQKJW+LnG8vP7v8W6ILGl75dUqWAicwM5itCkDmb620y1gHU9J
	pzpTtMbOFlGtVfeKkdej4n/aizStrOW3KO3AL6pYXMqMRxiXCV70=
X-Gm-Gg: AR+sD11NxTuxuWNxCCG6GaxrxNXuzAeCzaEya5b03otw14K8sqQa6x8xvI5RQ5cYWOE
	xA1Eowg1NOWEZwd9EA8QkS3avEf6Fr+gQLPRftoD11PdOwRIfzIP9kC/tWpOxmRVN4YVSveBfVl
	dSY/Aqqu+hWCRiNy4Zh7xZAH1v3U29PqTvdUhYCwLXvPzxJR5jj++89/JyPRtGY8d8J8o3mYTGE
	5jX9xt5wBoNbCH3t8BiCRyWLebaS6KAZlUM8ltbJD6CWrN76eBo1gwhYBP3QObxRpRdeJQokwsT
	1/qhdBhnZJwTbxyEW4m1BDr3rI37F/Xqa+ZzuU37onucgFBXcn/xIiGDx5+NJwK/lWydtMky5lY
	=
X-Received: by 2002:a53:cc8d:0:b0:667:a285:7624 with SMTP id
 956f58d0204a3-66ce4b02a7cmr6592191d50.35.1787562752511; Mon, 24 Aug 2026
 02:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260824090409.203230-1-justin.yeh@mediatek.com>
In-Reply-To: <20260824090409.203230-1-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Aug 2026 17:12:21 +0800
X-Gm-Features: AcwNN1UaUKwCCupiOXtWdw-rOGn8WYmR4nT24X-TqWmsTUf3H_iO0AMalDMrH3U
Message-ID: <CAGXv+5ERR61sdVK6VYugeCnOaEHt8XBUZZAfj_GXvAJg0hiWTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0
 memory region
To: Justin Yeh <justin.yeh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_021234_370418_F1A7C331 
X-CRM114-Status: GOOD (  19.23  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2026 at 5:04=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com=
> wrote:
>
> The SCP firmware in linux-firmware for this platform
> (mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
> drives through scp_c0. On top of the segments it loads, the firmware
> allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
> outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
> over memory the firmware uses.
>
> Enlarge the region to 9 MiB. apu_mem starts at 0x55000000, so no other
> reserved region has to move.
>
> Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first S=
CP core")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index f382f90c48f5..35f60b5bba6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -166,7 +166,7 @@ reserved_memory: reserved-memory {
>
>                 scp_mem_reserved: memory@50000000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0 0x50000000 0 0x800000>;
> +                       reg =3D <0 0x50000000 0 0x900000>;
>                         no-map;
>                 };
>
> --
> 2.45.2
>

