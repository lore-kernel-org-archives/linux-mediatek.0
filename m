Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C29CC5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=; b=ZLPZfJAOjMlS89sTNsPlJ9fedr
	a+5d3tYMQC2g8jH4ZRDZHIW8crcHpRzSnrk8bHYS6uYKAhweRLvXYz/RimPryDBJjLz7OXJNx39KO
	+jTtxExk2Ekv/mY2nVmsHxEwJjzHhttdZUKJCSDggRXJeb4p2LRCqnGs6rApzOqvKDbgE+yBtQPEO
	wWywfK9hlSj+gpogayM2OgP4QgL8VH2PvmVFEIkyTGX20Bx9lSdi+sFjKw/sIVMXYfIz/rEvh/SON
	o5mDKH370kPfybJoBNZDfJ/+pdlSTFIdGb6/CVrpgeeefYRcenjuSYnINZhIYXKKfPlcd2Jl42fbN
	Osevh4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0Qr-0000000BOKT-3q6f;
	Thu, 20 Aug 2026 10:55:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0Qn-0000000BOI8-47d6
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 10:55:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2055f5a993so221869666b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 03:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787223332; cv=none;
        d=google.com; s=arc-20260327;
        b=AvDvD5rzR4feq0OOlxbCKOmJE+OYYAt4O5/+ASUgOvWXUJVNsAjvyfKCHtq1FauYgZ
         F8Bpl0UY2XsXo47UvgUsfhm/eiErputRNPy4BWuZVweYg7fOu+uUIVS79C/O9uhTYZkR
         zPnVFokXYWA4yPZs2XBQ2MrE9uXrcML0+wAbz9VI7zo4rzrGGpun2XjuhwsjcZKnfdD4
         PdYCyB5tk6f5xfDOK6inChIFwGRo7aDhkxMm9zM4O+W30lWL+Zn26HpdZn05RWzHVsfu
         cBrK29hdrh4gIkYye5UHhE/SajS3xYyISAa01HkUAekn0Q6Twbp7cLe7EUgHCHyYE4Xf
         sQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        fh=4RcNdqh1bqasO4dfc5aPAtMd0wkDyGXkP+HO3RTg5rM=;
        b=rdCjCBFn7NYOGlzwsgZ04lIKeTxTuMo+iT41C3tB/0tG7zD9yxXsgqNPSN2rrwayJl
         P5sjILNb1G9BBVuLsuuNeK+tG8VvGo0s4kq7agZ3giwF+oefSBc4148i9y41kFyfbkA6
         KRQJkehprKLpTJLl79tT9Y8MP7x5DjMpFN9qASU9iZMAiImj7/9VsC2ZuoYM8V96vts0
         C40PAlOmrycUy6PgtC5pslXbOeJPMPCLfjcWkoleLuuLKRDbX/RC3Wjp8R/Och9yHt2t
         idyihDJKV/cw49eIdPogdfdIAV95oT/CTt1rTMUeCMhkHlkD3Z2kZFjuefY0UkCxCSbF
         nFQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223332; x=1787828132; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=SROYfvxg3zfpubSposkfDZtalk2HP0yLoCPwR6d0eCVwOJdU7aAmD2Q/1uCt4kJRd+
         zcgks6rWtBmg853aOKtUI7lQVNdbzVJSakRanKdtJwtS/tXKluwP2sHYUbiE3IZ/BrQ2
         oDTjBceUUYA7GJW2JVn3oHpntoj06nnaafUE3x0M1vBe5pcFfSZuDxn1+9h2mbn04qzY
         DiW4nZpkzq8wnUvLoluhlGR1GDl9pvhsL4KF1njbmIBUdQNJ4fc/FUD2AdeoRj9+Hb+k
         0pAcZSETtRdKxCN1ni64cz2rxkn/XamFXoLWVdsXY7eNFGwNxgJNPvJ/VpT+0/omokFj
         d8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223332; x=1787828132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ipmbXrGZuUTW3clkvLRtCtAeLwQH+jlck342QgUqPnQ=;
        b=oaHCuselH6o6K+/Syteowq29cO7L/dWCtjXWNOoD3oEJiSJFdy6CxqzrWSwjU/qGiY
         iavqDogz2k3B72DNlXViCVo+OL8UWhmG+2WkHfjGaiv86Zk+EYBGXgtKadd8Q16uespW
         c2K4p8+yrbtonR5jetUTadZagYQw2gQCiCjSqTM0ny6ujslZM9aQoaljkr0u0it0bnFz
         tfzm0mniNPmFEfZdethEY1P5FFc2zCpSdxpCfiWBPol+YjCZza9Ol4BkKE8ePBxzmOoo
         9ERRvmUwI32eMV9046AGfhPSz1fZzm/Q53onTPx6HUgc4+4VAmdBqpO/B5EZbh6zOxmE
         +k8A==
X-Gm-Message-State: AOJu0YwZctkRF03kmlUAkvK8F3jk+2wkCtoRuymr2m7Oal3qdqJL7pyy
	WF2PW0FN3dZ5z9idyNOd/K6foDADlWiKx7/EQxBuQEVDsOC1BEaJ+mn8eEhsaoXgEmG0RoAk4um
	q870OZCv0c4+rFrh2zJmt8P0AT1Q6WX4=
X-Gm-Gg: AR+sD11UnM7C1O+w/cm1N9/oqP5mV5mgV8yIjfUc+RJoGSr2E23ciJf2cSbD3fj1d8E
	QQwCr6m4rAjFZJFok+6xLY/KIKbtmB2H/HDMFTycFVuHgWxT/anuBwkaiTaGxqfx7d/IQPxznhw
	GZBG+3oX2m9XJRj9lFVCx37GIiMDY/ahN7LLWpdjBQywfyFxsJll4MLococxnWggrqDL1B4qIkc
	tED1E/HOsiGyW09/+gGxdf5Ivfgv6OUg46ji3yStDMRpYHwF5QgNT2ZKYxSt5vA6Pd4AqirL6em
	GEeEHMLiI6453MnXtbsbVBq1WC4BZIkY8VL20CtHf6U=
X-Received: by 2002:a17:907:1c99:b0:c1c:2173:d412 with SMTP id
 a640c23a62f3a-c23f93178a1mr798064166b.1.1787223331499; Thu, 20 Aug 2026
 03:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
In-Reply-To: <xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 12:55:19 +0200
X-Gm-Features: AcwNN1UZv97CCo3bWTxILn7aTXSi7ZUKBM5jaDSq07HQRpTQTLXr653YW63gQJQ
Message-ID: <CAORyz2Kp-LzLdUp=qWfF2xC4kCuUufj0seBKPcKEaebrXnhhYQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035534_051355_C230735C 
X-CRM114-Status: GOOD (  22.82  )
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

Hi Akari,
thank you for the detailed report!

> This is somewhat outside the scope of this series, but adding TOPRGU
> reset support for MT6589 exposes a pre-existing problem with the
> mtk-wdt binding that I think should not go unnoticed.
>
> Until now, using `mediatek,mt6589-wdt` as a fallback compatible for
> other SoCs was mostly harmless, since the driver did not expose the
> TOPRGU reset controller.
> This series changes that by adding reset controller support for MT6589.

This is the exact reason that led me to touching the MT6589 code. I
have been working on improving upstream support for MT8167 and its
TOPRGU reset is required for audio support, but the current fallback
on MT6589 does not allow resets. If I changed MT8167 only, a reviewer
might have thought that the new MT8167 resets should have been applied
to MT6589 instead.
This series should cause no regressions as the addition of
#reset-cells itself only registers the reset controller for
mt6589-derived boards and it does not trigger any reset on its own.

I agree that fixing MT6589 should be an initial step and that upstream
would greatly benefit from the cleanup you described. From a
high-level standpoint it seems like all of MediaTek's WDTs include a
sw reset controller, it's just that the reset table is different for
each SoC. If I'm not mistaken, fixing it shouldn't have particular
repercussions on existing ABI since the existing fallback could be
deprecated and their compatibles relisted as independent devices, i.e.
basically what I'm doing with MT8167.

> ## MT8516
>
> According to the downstream kernel, its reset layout appears to be
> compatible with MT6589:
> [...]
> Note that a downstream kernel claiming compatibility does not necessarily
> mean that the SoCs are actually compatible. In my experience, MediaTek's
> downstream kernels contain substantial amounts of copied code between
> different SoCs, so I would not consider such compatibility claims
> sufficient evidence on their own.

Kudos for finding MT8516 sources, I have been looking for them for
ages! They actually reinforce what you say above.
MT8167 hardware is currently described upstream as MT8516 + display
blocks, but the MT8167 resets as described in the data sheet are quite
different from MT6589. That said, I've also noticed that sometimes
parts of MediaTek's data sheets are copied from other SoCs too, and
sometimes contain mistakes of their own... unless it's possible to
test on an actual device, some kind of guessing is probably
inevitable.

> I also noticed that the v3 link is missing from the cover letter:
> [3] https://lore.kernel.org/linux-arm-kernel/20260809160643.33991-1-l.scorcia@gmail.com/

Thank you for spotting this, I will list it in the next iteration!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

