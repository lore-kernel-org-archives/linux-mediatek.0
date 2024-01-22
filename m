Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B84C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuCnBVR88ntymG76CNyDH8bqX5RV/3GbHvDE2cVI+k0=; b=We3OmIpyWZIeTJtfvmrIoAieyz
	oNzIwpXMZGEnVYip/Lf2cUspgGnGNQ9dcCEA3glDo2oWmZhUgrRTiKHJaVLAQQks1W3WtWQmT1BfL
	R7e2afuVfqIsEW+z72GLHeBG/4I76Tju6xjSW159hN2GHICmh8BECjVveMmfM1htq8RgFjWE7EfjS
	wiCgNtZ77yRhfrNpCAJOxvYX2AYTxDvVSmWX5/rq7j1ZBEM7RDL7WCe8zEatV5wKH9n2sh0dwNXax
	S4WSFzitspU1/omzKTy8xiSqWJWG+6Un6x6V0f40+UxO8jnQrI79zkNa62hJhVK+rhdT1CH3AFU4G
	XITZasPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpVZ-00B18E-0s;
	Mon, 22 Jan 2024 08:18:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpVQ-00B155-0S
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jan 2024 08:18:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50ff9bde634so545380e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jan 2024 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705911485; x=1706516285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuCnBVR88ntymG76CNyDH8bqX5RV/3GbHvDE2cVI+k0=;
        b=Jl5BaT7MPkxCOjHYaT9QVa1vqNajCB9O9mlAeATy7+4OcwMYntCBMGW/d9Wt+tclEC
         Ed8OYTJFJ13NUPIFyrVxVgoyJBdoekLtyZN+xWsvZ7X/H4Bx8YG2M9qiP0mqwXnLWHVw
         19nR8UDYLSKFxbg7+8i7JKAAbpPABM7BjI+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911485; x=1706516285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuCnBVR88ntymG76CNyDH8bqX5RV/3GbHvDE2cVI+k0=;
        b=j5PPuXmQptpPFIA9ljasRhr3mqiXREPp2FT4zcvVDpbjXsGyHh2Ov6xGaWNDP//AoV
         0OFJxmaa+t0n9iQikQgKpUw4cXfL6mmCQFFa11CL56XuGpfgLskiA6bvKp7sEuVPIme0
         7vvVDXo97t8485v7OOKm6m3PV16jR0KgjSWVWweukgp6VqRvouGHyjISOG8RWHk0nJDb
         5TmwvWzhC77VkoVtPJxqObl/aZZFYjrSKbPJfzWJS68qldYHH1wjcb1F0/WLySYpc+NS
         mWrHTpZkviiD9CrINDOMwKdjXEuu6J6iIzsItx8PFY5MQyb4seW+3IyHSP/egbKeuZr7
         PZkw==
X-Gm-Message-State: AOJu0Yz6+dvuSNEAiRbyoDbH8IBbXLmzvyhWdqKeZOTCUj76ZfqWSou+
	BkCNUJea1Z2SDM1JsrzD24ptS/ZOE4fYPYZJ6IdyChUpHoOScYOl5Kn/hLnh78kzTcWiK+v8Pxh
	e23+zwsImA44oZJLdVSIYzgkXbVVyInrJVcB8
X-Google-Smtp-Source: AGHT+IHqFkBn13JB/hRuAs3sSSx+yTST7ZFxRuIjTeHxb63T26OccgYLsj9ML0Hpe1WxHZ/X75r0bu3mEBfMQsY40Y8=
X-Received: by 2002:a05:6512:3d1c:b0:50e:3f2e:c726 with SMTP id
 d28-20020a0565123d1c00b0050e3f2ec726mr1762337lfv.87.1705911485563; Mon, 22
 Jan 2024 00:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20231213150435.4134390-1-wenst@chromium.org> <20231213150435.4134390-2-wenst@chromium.org>
 <d16723a6-5602-4fa8-9cfc-589846b75f5b@gmail.com>
In-Reply-To: <d16723a6-5602-4fa8-9cfc-589846b75f5b@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 22 Jan 2024 16:17:54 +0800
Message-ID: <CAGXv+5FVOb_X02ovGgwZ=5YpipiCfO9SKD5hOrx9eweps9bB+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: arm: mediatek: Sort entries by SoC
 then board compatibles
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Eugen Hristev <eugen.hristev@collabora.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_001808_228632_A77212A4 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, Jan 22, 2024 at 4:02=E2=80=AFPM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
> On 13/12/2023 16:04, Chen-Yu Tsai wrote:
> > Some of the new MediaTek board entries were inserted in a chronological
> > order, or just randomly. This makes it harder to search for an entry.
> >
> > Sort the entries by first grouping by SoC, then sorting by board
> > compatible strings. Also add a comment at the top asking people to do
> > the same.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Does not apply cleanly, would you mind to rebase the whole series onto v6=
.8-rc1.

Sure. There's still a bit of discussion on patch 6. After that is resolved
I'll send a v5 which will also address some review comments.

ChenYu

