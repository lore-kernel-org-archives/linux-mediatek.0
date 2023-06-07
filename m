Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930C5C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lBmhujNhAhblQsCwbKkWljrBxLfrTOAX5lWYRzYv/g=; b=nDAS/7cU77W+wFC3ITMpGfzaf/
	np7RAu/lvMeGO7VlQKY2eLuFAEkG7DmVIu3latST+Y3i1rP0DP0tdyLXS5YnW1J7GxtzroPx+towz
	U2lff11Hx2yyo0hww5zUzI+4O/M6ZoVuVQtlpqqlmRd0K8AD3bRo0Jz+04C5yBvyhLBcR8ckuKHaI
	OphH5bNfhpfHcoJS03CFy7wYDSwF+za9HFCnp+zzHbpJFKGIHJF6OybHMtgv5u1IeLyA7yOsNmlSR
	9XPQAlCueZWtO9xTn0/vjcIhFQgTFBwXtFiLz0RSGHaqfpEojd/8XCnZLFCVsxcUsHqryfVBpaEuN
	MgBsFTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zIv-0072UA-1Y;
	Wed, 07 Jun 2023 19:58:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zIs-0072S4-1v;
	Wed, 07 Jun 2023 19:58:48 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73E3E6600014;
	Wed,  7 Jun 2023 20:58:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686167921;
	bh=V4aYOfdlmGNGL6oFKj3asBG3FW4Opmc6t8Sp4HBQiyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZrn2ezwA9qngagBGLJ1UosmKAQnL+vYAWdNsH5eOHqq0/FEOuo67Rf1Tzu7zZnrs
	 w0O7sCdDl7KZwkpgVHHvv1PJKb4GU12GLvdKNPzG9eKJHE9wj3hX+W5E8yYpEFQBuf
	 TZHhPeFnM1ITGi+R7TaGfzcLmCEYvMLB0ETB3u8+ewtPz3QvAs6sNcuJvRY1Jc+GnG
	 fbtkDDtxSugUvFqyG19BAcByG+Q/KANA0Zlo0ea8fknVDRmnOq4qBXs9MUErpanxdX
	 ZsvO7/wxa2Qi00y2onNitgvQypYqZ6lt3HSEF6ZqHlbpe2nnzKMkPwGLo94bqOIY9n
	 kOjdX61pWjjig==
Date: Wed, 7 Jun 2023 15:58:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/6] media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS
 for mt8183
Message-ID: <d768f124-dcee-40c7-a5e8-f1c41439119e@notapiano>
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-4-nfraprado@collabora.com>
 <6d476d6d-7100-7674-2e08-661516b75f43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d476d6d-7100-7674-2e08-661516b75f43@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_125846_958304_20835B04 
X-CRM114-Status: GOOD (  30.64  )
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

On Tue, Jun 06, 2023 at 11:16:12AM +0200, Krzysztof Kozlowski wrote:
> On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> > The binding expects the first register space to be VDEC_SYS. But on
> > mt8183, which uses the stateless decoders, this space is used only for
> > controlling clocks and resets, which are better described as separate
> > clock-controller and reset-controller nodes.
> > 
> > In fact, in mt8173's devicetree there are already such separate
> > clock-controller nodes, which cause duplicate addresses between the
> > vdecsys node and the vcodec node. But for this SoC, since the stateful
> > decoder code makes other uses of the VDEC_SYS register space, it's not
> > straightforward to remove it.
> > 
> > In order to avoid the same address conflict to happen on mt8183,
> > since the only current use of the VDEC_SYS register space in
> > the driver is to read the status of a clock that indicates the hardware
> > is active, remove the VDEC_SYS register space from the binding and
> > describe an extra clock that will be used to directly check the hardware
> > status.
> > 
> > Also add reg-names to be able to tell that this new register schema is
> > used, so the driver can keep backward compatibility.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >  .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> > index 6447e6c86f29..36a53b2484d6 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> > @@ -21,17 +21,21 @@ properties:
> >        - mediatek,mt8183-vcodec-dec
> >  
> >    reg:
> > +    minItems: 11
> >      maxItems: 12
> >  
> > +  reg-names:
> > +    minItems: 11
> 
> maxItems
> 
> > +
> >    interrupts:
> >      maxItems: 1
> >  
> >    clocks:
> > -    minItems: 1
> > +    minItems: 2
> 
> It does not make any sense. Just two patches ago you made it 1! Don't
> add incorrect values which are immediately changed in the same patchset.

It's not an incorrect value. At the point that commit was added, the first reg
was still VDEC_SYS, so an active clock wasn't required. This commit removes the
VDEC_SYS reg, and so the active clock becomes necessary. Splitting it like this
made the most sense to me, and I thought it would also simplify review. But
since it seems to be a problem I'll merge commit 1 with this one in v2 to avoid
changing the number of clocks twice.

> 
> >      maxItems: 8
> >  
> >    clock-names:
> > -    minItems: 1
> > +    minItems: 2
> >      maxItems: 8
> >  
> >    assigned-clocks: true
> > @@ -84,6 +88,24 @@ allOf:
> >          clock-names:
> >            items:
> >              - const: vdec
> > +            - const: active
> > +
> > +        reg:
> > +          maxItems: 11
> > +
> > +        reg-names:
> > +          items:
> > +            - const: misc
> > +            - const: ld
> > +            - const: top
> > +            - const: cm
> > +            - const: ad
> > +            - const: av
> > +            - const: pp
> > +            - const: hwd
> > +            - const: hwq
> > +            - const: hwb
> > +            - const: hwg
> >  
> >    - if:
> >        properties:
> > @@ -108,6 +130,9 @@ allOf:
> >              - const: venc_lt_sel
> >              - const: vdec_bus_clk_src
> >  
> > +        reg:
> > +          minItems: 12
> 
> so max can be 1000?

No, there's 'maxItems: 12' up above in the general case.

Thanks,
Nícolas

