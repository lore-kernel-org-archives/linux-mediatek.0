Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C651DC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyD9HqZtSq4vczMlJ+45sDNKk0qk+SBg5VNyok2uFx4=; b=WAgJIWK1oy9Vn5391lIhADs/di
	YeNgKZtwo6gxhw0AwmrR7QOrlfDnUgYnAqO7dBSuDtNQ2G4EVvTRyazuQJ3YswjtDiLRosX2TrQEq
	b/T8IriLohJ+rpFIxgyRhyTpqyvZEEwSciA24eSEeIphN4Urxpte6eV40WAVxBrXA262C3rTIauyA
	VTcOrDYv9P/qqQmlJxUl9pQqvIXUTJx8aDHKHTHtAyXr0flWoNQ2aq/e2eBuHMB3QkNut5Il536xH
	Iv4LUE0CElH+V9K9U3u/m8XSj11xpe46VkbFBAtfxd+/6H8OoQQ1XiuuYKn6u3gUVtfcBL6Wq8iqz
	7n2tzDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE3M-00000003DHP-1rXx;
	Wed, 29 May 2024 07:48:56 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE3I-00000003DEd-495q
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 07:48:54 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-df771b6cf71so1810755276.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968930; x=1717573730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyD9HqZtSq4vczMlJ+45sDNKk0qk+SBg5VNyok2uFx4=;
        b=NS7T9ogapMKPG5xf4fz/PS1lfb4RkFvutM3Nq4P2B7sKODv2wMIAAq+ayw0ozV3SM7
         JQqGFS3oT644Eje4v0XOmRv+Xi4dGRRSRvkKAAKVJpPbAS6oSauSA8E9pD/nAZS6tX6V
         6mqXuG1bJmfCNXcG0aJHYX0c738PhS6C0ob2qQMN4EPQF7BFnJgdYwcPPudiWBoKRYYZ
         7273C4TjXaG1AUfEWuRLjTzIsR3s+4LV8Wf2Br1XKcCUICFDJzr/79exG8u8ClZgjPQq
         IyCHPiSGUiKEGwF8ItI91wq1OghqJD3Mw1+WMIrKeGEPquBCfTU9rmfqp33lc8J958p8
         J4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968930; x=1717573730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyD9HqZtSq4vczMlJ+45sDNKk0qk+SBg5VNyok2uFx4=;
        b=Dy+M6jQRDPYVM1KmziVAUWAtytGSSLH4UpNBOTrtFE7yNu6VIq6XTV8zGfqopVdb+I
         KYVQjkyzIoGAT3IDxpcVBrDQvL8oVURA5imoOyaz0nz2F0Xqu8vlVB1XoD+Atw5P+stY
         vqCWAHB5heBVzx/Cl7vnvQGWZDuYuPmbRbgwQfZAUEiV0fHHM2l7WtViSneI6itqUaJx
         qKOBmxpLK5Suw43XiIgjSX5ZGslK8bRToMf7WT9PVd7RkGfTHpztJaY7x5Jpc6S8ZYCj
         nTNHA7HjEt4ZD16pPwsxpob/mRaFxcNN8i5C68SQlSWecHZq5a/iuQxwkMppQ7tjhxed
         /2qg==
X-Forwarded-Encrypted: i=1; AJvYcCXgqxe9BcQhKViPWKh3GLDsj88Vkmax/boqFx8AZtmMFv37q2ctqHEwsNqaSbnJq4kJpDrwdZh7BTThtxpHa024iEqdDqBSH1gMczq/AhdnVvd0
X-Gm-Message-State: AOJu0YxpG9hCqaY1wJG0LtUlEutFZceITP5uRUfxHQf9+NccN8c5n7w3
	WqUA3+rO4TAdZM0Gb82SIFnv/s0LrEyhFjqjNTrIHXjLwXpy0ODsF8KlcXve+2giCCwatLsK6+x
	M1HtPFJ+UrM4WnOt8hrSMBoMPrG1xkvizaWPl7A==
X-Google-Smtp-Source: AGHT+IHSd/PXVXnQLhPVNg7fFhMrsdBcZFygKj2F8W4r8xr+nErsQNh+mjoKNVlbSYTvLms578njjoquRxDdDDoH63I=
X-Received: by 2002:a25:ad8e:0:b0:dcb:b072:82d5 with SMTP id
 3f1490d57ef6-df772267f49mr13018047276.64.1716968929711; Wed, 29 May 2024
 00:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240527115933.7396-1-zajec5@gmail.com> <20240527115933.7396-3-zajec5@gmail.com>
In-Reply-To: <20240527115933.7396-3-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 09:48:39 +0200
Message-ID: <CACRpkdaSsY0PnAU=UKJ0ZGLw0gJnBu3M9hQiQVBWjZF48cBO9g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Sebastian Reichel <sre@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_004853_059651_6E4245E8 
X-CRM114-Status: UNSURE (   9.01  )
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

On Mon, May 27, 2024 at 2:00=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> OpenWrt One is the first ever OpenWrt product. It's based on MT7981B and
> has entered an early production stage.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

