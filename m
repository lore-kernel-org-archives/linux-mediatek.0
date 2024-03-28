Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE15FC54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=; b=bTy3aBMYmEqKlyeOzGDn9FmTX0
	mX9Zss4TwNLo9XH0Q5Gj2MIGwaddl2oAebAUe1c0SoTWzZzm9T3XugCL2CDGu3HlVqeZ6sv6I84/O
	jWnrKzXqXjz78n/11ExE7FLXouyQNv9Rl9ISHhqJbcRGd/H3LG2hY09Uel/jPnp3XKomZJIAVESPp
	t8FEkDxDLBpswqWyKH1H+NFe/1r2EkOke0lXgW7BvevQL2Ah8mQf519nG0U45QLa/sh/a+IRcBekN
	suXKVxBH25Bbv6/KZXopMcCNxuVXNKX4q6DCVd1EhfK3QIMh9FfiwSUjjt7FdHfkX47hucY3CkQax
	/P3CY0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpieH-0000000Cc4e-0nXb;
	Thu, 28 Mar 2024 05:50:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpieE-0000000Cc2s-0XtP
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 05:50:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-513d247e3c4so582734e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711604996; x=1712209796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=gcOhgzl3HdlAsYFEREUMm+T/MJNQQb1SL5sFSui3Et9UhkCCiNEW9R5NhxRzYyYXUp
         hLES3eH9IBVyFfg41hTvZMcJzEc7MJrDI6Xu/8RxB/w5bvrcpOJjBiqTaUWC5M1kryNE
         ZgchEm1Z4OCvtjVUbcAvE4Y74IxlJQMWKE4NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711604996; x=1712209796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=t9jZNx5y9CtqYN9jT1mScf4Qyvta35d6YrKyI2vqUNP64g64tmJW8Gtrz4apsWnsCp
         kTO/dVDVSCRoBC5LWlCRiG7OxW+kobMhQ7N+Zs5/f6kxds611HkhuGF8S5IvXuVF4B5q
         tQJmvaVDXvq4SMJ4lBpXjn5Xg0tFC3WluGppKEOsTr68YQPqc7h5MAquojKNeN5C1QUS
         I3UKXZ+0b5a6Fp6rMkI5zTvh+6wUIUAq80U6rkzdZB1Gx09zRwhnKSyDY+5pdHkMNMC0
         qP0Jl/YIEjvBhAG32ePMnuGzo27VNysSWYSGD0D+C2LwiwK7iHx08Aa/YsOPTPzQ9fMh
         knxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc1gdgKh57kjbwGWyzNIIu2+R8KlANJoJiCUAnEArkoQ0aHard4uZh6y2ISvGN/59ihmdxyKFViPl/fgidlbpXApuxxb/v/PSssprEoH1vefj/
X-Gm-Message-State: AOJu0YxJd6iGyMxZ71UX6tob2k1BaWk3UqCLlBxfzhHugr1bWDF42huM
	8Vqg2o3Vhevgu3ywyGAHcQszbx7NTK67uAIQQImkZ5tVb2mohDNDhbatWOwrJSdkPLNDiwOEskV
	M3judryd+Hxrb8FcySEu73PzK/ebuNW2QQJzf
X-Google-Smtp-Source: AGHT+IE9E7br29oy9RDRD35SwQNl2vwFiBtmvYXASR4vX3jKO04LtgAi9c4oMgaAsLskFkIEeHikqvJMsXTcDn6BjM0=
X-Received: by 2002:a05:6512:32bb:b0:513:dfac:b29e with SMTP id
 q27-20020a05651232bb00b00513dfacb29emr414742lfe.26.1711604995631; Wed, 27 Mar
 2024 22:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud> <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Mar 2024 13:49:44 +0800
Message-ID: <CAGXv+5HchqvT=J7_qsJMB7OthX-gtGp0E64Xfk3i3=DDX6o1=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Doug Anderson <dianders@chromium.org>, Amrit Anand <quic_amrianan@quicinc.com>
Cc: Conor Dooley <conor@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@quicinc.com, peter.griffin@linaro.org, linux-riscv@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Elliot Berman <quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_224958_254106_D0B2A1EC 
X-CRM114-Status: GOOD (  38.44  )
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

On Tue, Mar 19, 2024 at 5:36=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Mar 16, 2024 at 9:51=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sat, Mar 16, 2024 at 04:20:03PM +0000, Conor Dooley wrote:
> > > On Thu, Mar 14, 2024 at 02:20:38PM +0000, Caleb Connolly wrote:
> > > > On 14/03/2024 12:11, Amrit Anand wrote:
> > > > 2. A top level board-id property that isn't namespaced implies that=
 it
> > > > isn't vendor specific, but the proposed implementation doesn't even
> > > > pretend to be vendor agnostic.
> > >
> > > I pointed out previously that the Chromebook guys had some similar
> > > issues with dtb selection when the OEM varies parts but there does no=
t
> > > seem to be any of them on CC here.
> >
> > That's maybe a bit harsh of me actually, I see that there's a
> > chrome-platform address on CC, but I don't know if that's gonna reach
> > the guys that work on these devices (Chen-Yu Tsai and Doug Anderson in
> > particular).
>
> Thanks for the CC. Yeah, I don't watch the "chrome-platform" list
> myself, though maybe I should...
>
> The Chromebook boot flow and how we've handled this so far is
> documented in the kernel [1]. This method is what we've been using
> (with slight modifications over the years) since the earlier ARM
> Chromebooks and is, I believe, supported in both the depthcharge
> loader (used in Chromebooks) and also in U-Boot, though it's possible
> (?) that the U-Boot rules might vary ever so slightly. I haven't tried
> using U-Boot to boot a Chromebook in years.
>
> The current way things work for Chromebooks involves a heavy amount of
> duplication. We bundle an entire "DTB" for every relevant
> board/rev/sku combination even though many of those DTBs are 99% the
> same as the other ones. The DTBs have been relatively small and we
> compress them so this hasn't been a massive deal, but it's always been
> on the TODO list to come up with a scheme to use DT overlays. We've
> also talked about bundling a device tree that has the superset of
> components and then using an in-kernel driver to set the status of
> some components to okay and there is some overlap there in the
> possible way to represent board variants. I think Chen-Yu is going to
> talk about a few of these topics next month at EOSS [2].

That's right. It's the last talk before the closing game on the last day.

Elliot is also presenting the board-id proposal at EOSS [3], which is the
last talk of day 2.

> In terms of looking at your specific proposal, it's definitely trying
> to factor in a lot more things than the current one that Chromebooks
> use. The Chromebook model was "simple" enough that we could just
> leverage the compatible string, though the way we leverage it has
> ended up controversial over the years. Yours is definitely too
> complicated to work the same way. It seems like device tree overlays
> would be a better fit? I'm not an expert so maybe this is already
> solved somewhere, but I'd imagine the hard part is getting everyone to
> agree on how to specify stuff in the DT overlay that allows the
> bootloader to know whether to overlay it or not...

I think qcom,board-id + qcom,oem-id maps to our board name + SKU ID + revis=
ion.
The difference is probably because we make our device codenames public? We
don't actually have integer identifiers for each board family, though I do
see the appeal of it.

So it looks like this proposal is more about identifying boards without
polluting (?) the compatible namespace with all sorts of combinations
and hacks like we have.

> [1] https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html
> [2] https://eoss24.sched.com/event/1aBGe/second-source-component-probing-=
on-device-tree-platforms-chen-yu-tsai-google-llc

[3] https://eoss24.sched.com/event/1aBFy/shipping-multiple-devicetrees-how-=
to-identify-which-dtb-is-for-my-board-elliot-berman-qualcomm

