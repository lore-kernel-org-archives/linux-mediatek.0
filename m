Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4299C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaO3aHdjj7LC1VgBgX7JPhJKKz+gG9+KGKvv6CQHqWM=; b=BgFwU7hD+eZP2UwjqyRkbY/CKo
	jzyLTNxUv/HY65unt/YFesc3UYSAeNyZoEaIRhOfaRsw22w6BAEhhEj4Yzda7odLQ9CaYO3pnYOCd
	0onit4XBhrLhOiviEkpkfkEI4WMWjie+r1cVrB6/AdcLohLQuQQY4w0lidRaotuFG66jBQCFahLXH
	cZ5TJzgnagiHFj7+ROFb8C28Ozfq43Iyz2oJQpnV/ZDmfIGc8/mTNZVuXLyJyMDZvXSJQOy5gYeLI
	hNWb8Ttx/1Q0n6fL9+pMbbFHk3pVAwviphexIoTLELWAkWsJBy1yrwWq6/91qJodKBovMO8rztArN
	gckLPFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDxM-00000003Baq-1sR1;
	Wed, 29 May 2024 07:42:44 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDxI-00000003BY5-1PUS
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 07:42:42 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dfa48f505a3so360692276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 00:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968555; x=1717573355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaO3aHdjj7LC1VgBgX7JPhJKKz+gG9+KGKvv6CQHqWM=;
        b=E53Z2cBXZaKamGnxhX5AZBZ7r+NnAhE7wnqneiyXvqoxpmn+5MvbVcTx+YLVK/NpGt
         L9TyXkwTqwUcpZEMVe7iPwM0hEsIDAZ/chfjLZaC9ckp2Bj1yxM4FU9T1IEZGlJccD+F
         OnxxtCfe/JmiwoLt6IkytH3sbKrmkTj+hMjuakpJ2nuLH3uSb3vshrPYLZFEMjnyQmB/
         xjx1KHBG1GLnLGGL3Xmb/eSzdKQr07dbeIWkCNY14msKb4R7rJzhKSDlLatYIrAp+SNH
         jDqZCdO2J2Nbv4wWAzd29GGM7HGEECRrB6sfoS0Z0cRpKY9wrR9+puu/cCtrpo1n9TuT
         VyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968555; x=1717573355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaO3aHdjj7LC1VgBgX7JPhJKKz+gG9+KGKvv6CQHqWM=;
        b=fx0GlcIzJJmywqfsmTc54SItjzYKBt8MVIlm3ySIKZVU7LmLA9a1yGRaQe56Kc8h37
         LvwHI37URF4W6nSzjplvU035qrgnnuPvqp7vBKEv3YE5bsFk4haxo9MDdhe2ee7wVA6y
         Kn0zvlJAMCXhjH/rwlVO+rNm4aoEv5kcJ4/SHZ5qw/jrH0edc+DJHcjqlyKYTKRa5Hh/
         eyQJTnAE+1FQOA+Xm2WvCEq76Ku0MQO1ex3bC6hMmVd84xvTsXp+66/U11MyCqhCOZmy
         w0Wd5ykTqFTMNiiZLh1Hx5nIy14tMPRtlwE48Iuq8sgU2LCuL59V8obUGTr2ODFPrnGt
         b+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqrTQPTiR3DVQ+/K+AHqAjAX4QWnZHZ/FmP1/YvqX+Dxmyluk3Yk/BVA/nQnzC9VQ+YQevAODYkGKmn1jnl1uS8EIZeWhnDMgxZGgPg4rbEG0C
X-Gm-Message-State: AOJu0YwwbfPpxsmLVgrKHrfLJDguRZPMjP4C8zvdV3gOj7wI/kwS7JrI
	h4SFaizIUEHNsKEZMrLotkTizzKEDurNUbL2TperS8P79KOMOoK40nCoMFdgesewcnASUhw4upF
	VSbWPBRRo7XGwPNz2YGzZUHmf4X5O9EDdG/mpBQ==
X-Google-Smtp-Source: AGHT+IGFvz606hz3gC7JBXtHPotg3mTma00HFlofyRFsegTt///1sv0tQAk8wPQUbRZ5YVVVf8iIKVOpjk0LeEAjzLs=
X-Received: by 2002:a25:7446:0:b0:dfa:4680:21eb with SMTP id
 3f1490d57ef6-dfa468034e8mr1388083276.43.1716968555460; Wed, 29 May 2024
 00:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240527115933.7396-1-zajec5@gmail.com> <20240527115933.7396-2-zajec5@gmail.com>
In-Reply-To: <20240527115933.7396-2-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 09:42:24 +0200
Message-ID: <CACRpkda-egxVtP8Tan9T_EfQX6ekqQDf3LaVUu0by7aWY1Qmag@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
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
X-CRM114-CacheID: sfid-20240529_004240_626071_232D776B 
X-CRM114-Status: UNSURE (   8.13  )
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
> OpenWrt project (with the help of MediaTek and Banana Pi) has produced
> its very first own hardware. It needs its own prefix.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

