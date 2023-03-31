Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE2C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnhVEWPY3LI3WG9Svxz8cvgWKx4Gl9EpZwq0srqQMr8=; b=a0TZw4BUhcWcOCg3lVchtbXIGX
	vhbA+OWPFXvzuvhqs/KryF7qtWxYXE+NvzrAK5Kd/m2W41w3GWGszt9eB59Bc4cvsbbTUUOfaTUg8
	mqC/NhiVyRCtG1nCI+/tTiPoHJiGZeB/2L14N2AXN9Qq/s9JepJ3wPdrR9WCFjLnn6rrzb00N5gtk
	CtN2T9PwhkY1g8r7maJOq+vafY3nwzDdJW5YXcLLiQC1uPZXZ8GpYi52s69HVw02JiooDinJ4vg2W
	eAxMwRe0LnAg1BKrtMF/FMXJKZGY6PfSjp0Fz16ZaFq02AvLQEE053cDYfKU2NXvPq4W1xTbxol4l
	XgZfCv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCg0-0075G7-19;
	Fri, 31 Mar 2023 11:12:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCfw-0075Du-0X
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 11:12:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w9so88160447edc.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680261125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnhVEWPY3LI3WG9Svxz8cvgWKx4Gl9EpZwq0srqQMr8=;
        b=xq4n2KuvPi65onmp9ypTuv04b5ojmuuFLk/ZRJzgD/BrlBvW4YGewuAtP6VC5kbTSK
         ey80Wblfa744lKvJkqHXJZUCOjYBuBevkWPvH427nbSt1RIMmrX6zvSrtrHivxOS+PK+
         DSFbRCzORTCoUBAnZklX3646x/DVoZVTJTmH533ybteQVVjrjLzHaLxvp/ZKhNZh4eW+
         npPQxmLKAF+kM3nsEDNLzUSXafiSa0jEJ8YQXlQkIhtc1YEgc5tPC74TbBki/yS0l9w/
         jlERXEv38wD5KLwCZgIQ/mIrslbONLdwZmR56vcWt4l6mBE6umNJ4USyv5vn0BYpPGdU
         rpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680261125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnhVEWPY3LI3WG9Svxz8cvgWKx4Gl9EpZwq0srqQMr8=;
        b=4sdtj+pyRx6EEptgex56bcmyDqri0HteJpM/ivZrDPvG8+jnBaihdGJnF7eB8cRx+s
         rHHHSyyjquyqpTi0LgS6pQSWt3TONmtl+5kL5HOXRh4apnhvGjhJpFPcB7YGAFdA7Zv/
         SCqYcP2a8PAh0+KihUFKfnRnnpcrqSluZ8YVYT67lAe2PIT7Wsqx2F2NxrARRLpV90gM
         SrGSzSs53pkF5o8xA64O93qwAh2Sh1oogY6sMxzXSCpK2AAl1DrOo6Rwsdwlxr3LQn5w
         fK2K8DN97JwH2oxqP7hUnm7+c0E98Ty4G8jCTAdQrgPNoI5cJOJsb7izDKFe6ojnqewL
         a6Sw==
X-Gm-Message-State: AAQBX9eLleVko/xuXzwKLRnxdihyoRllarMHtnbIelJzcqKh9dTSH7vA
	awCkEz6iW3S2ppzWkcWvYiuVNeNQ7WUQCcCfZUaeHA==
X-Google-Smtp-Source: AKy350azlQfzBnLoPq7rtYMIv00ABiMzIBIBlYFONAJZctR5m3rtXPk16+owY2z1t0tNFwozIYO4yrgn1BJTKVFHSXA=
X-Received: by 2002:a17:906:4a94:b0:947:c623:2c84 with SMTP id
 x20-20020a1709064a9400b00947c6232c84mr418421eju.2.1680261124928; Fri, 31 Mar
 2023 04:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-7-bchihi@baylibre.com>
 <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
 <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com> <CAGuA+oqJVTXE5YHm6rSv4pPWsGxR8nZD-T5EM7LS9gPtdcu4HA@mail.gmail.com>
 <CAGuA+oroM1XmLTDZcFx5F+tHvbOJXUGuj8SnZnUxD56+9XAb2Q@mail.gmail.com> <a1fde974-f392-1493-b48a-b4cce05f3ea3@gmail.com>
In-Reply-To: <a1fde974-f392-1493-b48a-b4cce05f3ea3@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 31 Mar 2023 13:11:28 +0200
Message-ID: <CAGuA+opkB0KHm8ngf6+U_o8B91Qv4Keo2XJb4UXfJe-DainRDQ@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, daniel.lezcano@linaro.org, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_041208_204765_D56883FE 
X-CRM114-Status: GOOD (  10.13  )
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

Hi Matthias,

On Fri, Mar 31, 2023 at 12:36=E2=80=AFPM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 07/03/2023 12:10, Balsam CHIHI wrote:
> > Hi Matthias,
> >
> > Is it time to apply those last two patches of the series "Add LVTS
> > Thermal Architecture"?
> >
> > [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation thre=
shold
> > https://lore.kernel.org/all/20230209105628.50294-7-bchihi@baylibre.com/
> > and
> > [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal n=
odes
> > https://lore.kernel.org/all/20230209105628.50294-6-bchihi@baylibre.com/
> >
> > Is there anything that I could do from my side, to make it possible?
> >
>
> Both applied now. Thanks!

Great, Thank you!

Best Regards,
Balsam

