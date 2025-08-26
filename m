Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23620CA0FE7
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=; b=kTvU/ERIw/AgRp2qAs1v56Gnsl
	d91eWVFedQhZhiG8AkKsl4pzLbWw8sFCF7HzQd8i97WTXPkaoUiBxmcVd7wAc4QigSU87njmG8qaA
	ZwpfVo+2gDq6HIdjHJpZs9wUrO/n2axcSRsO/clDG8mwNZuVzovVoIwoCcEXmtay+wT+sEQ53SnCT
	O9bT8Klyqovjg+tl7V4nTrtcLCucV9f1CxefTF844gwep29Vp6XLMVYT5jrlERcRZT9fsLgRwjgD4
	rWiDA37fgJOxRQBjQcksxdHxEbpr5/vw+fw2YDuzJTvkyaQNYVSGk53uxfO8sVR2+VCT3hMUfu+ax
	INlCSmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyGv-0000000CrGk-06QT;
	Tue, 26 Aug 2025 18:19:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyGs-0000000CrFu-0olA
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 18:19:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f48d62057so2291892e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Aug 2025 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756232388; x=1756837188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=Dh8SOfUPg1/GjcA7fL8lP3NOudRSMM+t3OnUNic5ZTrILRpeTuLe7pH9P40IClLwT0
         TNSaqrVXe35BVpcoduZ3TEAnS63UFhLBpjWjDWsLIc+csR9iu+CQ0TTEPww54IZL0sYj
         UjVHXu0RgRLMCjmwcfEI1n462U/wK2YhKgV34exQmciQeO1xHNvDh1uf7OVz1f4G1qJD
         DWxwNeNIrdKQvGodvi8PbLOOQW0WJWW0AcPpfGloRTx6k+rtd0/UlKSqOgWhhmz5noXc
         PDLloZKrUMnlkLchqIT6895n1HjVUiBdCN1HGGE7WtDWlDjhaDBezRdaQfT6/sC5XOya
         Rxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232388; x=1756837188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=DYMx9Q0jJA8hScVhL0ZnFaA5t8C1u8XLmOPJmWIZSG0muRNaF9FOJ6hp4Ux473kw2J
         pNvdm9jcXixQqF01fiKhyi+Yh71kAgHsvZIyFHi9B6dXl3zv0KRktTLl8yFIfpjT0zNI
         3V5MnDFOF43oAIlAsBDtqlKJBoJRYXp8ncYDzSETPQh4b4Yzj7NgPpDFLGa4rxPIFqNi
         th8HdkxY1CBAC29yViXY377i6ketA7ufGE5EYXQr/CdFKTDSj/mFaDuKig41+fwqskbG
         tF6dDpsbmqcCV2uME8RK8Gf0bvdbMeLTAP+aA6YvPGDEiioeAJDqZvYo7R0odYt+Bbwy
         8fuA==
X-Forwarded-Encrypted: i=1; AJvYcCXEM6vqXhgJgeVl8VnsVVPJwKapUZJL8HdYG6zRdZs7ajPK7gyTrNtVMnMN9JUm6SCwaC/aFir4Wi6gQuGGow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp7vzMCCHANgamjn1mjgOcPzBTETKFdP+rS4K+GIZNsYnqE8g3
	1t6N20Y+1gohPJ7MwyaW+o+M3T834jQhRxSK90W3z/n7Uxk8HH+uXbEmvhh3QnQaZHkFVLpdskL
	T1GHFCYoso3yiCjfkd1T9ErBV+Qt0LepIOPuNhki/ag==
X-Gm-Gg: ASbGncsOXAU9lAzVyE7/UuSZkIqqZL/wLd1gQYMWNWnx0//3arY6KlWNBKAJDYjCr2K
	0zbVkJOYNKA7u08LIZ/YigFJFdeNYLXLvlFLhwsnBLT2p3rfgl2n7jpekdm7pxA/vMTHwQVvgIU
	rmlWdxyN7cB1XCH1e1iFAOutL3DHnrW2MMhykV882AL+DEqm0WBtj/c8HLyCwCsnCsqMirsdTHj
	hr9HGAUnliP6kywKuHAV6DZ/xDy+T+l7MoeMUi7h84trXMMyBFw+zV8fdB/
X-Google-Smtp-Source: AGHT+IH9/wDD1C5c1pzIo5M6703fhe2Ju79J3Cg57MCbuHB+kMzD9Ry2MpuHtwyxY9EgNTzhw0WfnDm8emGE0JQOveU=
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id
 2adb3069b0e04-55f3d7c3badmr3365498e87.12.1756232388100; Tue, 26 Aug 2025
 11:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com> <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
In-Reply-To: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:19:37 +0200
X-Gm-Features: Ac12FXxAYIw0w_2T1YaN-IyY2JYcpKwwddZS_ZNL3wGJGwAsl60-M2w6oLQOL30
Message-ID: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_111950_470863_64C4A2F5 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > The qualcomm 32bit platforms fail in next anyway so I dropped the patch=
es
> > for now.
>
> FWIW the i.MX8MP also seems to have been broken by this:
>

I can't test it unfortunately - would you mind sharing some info on
what's failing exactly?

Bartosz

