Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BEDC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOG7EXNpbCQF/FK7NgcIhsZjmEslJSuxN767xxFdzrM=; b=Z52sk+NhS3DInCgii83XtX9OAU
	zCsVJv5aL+9AbynQ3neaJxZMme05VMjgcDraIhpQT+7mjfcSBg5p+WK8go2mLu2gs9MtKWEtK594Y
	rrWI5Dhkt3LnUSeZ2XFjg7r9OuLJACu4IDjEkJT6WEZr4po3osr9QOQhPvzwxPkzgUEGtoz01jBZL
	9nMUkRuqhNbqDGUtC0eej55z83jWqqfBvcS+KrEVIrsHRZDuelCwHkyt6C0qbnQqWCiOV/mD34tCN
	p/Dv1HKLmJ4aPUCttDUwypbS5rkTL6ELgCWo9eHMiLhn/VAdACj3WuKpoKv22uDJ75kyO7z6u1qo3
	9ImIJpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjh9m-001ePq-1W;
	Tue, 04 Apr 2023 13:57:06 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjh9L-001dxX-19
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 13:56:52 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536af432ee5so615751947b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680616597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOG7EXNpbCQF/FK7NgcIhsZjmEslJSuxN767xxFdzrM=;
        b=c0QPXE/HaATOw04uUyouWe33f7wYI0Gv9yrnJ/BtLOmZ2x7dDrUf3+Lht5pe/vWj8U
         PyzZX6FfyOpHP5wKyYZCK6EQDJ7nqLYQsoLowAgjvykIR38+KPw2yxcLBaTY5Xn0CEID
         Fke1g6Ii4InnnyFybyNtl1M7H8x9AxOkI18J1LO5oZmq9DqbhEMUH3EAU0wHyoc6R1i8
         q2KJ7WwpTwic4zJ0z/1SW5hh1Fnu24KAWI2g9Mp5PmfLHoQ+wykh5YQjOmXnHb0eN8m+
         m8QM3kJnt7gQABBijG4xCePSN8mTvn3KelbspmSjXnETJkX512C82xtPv/kMvL2kXMV9
         Fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOG7EXNpbCQF/FK7NgcIhsZjmEslJSuxN767xxFdzrM=;
        b=gDWus7PbYOMYxB8wC8k2ZhFZDOZUIVdw+WU6tsp4qD0Q1l5UGeaXMM3lbbnKTfas5W
         d89gKhPLuFIt9lQ0mCjzgWJtKJlPxVdjzE/i02bGdnz48tng+BBwfaani9rj5WlkKQhb
         xjxPZqd52nDfvbV8UQIJcXImyvwaVih72bYTq34oNljaJcw/qCZBEVnS0iGMT8p7M94K
         aDxnYBZ+pamFz0cJnq50VjbK8yochOzgGk2IHFznGVFTASYo9sxHAusMtCF3iJWJS259
         oFpldJELKbRaX1E87IHz/jqnPrjcKIGVzKTCMWsv++DYsvpI0ajsxLkrmxU+OobNCy5z
         7YMA==
X-Gm-Message-State: AAQBX9cnJXgjLs/N9dT85GBZjR9FAtcJlXw/9FFj8kTA3toX6ATCOxyk
	3VJxszB203VFbOw+3y0m2WP1dUU/UrIpHPTRF4L2Qf/gyD3gUbpEbBw=
X-Google-Smtp-Source: AKy350YStYRZxmzUFjuh0G3rUNh+k1xCbee/1MWyMTOZE+CBKZN5euk0gmxKuhQhrjExvhnBVB5UMc35uItyJbpnS8o=
X-Received: by 2002:a81:c406:0:b0:534:d71f:14e6 with SMTP id
 j6-20020a81c406000000b00534d71f14e6mr1538463ywi.9.1680616597438; Tue, 04 Apr
 2023 06:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 15:56:26 +0200
Message-ID: <CACRpkdYndXqTXrTakwv1mbvJBs-tG+pjOpLLCgS9crE0aBj0jA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Cleanup Mediatek pinctrl device tree binding
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_065639_427637_826F1300 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, Mar 31, 2023 at 7:39=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:

> Deprecate properties which shall not exist, leaked upstream from downstre=
am
> kernels, there's no reason to use them. Here the deprecated properties an=
d
> the generic properties which will replace them:
>
> - mediatek,drive-strength-adv =3D> drive-strength-microamp
> - mediatek,pull-up-adv        =3D> bias-pull-up
> - mediatek,pull-down-adv      =3D> bias-pull-down
>
> Thanks AngeloGioacchino Del Regno to reported it. [1]
>
> [1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@col=
labora.com/
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v2:
> - Change the bias-pull enum values to match with other Mediatek SoC.
>   That allows to use MTK generic define and be compliant with the MTK
>   common pinctrl driver.
> - Link to v1: https://lore.kernel.org/r/20230327-cleanup-pinctrl-binding-=
v1-0-b695e32e4f2e@baylibre.com

These patches does not apply to my devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Can you please rebase and resend?

If you have several conflicting patches that need to be applied to the
pinctrl tree, then collect them all in a series so I can apply them all
at once. Thanks!

Yours,
Linus Walleij

