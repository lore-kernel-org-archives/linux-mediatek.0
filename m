Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B09C88E72
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yokcjFoYaQjb2AXJXwiS2CgA9icNw4hd0m3OmDjYLh0=; b=1wmVh2U8Xq20NS5X9glkW+Dyjd
	IyEdyv29/Go0qiic82tQQ0dKCOOxM2Aezw/Ajsu3DE9fhIqEMpD6H8O3tH88dlLSVDnOeWB1vN9AE
	VLKidU1W3MejFkbPGLCdQjB0OwVx4oIo9Q65sNzKV3f+n/wjPBxsjW/ZfxOSnufZrUop0InjiELkQ
	OV5Q0ziPpbVa+i3zas2blXrukYN2lrMuqt53KklE3DvPF0YbctL6SwvWIjHP3FXQ+sDKqrB9f+thN
	A2hasLG25BwcnCui05DKMrIT6HpONuTbxxRa1PkQUbBC3h7YmWz6VoMxMdFhilIT8FB/cHqj0uPe7
	C/9Z4RuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DrM-0000000Bem8-3JdU;
	Thu, 17 Sep 2026 15:17:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DrL-0000000Beld-1a4L
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 15:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A84DA60514
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 15:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8991F008A1
	for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789658230;
	bh=yokcjFoYaQjb2AXJXwiS2CgA9icNw4hd0m3OmDjYLh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=baYHiQhLKHIXv5JcbsYM8h8jWAIdy60s6NhCh0ZGU54W95BOiAuC94Ol2AcpHo47g
	 xOJkjhXStRdOshTWhG385se+mN0mwxSalEgzP9JG2PQIOLJ/oHEIVw0zHQeJ6cCyxv
	 qfvHypAZ4Aa+PBTDs1xGLwk8gxllOPs9TBclUTaLcaptPXVE/nH6o6dNw9fmKr/Ga+
	 euX0r0XKcn50B8jtWh1/A5rkcHzzpSCbjKD97mWUlLgkoyhoofyCpgqfsFLMmV7xqx
	 ARc5Jnmu7agtqFNmn3zlh9R+1V4XybdteMzm34GCd9fCbp5oeKdHFvfY4O6Spsy5NH
	 56pQ+Rtftr60g==
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1567961a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 08:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxcvKVtwtulM+A4mpiLfzGqljCZmlH7OKhquT4zfF9awA3BmcW/B8Wc54DF11ZomXMPmqZBol2IkjMAkSf8sg==@lists.infradead.org
X-Gm-Message-State: AFuF++kUVvMnRYCe3uzDfqr6jAtjuXrcytXHhJeZQNvB+JpGiX8eboWh
	ikVz3V0+rzJrjX05S1u0NrkLFIq611PUci+ftx7F/SCSo0SFn/fHaAwAc+7vThKB0GTrdI/gu8h
	rOCx1XbRb3MBZSW+KO62oHWd63mA+mg==
X-Received: by 2002:a05:6402:460c:b0:6a6:8dd:c76b with SMTP id
 4fb4d7f45d1cf-6aa22247992mr11552271a12.1.1789658228391; Thu, 17 Sep 2026
 08:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260917144134.459819-1-matyasdaniel006@gmail.com>
In-Reply-To: <20260917144134.459819-1-matyasdaniel006@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 17 Sep 2026 10:16:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyPK2rJVAyzCtGtrBSTwOKRZ_EAmE1Xd++9DFaxrrmDw@mail.gmail.com>
X-Gm-Features: AcwNN1WrkKsI-hJClnXnbb72poP7rLqVHTc23ccK3T-HSnvYyjsVzuH4L2tWH2Y
Message-ID: <CAL_JsqLyPK2rJVAyzCtGtrBSTwOKRZ_EAmE1Xd++9DFaxrrmDw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Dharma Balasubiramani <dharma.b@microchip.com>, 
	Jeff LaBundy <jeff@labundy.com>, Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Atish Patra <atishp@rivosinc.com>, 
	Shawn Guo <shawn.guo@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Okan Sahin <Okan.Sahin@analog.com>, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Ricard Wanderlof <ricardw@axis.com>, patches@opensource.cirrus.com, 
	Lukas Wunner <lukas@wunner.de>, Eugen Hristev <ehristev@kernel.org>, mfd@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 17, 2026 at 9:41=E2=80=AFAM Daniel Matyas <matyasdaniel006@gmai=
l.com> wrote:
>
> Running dt_bindings_check returned:
> [error] string value is redundantly quoted with any quotes (quoted-string=
s)
>

That false positive is fixed in newer versions of yamllint since at
least a year and a half ago. There's also some other quoting checks
I'd like to turn on, but that bumps the minimum version since unknown
checks are an error in yamllint.

> The files used quotation marks in flow lists because the strings had
> commas and these commas were interpreted as separators. Convert flow
> style lists to block style lists, so that there is no problems with the
> commas.

If we wanted to fix like this, we should probably just require block
style everywhere, but I don't think we should do that.

Rob

