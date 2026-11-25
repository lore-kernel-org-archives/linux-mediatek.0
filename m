Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D652B606A334
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3TpknZ9Q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z09Id4Z8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=; b=3TpknZ9QPxQHi8
	qy/gjOws6Idc1RAk2VXrzaQHczkZwhuTOENpIeODVqxwN6hCGtLVsnkoYALeRTOCd9Q2VRt5XKVNn
	eTMMn2ALIB1hfB0Rk7WABi692uGLczuTSejP5WIg/16v221bG6jrump5ffJskOT4wIAbLBmGC7LmR
	m2X07yE2yHsEEJaNmXWgbQmB0nEOdbGUM2kH5rtcH/lE2KzVYw1lZzDZhvXxVC4x7YqMdFFfddoHk
	PRJ+RZMIFfP2/Lh+mqiMlUFLV1/Zi1Ip02ormqJWpucTOPmTl933WmFkJ+qQGGMajUjEuKXzbp8Ee
	k7Sou+ioDhsfYEXKJZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHje-0000000B0Sw-2Xzf;
	Wed, 25 Nov 2026 18:28:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHjc-0000000B0Sd-24nD
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 18:28:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22482429F9
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026C11F000D2
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631328;
	bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z09Id4Z8vbGXWMkS1WR7gKdR39oEkIz1JoFK6v2fcJ3HDWZQEH5Wg2j4BlMbe5Tiw
	 Op07GQ7ZOBQPpPQ33dWnYZbQlClfUZwMO0/aaeAbFHLbf2VuNc/CGRuOxL1ldqWzpj
	 99zYPOLVb2nNRTZejieDWlitrmHVwPhj8LRvDufiId/Sh/nJe7+/4//2GKErIvO2YK
	 MEfTnlSx07Bzs1TEaYccXsWLnUbFHIHvis66TU2ZakXfOkROUwV11u3zZPDyeqv6U9
	 dqbIX3OHFGaCGCsAYinLTu5QObKclEib2rFg46AGmWpBgO5YmZfUL2Q7K9SxTy1YxL
	 TFYxMI+cYPOQw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso4178982e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 10:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGWZTJa+DFP25PQY3cuiRr64X1tQZinCH1AnYQ3zWGeSwuGrxX2fZA/ck+3VictDRg03at3zkwfXG4MK/i/6g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8sA7IjUuHbfwTfOj/GNB+l4S9K6Mg1CepFBsIe2T/eAU1C12af
	iZOb8Xc4mX9NBOfg3khUh3AGEezfCug+P1tBsgjPTUaGZahWZ41Hcs+FcCLyUtcGY3T8gXCPBCA
	OJrYPOLgS1kzCB2PWGBEMCM+B/CB8ppU=
X-Received: by 2002:a05:6512:a85:b0:5b7:f75a:ea68 with SMTP id
 2adb3069b0e04-5c1bc7df486mr4990618e87.35.1795631326771; Wed, 25 Nov 2026
 10:28:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124094059.3882014-1-john@phrozen.org>
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:28:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
X-Gm-Features: Aa3M54q4ONvPZcrPiz4EM8PUlUrVb5r4XA_5oO6TkamikfKXWeoyqqveph49Ceg
Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	devicetree@vger.kernel.org, lei.dong@airoha.com, Linqi.zhang@airoha.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rajeev.kumar@airoha.com, 
	upstream@airoha.com, Weifeng.xu@airoha.com, zhengping.zhang@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:41=E2=80=AFAM John Crispin <john@phrozen.org> wr=
ote:

> Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
> binding for the pin controller. Patch 7 adds the binding for the GPIO
> system controller it sits under, which also holds the PWM controller.
> Patch 8 moves the GPIO register offsets to the common header, so the
> AN7589 data can describe its own register table, with no functional
> change. Patch 9 adds the AN7589 pin data.
(...)
> - Split the bindings in three: the syscon compatible (patch 5), the
>   pin controller (patch 6) and the GPIO system controller (patch 7)
>   (Lee, Conor).

Once Lee merges patch 5 with the syscon bindings I can merge
the rest to the pinctrl tree.

Yours,
Linus Walleij

