Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7815DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy6W+7k3BeJKqgzPdz2XPAPUoN0FAdZUL4QV7gd3iGc=; b=Hu+uBpfoqKTsHgLc9fdgStAhSF
	Wm/hKhj/3MdwEEDIIW+BIQoC3N0v7MxyMum9uKreLWL2DWG57BmZrHOnvUvYTr1CWq3DLl6N9jVOu
	UjK5chPeqU2B+H1q+ncAe3G5iPx48DLFjZ8WE/uLDy8hcoklwnPBBuvJVOtsBsNayl4jceQDoRVx3
	cbt7L5m+b6LGIFghvV7z4UNIM3QQ+EsSroxGNZzA+R/x3jtOv5uMqHed13Dwj7UJ6eYOU5+T31i/e
	ig8RDbisctIb2d/n+9TR1bKjeCAB7VmWGYbpzKbVbpBz68kDOwo9GW5QgW6Xqzw3E9I8tTPEw1gr3
	MXy2d3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cr6-00DeZG-Uo; Wed, 29 Jun 2022 18:56:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cqw-00DeXf-12; Wed, 29 Jun 2022 18:55:55 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD78D6601924;
	Wed, 29 Jun 2022 19:55:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656528951;
	bh=GuaqbcYp+PIdlyYAwEfu+gsN8LZtcE7SN+Ulmy7dl7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2NDukZrzpjsnwS/7rMZy5ACcuA7lxgFs06F1OfZj2mrxXy0apzTAeAxM5zULbXew
	 MKqaUlDqxmfkfq/Ek+lRhq9uuhe+9ulbhdkiQ29q85Q1B8+E2fB2JBDK0K26PzkM+y
	 CXcXLGRqYrsfbBX4++oAWMAoySib7C53BwlRr+BQm339A9SC9UPmy66fSrRdCF7ivQ
	 0zcLTBhRIasmZAMMDC+T0IYpIkSnU+JpS/yq1zBH3xijf0xsCOQy92GcuTJwyk5ePr
	 Prm88EgOx1dWFkiIj8301TZ0s503/nBALuw/HnQFtFRz4qzrckE7kPBkRmetHyfLNJ
	 K1UyfaRac3qbw==
Date: Wed, 29 Jun 2022 14:55:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks
 required
Message-ID: <20220629185546.z6rn7xp3ejpmaupi@notapiano>
References: <20220623193702.817996-1-nfraprado@collabora.com>
 <20220623193702.817996-3-nfraprado@collabora.com>
 <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_115554_241444_6A07D475 
X-CRM114-Status: GOOD (  28.61  )
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

On Tue, Jun 28, 2022 at 08:57:45AM +0800, Chunfeng Yun wrote:
> Hi Nícolas,
> 
> On Thu, 2022-06-23 at 15:37 -0400, Nícolas F. R. A. Prado wrote:
> > All of the clocks listed in the binding are always wired to the XHCI
> > controller hardware blocks on all SoCs. The reason some clocks were
> > made
> > optional in the binding was to account for the fact that depending on
> > the SoC, some of the clocks might be fixed (ie not controlled by
> > software).
> > 
> > Given that the devicetree should represent the hardware, make all
> > clocks
> > required in the binding. Subsequent patches will make the DTS changes
> > to
> > specify fixed-clocks for the clocks that aren't controllable.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> > Changes in v2:
> > - Undid clock list changes that allowed middle clocks to be missing
> > from
> >   v1 and made all clocks required instead
> > - Rewrote commit message and title
> > 
> >  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +
> > ---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml
> > index 63cbc2b62d18..1444d18ef9bc 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -67,7 +67,6 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > -    minItems: 1
> >      items:
> >        - description: Controller clock used by normal mode
> >        - description: Reference clock used by low power mode etc
> > @@ -76,9 +75,8 @@ properties:
> >        - description: controller clock
> >  
> >    clock-names:
> > -    minItems: 1
> >      items:
> > -      - const: sys_ck  # required, the following ones are optional
> > +      - const: sys_ck
> >        - const: ref_ck
> >        - const: mcu_ck
> >        - const: dma_ck
> 
> This patch causes more check warning, I prefer to leave dt-bindings
> unchanged, but just fix mt8195's dts warning instead, thanks a lot

Hi Chunfeng,

the warnings reported by Rob's bot only happen if patches 3 and 4 aren't applied
to adapt the devicetrees. They are ABI breaking changes, but I understood this
as the desired solution from the discussion we had with Krzysztof on v1 [1].

I was expecting some feedback from Krzysztof or Matthias if this was an issue,
but it looks like Greg already merged the patch. I'll wait a bit for some
feedback and if this really was a misunderstanding I can send a revert patch.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220622132219.36rvznhip2egujec@notapiano/

