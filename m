Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6146DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 05:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XxiyWrVtZsEXcBKrvCvmO/TzL3Qa4iJUHpiMBBofoE=; b=yDnWJmPqAk3mNmUpCMMi41DFyC
	JC13Mp8ZZcwcW5YoN9h+Vwi/UC3QANx9SZ40F678n/dXR2SR0nqmYuwUAq4QlRuAu/ktTQNWIce2u
	Fii5OwrACdSlWSIKDcsOLWqOJizzYsVWlP0R/CzXd+W8WQmYzdCi2IRDi+hrJoSH+I5+67NJnrLV5
	7dvkcMK5qLjC3VJdhQ9aZrDYJascruJ1ubGlNzrimP26a7M59vb+mj+pTrpFsT2GtuJsyYpkH++Ha
	W1XiVHjCZnyGgnof0+XyOeQYSMuEC3DwlGNlNxpVgtc8Arsv7UOKcyOm/988eT+dAQsoZye0D4yE8
	QykX+Z6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGlC-00494M-SV; Wed, 31 Aug 2022 05:59:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGl0-0048yy-Mm; Wed, 31 Aug 2022 05:59:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2179A604F5;
	Wed, 31 Aug 2022 05:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED23C433D6;
	Wed, 31 Aug 2022 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661925561;
	bh=Sv3zrf8KpU3BGK4FJ/+tlCbwePgRoRrP5taWOD3/2+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2rhMHT910chZUzsj3qTfbIH9GrGHu+shU1QikKSgpzDqxio25Bqv8B8iiic25z4I
	 FJvLkINmr2jNuUon6kXF6ezUAQA9CNTzY6Y+aEUIyR4/GVGJq8DRTbivrqLMbPNOyN
	 AlgISojOPSJAl17j+nYDHi5gFP+P7IaTMVl7QPiM=
Date: Wed, 31 Aug 2022 07:59:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
	qii.wang@mediatek.com, liguo.zhang@mediatek.com,
	caiyu.chen@mediatek.com, david-yh.chiu@mediatek.com
Subject: Re: [PATCH v2 1/1] dt-binding: serial: mediatek,uart: update
 bingding for MT8188
Message-ID: <Yw74yHdI8lDLG4+u@kroah.com>
References: <20220809084457.31381-1-kewei.xu@mediatek.com>
 <f8a391de-dd47-1eb9-0e15-e6a651517a6f@gmail.com>
 <b77553ac2c9c934abcf3b5e5b5083ad695584c42.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77553ac2c9c934abcf3b5e5b5083ad695584c42.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_225922_799752_25FD5C07 
X-CRM114-Status: GOOD (  21.23  )
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

On Wed, Aug 31, 2022 at 11:03:37AM +0800, Kewei Xu wrote:
> On Wed, 2022-08-24 at 15:59 +0200, Matthias Brugger wrote:
> > 
> > On 09/08/2022 10:44, kewei.xu@mediatek.com wrote:
> > > From: Kewei Xu <kewei.xu@mediatek.com>
> > > 
> > > Add a DT binding documentation for the MT8188 soc.
> > > 
> > > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > > ---
> > > v2: Resumbit the patch based on the linux-next branch.
> > > ---
> > >   Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > > b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > > index 4ff27d6d4d5b..fe098d98af6e 100644
> > > --- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
> > > @@ -42,6 +42,7 @@ properties:
> > >                 - mediatek,mt8173-uart
> > >                 - mediatek,mt8183-uart
> > >                 - mediatek,mt8186-uart
> > > +              - mediatek,mt8188-uart
> > >                 - mediatek,mt8192-uart
> > >                 - mediatek,mt8195-uart
> > >                 - mediatek,mt8516-uart
> 
> Hi gregkh,
> 
> Just a gentle ping on this.
> Could you please give me some suggestion on this patch?

It's still in my "todo" queue.  It's going slower as you didn't cc: the
serial mailing list so when I processed all of those pending patches, I
did not catch it.  Give it some time, it will get there eventually...

thanks,

greg k-h

