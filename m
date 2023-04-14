Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE7AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olkBpwelntIx7Tyor7pZY2ygJ+sxpqPGEPSxW9RBwyY=; b=xZsl2LIHgRWIt38GL0AnoklOWU
	A+IH9egnpqeegIYeAJjF1fKmCjbM2cpwAG6oqOc+hTUMsjwQMm40Dj28gPnBP07B0s4tTquwRgN50
	PhK6Otw1NqLrqdyG1itJEMT0J+HTptQnNuo7zalrWKifLvu75axeNaU7rXnawdpc7nG+Z9I95orXv
	tyT3RY9bJ1ziIh3a7OXOELLF0yNrGPLjIpBjsTUCblwQUIce6tKq8BmQVvrHRoxwFFgonxB65++LP
	09y10KHCD5MGNyn3S9LJ2w9g9KWY9TEgVJtJkCosMyv3ihXK8csvOi2DfnNOlvch7oLIn34h+oejf
	E6cZlw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDXM-008Vm6-1N;
	Fri, 14 Apr 2023 07:08:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnDXI-008VkW-2f;
	Fri, 14 Apr 2023 07:07:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A47006434F;
	Fri, 14 Apr 2023 07:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D9CC433D2;
	Fri, 14 Apr 2023 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681456073;
	bh=leq9UGYYDxJ5qeejBWsEvNY2y+gGUIqDDe6MNk/qmsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ith2rptmH3lkLgjnSQxC6xEV6u5X6eWkyQwRr/mRe9Qf6AsoFcPTQTI54iOkLm1GR
	 Rf7MoCirXwGp8nZfm2UBJbFVi9wAoq79eIOnbNobW87YmDGxbFxmLfC8jXCf0/I/sQ
	 EHuUEpg+iEuMk/iOmSwxCt+z42GGcr0mm9Is06F+jr5+zsCPPDngvQ/1kaDp27PbKQ
	 gvhFk4tt8DRKtTmtJ1nxa+s9yfN4WY3HjQbU7KVr2hS4ZWl8nVvIfeKnmm2ZZK6NlN
	 ax8osBbssd4fOPUrlxs0dJn7FD5HFXeZqxfdZzadL1wnAJhAiV1a8oXfVSOA14IEhG
	 uxDpIbWJSMgJQ==
Date: Fri, 14 Apr 2023 08:07:48 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pavel Machek <pavel@ucw.cz>, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 7/7] leds: leds-mt6323: Add support for WLEDs and
 MT6332
Message-ID: <20230414070748.GB1036697@google.com>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-8-angelogioacchino.delregno@collabora.com>
 <ZDfiNSAs3Bc7xe1l@duo.ucw.cz>
 <76c89ad1-a189-c907-590c-35ae6b7edd9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76c89ad1-a189-c907-590c-35ae6b7edd9e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_000756_909235_6ACC264B 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, 13 Apr 2023, AngeloGioacchino Del Regno wrote:

> Il 13/04/23 13:06, Pavel Machek ha scritto:
> > Hi!
> >
> > > Add basic code to turn on and off WLEDs and wire up MT6332 support
> > > to take advantage of it.
> > > This is a simple approach due to to the aforementioned PMIC supporting
> > > only on/off status so, at the time of writing, it is impossible for me
> > > to validate more advanced functionality due to lack of hardware.
> >
> >
> > > @@ -467,14 +590,24 @@ static int mt6323_led_probe(struct platform_device *pdev)
> > >   			goto put_child_node;
> > >   		}
> > > +		is_wled = of_property_read_bool(child, "mediatek,is-wled");
> > > +
> >
> > This needs documenting in the binding, no?
>
> Yes, and I forgot to. Would it be okay if I send a supplementary patch out
> of this series to document that since the bindings are already acked?

You can add the support as part of a new patch.

Please resend this series with it attached.

--
Lee Jones [李琼斯]

