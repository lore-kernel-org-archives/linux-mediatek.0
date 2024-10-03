Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0DACF8551
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 08:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3r8VTpa5rQNT1752KdN5+MdYavCY3+0qn/sOWEYrSA=; b=0Gi5I062zybHUEgUU3TRVJHL/3
	k2x++w2CRWHSxdMEwQpMXmkGdl8ZHLtoNBk5vZHbvWbuMfQpJK83DuQIPG3YImJZhxplPMKox8xp1
	Be6wgy3yoMweFS2MR40nVIDkO/5L7dEazte/RlROgdC244ZfQyHBuAMbvUFSpsaknOEngVAnBTqZ4
	i7s6oqOPGGslfwP1ig+fLGdHDdozAdk5dc3v9pm/5UfnjxMsyd5h0BoSs2RRNLzE4zKjQ9x+DmK1C
	psmgjQlat+QgRONA86gBCJdzzVTNve+jihN8T9dM2CPXH0Cnye57F/h8tOBESo24kcCYWCsO0wbcd
	0HCt7Zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGzQ-00000008WQv-3Wa6;
	Thu, 03 Oct 2024 08:15:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGy5-00000008Vo4-0TO5;
	Thu, 03 Oct 2024 08:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DE735C5C68;
	Thu,  3 Oct 2024 08:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEADC4CEC7;
	Thu,  3 Oct 2024 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727943227;
	bh=Itl0lNG3SHyzps1B6SjVO8EibEF/9aynPeJRbif+49g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAXw7Q5M0keCOif6SbQ75a0Xvs+MmWKWITYiRBIFE5fEnxvwQSdHwSYDh/7K05bqa
	 +laZ7ZA+sMwFgKh6dLhZM487lJ4IaUpjSYsSH7+CRlhpD6U/5zZFbPHPq4L8XiXeke
	 gQ5OGvEbxEwq4vFRnWvT571Y/G28kzb/l/snDduc4iZyyMWf+A5hV77Mkidg3WfCGy
	 hIZYBrnvKECo8vTEtJMBXeKAoMDBDXxwpB3psujRpiIYJdICVRmWhqpJl2jH3OXrQp
	 2tiHTLWKNpDB7HAxI+HjYBTfXaM6f8I3ppEaih7n0CBG/CGO5oFq2Vdm2gxXQ6b4A0
	 Tf6Lp9DikBGcQ==
Date: Thu, 3 Oct 2024 10:13:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
Message-ID: <74uvqyd2n6cxzi4z3miqh5ay7xun2qapjuse7bav5thr44rlml@pr44cvxsngfe>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
 <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
 <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_011349_216726_8ADDE0D0 
X-CRM114-Status: GOOD (  22.66  )
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

On Wed, Oct 02, 2024 at 09:42:32AM +0200, AngeloGioacchino Del Regno wrote:
> Il 02/10/24 08:11, Krzysztof Kozlowski ha scritto:
> > On Wed, Oct 02, 2024 at 10:21:35AM +0800, Pablo Sun wrote:
> > > mt8188 has the same GPU speed binning efuse field just
> > > like mt8186, which requires post-processing to convert to the
> > > bit field format specified by OPP table.
> > > 
> > > Add the binding for the compatible list:
> > >    "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
> > > so mt8188 uses the same conversion.
> > > 
> > > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > index 32b8c1eb4e80..70815a3329bf 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> > > @@ -39,6 +39,10 @@ properties:
> > >                 - mediatek,mt8195-efuse
> > >                 - mediatek,mt8516-efuse
> > >             - const: mediatek,efuse
> > > +      - items:
> > > +          - enum:
> > > +              - mediatek,mt8188-efuse
> > > +          - const: mediatek,mt8186-efuse
> > 
> > And this is not compatible with generic one? This is confusing. Why are
> > you adding generic fallbacks if they are not valid?
> > 
> 
> It was my suggestion to start dropping the usage of the generic "mediatek,efuse"
> fallback, as I've seen multiple times feedback saying to not use generic fallbacks.
> 
> Was that wrong?

No, just nothing provided the background that such change is
intentional. Please mention in commit msg that the preferred way from
now on is not using the generic fallback.  Maybe even add it to the
binding itself as comment, so people won't grow the enum with fallback.

Best regards,
Krzysztof


