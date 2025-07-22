Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3402DC83F1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=; b=cG+hHmilwJ9d/zIiHv4v6EG0yG
	pLfWqNSUT0+BFRpukKz3Y0GBgHGIjxi9oQWkUhzwnxZ3MByuZsAplnBXusL4I+GEX1kWHpJlmssL/
	UhrhAAUP15/mUIADtda0RzQ7MG3GK68aPdY1Y+aCmOXkJ/5DRDLv8vsVszcatJnp33UbmeywPdgSQ
	OKhF0E0BcLt9i53yRG7u5UHRRq2Zu8YHBVsRybVJWg/y9z72lfBBIl8Fb/tpsvMlsMKiX2PxYcnCK
	K8KZXmpcfULtx0nUnRFxfgqDXHwy07hwK/ot8ZO3xPxdRJGPlVQzO+MViU2ktFpdYuOGz7PI84Mjo
	KW5daIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Kr-00000001JhL-2G0O;
	Tue, 22 Jul 2025 05:14:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5IH-00000001JXA-2h1v
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 05:12:03 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-32b50f357ecso12161841fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 22:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753161120; x=1753765920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=;
        b=Vi6h8/CClN8WPbP/lLu/nBOkwhiPD+fM+r8/pEO0iW/wMWzNPtxT9Zm0w4qyMJK/Dx
         NsN6xojNzg+YJokU2UDAfqZKX/yjhpP2CTDLvBg35uq2hAqZ3JCfdrpMH2RL6u7BM51l
         iXdn+hN2STz18a5BypW8WutJAsErZWGktM8/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753161120; x=1753765920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=;
        b=WqJh2c8TI9CzDTTcsyH+6CzPSQGK/9QSSa6boViGh15FLO9iviAlnF2B1wcOke3/C3
         0g48p3Nt3JqPxZxEMHyK/7Y/VofvBoCMr00aBt06P8GSR2i7dRDQGaLhiWAywk0WMaRg
         dIY9G5nYL2RZKA/D6d/2101IeVb9YwFqgF6+YaFZ7hofW32dhNIsU38mCUirAmMez23Z
         WQlsBphl0b5YYb9OECQdzWFKX5WgV2LNSSXKvnZKAUs8AGFnXdbygPHLu+XnR6iBgUvM
         hp0PyU4yhhX7lNus4bMWZSHJ16vzgdOzHnC9HpDn893QzldmZ8KCz3MxwPJbMwUkkwph
         ZaRA==
X-Gm-Message-State: AOJu0YwSsiE+ErKC5AKYsnG1N2hqhSpVYWtA5XH2tOdP35rCJ2NezTk+
	tXFGUyvTUqEG6wcqCQ5/SToy9YTXkqS/BinwQt+Je7OFIzUm3SUr7gS28lHcW4/F4KF5nBxUgnr
	saRBv7UDJ3qFy6S3Io1TLBICdwBgDASxTii9QnaeF/JenkVA6ANg=
X-Gm-Gg: ASbGncuQVnENiGdJayoxJM+xgWzYuftU1tO+uAc4T4V+e4F47TK0PRGlyRUYtcQf8WT
	KPnI8tglPg6a1X1l6GYWVHLYCJtVkB0+SuxSrSh9hqeYfujKnGP2NN+mPOQW6YnImgEAYgH0m6L
	zJPrr5KDAFyOSQPmbePt7mMs+eVE8G20ukJ77Ta1rTevj729Ea+2LcXq2eVX0Bdz6mlLDb0NoFg
	LdsRPS612IRxnz/HJjrFxP1sh/qI/uporE=
X-Google-Smtp-Source: AGHT+IH22/vbUKUG8iVF8TLU3Pr09FJMHHQB0cP/VJ/YH6NAlscN+8Vsgqf7M6hY2SpFOoAipmEJQYGQAxTIjPOplEY=
X-Received: by 2002:a05:651c:220d:b0:32c:a097:4140 with SMTP id
 38308e7fff4ca-3308f2bf935mr75562221fa.0.1753161119744; Mon, 21 Jul 2025
 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-2-angelogioacchino.delregno@collabora.com> <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
In-Reply-To: <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 13:11:48 +0800
X-Gm-Features: Ac12FXzrJFH94VROkFmS93jdH200nA-PFU34ujXfOAcSOpzNe3a_1b3sR8e3Sus
Message-ID: <CAGXv+5FAm2zwnVZ2+YHiSJdMoByUh_UV3j4yNTmo7Ngv89Ck6Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_221201_907517_519C305D 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, Jul 22, 2025 at 12:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks.
> >
> > This chip is fully controlled by SPMI and has multiple variants
> > providing different phase configurations.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> The descriptions match the datasheet and design notice I have.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Maybe the supplies (PVDD[1234]) for the bucks should be added?
Not sure if the control and I/O supplies should be modeled or not.

ChenYu

