Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE1DC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+Cbf4Z4xMq9dOhY2lkOSlIg0Yv9C+GaGVRwFcKdaa4=; b=GnJYoe7ld2QZ6NaaGpRUp4GrA9
	JSsSrCb9ShcbMlYp3vlnwpJ3QjKuasMFFaE6kJkpAFEaF0h1qjKRX57gkcUiYj1ue7WfMeQ3DpHPK
	PaMhruhp5jNpuRabKUKQyyVw5GrVmbpNonSa25u199xzqIETbEcdfqUAcnehSnlE/z54XwzxUursS
	x75LHaApADfyD0WT342TS4EzMS8mJmR0W+WPSw2p9QcjIe+ZVf0z5VG9ssW+QKyUQQvM7NuhZPzfl
	VjKjilDbpjUEO2nHTLgqBLxvnvhdSz5Dfb0qk0pPDmKUnjrW5i3y1aoMsYalVB3OlUi9Eu+Y12Hcx
	MfDPtr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jZt-003XjG-27;
	Mon, 27 Nov 2023 21:55:42 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jZn-003Xgu-1s;
	Mon, 27 Nov 2023 21:55:37 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1fa26074783so1456131fac.1;
        Mon, 27 Nov 2023 13:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122134; x=1701726934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+Cbf4Z4xMq9dOhY2lkOSlIg0Yv9C+GaGVRwFcKdaa4=;
        b=AvwE9QUrDyICmOD1GgDVU/lJDWUkgyGTjec/qmjPpSBPQlaOVq4sLOyHXyFW3CmHv8
         aiVywIuzuLaLVH9iTXL2mg8knEqBvhSqIJQ1yc/A8uSrOxWEiw33X4U8k45RSKnUQAS4
         JJq9ZMPXx7p8FfEOQGxyN2/u2kYV58nvhs+3OxH5d1+dn4CCPxmY7XPE0NrUdsz7BodS
         Rrz9HbS19Vpa6pTUb02HZaCilVAVyD/Bdp48ZoX1X89LNs07pJ5bqWbBozoXWOh0WrVQ
         PUleNXdcNoIo4aOsjzlEy/SOR9ju7ljG2h2kCw7w9FutGt9NanLROdcVfsRA8cdMMJoj
         V3kQ==
X-Gm-Message-State: AOJu0Yx7wEK8KuhNxc6Sitf567qFszFeHBimZ1Z5wmJn/eWTLQH/giwK
	pIq+v1JMChdCP3u2E1mAfw==
X-Google-Smtp-Source: AGHT+IHE/25NEUwlRx2TOFVPP+SptbOdKM4BzwgEQJDXuam12+MKf64pu6FFsol8jZ2RdnKGcptx6g==
X-Received: by 2002:a05:6870:5d93:b0:1f0:656b:5b99 with SMTP id fu19-20020a0568705d9300b001f0656b5b99mr19942781oab.11.1701122134393;
        Mon, 27 Nov 2023 13:55:34 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id lu4-20020a056871314400b001fa54ae35e0sm681401oac.12.2023.11.27.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 13:55:33 -0800 (PST)
Received: (nullmailer pid 3942464 invoked by uid 1000);
	Mon, 27 Nov 2023 21:55:32 -0000
Date: Mon, 27 Nov 2023 15:55:32 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <20231127215532.GA3822595-robh@kernel.org>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <20231125193737.GD7486@pendragon.ideasonboard.com>
 <26f095ab-c47d-4bcb-9830-4493b1c0cc75@linaro.org>
 <20231126145340.GA19999@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126145340.GA19999@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_135535_888904_3C0989C4 
X-CRM114-Status: GOOD (  27.74  )
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

On Sun, Nov 26, 2023 at 04:53:40PM +0200, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Sun, Nov 26, 2023 at 11:32:17AM +0100, Krzysztof Kozlowski wrote:
> > On 25/11/2023 20:37, Laurent Pinchart wrote:
> > > On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> > >> Document preferred coding style for Devicetree sources (DTS and DTSI),
> > >> to bring consistency among all (sub)architectures and ease in reviews.


> > >> +
> > >> +Naming and Valid Characters
> > >> +---------------------------
> > >> +
> > >> +Devicetree specification allows broader range of characters in node and
> > > 
> > > s/Devicetree specification/The Devicetree specification/
> > > s/broader range/a broad range/
> > 
> > Ack, but I really expect people finish with grammar and style fixes at
> > v3. Please point the language things now or just let it go.
> 
> v3 is the first version that ended up in my inbox. I haven't noticed any
> other spelling or grammar error in this patch, but I can't guarantee I
> won't see any in new text that gets introduced in a future version :-)
> 
> > >> +property names, but for code readability the choice shall be narrowed.
> > >> +
> > >> +1. Node and property names are allowed to use only:
> > >> +
> > >> +   * lowercase characters: [a-z]
> > >> +   * digits: [0-9]
> > >> +   * dash: -
> > >> +
> > >> +2. Labels are allowed to use only:
> > >> +
> > >> +   * lowercase characters: [a-z]
> > >> +   * digits: [0-9]
> > >> +   * underscore: _
> > >> +
> > >> +3. Unit addresses shall use lowercase hex, without leading zeros (padding).

Unless a bus defines differently, unit addresses shall ...

> > > 
> > > I'm curious, what's the reason for this ? I think it makes the sources
> > > less readable. If the rule is "just" because that's how DT sources are
> > > written today and it would be too complicated to change that, that's
> > > fine with me.
> > 
> > Warning (unit_address_format): /cpus/cpu@0100: unit name should not have
> > leading 0s
> > 
> > And we fixed all or most of DTS some time ago.
> 
> It's the current practice in DT sources and I understand it won't get
> changed, but I was more curious about the rationale behind that.

I put the dtc check in, but the rational predates me. The OF PCI bus 
supplement from the 1990s defines that. My only rationale to check it 
was to be consistent. We don't check "the unit-address is lowercase hex"
because technically the bus defines the format. Leading 0s was as much 
as I could get David G to agree to check without regard to bus type.

Rob

