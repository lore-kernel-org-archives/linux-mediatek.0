Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12676107760E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2026 21:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=; b=y8NIKjt4iRYB1g7/2pe4lhaphz
	AE7Rxz8EsFIXD/kSnYcccdCHSk32wPy/wJmgm2VPfPL4FIunFS+CDIbs18L0yCN5u/021O3XSm7E3
	iYNB5a4eDoDov8OFbKA4vZJgPwhPoK+BwYQ6nztQllE+Eco7lUe+TS2oQZN4aTaDZqkGbgXXtN6s+
	IuqTwxYiNQFPJPxPA5+KbGNOFFQ9VGKW32bhRpZExlHzkow9dTZL3W0pbqeqenpcvi92zAbLQKPz9
	btosgbQznDPCVp9w3crhJ963kcrCY+nVnkk6N6LhGeQv/DEbJTSX3JjzPdwSOmL7XCvG6VJeYbFXq
	pgD9CAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOe-00000009NVb-2SkV;
	Wed, 18 Mar 2026 21:25:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOb-00000009NUs-2HyI
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Mar 2026 21:25:43 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so39469166b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 14:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869139; cv=none;
        d=google.com; s=arc-20240605;
        b=bIZ/Baa5jMp2MAcNEa2+IMUVWyw0uArpZvvjB+x8m923rao6pv/qZVqCaOXY7p+aLi
         4n4RI5yLYJKfeW+vhcj9JIImAIqW3pEbL7laoPZi8dOXi1HzSMuNxecP8yozO3kmRcQ7
         BgfOL30h2eAeWNeUTM9r5HUW0qcFDeJX7yiu93uu9+1gxPh+kyOjOdChem51Athc9Nn6
         K+ITfY/0X6irwP2RkyGTgmiPzULu1T1beN2n47H78quawy2zdVV+APj6Y8bqnKpb7f2Z
         7z4Gx5pmO8zz2oA5ZVrPdg1WkN0qibzry3kepiIJmub+y/troB3YPzSvBue72eav2y/+
         qoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        fh=FNkxrngzHrwwFxxDLkZmhoK0A/EXIYkZyDRePBi2Pp4=;
        b=EiDC407/Ln3ZCzx1XQJ5myjYN305WjQnGYuW0SMkAMzAWMg8ShBvTcuRLe5UYEaBCh
         QK/tcZrMkRlMS1FtEhQWOxa0yCeIqr08w96PbE3TD/FjTIvqZPZL+7AYNPYEb5b4dXwX
         RAeh2/3tdXJDVQYYnkLV0GJQo5iGT7P4AqgxUAx8dFfGJ/swk0iIW1fGdQ+y1TYPbaZc
         SCVWTZRobGc7EcJKZ5Pr+O1bB8BAhlPQxtkB+hnr26pvYVCTXFU6PJEgu0/VJpLNLacu
         QYUa5jIdJnhlDQeJ6pJm/EYM0gZs4UeeDhxhnT0eNlfKsvyiOPjN+UyzFs/CbcijTNAB
         NDeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869139; x=1774473939; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=DIGbegu3A9HzWPmO97IN7D9SrXS+bIFAnI9WntNUvChub4wASUMgGpCVE/dyFZuOEU
         XLD9fl8kAo+Su9p12k2LBoNO0aHcD47wl77hdpqMZS6uwb2NLcE1/Um2t+/ywuwh8nTK
         FCAs0jPVmf0RbF6wR9gm1b/wI0UEh18lflR6Jbl0Aak0mkgRnFvB+Wcg7Dg0SXjdc7ON
         awBkVpKWrS6W02wo40F4Vntyt+PLqxI5EdShyJou0yUEzM677Dzp70CmH17M7WMr3dgm
         JYoxc6zq5UWQUlV59d3eX9K96MGrVzggGw35efAVIWvT4UeySbHb23cIGi0ohhvvYAnJ
         mA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869139; x=1774473939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=ATaebhHShDzY1t9IG/fZvpVCByXcN6Z7NWgm//m3RIEqJQJ6toW4/dVc2KJTI+l2i6
         4+h8RC5WXT8Vq2SAHfx2q69jFKv17k+zilIcj9DdQOxsj1xvM/hmSvXcawYMkwOQ/19u
         zdNw9C0bcj1ASKHim6NrXs+R8xWGAJbsmu+3culNdR+Sino7kf1ik5nXHrpBMhyLNrG3
         MnNGOzZylVLWWKIpI7AbJ3muVXMJ/JoWRURygMtkAO1lKRklDJn87hVfCAX6+VflaFde
         1nYwpHbFcHPRku7rwxdVqlRrUfh7uAxoXVjgqe7c3u/kUc9nXzg0KX9EoQX5PsXPPMtG
         LKSg==
X-Gm-Message-State: AOJu0YzlcAGV0jlpyZje/UPfqKuk7d2/9OJzXlBIvJqfEdcx2myqaraK
	wAyEP2sJS6MFG0qf9TsHXtlqA5JNm1CWKu+WTf3hT4ro8LU6JB5bAOtkoEfIqVdwXbgL/w4uEKk
	UKCEfAx/7uzrqCqq5OPryirNYBXAMP35dtAb5Ku23iQ==
X-Gm-Gg: ATEYQzy40ko5jajWzf8+YL1ATMidwMoYlE4iWUlKXotSXCIiEdfseFeK+Xxg6gbQ+D9
	btc3jhaUQFyDDe+fXoaBFJ/P3+yJp0yukO5ZaIILKA8oJfuocnsHcGIlUR2/2dCcRNamEpUvX74
	TTED9Agajcc0wdrvyI3zF/w/ZW/M3aQ9GA3VVkkmisepD+d1t4BELbrdKlXb5/sQJzMgJYddhXh
	mg6zHSM84P3tC3UTmMjAGDFMX3SsAmLD5IwHrg18osKoE5oVaD9/iDhndgqmu+eHnzZ9UUtAZ7F
	DBIv1g==
X-Received: by 2002:a17:906:99c5:b0:b93:9407:ea5c with SMTP id
 a640c23a62f3a-b97f4b70e51mr342818966b.57.1773869138582; Wed, 18 Mar 2026
 14:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll>
In-Reply-To: <20260318-nickel-serval-of-tolerance-621bad@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Mar 2026 22:25:26 +0100
X-Gm-Features: AaiRm51yI9RGCvrRh7GVNMdJwfVjHSZ_bJ1ljw9KDUXHaZfxU7GvIWfUsRzyb80
Message-ID: <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_142541_601985_275BEBC4 
X-CRM114-Status: GOOD (  19.13  )
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

Il giorno mer 18 mar 2026 alle ore 08:43 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> You already received this feedback from Mark.

I am sorry I missed these. I will revise all of them in the next version.

> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
[...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt6392-regulator
>
> Drop compatible. Regulator nodes do not have compatibles.

Thanks for this comment. It took me a while to understand what you
meant as most of the MediaTek PMIC regulator drivers still require the
compatible node to probe, including MT6397 that was the template for
this patch. I compared the driver to MT6359 that does not use it and I
am now working on the driver to not rely on it.

> With this, you can also drop example as it won't be used.

Just to be sure - do you mean remove the compatible attribute from the
example, or the whole example section?

> > +
> > +patternProperties:
> > +  "^(buck_)?v(core|proc|sys)$":
>
> Nope, underscores are not allowed. Use only hyphens.

Got it. I will actually completely remove the (buck_|ldo_) prefix
altogether as suggested in another comment.

> > +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> > +    description: LDOs with fixed 1.8V output
>
> If fixed, then encode it in the schema - min/max microvolt.

If possible I'd like some clarification here. According to Chen-Yu
Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
I understood this is that electrical constraints are a matter of the
actual board layout, so if adjustments are needed they have to be in
the board dts. But you also specify "If fixed", so maybe there's an
exception to this rule when the constraint is "absolute" and boards
can't actually set a different value?

[1] https://lore.kernel.org/linux-mediatek/28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com/T/#mb1473bb5515f3e5a1bb3ff20c717b387c42373ef

Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

