Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CCFCD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVtF0FbxwDL1+EyVXXt8m5PuumkGURWxInjDGKcvjBg=; b=IKeyq5JsmR0ihcUZHuKzStUZJB
	Nied4mKr3/D3hLk4sDpdBkz4L8l/tA6DDnRAS1666Uu/aXKZR/RhhE9hLxwnc/YihSqtiGSDC3NLa
	Oo2sLX7qYw77+u3PE9umRWN4u8etkgOx62Q5MmqMYD7xIPfS0M51fT2Lni2Fs6KH/YOaZK3r9eoai
	6aqxIAureLPGEGcNEMjcRUA/PVYZvU0f4NTtcXPzOHR+BVzwnpzTunUitgqP4GrHsxOV8ANIXNzZv
	kb5UlTL16PK83WzhUo0L/9kqzPnITjWFdBsrUup2ydeD271a1V1Hj2ifF2WQcDxGoF1OuzS0Og5Ey
	X+IOd9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruo3s-0000000AdB7-2QCA;
	Thu, 11 Apr 2024 06:37:28 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruo3n-0000000Ad9U-0wBi;
	Thu, 11 Apr 2024 06:37:25 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-22ed72b0082so3347269fac.3;
        Wed, 10 Apr 2024 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712817440; x=1713422240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtF0FbxwDL1+EyVXXt8m5PuumkGURWxInjDGKcvjBg=;
        b=Iaz9K1eyGUUuFqKMmAAfk8i3OuNN+JXDRBgGqTrKiLc78IdcYuqNLGvfN++mA19nug
         pJQXoQ/+1K2prDkfSY/etU1vV0yxuLlvGntYCCxKX31s+g3yMOMI4H3J2Z/s4y5gzF3u
         4oHSrSHnybit/m8sLvU2lZAe4w9mhgViqExoAjHHVMDex+C4y6DPaAE9hBuziP7vWEZu
         pNM8nMuIpsBVJY36O0DPZY5Y5+mR633LBiqRt+2P2N6nnPlr+ECNv1qHKD7Wz3gUaCoo
         szAQC4sBCKFTENBq2paC5cIw8zH5t0DwtrvnkSBjoKVYOR1OFF8l8fdhpVAjnf9wK/FG
         4egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712817440; x=1713422240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtF0FbxwDL1+EyVXXt8m5PuumkGURWxInjDGKcvjBg=;
        b=ABkeotx6J8KCb5rzvpPB3ECmHWfgqjjMszD793vc3uqE+rvkUU795nrVW8FxGZ/smf
         HhqOU2gh+D+qnodHeiY3aZVkIYfS/D22v5utF4XTvrsrdQEaGYBz/oKZaQ554wCLmEMt
         CY+vWLElwd08giklwvNK9w8tydz6NrcCmUfZV5Vxns/acR6r3cR3Fe712uXooZMm+gvo
         muEYV2WcfgQyl5C6d+IIAozJs+v1zxPERSAN0z1yza+t38OWAjDIHNJ5n8c6J4y0duhL
         cRYtPmvhfAVAeFKDgrF9o3CDWo7mNtgeURak6QbJZ4VxSxuy6QrJMPuoiJFEJcUTxKTQ
         gGhA==
X-Forwarded-Encrypted: i=1; AJvYcCWQx5n8XjChePDKqaF1kugxEkF0ATFSIkdqyMrLmzO4s67FddikEYuJ77o9TNbixsnTfSb9TMQpWNWPx1SNsR2/BfjZg1RfcD6NNNVqYiRrMMW5RSKcgtYzeYILz3xbKMRJv/2ryrlXMcH1Sfae5ZnRH6QqRSkakTGn6yCl35L9VpSmh8Wg0Yav0ky3b8QmYm0tHKG7ikzG/anvutF7L9PusBhz9In5LvpuxGyEtzGFPNHW5dEfrNXr2CheeSWVfgF82A==
X-Gm-Message-State: AOJu0YxRZXDLy1X8JfXaRlqoL3sA+TqK1KVn3X9BxSQOriZkx+YFzulI
	ZAIu0eB8Hp03msyWh14QSm0aBpkTczNZ+1sqfwouIqy5V6MPMWT4UdpNW2wGzCJshFN2+fLyox2
	aS4VvI76Ls3AFhO+laLLUzJY7A9s=
X-Google-Smtp-Source: AGHT+IES9majFVr22VozspwWyOs+YbISGsgQi1H0N7wgH6XHm1MFch0WdzdzAv98JrRwXB0nazk545ZDOwQPlvcyYH8=
X-Received: by 2002:a05:6870:55cd:b0:22e:6b4e:d2ac with SMTP id
 qk13-20020a05687055cd00b0022e6b4ed2acmr5468350oac.12.1712817440529; Wed, 10
 Apr 2024 23:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240410212638.GA2159326@bhelgaas> <458ce909-0616-487d-b4bd-42b58d059198@linaro.org>
 <CAMhs-H82Ymc=isxu6AX4_s1QnNpSSNt74--ED1j7JxpzE=eCRg@mail.gmail.com> <0336b752-ba98-497b-96d0-efc01ffbd93c@linaro.org>
In-Reply-To: <0336b752-ba98-497b-96d0-efc01ffbd93c@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 11 Apr 2024 08:37:09 +0200
Message-ID: <CAMhs-H_yWFn7JvCYhVqELmBjwHO8KCU_UVE5XTas2WVJC1UsAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing
 child node reg
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Will Deacon <will@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_233723_307019_1578046D 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Apr 11, 2024 at 8:20=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/04/2024 08:13, Sergio Paracuellos wrote:
> >
> >>
> >> I think the question should be towards Mediatek folks. I don't know wh=
at
> >> this hardware is exactly, just looks like pci-pci-bridge. The driver
> >> calls the children host bridges as "ports".
> >
> > You can see the topology here in my first driver submit cover letter
> > message [0].
> >
>
> Useful diagram, thanks. It would be great if you could add it to the
> binding description.

Sure, I will do it depending on time hopefully sooner than later :-).

Best regards,
    Sergio Paracuellos

>
> Best regards,
> Krzysztof
>

