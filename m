Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A91C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 05:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTOOhYSz2Wo3skXNKI7YNt40yz1EYPv8kOg9CCS27tM=; b=4jc4ektrNVHqKO1eQSRzSBZi9f
	gcr0yUzwepNDbMNn27SrXsQdtg+lJB2zq5f8O7PG7q6mee0pRMvaBohd4EQGIKjNm0VL30pA7/aZs
	DtM1H9Q9dSpeHwoQ1VLoW3FVdxooCxLrayUywPvVBB6X1Axbl6j1J3De02H1QdcsRr9v030fYt6Wo
	CmW2BbexGkqYsyrM+HHKsWDhXdiw1+CDsb0szBymcD8I6K46H8HNI2611gF5TDb+qlOWPzNnOy0Fx
	XarcgPf7wYJbBxTHo657v/k1MQrdFtmGs1hTf5jOQG38I2Mw1xKT2p4ppROegTC8yQQUVBWnR+Hq5
	52GBt+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o799i-002xAj-B9; Fri, 01 Jul 2022 05:25:26 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o799X-002x7v-0P
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 05:25:16 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3137316bb69so12976117b3.10
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XTOOhYSz2Wo3skXNKI7YNt40yz1EYPv8kOg9CCS27tM=;
        b=OUVBm9UxYy8zUYolvkYKO2nN8kvaVrHfPshLWiz0dIbiqpLsnYO6NS8OQe7K61FvgG
         xlFLGudBSW9dFhmMZTMxw8rmKFA8aNvSEK+JjYGsDksY1MDQUtONRgS8zB9+Cq40w3GZ
         AkQXnp9ANfc3yECwFgfym9eIp0xkR7YYdxN48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XTOOhYSz2Wo3skXNKI7YNt40yz1EYPv8kOg9CCS27tM=;
        b=jAONmW/U3++ADo0uGKFZR61XzqGILOirNGVWTBtcoRcn0YNCmmJu0IUh8ivP2d/BsR
         XAa6bXy6hbrgjGpsJqY0YU5dGXRBjOINenLEMZe0tEiQr0hIYXWodTrot3T/GQ2ie6K9
         fkoQCS5xLObiCBIwXTRzEUhJgejgXrMEw6kHFQLRTP1fad05PqO/ZGaA5DGoHC3+/zBE
         hN6bDEbw5+tJ56nw7OHFVLSH2DUwoxLihSg61QBbI3HMPz4zupuPw6hvHzp6Qki3hw7f
         c0pnlYytMgIAB9VHmBy7Rqcb6luvRgD/sEWpmQlGuHe/Upxt0GHGK8n/pz0TmkOWO+Hf
         jTCg==
X-Gm-Message-State: AJIora9860RdxDU64zKIfmTmkyQU7w51T4DR5ULC/dsgixLmixpyf0zC
	qCyV5QOdwQ+Rl1frVcEDedK054eKsSBzRjG7QP7TU3mUYoIUKw==
X-Google-Smtp-Source: AGRyM1tzFRf+vWswFtN/NIUdUvvppuw3iV6XZTQB0jFpMstnBu/FE0ARw+3sZHiT20dCyvZqYsyn3NLnLK+W5NulKng=
X-Received: by 2002:a81:19ca:0:b0:31b:732c:15e9 with SMTP id
 193-20020a8119ca000000b0031b732c15e9mr14884710ywz.167.1656653112137; Thu, 30
 Jun 2022 22:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-4-allen-kh.cheng@mediatek.com> <20220629232429.c5oysjgy6gflqhct@notapiano>
 <99342f13190cb4ea103c4227e6672eb5cad63b82.camel@mediatek.com> <20220630134210.7j665amh6tbeaecv@notapiano>
In-Reply-To: <20220630134210.7j665amh6tbeaecv@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 13:25:01 +0800
Message-ID: <CAGXv+5EKK_eicvD6-nFG0CkirYA2sFUJp59m6RK7y534HvYwbg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: mt8192: Add display nodes
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_222515_084334_2892F5E7 
X-CRM114-Status: GOOD (  27.21  )
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

On Thu, Jun 30, 2022 at 9:42 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Jun 30, 2022 at 05:41:31PM +0800, allen-kh.cheng wrote:
> > Hi N=C3=ADcolas,
> >
> > On Wed, 2022-06-29 at 19:24 -0400, N=C3=ADcolas F. R. A. Prado wrote:
> > > On Wed, Jun 29, 2022 at 08:13:56PM +0800, Allen-KH Cheng wrote:
> > > > Add display nodes and gce info for mt8192 SoC.
> > > >
> > > > GCE (Global Command Engine) properties to the display nodes in
> > > > order to
> > > > enable the usage of the CMDQ (Command Queue), which is required for
> > > > operating the display.
> > > >
> > > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > angelogioacchino.delregno@collabora.com>
> > > > ---
> > > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 136
> > > > +++++++++++++++++++++++
> > > >  1 file changed, 136 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > index a07edc82d403..26d01544b4ea 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> [..]
> > > > +         rdma0: rdma@14007000 {
> > > > +                 compatible =3D "mediatek,mt8192-disp-rdma";
> > >
> > > dtbs_check is complaining that there isn't a "mediatek,mt8183-disp-
> > > rdma"
> > > fallback compatible here. But given that the rdma driver matches
> > > directly to the
> > > mt8192 compatible, I think the node here is fine, and the binding is
> > > the one
> > > that should be updated.
> > >
> >
> > I have checked the binding and driver again.
> >
> > I prefer use "mediatek,mt8186-disp-rdma" as fallback and remove mt8192
> > compatible and data in mtk_disp_rdma.c because they are the same with
> > mt8183.
> >
> > Do you think it is okay?
>
> Sure, that sounds good to me as well.

That's backwards. MT8192 was released well before MT8186. The latter hasn't
even hit the market yet.

Please use "mediatek,mt8183-disp-rdma" as fallback. And you need to keep
"mediatek,mt8192-disp-rdma" as the most specific compatible string, because
we want SoC specific compatible strings.

For the driver, there isn't any difference between mt8183 and mt8192 for
the rdma part, so we might as well just remove the mt8192 compatible from
the driver.


Regards
ChenYu

