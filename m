Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B130C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkF984r0jfTzyI7tT6A37vG6Dq6NrZDLkNTSQzJ1szs=; b=cBbpeVyPGIaPg8Syv1O28VvPRO
	z3el2Mh51YdOxTpmarG6pViiOpRMnQ9YbNa7zZbRCWuRQTbOS/XEaEWt1B+EyP/TgSOH1QBh53dyw
	v/0fa7ciQrKhisnVrPJlga1KZ/s+8o6PYB625IEoVNUk1TbDXy6O5HpKVzEXARniAkbxGcbpoBorh
	kJaXXnLXAguSnSKZyEsLoeK6rVvTFqBo51x6/w7xYZiLAZf8p5txwwLgg+GjplnBCF55vUZw1uNHX
	Yiuqi6vPeE3wjz4y1pCXLy31JlZgc033JU8IfctdRuEwAr+Ie2kXfuLjUhOZgkfz383hchEQl+fS3
	88dQm6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlTn-004uBg-V4; Sun, 20 Nov 2022 14:39:32 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owlTM-004tyt-Ae
	for linux-mediatek@lists.infradead.org; Sun, 20 Nov 2022 14:39:07 +0000
Received: by mail-ot1-x333.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso5936248ota.12
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UkF984r0jfTzyI7tT6A37vG6Dq6NrZDLkNTSQzJ1szs=;
        b=FkknNl8+w+PHZAEsszcaj6TK9kPpmxhf8hqcerwxC5O1stx9ns4RZ/+42f5YcrjFSO
         b32/pr9TNcXXKesgg09UNuGx/jmd/g+11KmGXLwieKzKJHeF800iLkUuBcU0dJJRkNjy
         gPBTauQfrp90FjVVT6H5FFR8u+s6b9eRHJfS3Wt6IXY5SI3nhq3vntva8f/TCjn2WjT6
         preWJI5H9/6wxtXb25uUg6Q48J6/ze3hhMgSJusetrcOTg3BvSU6Bhwqe/HNCatc3jWv
         BKrIwhku5hdXbu/LsFyaPxR9lIXF5sDPAgyvW4Y0v0QBU8AAxZH4P0RFo0ymCPOY0Tq+
         umiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkF984r0jfTzyI7tT6A37vG6Dq6NrZDLkNTSQzJ1szs=;
        b=bGQTaZdxPO9RooTgPWyfCWj/x7FznshRtTRLFLS0iE0H/HzdAF5NIpKTFfdN/bnEGn
         fW0lG9heWir1fyxDb2qeYCvSIqq6v8sMK41ECgSnbcqAoZlZ/P5LpbqasHHrAyOX1C0f
         WauVMPbeKbwSAPwYE3zikfsfNpPxX6NNJtfi+w3+iszlfnY27Ki7214vlPYEsOBJ6spC
         8n7fFAYGjGEhepJitpYwLNUBpdYAJe06S5lqM8bynAOGKuCJwZIMiBr7VgaKETyX1nTv
         Cu09atENLeLAiTtyiYOfdFVMnER8f+ej9f6cRWsYnK2Bakv3gkQO0KL2liO9iDfkHw7K
         cE5A==
X-Gm-Message-State: ANoB5plRRX8XfmgNCiTpjpF/oWEaIj0e9rIAXxAgdekdbP8+Fp3h/hoL
	PPtRwQOqg3/qLzAMaVzf1MF9J/aHvw+LOlKakqOtxQ==
X-Google-Smtp-Source: AA0mqf5QbUJkXVIDNzWd1p6fxDx5nruCaRzVAH4gg+pHDxWzbCNuyfH+tzGeQnV8UhP7ITbVDOo+859w3u2Hq+bHCA0=
X-Received: by 2002:a9d:6c4f:0:b0:66d:2671:da35 with SMTP id
 g15-20020a9d6c4f000000b0066d2671da35mr7528322otq.137.1668955142399; Sun, 20
 Nov 2022 06:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20221117210356.3178578-1-bero@baylibre.com> <20221117210356.3178578-5-bero@baylibre.com>
 <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org> <7ha64o9h1d.fsf@baylibre.com>
 <76cae9bf-c81a-684a-c22b-9548dd82c8d4@linaro.org>
In-Reply-To: <76cae9bf-c81a-684a-c22b-9548dd82c8d4@linaro.org>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Sun, 20 Nov 2022 15:38:51 +0100
Message-ID: <CAP2ifjMQAx23xc0p_LZ9Dj79Hx1cyLZ-tx8HrGUbtDR-SmdECw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_063904_568104_F18E85FA 
X-CRM114-Status: GOOD (  22.05  )
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

Hi Krzysztof,

On Sun, Nov 20, 2022 at 11:40 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> >>> +  pins-are-numbered:
> >
> > Yeah, having this as a flag kind of implies that this could be present
> > for some boards but not others.  But in practice, the driver requires it
> > to be present or just fails[1].  What's the right way to describe that?
> > We're just trying to add a binding that reflects the existing driver.
>
> Uh, what an interesting property. What's the point of it then? Why
> failing to probe on a missing property which does nothing else?

I couldn't find any other use of it in the kernel, and also checked
u-boot (where the property also appears in some devicetree files, but
isn't used anywhere).
Both the MTK and STM drivers use it just to refuse it if it isn't there.

Unfortunately "git blame" only shows pins-are-numbered being added as
part of a larger commit ("add the driver"), so there's no "add check
for pins-are-numbered because xyz" commit message.

I can think of 3 possible explanations, but none of them are good:
1. It's something that had a purpose at some point, but doesn't
anymore (but that would likely leave some trace in "git blame"...)
2. It's something that was added in preparation for another patch (but
I can't find any queued/suggested patches that make use of it)
3. It's for the sake of userland -- check if pins-are-numbered is set
(which will be true for MTK and STM because these drivers enforce it,
false for anything else because the schemas don't mention it) and then
do different things. But this seems unlikely as well, the usual
suspects (libgpiod and friends) don't do any such lookup, and there
are ways to look up pins without that property - and I'd expect pins
are numbered on many controllers outside of MTK and STM, so looking up
that property would give a false response there.

> I would like to understand why do we need this property and what is
> described by it.

Same here...

> Because if it's purpose is only to fail or not fail
> driver probe, then we should just drop it everywhere.

Agreed (and I think more likely than not, that is the only purpose),
but probably a "add support for another board" patchset isn't the
right context for that.

I can prepare a "remove pins-are-numbered" patchset, but given it will
likely take time to track down someone who knows why this was added in
the first place, I don't think it should block the MT8365 patchset.

Best regards
bero

