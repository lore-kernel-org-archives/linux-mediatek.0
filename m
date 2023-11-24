Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92238C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y622WiMwHYSWvpg2GlDOi18NUNokJQ6nlm4sUNqp440=; b=uScTuuLQdM25fzXE3aBWJLq0bB
	75pYQ7PVEktn0fZUr1svO0XnnKKDb0wT+6pzprukJT8Pqc8zyIFoIQFqHFP7o8wBP1raFJ/8tqdFp
	LZZKoSsqpBL2LQfOC/MLNZ3+mgkmYfAOoCE0g4s76uUPPUbJ2cYMdnAfto+Om5ixm3xq5bcLaUjJw
	+mIaaJXJYjjQt5lUbU6lA06uAyVb2uEsgiOb5PBKtVXj5JHycOkXw515eveOwzLw5KMwqn7xeFYZt
	+FrJjfip9xhuo6nrEArtzHGll7Ui1HDx+PBhdW7LQ+38Lrva+EEkvxHNMbYpS5NpwR3j2JP2chay9
	oWsGYS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6SoT-006jGX-1y;
	Fri, 24 Nov 2023 09:49:29 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6SoQ-006jEp-18
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 09:49:28 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5cbcfdeaff3so17394637b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Nov 2023 01:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819365; x=1701424165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y622WiMwHYSWvpg2GlDOi18NUNokJQ6nlm4sUNqp440=;
        b=j0Xk8ZYpnsktnsgSV3hwZnK0aaL0GWxDp1C7H4m4dRRhH39fUX0dwRDF7I5dg2YHoF
         0AcbClIT6E1eOwF61aM7Fyu+cQxB1oXDvrglizYM8jGbzWiCApX4SlOU8x12dm8yMvj0
         UepzCXbZf6UhZlj2s4eBjztRReJ5SfiQN24DNSyZ0yYmAId3AbutP6VOvWjrRECshRHM
         wT4pV53W942i9ppnnoT+7H94+yanq/8BAkAvY0LFdPsvuaNqkxMRm6txrDDMENzxrURR
         oOFW194GV2ogPIeKo92luOPEyjdbj86OmvKb8iB3KyoCXMKi9REOyBVqldTJxcE2bLzp
         J1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819365; x=1701424165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y622WiMwHYSWvpg2GlDOi18NUNokJQ6nlm4sUNqp440=;
        b=X4SMPc+38gLXMD4O0KIshS/RbNcr4IBmSySnxDwZtagL7cADyJgf8VQlR2JcjjP+an
         OvT6CAEKpD5W9Jv49FJz6kriLLwpflUGyLb/cbijgNnFDZthFbyo/0m9BYYOu5Fxo+L6
         aZny6cOXnXRF5DbACmyCNSViD6eJfEk9+9bJRAnKFHXWaGWYsBBUbgpJ6BbWsjnuVGeu
         6uNPW8VYt/5qvH+t2EaDSE1IA4bnWXuc52aYX5uNU6Z35ei3gXcvH0Wjqq6tE245bJRG
         6bqQEFdR5LLTYlFhigktR35eUjPuWbLp00brbkROJxvMJbbQOur4cxUDyLGi6DEDSGWW
         aOXg==
X-Gm-Message-State: AOJu0YzsfN+j+xVQivDx2CzvmcaA39I8M+vgWBXC1pko/839uVzzxgGn
	dtXHu51RzRJ8CLWOpJgW1ZEBm8HS8TLc92JNbaIsng==
X-Google-Smtp-Source: AGHT+IGjpukiK1tECzhi8Ll3VSeycM6tp7xdGxGsh0QUN11xzJy3u9DzHTy5UqDem9tLcL+crrEE8x0xvXGeMvgE294=
X-Received: by 2002:a0d:d4c6:0:b0:5cb:89dc:ccea with SMTP id
 w189-20020a0dd4c6000000b005cb89dccceamr1961171ywd.10.1700819365616; Fri, 24
 Nov 2023 01:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20231117104315.9718-2-zajec5@gmail.com>
In-Reply-To: <20231117104315.9718-2-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:49:14 +0100
Message-ID: <CACRpkdbwqy+LNGi-7rZjPLWESbKJSFVzry6pAGd6aTnq0ifoDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink
 EW-7886CAX access point
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Chris Morgan <macromorgan@hotmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014926_390374_C01BCBAF 
X-CRM114-Status: UNSURE (   7.61  )
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

On Fri, Nov 17, 2023 at 11:43=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gm=
ail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

