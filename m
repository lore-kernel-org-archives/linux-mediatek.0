Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD07BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 16:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8BE61354
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 16:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A8BE61354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYzu8VfPJqnqiw8BYStjI1RL23CIMIx4QB+tG5kH9wo=; b=RlXoPeXexSWKCq
	MYsLHMCtkKPClOkJ5P78f0bcNWGjxtyXoCNy23JWzkjB3wDowZKnCYyYNWZutKYFtwYwyeKcoGkwP
	NToJUTpZQTAXCBRY37VIfRS1rQ5MW7iqZxCUqp/rEhpmvh6y6Xt69V481ggG6PdXR70osWlHI6Nmo
	pXwnVw/wGJL1BSRVdejYXj+rRC/J7YuuKt+VNq13AjG1KaD1ZKfgTHW5sf2zNEe76ZWfb5qooeRG1
	1O4T1Z7YKjlqfXdWkjka5JYSdXC0k/E5/4jcGuTbPGm/55dC4Vubncd1zj2Y2gfaGg/6qVCGEkcKA
	mM+tqc1FCYPGf7aAt8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXmze-00BEdv-7v; Tue, 05 Oct 2021 16:08:38 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXmzT-00BEaZ-2Y
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 16:08:28 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mXmzM-0004zU-Ko; Tue, 05 Oct 2021 18:08:21 +0200
Date: Tue, 5 Oct 2021 17:08:05 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] dt: bindings: net: mt76: add eeprom-data property
Message-ID: <YVx4ZaIZsfNQocT+@makrotopia.org>
References: <YSWdv7ZKz7SBtF+v@makrotopia.org>
 <de40bcd3-d730-4d6b-27d0-50492fe18404@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de40bcd3-d730-4d6b-27d0-50492fe18404@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_090827_143331_7C9A60EE 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 24, 2021 at 07:14:47PM +0200, Felix Fietkau wrote:
> 
> On 2021-08-25 03:33, Daniel Golle wrote:
> > EEPROM data for mt76 can be embedded into device-tree as an array.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > index 3e2c2e43175e5..1489d3c1cd6ec 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> > @@ -47,6 +47,11 @@ properties:
> >  
> >    ieee80211-freq-limit: true
> >  
> > +  mediatek,eeprom-data:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> Given that the driver patch simply uses memcpy on the data, shouldn't we
> use an uint8-array here?

When using the /incbin/('file.bin'); syntax the result is included as
what appears to be a uint32-array when decompiling again with dtc.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
