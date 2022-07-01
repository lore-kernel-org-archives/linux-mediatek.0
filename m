Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D44C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J86v2cLDP22dhdMQY1gkogeTSb0Yh6JFnGz+u5RmAN4=; b=lZPNfk06Q/W1DwVVBOpaZ+Ns4w
	AB1Nny3rD8dom4qcEu8z57Pnc6KQvlQxX83PUS1/mJNczf7PTH4432sMBh/IPwQFA6HhYrdGYS3TF
	TFJImPPANhkW/E/DxDGFvvtWBeEj7jbXNAx/tPFsZffSzyML2BPt1DkO71tzpoNlFUrLugNg0A6wx
	OL2IuFquH1xVX596oop0P2p1AJWd4xsUA21gtAyh19P+7I7VfV6UTAbv0viEYdrI0q0O7/OPLACrH
	BK36STWVLNBZpPrW/e7OblaHW70TP9MuiBbKiRNfn4DRWzd2wlGt9H7mwvYiUfHlf1OI5sdYSGQfB
	yfPIv7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7OKF-0071wK-8r; Fri, 01 Jul 2022 21:37:19 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7OK4-0071sm-R3; Fri, 01 Jul 2022 21:37:10 +0000
Received: by mail-il1-f177.google.com with SMTP id h5so2190572ili.3;
        Fri, 01 Jul 2022 14:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J86v2cLDP22dhdMQY1gkogeTSb0Yh6JFnGz+u5RmAN4=;
        b=VIE64KURreRMmSQeU4lt46ws/sM6MyS4llAsQS9XR/zowcqk+EdoCMLQw4El6tAjl5
         e+73KR3rNaBMlepU5gMhhr6s/A5xBQKjzOTFDIl+tBwmKiZjQ5A3mZwn8F4j/lNi20J7
         L0qHKBCQWOpti/M17OjEWRX4Bm9YZlXyit9FPyiTsvQtyfVsVV+MjMxXn1ItMDngOxt1
         NAhnwJBI1NMtgZy3Czm4hP4736lDszVoJQJfiSp3ikRYi/mlb9FG064+hFh/KlVa8m5X
         OrYexOytdnohRQwk+xwhDDpeUomMzC0+cNG8ZikmCeQ8mEtkM9BcawDHQ6T20KbPg7WC
         buQw==
X-Gm-Message-State: AJIora9sxM3XIAdX32hQ6g8Ik0Noa9s+rJy0YtuCoOya063boCVLRnlx
	r+dKO3ZakgsoMBseFe0rbg==
X-Google-Smtp-Source: AGRyM1sYR91twYxQYAQPVbEe2Fqnz0wIkKnwr9gOaTJIX2q5xD/4kgmop65ap+DhwWDj1Bc3j/yEmw==
X-Received: by 2002:a05:6e02:1c85:b0:2da:956b:6bc with SMTP id w5-20020a056e021c8500b002da956b06bcmr9686339ill.36.1656711424773;
        Fri, 01 Jul 2022 14:37:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x5-20020a026f05000000b0033eb2f2ccfasm100716jab.43.2022.07.01.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 14:37:04 -0700 (PDT)
Received: (nullmailer pid 1599831 invoked by uid 1000);
	Fri, 01 Jul 2022 21:37:02 -0000
Date: Fri, 1 Jul 2022 15:37:02 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks
 required
Message-ID: <20220701213702.GA1591697-robh@kernel.org>
References: <20220623193702.817996-1-nfraprado@collabora.com>
 <20220623193702.817996-3-nfraprado@collabora.com>
 <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
 <20220629185546.z6rn7xp3ejpmaupi@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629185546.z6rn7xp3ejpmaupi@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_143708_918173_0B758853 
X-CRM114-Status: GOOD (  29.52  )
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

On Wed, Jun 29, 2022 at 02:55:46PM -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Jun 28, 2022 at 08:57:45AM +0800, Chunfeng Yun wrote:
> > Hi Nícolas,
> > 
> > On Thu, 2022-06-23 at 15:37 -0400, Nícolas F. R. A. Prado wrote:
> > > All of the clocks listed in the binding are always wired to the XHCI
> > > controller hardware blocks on all SoCs. The reason some clocks were
> > > made
> > > optional in the binding was to account for the fact that depending on
> > > the SoC, some of the clocks might be fixed (ie not controlled by
> > > software).
> > > 
> > > Given that the devicetree should represent the hardware, make all
> > > clocks
> > > required in the binding. Subsequent patches will make the DTS changes
> > > to
> > > specify fixed-clocks for the clocks that aren't controllable.
> > > 
> > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Undid clock list changes that allowed middle clocks to be missing
> > > from
> > >   v1 and made all clocks required instead
> > > - Rewrote commit message and title
> > > 
> > >  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +
> > > ---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > > xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > > xhci.yaml
> > > index 63cbc2b62d18..1444d18ef9bc 100644
> > > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > > @@ -67,7 +67,6 @@ properties:
> > >      maxItems: 1
> > >  
> > >    clocks:
> > > -    minItems: 1
> > >      items:
> > >        - description: Controller clock used by normal mode
> > >        - description: Reference clock used by low power mode etc
> > > @@ -76,9 +75,8 @@ properties:
> > >        - description: controller clock
> > >  
> > >    clock-names:
> > > -    minItems: 1
> > >      items:
> > > -      - const: sys_ck  # required, the following ones are optional
> > > +      - const: sys_ck
> > >        - const: ref_ck
> > >        - const: mcu_ck
> > >        - const: dma_ck
> > 
> > This patch causes more check warning, I prefer to leave dt-bindings
> > unchanged, but just fix mt8195's dts warning instead, thanks a lot
> 
> Hi Chunfeng,
> 
> the warnings reported by Rob's bot only happen if patches 3 and 4 aren't applied
> to adapt the devicetrees. They are ABI breaking changes, but I understood this
> as the desired solution from the discussion we had with Krzysztof on v1 [1].

The warnings have nothing to do with patches 3 and 4 as those are for 
dts files. It's examples in bindings that are the problem.

Rob

