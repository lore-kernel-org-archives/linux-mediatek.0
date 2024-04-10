Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF378CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YacaumogoWPfSYwVE9F4fCQDEzEforeFJlz030A/G7A=; b=gyiD1AT5oQmbWIj/ttLfNja5ZD
	o5Ht/DYUh9lHhuVs6OXxD3Tw+pGF/JazxAzbRgbP6nHQLMbZiStpPsXTZtseoadEXmIuS1Wxc2pVW
	fRTISpUKiUYtY1mPYWJkVzFTqecvc7SWNxBckT7f7zPxxlyAwwUkg3DIQlnrb69HOXki5M6yJdGaW
	OultqxF7O3GuYGe8qGI9tu32BMqUh5ymh/t5sjY+Vpyf7bOJZVBlqanaVbE4T0v+mt2ebNVytdKmZ
	ucmS8OcrqQoFLQ6FWKaWY5Bx8XhfS6sBvrO9gsgb5V9OtkP8bbARlSnETFKKzBgsWWpUwSBb23wmT
	J+t4MN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucQH-00000008QfD-3jYe;
	Wed, 10 Apr 2024 18:11:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucQD-00000008Qe3-2Pts;
	Wed, 10 Apr 2024 18:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE80A61CE5;
	Wed, 10 Apr 2024 18:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E432C43399;
	Wed, 10 Apr 2024 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712772704;
	bh=SIfBrassqv54JCwf0gOao1lkha0r6aQpuZyT4i7ALWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E6D8RfLIvohoDBOVtvP9WjCvBqpxPjWQi3HZG5sqrgWP/cThTY4SbcDt3N8yTcsn0
	 K5KzF1xFMZbMhzeMdc+F1UZch6i88XrLP5skhf9dN672OoqoYv5SZHFmh9Owu5UmgL
	 nfgB85Hhsd+GeUvOUbzzkl+KUJLjxRGoNadqtKzIbkUdT8veuVPY1EIF0BwXAb7use
	 Lz5+gIT4PUZ9O+xRbWbjGGwonUaW//MChfhpIT8bvKYsCEO+S/Q8SEWI6Os9aw82Zp
	 iohh7xl1xXXp7QeVRtSNDMeYQ0OWla//I4kDbqDpNyJd3dL0QIqxYmxCys9Df5UWk8
	 wloVmtobGjJfQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516c403cc46so13505521e87.3;
        Wed, 10 Apr 2024 11:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAJjC6zZHzmPRzbeKVwlK+sI4LD0V5xN2U5l2jeKf8RUyLrLQZ0NWzplACBR0c/2S3h7XZaIjqQcopzQOmEA+RtvBVMdcj+d13bKhCuOVMqx06vi/dJS+lDpcR++YUmvm+LGuuwMrUOweoUtamgCuYpyiHFeLflj+sY7vyPJj9cMIpQ+6QDXUnmqRqmpQp3izMlLIWGVOm9Prnyxy23GIJouVETNmUUrCuuCp2x+QgEZpX4M/R/0xmAPl2eP9NNVhD7Q==
X-Gm-Message-State: AOJu0YyC3BrgYZGiIg83HoFzvD8d4tCDk6cH0qqGPqoMOxH4OYnVpqR+
	K10JS6PlmndWM4Vq1uVanTtUdfV6tyt5iUvwwTyzjCYsTNfBmmTgl6b6nhG/KtlBP1a2rZ9ziuF
	jlTXJnCkj7iWLgMk1Vbr3eeV7UQ==
X-Google-Smtp-Source: AGHT+IHbOoi9pe2CCyb7hsJcUyAJ3hFQu5C1Tc6qPSzdO6bIBIJ5wxJRXN6D3zuXZ5K6R7oW9afgZVIuHfjCY5eQAY8=
X-Received: by 2002:a2e:b617:0:b0:2d6:a609:9a33 with SMTP id
 r23-20020a2eb617000000b002d6a6099a33mr3024179ljn.0.1712772682322; Wed, 10 Apr
 2024 11:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
 <20240407102000.37213-3-krzysztof.kozlowski@linaro.org> <20240410174806.GA788199-robh@kernel.org>
 <57827422-1042-4ef6-a11e-cb53fd930a41@linaro.org>
In-Reply-To: <57827422-1042-4ef6-a11e-cb53fd930a41@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Apr 2024 13:11:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJM-DQvZ0fyJ17nY=vqtCRxyQwXGh6sbbAJ7rFjnAGrEA@mail.gmail.com>
Message-ID: <CAL_JsqJM-DQvZ0fyJ17nY=vqtCRxyQwXGh6sbbAJ7rFjnAGrEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from
 deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240410_111145_753026_6F7F5058 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, Apr 10, 2024 at 1:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/04/2024 19:48, Rob Herring wrote:
> > On Sun, Apr 07, 2024 at 12:20:00PM +0200, Krzysztof Kozlowski wrote:
> >> dtschema package with core schemas deprecated pci-bus.yaml schema in
> >> favor of pci-host-bridge.yaml.  Update all bindings to use the latter
> >> one.
> >>
> >> The difference between pci-bus.yaml and pci-host-bridge.yaml is only i=
n
> >> lack of "reg" property defined by the latter, which should not have an=
y
> >> effect here, because all these bindings define the "reg".
> >>
> >> The change is therefore quite trivial, except mediatek,mt7621-pcie.yam=
l
> >> binding which have children nodes being also host bridges, apparently.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/apple,pcie.yaml         | 2 +-
> >>  Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 2 +-
> >>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml      | 2 +-
> >>  Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml     | 2 +-
> >>  Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/host-generic-pci.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml | 2 +-
> >>  Documentation/devicetree/bindings/pci/loongson.yaml           | 2 +-
> >>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++-=
-
> >>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 +-
> >>  .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/rcar-pci-host.yaml      | 2 +-
> >>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
> >>  .../devicetree/bindings/pci/rockchip,rk3399-pcie.yaml         | 2 +-
> >>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml       | 2 +-
> >>  Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml   | 2 +-
> >>  Documentation/devicetree/bindings/pci/versatile.yaml          | 2 +-
> >>  Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml      | 2 +-
> >>  Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml     | 2 +-
> >>  25 files changed, 26 insertions(+), 26 deletions(-)
> >
> >
> >> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pci=
e.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> index 61d027239910..5bbb4a3f3dbd 100644
> >> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> >> @@ -14,7 +14,7 @@ description: |+
> >>    with 3 Root Ports. Each Root Port supports a Gen1 1-lane Link
> >>
> >>  allOf:
> >> -  - $ref: /schemas/pci/pci-bus.yaml#
> >> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> >>
> >>  properties:
> >>    compatible:
> >> @@ -33,7 +33,7 @@ properties:
> >>  patternProperties:
> >>    '^pcie@[0-2],0$':
> >>      type: object
> >> -    $ref: /schemas/pci/pci-bus.yaml#
> >> +    $ref: /schemas/pci/pci-host-bridge.yaml#
> >
> > I think this one should be pci-pci-bridge.yaml instead since it says
> > these are root ports and based on the unit-address here.
>
> I was thinking about this as well, but pci-pci-bridge.yaml defines
> compatible which is not present here at all. Since you suggest pci-pci,
> I'll go with this and make it a separate patch for easier review.

This was my concern at first. It does define compatible, but it
doesn't require it. So I think we are fine.

Rob

