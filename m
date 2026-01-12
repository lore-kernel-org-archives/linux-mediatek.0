Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45035D25049
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=; b=zKBjn50VMBGVWd9tnmeex/AEVj
	l4noBy+yV7Gt5n8yICLUgX1CnN4XW+mb2CM56zkEFS94Vc5IEVLqtwcU4HMWwRfoRSUTqz0ekbT6Z
	9I9F5CzlhKKk3k+oChK2gpqoljDcLlb7UXSLvEL7lO5xteZMoQxqdmS7A9asdembk8htgiQxb9GFW
	yxykdB0d9xWuQIf0HV8+1zLw5JTRWb0ktDzn+7KEhW16c81mtU1QvGqRummavkL4JIS7iAZ59p6NW
	YpF9UMnCPCtuOGz9BxfWnQf1l3dk83wK9eg7wWGwhM2HpyJwpxiDPDsw2/RCjwOBiWgvWeUXn30kh
	N/Sa3DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD89-00000004yF4-1SL0;
	Mon, 12 Jan 2026 08:18:29 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD86-00000004yCy-1cl9
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 08:18:27 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-382f9211cbfso58373521fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 00:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768205904; x=1768810704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=;
        b=YYiHj94a1EGoGpz7YzyIIoWutqmgDINC/lHcx+A6Xx326SOZiY9TuNBhuf1x++aGYq
         lVsTOIFQ5VWi0SniGuV5VIaY7Z6JlOPZXv3LoLVCMyyrF2eBwLzSXyuFUOIQ8Lfaeiwr
         Kpg763QlES95o4RI/tPWQKmJJXROdolNzzDN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205904; x=1768810704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=;
        b=k31BOhdfoR4Igz87BfbvYSYVlGYxIapeLOv3byWarU7dnqPoYZkdnFXTFnmn1OsyLV
         KH3xFhOOcrk6k9GN8TBx2062U4S9ZcP8PKZgDHMxaDW95zihccHR4NpwrojUGT5ZATel
         lRaf04lkbJanFhz23/FPshtZ3U6+LaBTWZAL9/3bSpCQH32HoVgpYTQ7dKvNOfDpXtWJ
         gPE8XWU6BzW77gI5u5DbYeCf4EXtomKnABC4eCEaU2jFBeNSXiFmX9QVGMXE8b2dfxVa
         PBsjTId2Vqx01u2dpagODz8/QN7iaXKUijQaIKhiOr7cTEv88c3ER4ztHq5160gRZkeN
         jJWw==
X-Forwarded-Encrypted: i=1; AJvYcCXqJINooUjTLMdOKyeDaFkI0JV9+/WYzgsv9GYKD3X5rY+T11XfJwSVPQJBx242U/bw/UPQ02WfIalE5B16rA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk1pYjDaY+zpCGPAmH12+sAisiWbw8jKGXWbK69bQNhgoq/UBZ
	lCpgjJ0POtvEK9q0g/NbNJbvZRj9hUFZxJinimWakOpEHKF1ORp3Npl+dXO3bvOtI4QrL2A/DAx
	fRJ+1ObKl3ytM6pHQGiCVGPeNJ6LKMDuMZlMcvJZT
X-Gm-Gg: AY/fxX44phDn84BKGHLv36WQxUszWDKk9cBnU10W289uegX4SL1wGhXlewXACDA+wwR
	PJTikjDZsVSH2iksM6dHlbgv4LG9qUWm32T0XBzpcSWhDD+I/UuFKp280QqS9B1j+9tIPX+bUPJ
	/fhqg6Wd+b6qhZRHjTsRx4KRLQ2o0yLtTFM1P5uWkoBeG805lzZTHnLN58yI9mWaQ1zF5VI//9y
	xAEY2FxZX94RzDDrbS/evyNI39JYycLurnnhgIPLTg+V2qkELcJcyl6fUIzxFQiWAU90pRMMZKn
	KM/m+qcHNF0lRID0OpBZb1Vs
X-Google-Smtp-Source: AGHT+IHZj8OtKhvjb8Ys8ElSyf3nhdRjZrZvnNua8ODxVvC28Gw2WXeKLgSbqyeYTY7AH28BYlDFxpSNkhmnPhK2TKM=
X-Received: by 2002:a2e:b88f:0:b0:37b:b00b:79a2 with SMTP id
 38308e7fff4ca-382ff688d40mr47364531fa.3.1768205904306; Mon, 12 Jan 2026
 00:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com> <20260108143934.69634-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 16:18:12 +0800
X-Gm-Features: AZwV_QjyElcmXKN67UO8XW7VC_1mJ-HQyn22SZQ60IamoKaOC4_dQt9Okx2MZZo
Message-ID: <CAGXv+5E4w==FbYVGdh+7+btZJBT6UQa3V9buMKO_z7M04RL8Vg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188-geralt: Fix warnings for
 vdosys0 endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_001826_436475_5D4B4209 
X-CRM114-Status: UNSURE (   7.58  )
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

On Thu, Jan 8, 2026 at 10:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This machine needs only one endpoint (@0) for vdosys0: remove the
> address and size cells declaration and rename the endpoint@0 node
> to `endpoint`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

