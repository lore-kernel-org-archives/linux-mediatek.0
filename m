Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89919CD11C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTpah3z9nxK4+QUIUhM/zsRbPjioxiMre0R2YErPMBI=; b=bbRC2DyFY4ZLzYa/Ikh8RqW2fY
	RyVo3cL4sXe6JtUGd//tK991B+Ck2TpK+3Gac3DBQbn75slVbgfzzPZLbDVTmFbWqBDbn+HmtfWoy
	7LqXtWqGjYB5tEr3eyzvutpspg1NsS3freBUoc0JRXPcKguKprFDV7WYZXRs+5pLcrK81mCIWF9fZ
	kD9RdyeXc5V/d4/AfqC/wWtctDHTZyk5itnV9y0WDp/rziSLXz1pVkooiSQ6Hx2l1qN1TfB8SfWPV
	E1cwq0iCrKZT0ZNmGTdQQ+TPTqY1jPCWIqELxPCobZO+bHh3KVtG8wsWGEoMyu3pxlkWbHBjFJGdj
	FBwlZsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRl9-0000000CXVN-3F6w;
	Sun, 07 Apr 2024 12:36:32 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRl0-0000000CXTR-1c4u;
	Sun, 07 Apr 2024 12:36:23 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-222c0572eedso2290075fac.3;
        Sun, 07 Apr 2024 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712493380; x=1713098180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTpah3z9nxK4+QUIUhM/zsRbPjioxiMre0R2YErPMBI=;
        b=aSJ40g2sAO3P+yQphen2ZXP79revuZahKEzB9GigZepMz5ND+jynO3hSLUQPGomySe
         5c1nJRAZoaRsaKSropi3+BMMtZJMlauoINIO5iK9HZiez07d4EKxxl4fBI3UjUFzWvt7
         EUQ/xMYKZH6wYxsV2RG7K3k7zKsvCNGPqW4EIVan/L1gKecUYZgT232w+MvrG6cQ2IUm
         t/DOmKgjE5weVXYZACuDg5mHNbFPuF257ImtingD0yzPA3QAppV9wR8HJpt7hG3aDX7e
         3cOIpnyKfAynp8MWJgxVQ9Iw+XFNhxSrXeUAYU838MxbRja91odEYg3SPQVLkh7ET80z
         I9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493380; x=1713098180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTpah3z9nxK4+QUIUhM/zsRbPjioxiMre0R2YErPMBI=;
        b=w+Ln4iZMdi5C2nkbgoZ1gewnspr/ChVb+VczTYKUzg2+a/c0ePZgZn79gmzQkalS/I
         OXXcLX+1g21NTzve+YR8KGnBIy4iC5Q1E5Z6dyKcSiYqTLwT6jHLPzo/ohuFzFyWTyO8
         ErZq6QullMTpUYVHzeL38ECH22DCqvW3CNcjT28d2EPaTMZeKQktISNwP42sAkwxk2fb
         1yvEEDdg5Mp2PaOKIKHEH+HfKbDkVxWr5Hy5Vc18rHP3VQ5V3C8+gZoqFjVnPOtdJFI+
         WeM6wof5lYaleCH4URIOVMWf2M/BsPgKQ9aefzAoY/G6M/H0exSN45iFFFcgc5hLWVXp
         wlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCXjfsCLXs4oh4znb0t8a45BhGucehYwPVieiTQlw5o9SCNK1vAvrKK/1qt854JX4PV23wRJiq/lJKYe1cHnFEuHm97WiYMQ4LrpNdHJ7ONNOersE7JSh/UiF3Sd7XfUw7HEJJHgtY0sMbCUZcM3K+huOkaqXEDsAVMHa/FJSrichWJGju3ubizOsGJ1l1jIVU3MqpOsl3bmUTwfSMFPe3ducx+EaFvkbvhXkfsBv0wnnAv3qzyVL901SvjKG4MeOjMA==
X-Gm-Message-State: AOJu0YxYfHD/sB3WsrnC/3U7ER7KIPxw4siGZfFbH898X4v9larceh3F
	OvZs6m3tXM39JYXYmaH551pS4VdnAJR6v0DAs3MQXJ6d3W0LM0Lo9cpYnH72YfBnSLLx5bp5ytl
	p4DlIsi7Bw2PUTkURxrhea1QFyCo=
X-Google-Smtp-Source: AGHT+IHCRJwJiztaVGgYDsbvhsWKurdYA7ka/A/XrCbAAgdQQF3HjScy5xiyJE6CEank6R3QWX9EeoxlvmFNctyZZ+w=
X-Received: by 2002:a05:6870:d622:b0:229:f9fa:df52 with SMTP id
 a34-20020a056870d62200b00229f9fadf52mr7031792oaq.12.1712493380515; Sun, 07
 Apr 2024 05:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org> <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 7 Apr 2024 14:36:10 +0200
Message-ID: <CAMhs-H8jjPpoFfUngpCckAq+hix65VN4rNWMJb=Rrtkzq6nEKA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: PCI: mediatek,mt7621: add missing child
 node reg
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240407_053622_620987_483D660F 
X-CRM114-Status: GOOD (  13.60  )
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

On Sun, Apr 7, 2024 at 12:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> MT7621 PCI host bridge has children which apparently are also PCI host
> bridges, at least that's what the binding suggest.  The children have
> "reg" property, but do not explicitly define it.  Instead they rely on
> pci-bus.yaml schema, but that one has "reg" without any constraints.
>
> Define the "reg" for the children, so the binding will be more specific
> and later will allow dropping reference to deprecated pci-bus.yaml
> schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

