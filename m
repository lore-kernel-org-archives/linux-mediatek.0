Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rjK+cFGvl0bYlnbNWlNdjkQ+vEPF5KQW+G9V7jNEfE=; b=ztFvAvK/KVAdnxPKinhOBSFEky
	9SqGnMjJy7L3CjXc0Zb8y4gGIjgawn+MP3Agpq2SxoznQcJO9u1rlHbaIGNEo423q/zEDjqv+ifVP
	/CxjShK7M9ZJDhG2WQiDt/hqgUMNtJ1nJxFMKS+3o8q5dwLZfrhCt0NkRDDQl2t76DgG0UQFSG+FF
	Us4ERUVU1ytxrFdci+5234zEu0cMIfwkJ0HzoO4PMhfqH+4iXJ66mQ7vJN8/Qqxuy+NzSd/L/+Vec
	s1AyuEjLVWSoU8mHHdEYdNJoUqm1CDow+8tpRKPbsyIhXhL77fNg6D/rSc3opIL1gn2YYJmvEhro6
	NecpysGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osK4P-003la0-LD; Tue, 08 Nov 2022 08:34:57 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osK4K-003lYH-T5; Tue, 08 Nov 2022 08:34:54 +0000
Received: by mail-qt1-f182.google.com with SMTP id hh9so8260816qtb.13;
        Tue, 08 Nov 2022 00:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rjK+cFGvl0bYlnbNWlNdjkQ+vEPF5KQW+G9V7jNEfE=;
        b=ZWG4r7tAaQE5fU1Ar/DLZpgeROy76M1NJN1h2Mid53YVVlw4ycZclUguUUvzqE3VTc
         98864PH7Q3r6n2SW68eE1ySjFQ34fxHQRqTT3wThe/ubTA4gzMpkwyczdO5n6tuhDp6z
         xLFUpFUB3cNCIZJPtLWhbowDgO3Qh7qMievtkt3WJHjX1+XUy4JONGnvKHyBQmMqBYXM
         oIOZp1Axl8IKSqcROTYXo5GAII6NWnhcLqIILwQKIhclB9hKksy1QMwA8YbS91Pm6bNd
         NpYz93FElimbxecehrX0ldjSgE4xNaItMB+AaxAzCO0i7gAsy/B26IbCFEAiwn+ZDuPL
         cZ/Q==
X-Gm-Message-State: ANoB5pnbfwC+bIx1DXlpLnfl+Hqgl+WR1TAkLxqOB30fmD3arviLh0MA
	9tF3dsP9iLf7qTC16JkJ6xdqHP67r4sZaKU+
X-Google-Smtp-Source: AA0mqf6GY3dIsUauJTYPa89UH0QfQbipfLAqzL+8cO+Exws06wgkGR1miQlHZHOwycov27x9LNSHHg==
X-Received: by 2002:ac8:5e14:0:b0:3a5:89ec:b1fb with SMTP id h20-20020ac85e14000000b003a589ecb1fbmr7412577qtx.304.1667896486815;
        Tue, 08 Nov 2022 00:34:46 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id f3-20020ac84643000000b003a51e6b6c95sm7709123qto.14.2022.11.08.00.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 00:34:44 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-370547b8ca0so127738047b3.0;
        Tue, 08 Nov 2022 00:34:44 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr6035680ywe.358.1667896472556; Tue, 08
 Nov 2022 00:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20221107155825.1644604-1-pierre.gondois@arm.com> <20221107155825.1644604-19-pierre.gondois@arm.com>
In-Reply-To: <20221107155825.1644604-19-pierre.gondois@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 09:34:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOZemsvMfM8+NTvQ4=cDd9hu3=0tVFRmNzFmjaxVhgig@mail.gmail.com>
Message-ID: <CAMuHMdWOZemsvMfM8+NTvQ4=cDd9hu3=0tVFRmNzFmjaxVhgig@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] arm64: dts: Update cache properties for renesas
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, 
	Antoine Tenart <atenart@kernel.org>, Brijesh Singh <brijeshkumar.singh@amd.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Chester Lin <clin@suse.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, Wei Xu <xuwei5@hisilicon.com>, 
	Chanho Min <chanho.min@lge.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Viorel Suman <viorel.suman@nxp.com>, 
	Abel Vesa <abelvesa@kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Ming Qian <ming.qian@nxp.com>, Adam Ford <aford173@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Tim Harvey <tharvey@gateworks.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Li Jun <jun.li@nxp.com>, Marek Vasut <marex@denx.de>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Joy Zou <joy.zou@nxp.com>, David Heidelberg <david@ixit.cz>, 
	Liu Ying <victor.liu@nxp.com>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Shijie Qin <shijie.qin@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Vadym Kochan <vadym.kochan@plvision.eu>, Sameer Pujar <spujar@nvidia.com>, 
	Prathamesh Shete <pshete@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Vidya Sagar <vidyas@nvidia.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, Johan Jonker <jbx6244@gmail.com>, 
	Christopher Obbard <chris.obbard@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Aswani Reddy <aswani.reddy@samsung.com>, 
	Shashank Prashar <s.prashar@samsung.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-realtek-soc@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_003452_967684_FD5BA23D 
X-CRM114-Status: GOOD (  23.55  )
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

Hi Pierre,

Thanks for your patch!

On Mon, Nov 7, 2022 at 5:33 PM Pierre Gondois <pierre.gondois@arm.com> wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes

"compatible" is present?

> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).

Present, too?

> Update the Device Trees accordingly.
>
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -88,6 +88,7 @@ L3_CA55: cache-controller-0 {
>                         compatible = "cache";
>                         cache-unified;
>                         cache-size = <0x40000>;
> +                       cache-level = <3>;
>                 };
>         };
'
This hunk now applies to arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2, with the patch description
and the file names updated to match the real world.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

