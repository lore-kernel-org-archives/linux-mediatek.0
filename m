Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6136C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMR8an0JRWHZA1P1/uHnoRp0s3WrOGW2c1tblhIF0S0=; b=u/WSe6/ngTTKiaNRCLgzae5dMz
	f23QMXQS1/SrfdhDOAmVJTYOTmWz1KaRCea+IKk4s8tqu0fBZQbZO6DRBW4OLqwAduJkWJpZsz40R
	o7YBExnttc8PkmPQuwSKQJGCNbxibFEVOJ5qKcqXoT7C7FSeP/FqTtDi3RkKrOB3hSVOqv4C74UD9
	W8JZrpmZaEacYAKxLKm4DXqLryQ+JMAiPpqBgQlisxWw+gvS8ZNClkvIK45Y0NMJLZCuOQLf4SbYb
	cEnnViEnBlLuvuVLo8aHJMyTx6g4+WOeXHucu6FjR8ePE0WFMHbAvd5ViN4a3T9uRtbeRywUEZPsF
	ACIPk6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwkx-00000000mao-0khi;
	Tue, 30 Jan 2024 22:39:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwkt-00000000mZM-26gR;
	Tue, 30 Jan 2024 22:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A6146110F;
	Tue, 30 Jan 2024 22:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEABC433C7;
	Tue, 30 Jan 2024 22:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706654338;
	bh=8Eyya2MZJxron5ZGyDFt7s2SHtvsfbEMHuSW8clUuFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZqJ1j+iT4U1BpRQSHn+TKtGmW+du+QKRF7/9gbYMjf0dVK8rzdEq+m7boXXeg4Js
	 1tao+CN71PidDU27iAQ+oPFCDReDWW5k6mRlBSTavzIGXIA7pnH+2fdTRC29sj9hwV
	 g2qGfiAa6yyczzBrgTDjeHPKnpH91ym6Jvko3bLlmh8UMMIM92e8IVQ283ucErsHKf
	 Q7XXGlQC2kx65ZuvP0utNzdN25wV+d1E7iPZwKFCMhRTEOozPUn3phiYp/2CPZ4gNP
	 XwTQYHZIs0nBW2aRyTIPdu1ErbFAFBnXExyt/gRbq/wbBwQj712kC/Kqz0hBe/jiN3
	 ZBVqPY2N/sVsA==
Date: Tue, 30 Jan 2024 16:38:56 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
Message-ID: <20240130223856.GA2538998-robh@kernel.org>
References: <20240126063500.2684087-1-wenst@chromium.org>
 <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org>
 <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org>
 <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
 <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
 <78241d63-3b9d-4c04-9ea5-11b45eac6f00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78241d63-3b9d-4c04-9ea5-11b45eac6f00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_143859_642573_737E2632 
X-CRM114-Status: GOOD (  25.91  )
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

On Tue, Jan 30, 2024 at 05:25:38PM +0100, Krzysztof Kozlowski wrote:
> On 30/01/2024 08:47, Chen-Yu Tsai wrote:
> > On Tue, Jan 30, 2024 at 3:37 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
> >>> On Mon, Jan 29, 2024 at 3:34 PM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
> >>>>
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: bluetooth-controller.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    enum:
> >>>>>>> +      - mediatek,mt7921s-bluetooth
> >>>>>>
> >>>>>> Can it be also WiFi on separate bus? How many device nodes do you need
> >>>>>> for this device?
> >>>>>
> >>>>> For the "S" variant, WiFi is also on SDIO. For the other two variants,
> >>>>> "U" and "E", WiFi goes over USB and PCIe respectively. On both those
> >>>>> variants, Bluetooth can either go over USB or UART. That is what I
> >>>>> gathered from the pinouts. There are a dozen GPIO pins which don't
> >>>>> have detailed descriptions though. If you want a comprehensive
> >>>>> binding of the whole chip and all its variants, I suggest we ask
> >>>>> MediaTek to provide it instead. My goal with the binding is to document
> >>>>> existing usage and allow me to upstream new device trees.
> >>>>>
> >>>>> For now we only need the Bluetooth node. The WiFi part is perfectly
> >>>>> detectable, and the driver doesn't seem to need the WiFi reset pin.
> >>>>> The Bluetooth driver only uses its reset pin to reset a hung controller.
> >>>>
> >>>> Then suffix "bluetooth" seems redundant.
> >>>
> >>> I think keeping the suffix makes more sense though. The chip is a two
> >>> function piece, and this only targets one of the functions. Also, the
> >>
> >> That's why I asked and you said there is only one interface: SDIO.
> > 
> > There's only one interface, SDIO, but two SDIO functions. The two
> > functions, if both were to be described in the device tree, would
> > be two separate nodes. We just don't have any use for the WiFi one
> > right now. Does that make sense to keep the suffix?
> 
> Number of functions does not really matter. Number of interfaces on the
> bus would matter. Why would you have two separate nodes for the same
> SDIO interface? Or do you want to say there are two interfaces?

Right, one device at 2 addresses on a bus should be a node with 2 "reg" 
entries, not 2 nodes with 1 "reg" address each.

Rob

