Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B63FD4F13
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z95EWVsrMzPDT562nCNm2Yx6CMWIqcpH/rEof9XkH8U=; b=xwpN0S9nzO9PCEOW/KYKjAMZqY
	gPyKhVdgSTpkiksrAN9ZMKQ8+LLwzfDYubV81v/S9uQQrXX9v469Hr5FwIMpQrE7OjvFfP9qbRxWr
	ZBO5hMzePQHr4e2wTsgD5oKk3fQjqZvjsQulhg4e5YiwotHVGNGG2SuRxzEn4AlCvlmojTkDHcKFE
	G9Uq8L96b3x3xc47WbL5JG7EN6RNwx4lJME3+kQxmVqihUqS+4SZ+GhOA8eIFhu86gwHhi7KFreMY
	oxnaBt2oO/hosawRFhm07uRwHAASwhKCjLHWc28ZWovkEkOPeDXrXgDLiIFP7IwILqPYBbHRfxnmR
	LykWRBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01XL-0000000A34A-309H;
	Tue, 10 Mar 2026 18:10:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01XI-0000000A32Y-3WCe
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 18:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14AB543967
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 18:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E351BC19423
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166227;
	bh=+BkbeGlWZU3HoPWqSJ4ZGWH/mYA1R9F66ZxBmJ6EvZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hnhADpr9PWgFP+e86Uvz85mpCd3sjX+Fn9/25JBt93xOCSRZiFFDcURInjGHFNEZv
	 CCUblqp+Gc4vpZEOj3N2SKySqYc+f9+AkO93+iKkTVMR10eJttAuG6saQieHdEKtD+
	 Elkxk2zhhfSbPG6gcDvv1jrokD/I4RNyeLAHjkIa37t3QjBSCobkgnxb0Fx+iVmJCg
	 hEcl3I5TzqikCJaHNBN5SgEKWHVWiRYsFIjYlHU6raTgnFgk6K6hpFTkxiUivXWP4L
	 2d2QGGRswTsLr/uOoGKTHGJG9OiTt/ufXFTV/swL4qwYvhaY9i2OpEKGaZVo0jRtTj
	 EpibWBdvp0xIQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b936331786dso1466141866b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYP0YF5spL/t3XrSTKMXWICz5AUT7boQH7y3BOOnTfrQyFw4cS7LSGRpjot8lqBcGzWq4FsmBvFjDyIuKZFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIMmjv4cOohsuGHLT9pH580ktDgDH0qsyvYtiSnLPQjrXCZAlk
	Q+32rv4DNbEYXI8SDFg1+CXlwhcGMnJMhDArZ+ikm3fA7fQvti9/XY2zhcOxmViKzzwSXtdZ73X
	0jLKh0kPxfa8pMHR6hFOs8txpleRBDw==
X-Received: by 2002:a17:906:2091:b0:b97:1d24:c015 with SMTP id
 a640c23a62f3a-b971d24fa35mr124911866b.40.1773166226421; Tue, 10 Mar 2026
 11:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <20260306-mt8196-ufs-v9-3-55b073f7a830@collabora.com> <20260306163305.GA2680515-robh@kernel.org>
 <4089450.ElGaqSPkdT@workhorse>
In-Reply-To: <4089450.ElGaqSPkdT@workhorse>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 13:10:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mF_Q7Ld8__ZTc5yDvWAT6uK5wxfBJM-YdFjOvdiDc-w@mail.gmail.com>
X-Gm-Features: AaiRm53tDdS80GaVjUeFGPThiibYh4p5Q5y90_XYQtN7oN_0_RN9C3azVe77kTU
Message-ID: <CAL_Jsq+mF_Q7Ld8__ZTc5yDvWAT6uK5wxfBJM-YdFjOvdiDc-w@mail.gmail.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Stanley Jhu <chu.stanley@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Chaotian Jing <Chaotian.Jing@mediatek.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_111028_918124_C18A0BF0 
X-CRM114-Status: GOOD (  31.34  )
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

On Fri, Mar 6, 2026 at 12:37=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 6 March 2026 17:33:05 Central European Standard Time Rob Herri=
ng wrote:
> > On Fri, Mar 06, 2026 at 02:24:44PM +0100, Nicolas Frattaroli wrote:
> > > The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> > > compared to the MT8195, and a different set of supplies. It is theref=
ore
> > > not compatible with the MT8195.
> > >
> > > While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS p=
in,
> > > it appears that these two pins are commoned together, as the board
> > > schematic I have access to uses the same supply for both, and the
> > > downstream driver does not distinguish between the two supplies eithe=
r.
> > >
> > > Add a compatible for it, and modify the binding correspondingly.
> > >
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 58 ++++++++++++=
+++++++++-
> > >  1 file changed, 57 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml =
b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > index e0aef3e5f56b..a82119ecbfe8 100644
> > > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > @@ -16,10 +16,11 @@ properties:
> > >        - mediatek,mt8183-ufshci
> > >        - mediatek,mt8192-ufshci
> > >        - mediatek,mt8195-ufshci
> > > +      - mediatek,mt8196-ufshci
> > >
> > >    clocks:
> > >      minItems: 1
> > > -    maxItems: 13
> > > +    maxItems: 16
> > >
> > >    clock-names:
> > >      minItems: 1
> > > @@ -37,6 +38,9 @@ properties:
> > >        - const: crypt_perf
> > >        - const: ufs_rx_symbol0
> > >        - const: ufs_rx_symbol1
> > > +      - const: ufs_sel
> >
> > "ufs" is redundant as all the clocks are for UFS. Same comment on prior
> > patch.
>
> Is this naming a big enough concern to block this series with two
> explicit acks on this patch that fixes a wholly broken and useless
> binding?

Shrug... Is changing it really that hard?

> > > +      - const: ufs_sel_min_src
> > > +      - const: ufs_sel_max_src
> >
> > "src" sounds like a parent clock? If so, probably shouldn't be in the
> > clocks list. 'assigned-clocks' is for dealing with parent clocks.
> >
>
> I don't know what it is, and I have no way to consult any documentation
> that would tell me what it is. I am trying to put out this dumpster fire
> of a downstream turd that made its way into mainline as the review proces=
s
> has been completely subverted, and is only getting worse with each passin=
g
> month that MediaTek is allowed to block this series from progressing whil=
e
> sneaking further changes through.

It's good Mediatek is active, then they can tell us what the clocks
are for. I would think the driver would give some clue.

I don't see how accepting sub-par bindings or not fixes the issues here.

Rob

