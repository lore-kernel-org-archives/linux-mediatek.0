Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E9CA1010
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 04:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=; b=aWcvm2KH943wMKAv8qrOUh/cj2
	9iebh0i9PdVM/8Bq7ZQ8vcGx/JQQzm/GVinXWacJZgHd2pWaJfK7MxaEZWa9KQcD4k3hRcjSBakey
	ddCWD6qBb19gWbi6RYSbhLpvmw5+cotEc4c5VOuWVCdb9ncnHM0m03p1aGYcEFvJaIcfcAHmw7m7P
	NLQibU3eZItmuMc5Gpga1Iw+1yKKlSz9OzdyEhgP2pp48cXtHsQS2MmSRd5B6Qhaldu92G00DaiXw
	6jScP0pKmjIbp+/VzBKMbUlOo5m4yzps/eWyfK3SlR43v3pmJC8FRF4ZOWPYTN6/kjXdj07Bh/2MX
	ErF//73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO4O-0000000GjOO-0UmH;
	Fri, 05 Sep 2025 04:29:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuO1T-0000000Gibs-3Tns
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 04:26:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so2485136e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757046361; x=1757651161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=iwc7A4OH1+XSMtix91Rz0dRtWUrIMrn4SBxza9vzOJa403Pqpl6NdGW5QgayQdT8bs
         sc9DX/9qfvP0ztE8Y7W3BNSag+rAsZ9upI/e1WZNEeyLZakzezsrXgF+Z1UwwCFJ/b5g
         RF7SsOBTJlikgtazJpr9ubYDy/kbiCroCkCJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757046361; x=1757651161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=pLZELcekogYFNAvEGq7PYJz+tEufjd77/lNg7hhd3HOLssCiCcPxR6OpXnBRVIEO+v
         fjGN/MwFThAxE36zwHAO1jqoCGsIdne0Alq69prFUXC72mh3wKhfOK1nDVMdeAX32ZC0
         qaLlAPGtRHK/UmMD3Knw9ebKA1Q432WrmG/AQRG5Xl6Bei4YLg++28Pj8ASjXOiA7AuP
         ueHkCNxhSnkb7VPqmWsr7OjVvWgsld3LfqVV8raCDrqMJ7za5FCjSgWIH2yVNHPKUBmP
         DJ3UHI5x1nLL4k7Wwix99iSUEsIHMLIk3AW6eLymzvvPS7gUqCIHGbIvUnAYf7iPnLDC
         sOrw==
X-Forwarded-Encrypted: i=1; AJvYcCVepex2/xxRkDOR8iVlIXMsDqEnDgCg2Vjz0zs4wSb2ZmsM92je9LKSJt66Qdw1CCG0fUpgXZRMNkvUp1JbYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgBEhbcQPHmnukibzNgWv/wOG3UrX7wvAmNT8S65p7pA4MSoCE
	FRSeGFHEfgV/HIGmYhzeE6hzyyQfgb9x+k5RhD5cB6rexMJaJip6XfHnpwfpO2lfh3J14qaDa1U
	DrE5JdyHpEdCF1oBmSuDV5f+f9zGwpsJkUABfL3ww
X-Gm-Gg: ASbGnctssHmxnxuB29bu7gFMV1gxEAPGRO5E2KQTP+wJLLT7SRiAwgymeZUtmgyVrc8
	qkqIMWMZ13T3O9M8uRQeNiCK9BEZBvhLTuRyas7/zu2h18Qtg9sNzBkKTzzLHjeIu/QnzpBiLfo
	EEL84jaSNIxMqejLnwtHeIG4LOUo5tDVIMc3KcoHHwo6gznT4bXyXhaTeB682/nGaRjNh3hO/xa
	8LwWTiqYhDh8eFWe0Q7Md/hF5CYKzDuvxsc/w==
X-Google-Smtp-Source: AGHT+IH5pWHA8nQf6AbDXyeEcMeTEINpq+oHNFsdmhAJKkVR1+KEZHE+PC3gHq59gfSmiiSALqCN4LCODqxkvK4xsXI=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr666761e87.7.1757046361254; Thu, 04 Sep 2025
 21:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-8-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-8-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:25:50 +0800
X-Gm-Features: Ac12FXzDHpGuz6HiaGhCY4WidH-LRTm2axo9L1u6x0u8-eqIT-uiyLk75FyGJCg
Message-ID: <CAGXv+5FgKsg0sM6EXeTL=du2BY1xgH6jVmtQtb2M0kY3iix-tA@mail.gmail.com>
Subject: Re: [PATCH v5 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_212603_891642_C07BE92F 
X-CRM114-Status: UNSURE (   7.95  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

