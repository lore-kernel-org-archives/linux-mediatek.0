Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C173CFD313
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVhQPGFGqrt1+uVUFNTc71/aYdl5cd0D4DfQVcOLfgI=; b=hYEMfxaY08CftxmJL33bZcuZnM
	jV8tbtvpVjw5rID/tW4iTwDhqz1LWbD3GgL15Jsyhzj438HCbnvkwKlp+M/BggBva2EPQSQT3k57E
	AAiBTQE43cQWXUncVfAeX0ItuPGnc9vCoCBwmMXfn/WAqpaLyXSJUGhR8ndQ0GplRgvamDJ7qW8mw
	E29XlukKtbOoijCPO4Ky6d1NbsdyrKWWWxyItE6Pfffx7aOF57k72h+WlB9tU3S2NaCX+9LxJgfRE
	L/ZYEQJ8QwAvwv04f09jLH75RxfANBIVi+e4ph5vy+9z8U7m//15tLgraRMABLL72MXg7vFRKY1mv
	lrdaNqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbhe-0000000CCeu-0vQR;
	Mon, 24 Nov 2025 18:54:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbhb-0000000CCd7-0hXh
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Nov 2025 18:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EDBB4440A
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037CCC116C6
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764010458;
	bh=TEK7y+I345Za9ATxX+knyA/Uh489WPY9Dd1JCZP1I5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jaJZZFHd9EbEwx/HXqWrnJzLLWTmDsjeCYIq0msXegrh1uOLQsYkLcGsOqDhYGYa1
	 ulVE7WOFxgFtpE2/6TkwNTfV+9Rh0FSoTOohVIha1MYp1K5u2GOOF4aS+plyAfBAle
	 vAZP1pWHSc2BhkypnD2nz0a3oVcYZoWGxiPrhyCwtfso6TjC0ca6YjyLVtMdloPCZj
	 YjsoUkmPkN4DfXzzlBmRG07pBRUjbMkoJH5hAhMxXKO6mhdkj9L8ykHTsvk6JpcSId
	 e4dHeGWi1OOrSvjb2TfH3swea0z/yg8jzYuM1iQ+XmmH3i9ds4f6wja6p20TfYTyKh
	 Wz2iE90nWxrRA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so7809135a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 10:54:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4DPAg11LaQ9vsczv/+UJnrZFBxK/j3FxA2GClyzzuCXzEAjMXU2tw88Co8FudNZkqUhAh5nLDiWXItGsbuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9VM/n3jaCaI1ILU+ftjE222kVN4b6GZqx2GOwblrYr0mvAztC
	nhoz4Xd/UTdL/ZQ4KVidLzGAm0D/neyaCAKOHFWsiySy7j5H7hXQk0TIno7RgaaQd2eBnjAOyjp
	YTLuyZG6BTSIaPCXZ7dlrZa9zkexQmQ==
X-Google-Smtp-Source: AGHT+IFReAtDFuSFDhp918Ohx2vHaiN5KlMAX/uodATZY6O/YB75rQVqkELqtwQbH271c/8FxbJ2Dkum3f0Uu3OWMzM=
X-Received: by 2002:a05:6402:5252:b0:643:4e9c:d166 with SMTP id
 4fb4d7f45d1cf-6455443ed4cmr10891528a12.8.1764010456224; Mon, 24 Nov 2025
 10:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com> <20250912140619.GA1293647-robh@kernel.org>
 <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
In-Reply-To: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 12:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
X-Gm-Features: AWmQ_blUF-g1qhHGkKsa6U6HY_V7mtf4Q-WkpVuhZVm09t2HSWt6-IOrweXVTPs
Message-ID: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com, 
	flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com, 
	jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com, 
	tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_105419_262722_F4D4D5A6 
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

On Wed, Oct 1, 2025 at 12:28=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Rob,
>
> On 9/12/25 11:06 AM, Rob Herring wrote:
> > On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
> >> Convert the existing text-based DT bindings for Marvell 8897/8997
> >> (sd8897/sd8997) bluetooth devices controller to a DT schema.
> >>
> >> While here:
> >>
> >> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
> >>    schema definition as these are currently documented in file [0].
> >> * DT binding users are updated to use bluetooth generic name
> >>    recommendation.
> >>
> >> [0] Documentation/devicetree/bindings/net/btusb.txt
> >>
> >> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >> ---
> >>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 +++++++++++++++++=
+
> >>   .../devicetree/bindings/net/btusb.txt         |  2 +-
> >>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------=
--
> >
> >>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
> >>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
> >>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> >
> > .dts files should be separate patches. Please send the bindings patches
> > separately per subsystem so subsystem maintainers can apply them. All
> > the Mediatek dts changes can be 1 series.
>
> Ack, will fix in v3.

Are you going to send v3 still?

Rob

