Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5464CA1005
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=; b=0/YZdXQ0t58+OpaFBeLniQh0m0
	gNISDoyU0HPV9WPD+YnY8yFOytYMG/zDbXySFO92tvkOrQq5AlHpfDkR2VigPGXG6OCNpFWVJOoqF
	favGoQZozGqTO6TAEjb5WP8GqoSZbxM86QNlRGJ+lR3trkbHQPQRtVXUAr2tuHX84yAY7OHZJxdlb
	APsSDSbzweO79Xo7/9QOVSTME6KB5JoSELbXDogY6zJvOCAC6FpedMHZP9s7vhsBn+juqv8OvR2L2
	gG2OPtkmqO6ioEF1HLSJTb2FDaETPxYEH9hY901vG/Z7FWzFcXtvALY9wwS9KQl+KQAGlCqBRj23u
	23N+i3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAZ-0000000HIpK-2kkx;
	Tue, 02 Sep 2025 12:31:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNyh-0000000GbNu-1oUg
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 10:11:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5607a240c75so1697378e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807862; x=1757412662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=Z60UBJyJW+2erPYJ57In48YRzqU4RabXLzpvgN6HWtHTc7pq7YpjU85bXzxSWhjFFL
         E5E1+VvjAUJpghUta83WNYywkPxBub3PGJNzbjn9Orry2L42gKeiqLJYvIfctVfMstrZ
         1K8RYryKbenzCNywFf6SxwD0lwVu/dLBHjE3lEAWEhwB06V4lrB/I2RfxnUSs1d4mytA
         2XPwoWVAmTga9pjElaA60Ykrb5XaQS50At2sG8Ziazs2IBRZ41oREgTRYCDEKDYF8GxD
         1d1r1YV4XvW2P0Hgn1HBsR2ymqpcAwSZ9X5vl+WZqC5M/0LjscP1LO57bXhs2bgEmmAc
         Mu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807862; x=1757412662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9/dg3rMdImtSDs9qVPDpc7idBTBiPszJRQRzWERi5Y=;
        b=IGUyDaXaGGshMIMjPuWjgtZOoxuPtXW0Cyzlqp9gZmZrHpwQVHM2lmE+S+eWmAMNcv
         +vxj3rogsmR13wmOAMWjNMNCgpqumFy5siBO2JT45wShTjZM68/RUX9qRkBlrekotrQt
         JzpaN2x6a+ekzNJ9wGjTXW22FVdK7eAsVq6KSNaoC7AFCKrrJ2Lj51IcHeXcbJNvf/m+
         GWv7OBg8AQ55C6uISd1bkxxPMnH5HnB3pSAa/RAn8Hpe9RfW47gPGAiQM5OOLGNrVRgg
         LvUSGq+/JmCSWdjyUTLTalWyP90j5lML/I2uEu+76OCy2BLOMC0aTMzgkFlUi5FuVpOt
         Tsmg==
X-Forwarded-Encrypted: i=1; AJvYcCWuhT9OzQU9yYFaJKDYjwO537AgK0SilfufGH8Kyocbc8BpzHTKVMmgpYHRugiriHQyuPTXDw0tX9hMRjy6Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ9J5KOt9Ph5L6jWQ+m0DFRJCpAie5KHRylrygfIUrmv0bIQhI
	mQP7YUjjuDKlvxeGi3Iy5JZyafzK8Nj5sQ6pQbwK5CUDaxwgpZ3nCe2ft2Y2YGExfKwwqEKT2jB
	DjztdJdbc8mtARUOe08K4901jsH0cITm/JZcionE0Ww==
X-Gm-Gg: ASbGncv6Q+DMpdOw5lpW7Qoux/BI2tDDWLuYdInyysWOvu6iVSSWBce+8A7gPN3SRaW
	fumQqTm1r52i+pk8XklBKSOkPzxK5O7b2y6rp9BJAyBJE6M0hue+Zd9/dBy01CFp90upBJiESM4
	0hDym3PEoZaLA02285Zseil/RxHjKjiOZSNmBzkX7YWpV/me3AVAmq8X8mIHJqmxr2AWtW8V9wW
	Z7VKkg=
X-Google-Smtp-Source: AGHT+IGvJOVNe+LUFvOCbgL5wgN/h/Cjvl043KlTfsb1COy3EuiSQw/TerVuRTUEwrGuUBs+VE/GG3RycL486iAnqi4=
X-Received: by 2002:a05:6512:250d:b0:55f:34e8:b1a4 with SMTP id
 2adb3069b0e04-55f709dda1amr3184317e87.56.1756807861583; Tue, 02 Sep 2025
 03:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk> <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:10:50 +0200
X-Gm-Features: Ac12FXw4LKCvHHNtKGBjLfwABtGCHq93WPj_v3YPD6EUsw9OMGyVKBEoUj5pgYE
Message-ID: <CACRpkdbrRc6E5idzkdN53QPDCSGpPUfdjmFmEFsS3g+v=cB6LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_031103_482642_AFB2A784 
X-CRM114-Status: GOOD (  18.47  )
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

On Mon, Sep 1, 2025 at 9:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
> >
> > > That's not a lot of info but it fails in strcmp() which - I suppose -
> > > is the one in pinmux_func_name_to_selector(). Any chance you could
> > > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > > Is it NULL for some reason?
> >
> > [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
> >
> > https://lava.sirena.org.uk/scheduler/job/1758947#L705
>
> Linus,
>
> FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
> be able to debug it and figure it out shortly.

Awesome, thanks a lot for your perseverance on this important
patch series.

Linus

