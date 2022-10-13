Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14759C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BvoIBHUV7sSVu2BmHzPijjDNXDNKD3Zm0QyxZGcDVo=; b=1F0w3PaMLx25HE9d2hm8sUASYI
	94wefGkqFlp9lze8U1sreX/N4M/JXdNdvXT6Op5X/wkFkzIbuVtaXlF6R8+gmdAcdYgSzvsYn2zFo
	76djE3QToyc7g9AV3TfiIa6TxFAF+/bIRYYBjqYs+oEZth3uSc/GaERel0xB5X7j4hkzZuhJFbU+g
	DWyCPc2xJeGDPGXmquSCqYntH9WEnxCQdKs3Ao4dkn3fV2z4QR9sZMlzM05VgWOCjTE19OY5dulRy
	PU5TgsGjRm8wmznvbi51bcKb0zYbvajO9ukIc4lz4Ygd0gcFTSGZWdpBaD7XtYaOL2MuLPhPe+RZR
	Y8GJE2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3i3-00CozK-Dz; Thu, 13 Oct 2022 19:17:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3hs-00Coxk-9j; Thu, 13 Oct 2022 19:17:25 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A375A6602368;
	Thu, 13 Oct 2022 20:17:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665688640;
	bh=XPnR4eQV28aEp36A+Rnv4iyGHE4Pd9SCoAN03pw58P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzWBMXxdFMBv5H+c45VXabjDnKOzjvHL4QRrFhyXiy5wnTgM+9+VM9ZWIWwPcWT8h
	 VrENFQyS4lyQEmPUZIPBgxi/UAQZJFLamwPugjkTDfja/5l/5U5q9RNKxcp0CiZ7Ej
	 R+Cv/uaCmYaUDtiPk7Q3FW/5QhWxSyfpCw+hrXbeCzTnOZ46FXH3mSwHSreSR4nl0O
	 KbNY653iWHEmxX6hAT1Suk/TYvW61gyRaAdCcZkaPSGw4cXp6uu/k/NZlC7xC5e7wx
	 Xr0dLwJqzHCBh4H8NkRClQOukrcs20LpwVJPuc4iWH4rz2Ft/LbD2F3vcnU6u12AWS
	 h9o6glcq2689w==
Date: Thu, 13 Oct 2022 15:17:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: asurada: Enable audio
 support
Message-ID: <20221013191715.5dyqunog2qj4z3fh@notapiano>
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-5-nfraprado@collabora.com>
 <CAGXv+5F684=hFa42vSuN24eBTGjj7LEQNzog9U8dEQffz0JZMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5F684=hFa42vSuN24eBTGjj7LEQNzog9U8dEQffz0JZMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_121724_508744_48472C69 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, Oct 07, 2022 at 02:53:24PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 7, 2022 at 5:25 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Enable audio support for the Asurada platform. This consists of the
> > machine sound card, the rt1015p codec for the speakers, the rt5682 codec
> > for the headset, and the dmic codec for the internal microphone.
> >
> > HDMI audio support is left out for now since the DisplayPort chip
> > required isn't enabled yet.
> >
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> However the UCM you linked to in the cover letter didn't seem to work
> correctly.

Did you comment out the HDMI section in the UCM? This series doesn't add support
for HDMI but the UCM already configures it.

I sent the UCM with HDMI support since I have it working locally and was hoping
that the HDMI support would be merged shortly on the kernel side, but on second
thought it makes more sense to have a working though incomplete UCM merged for
now and add the HDMI support later when it's ready on the kernel side, so I'll
update the UCM to go this route.

Thanks,
Nícolas

