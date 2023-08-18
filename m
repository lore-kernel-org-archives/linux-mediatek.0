Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140FCEE4982
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikwfu9DH7JwxtNa7wy36gd76Env6yF/Ptb67ShfYiGU=; b=aWpzrEn5wwtypC/ZiQi2Erohm3
	1enIUEq/wLDCXo8YYNP/xJDwLqsOmJoFmrDUlZ6YL6EptLt1PJiUZkERWjAnt5rb0q/6OEmbrE5ID
	6kb8Zja4kyIpyUlnfvHJmzakA4jHSJUX51Pcrmu0GuFCHG8GgJM8urnhxO57KlG/SPciMUFHNkgWg
	us3xnu4RG6DF6JaNv07SMGhFDJIK131zUlT0kzW+1c9WyBZH6gn0ck9lmzNxfMPHQIrJrg5HpKxqF
	7PeRuuQVvNuzmhKCBwKKavXoCmqb1+BHHlGG688BPCQJkAfEiXkIj7jFNGefiQUUPlurdqkTo63Q2
	GDdBL/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3Pr-009nlq-1E;
	Fri, 18 Aug 2023 17:37:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3Pn-009nkU-1I;
	Fri, 18 Aug 2023 17:37:41 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9D7A6607258;
	Fri, 18 Aug 2023 18:37:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692380250;
	bh=zn9oR99CAXJJI6TttM03GCqH+pqWZJKU1SVZwemu3yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwwBy4A/RdqwsiL/aVstRnbEbJG0J67iiUd3ZtOE+2bOQYU34iOrIhQnyHN+OGlWt
	 XzdfIpGz4sw8GZxB8rwck6kkz+xgevU3z8xXzAw3gM/LLXxwqypjVAP/eKGOq1gW0f
	 j0LSyLoK+3kAdVCBTLUV0te4mgYJLWyeIl4+W7iYQNdxfn2bXAgOHkd+mIXY4pE2Jn
	 OQUosFAUW1yXiD8D47aufHGNfdnYb9Ew8tXZTC1i+4nf4BSLizdY0tcFkNopmjHcca
	 qLlUJEBRQWJXFPiIb2Ilk2GlaxdFWDR82d0yPsTdz2+PqMQL/GDOoZdxO9EUaHQls9
	 e1qg99odBunPA==
Date: Fri, 18 Aug 2023 13:37:24 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: mediatek: cherry: Configure eDP and
 internal display
Message-ID: <8e7ce141-9c7b-4bf8-8929-deeebdbb9ac8@notapiano>
References: <20230816190427.2137768-1-nfraprado@collabora.com>
 <CAGXv+5EnbovYSfw=_wSKyKTSbDQYu6UW8u8L5bm9PKjN1dVGyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EnbovYSfw=_wSKyKTSbDQYu6UW8u8L5bm9PKjN1dVGyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_103739_596925_038ACF39 
X-CRM114-Status: GOOD (  17.66  )
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

On Thu, Aug 17, 2023 at 05:19:22PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 17, 2023 at 3:04 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > Add the required nodes to enable the DisplayPort interface, connected
> > to the Embedded DisplayPort port, where we have an internal display.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > [nfraprado: removed always-on, added vin-supply and enable delay]
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> > ---
> > The MediaTek DRM changes needed for MT8195 have already been queued for
> > v6.6 [1], so this DT patch is the last missing piece needed to get
> > a working display on MT8195 Tomato.
> >
> > [1] https://lore.kernel.org/all/20230813152726.14802-1-chunkuang.hu@kernel.org/
> >
> > Changes in v3:
> > - Split from "MT8195 Acer Tomato - devicetrees Part 3" series
> 
> The platform thermal patch from that series hasn't been merged either?

Yes, indeed. But given that the DRM series was just merged and this became the
last missing piece to make MT8195-Tomato an actually usable chromebook upstream,
I thought it made sense to split this patch so it can be prioritized for the
v6.6 merge window.

But I'll also send a new version for the thermal patch.

Thanks,
Nícolas

