Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D684C36018
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=; b=NT7O9552qxqeoXj1XmOZ/pWuSV
	VyzMC4mYXgHpswIrBULqJP/bCHjW2YNrLVdgohStm2waYD8NWuK+tXQmoTPO8I7Xgn/r5Wmo5OB7I
	l/ObdciZ3fsJUUHwbLuoqCzykplGUkxbdEl6O5nO6gsLXzvnPfVAb2fEdnXQioNqySdcO/yLXFLJz
	O3TySYaVoF1iQLaBCRa2qYi8tuFx8BC9BcWgGQdW+wDwTihQfbfVa3K5iJ4Wj2Cr2utsEA88ZlR8f
	tYoNB5ssDFe2WDzK60YjI8xWDiyLTrK9KWa0Ugb/L2KTZXJHCBLyPCdjtfi+urdsjEHbI/MF+Td5z
	HPJSANGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYB-00000001cdj-3v1J;
	Mon, 07 Apr 2025 18:50:27 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK7-00000001AnD-1yD1
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Apr 2025 16:27:49 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6f6ca9a3425so53850237b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Apr 2025 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043266; x=1744648066; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=;
        b=xkY2zL35ZrIeJ2h7iimk8YNwvJ69z6xvQmX21luuOvS4QTMPXsDXEJM5NLiT9FOmve
         E/VplsY3id4rpxbuv2zMHyn2g/JdkSJsSj7H0l/bLB1xiU2txTAKPxmUbUK82xl4V/0g
         Ymic6WGfu4EPq392Q+MnnUbUeWjUbNmkqU8mrddqkwvWLUPPbplpW8E+zZArzb0JAyYF
         ulXZzaZV1ZOYRI5Lt8i3yy9G3prVNrUj95HuYoddur5UjRXiGNiRvk69mPFNHeleFBph
         SpomeNqiBj9u08xi0jsBwOf7s0cqZOkx3w0CHBMAAuId/236UXYO2N1F05WaPUYrPAwQ
         nNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043266; x=1744648066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=;
        b=tJlfWrHOaCsqF/pX8UQZZ6lR/btTPGmA8myoMxzNw3OprFV8bFGFZ9OqWu5Lv0fHYu
         96v0rWLie95dSPKf5u1ohiQ55Vq0tncJk6cK741N0ij/DnNDGMGC9m8YMH7hdydA/FUr
         QTIUAlNLktX8tvhCeCB/+/iy8Ae0aoFsswxQoX6zm6BPW7M/FYSQPs42ggFgEUZWFxM7
         MwMHfdjOaUZ4WB9zAbCpU2znFNSNX8h1qpw9V7l5h4Tea42RAolXVKw9Agp46BBHKR7V
         buEeG4JQ7xclVi1R1RaNg0kgBEKSA+Zp4qbUBSEcQKOT5D2eM1PsKCL9RJfXctvetAoI
         8okQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRvP6G1cWABeTrxYtlgVlxwh0C7gMarN9x4fB1z68mIXMZtUvI3pkk4r2ZybJN7Q9jkpjUA2OEfJy0rW3ELQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwo4PGOTNPvtfWe9gvOtoux7GeLtOmP25yt52k/Udz2gwtotcQ
	sYimmnxPOTOyoqtmmnCoee+RLM1yMxRp5NZdMuLwOBjzxjilUhkGJtRlJ87KrnvFp5dKdTcJ0DM
	FJMHPQ6R9JJrLQFq8K0zfvaADwvydY1Ev0uWlMg==
X-Gm-Gg: ASbGncu9ez8TRigr12uoIqmn6ag483Olu2WoopxCNH2HVB+e6qvjnvWEAznUfrSUdBU
	jvcw9ckMiI37fKZ69En8N0XuVnXX0rUIdvxlY1F1AzcvE/1ZL3ym/g21ghCPqfcur23V3piE18X
	UJrbubd0PvIZSqOmGn6ym3JB9OpFw=
X-Google-Smtp-Source: AGHT+IGtNp2BrAkn3PRcCBrP5vhlJ1looux4OpDWyP6ljq92N0vWykgYWHtVBu01P5IBh7MS/lbuITHOgr8FD7w/MVE=
X-Received: by 2002:a05:690c:a84:b0:6f9:9d40:35cb with SMTP id
 00721157ae682-703f41267b0mr168266747b3.6.1744043266227; Mon, 07 Apr 2025
 09:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org> <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
In-Reply-To: <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:27:10 +0200
X-Gm-Features: ATxdqUE6-dDNiPO2iJ2zywPixm7KYg2Lx2vGxVH4s4tPgli0QW4REXdhqc3rxfE
Message-ID: <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_092747_595468_9252CB84 
X-CRM114-Status: GOOD (  14.13  )
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

On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> > "rpmhpd" is not documented nor used anywhere. As the enable-method is
> > "psci" use "psci" for the power-domain name.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> "psci" is what we want here, but these platforms require some more
> massaging..

So this isn't for CPU performance scaling?

>
> These SoCs don't seem to have any PSCI idle states (deeper than WFI)
> described, which is no bueno, as they support some..

If PSCI PC mode is the only supported CPU suspend mode, we don't need
the power-domain topology to be described in DT as it's optional to
use.

Is this a PC or OSI based platform?

>
> I'll try to improve this.
>
> Konrad
>

Kind regards
Uffe

