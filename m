Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64529CA600B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=; b=oXnOIuoT0ZZwcyvYNxNAt2SO/N
	uplb3QoUV6Nm0Hc1Hn4EactOmJWd3e3x2xVJ4RpYc9C/rvUle9lqnHNGZUTT/uBkj7PRj/2G8fOhP
	HZbdMGi2/PsXSmDeQR6+ph8KoR3B0S1NkFPhyQNc0n8XuBuAaF4HzDTa026e+FaccBVba2bcbx4QV
	eJImlFiG2veMQkh9ORpZYRlvJpk8p90DblmmbMAKK30f5rYOVXaH1qt238xnZVm9BjMjtBNYtLG5v
	erokk3sHknqkIsNdbkMzlIr0YwlZw5YTFKgYI2YYDuPFQx5EUKETVbokw7QnAc0k59jXZVL1VXUXJ
	LGN4vw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElh5-00000004CBY-1xvo;
	Thu, 08 Oct 2026 10:49:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElh2-00000004CAF-20ZJ
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 10:49:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso8148887a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 03:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791456582; cv=none;
        d=google.com; s=arc-20260327;
        b=dONU6PJmsNT3LAhl9Fk+yhvmD8qGIIPX1m2hRgSc7CmAKlfLQOse9QsxvFOnEOSm/B
         dEHwFhKX/ufWaAyyw3thgOUPdgM2VA4xOs6mpD+X55IiF6bi7FlqJM356Arp9B7vRIYN
         XYHP+mPqxhtrOwCmEFrnIOIyYq+2VVr0EhsCm6oAlzeBcD7N4MXfZt9kwAyle49pqp7w
         5Oh61tcuReZXIJidwkgydsEGEcqcdA4kTJ7771W59poVjCAK4zm5V8PXtP3419A0L/e4
         UGWw5XzETgtIYgrOBMvSKrsDhbOHqejWavsLU8O8kpnW6LllrgNDnptRTvz4tt1xGDfE
         Id1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        fh=/LY72HEGMaPS9Kig8Xibpa0GpQXzNpQflnbxRkxaHbQ=;
        b=nYzFL7BkP2+A17gmIjFBpH8CL69AxeMYniFXCl7Wtc+gB9PM0BuJEnXBdYAbLHG3O0
         OxO+j8NWYrRbSie/AYLRFB9iPmF4Kp5giKydRfpT4gdHoWGoAMHkEj5ftrJAAYMrot3P
         RcVp6rLIhUX1XzSHKGjUf94m8T5pNJjhGX/Z2Jpoh5CB/lUsuSQoASr+cLuH3fEfsvwa
         edgDBlDlwlzFeCF2uF+isPMJBsZHg4xA/V6Gt28T7cJYtaP13u5GRHT8nwlST+Sn0uvD
         rBCexYGUElexvAL8M78kK+2KZSux5R8CAh67hPYbSXih0uq24T+jL7nCfFKUEbsvQqqq
         zVQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456582; x=1792061382; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=dbwnyQFhtjQ5c8ZbvqkPdhp5wC7OCFX0Ripk8Horpeo3041b0wscL2TWkV9/oi2Tt8
         ule1AFKfuCr43Nq2lbeiA5+KH7LAQTOnMcWlB4j98caE9oIUtcUtB0a7i4gpYl60GW5p
         wpAxdhGThyGSdYjt0vnjifVRx4QAO00iK0QAK3tW/Mrfc3Bg/uGlRzMZzQHuWUnBDwTe
         1y8Zs6RfX+8wflv98hi0DR4tfXiMi7QT2Cnj68GZ9cxLiQKC+n4KPDFJvKW2Hf7C44Fp
         l213KsOxipW7r2wSbcns2f7ZowruMbpGS3LfST2hyr4R8dbbjCK7lg+AErw8SCk3J6Ff
         49hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456582; x=1792061382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=c+jQ4AsyEeO287mTPJiX3QoUcpTOP4w9qGHpUhDLTL9ufAhIKPpgJXW5ZdE6JzOivH
         CbT3HRSH727rnzKZueSXjujU3JNhnTUdsfV4p/fBPvIv5Sk9RqlnZutazc/vwNCc77tM
         h2ANvPGAAaUL7BQqID9/MS8h1khGjrxqBj2ATShUexKcQl8WeK/Bm35Jdk7kNggU+LXT
         GQcK3prrIsJDoB2eWop/HQNDIqnkM/Ojwka3Bd966zSa2Z9dOgQ2ADJL9GYlAG0w+KXc
         qbAb0edNVvv9cMpcySF15HfnUHQ4jotMekgWL/6dnKMhYVHgRCZu3t9rBvMWqvVLQJU8
         z2oA==
X-Forwarded-Encrypted: i=1; AKwUvByPAfGLn+oyaOk544iOMyA5e8ZMD9eI/n+rJ7ukc/t7gFYk9D3HD9pxQpUW99X9wofpsokkSRIZGJWlbgw3qA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ+icV8mmQFLINYgDuibryk3+2QO5hYesYDcgLjM6tm4wEung7
	/APvYaIYEDZXopWHJA+mVKNr/ij+9docxGauvzKno115H5JtTBJCxOWgaT0U6WsgenB1IvBcoKo
	GeL5vWXsk+Ap8ZcQsMYZvojAFvXTAy1A=
X-Gm-Gg: AYBFou36m0Ski6TLaP2Nf2n9c5mqN5oc3hjr0WSUvFvyS9fQKZx8UlczDV18H+hOC/4
	hb1bn12WTF4OV/K34iald2FG8C3AKJojJB+m7VJ/rpoJ080cGsjoHOho1gs2g40y52zNwzhXMHn
	OtFg7FftLlT/hDuSHLW/2WYE9XPyt/ymXW0WO+lDv42aYajFoQOSv+YFbCFZ9wf9kkM0/GZHSrV
	1BZC2s2TY3EtOr4tiMfk58DoRYry6c616wo1+VISEGFnLku1anEy0AjLizMD/Qz01LGa5cnv9Jl
	rgDh0dGyoJrbXvi9hcxyHi/DG2J7+1nmG7UiGOEb8daSTcG1Qkx2G19ycN7wQ+9/K5DyGX/5jbr
	iKw/GYFG+yO1qA9ZciViRX8tZgtDvEbD5xm7hhLoOUn9gNXYvWDAMofxUXG4AkVz323U=
X-Received: by 2002:a05:6402:4019:b0:6ac:afa3:6f72 with SMTP id
 4fb4d7f45d1cf-6aff3756d74mr4800849a12.5.1791456582185; Thu, 08 Oct 2026
 03:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261007110858.509341-1-phucduc.bui@gmail.com> <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
In-Reply-To: <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 17:49:28 +0700
X-Gm-Features: AclHuK_fTTXIpKAwLFkuMWapY1wvxwZhKpPugkOpZYUioKYV77e-gJQAnEgFPDk
Message-ID: <CAABR9nEOBf18aC3yUx9-d4TdUYdpdoxuXeNSu76Y3B1HYXytJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in
 FE startup
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_034944_532339_4636FA65 
X-CRM114-Status: UNSURE (   9.26  )
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

Hi Cezary.

Thank you for the review.

> Thank you for the update. The snd_pcm_hw_constraint_xxx() finding is a
> good catch.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I actually found this issue thanks to Mark's review in another thread,
where he pointed out a subtle issue with the return value.

Best regards,
Phuc

