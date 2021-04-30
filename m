Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:24:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B53261420
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B53261420
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVaMO0okNNmcqfo4JntjyR0/7Trpo7fTzHYDpDrLVQE=; b=Dff3LCawo977ydWJY12En5rZQ
	WHaE4vy3qFqZfuLsse1n6TCiurvQn/oi/rG0kwHZSYp/bjYckenbHaFBOqep6Vs09xRpFdYHXquw+
	7HFOfmfh45ZToP+W9gr2YJmRIYg7Hsf7tmgztAwLcZCUWL7woaXD8OkZa3rgD+ZNdQhh1g9yNjgwa
	sNuGMDGvCGuz4cTT8sGDrEeQ8+QrtfxCk7A4cYeNwaEUUI4jUZw+ZTI7n3MFBKR3dmOPL5Emy7O/w
	D/MeKv1PTMWdJ175VLadIXrtYMFJvh2WutSfpz7x7wbTznvpta8Iwtd7AyRF7HW6Bkx1YlJSBXpfy
	Q15F3I2tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSC8-007mTs-PQ; Fri, 30 Apr 2021 12:24:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSC7-007mTf-63
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 12:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P86Jx2k1VQ3yOTZzYB3fq+ZeCymZuD7o6dN9Bfka4ik=; b=KAfBNVWTkIH3zkkb0j4VklNThp
 lH8nc1aI/eG2x0IB81yTj3G47XJaqXIuo+5mAt5oabLRmkkfWhmW1sY/g6Y9kgUoDDEt2qMey3Np3
 0o1T3cbCITIetQjoDevDJgLdfE1KxMffUPqPc5CKm94YfsaY35OPpFm9F/zvmgnI3Wmj+7Kio8bjw
 zXY4RKy/ViZv5N0sEHHpeepUx6sMi/9qkor7tt6c1fGemoH09UfknJhMjBsbCmF3poqS0x9wYJXr/
 LZRbEtHe85+kWhWN/xS0QK/fPDBg/siljI1HAaWDp/2gwrygkguLXP0y18N/rbgUDuLt5IJQNoPwe
 p9BQGOuw==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSC4-001MW9-Kw
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 12:24:29 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcSBs-001oHb-52; Fri, 30 Apr 2021 14:24:16 +0200
Date: Fri, 30 Apr 2021 14:24:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: David Miller <davem@davemloft.net>, f.fainelli@gmail.com,
 hkallweit1@gmail.com, kuba@kernel.org, Landen.Chao@mediatek.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org,
 gregkh@linuxfoundation.org, sergio.paracuellos@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, weijie.gao@mediatek.com,
 gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 tglx@linutronix.de, maz@kernel.org
Subject: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIv28APpOP9tnuO+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430023839.246447-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_052428_708269_24A4CF8B 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, Apr 30, 2021 at 10:38:39AM +0800, DENG Qingfang wrote:
> On Thu, Apr 29, 2021 at 05:08:15PM -0700, David Miller wrote:
> > 
> > Please fix this:
> > 
> > error: the following would cause module name conflict:
> >   drivers/net/phy/mediatek.ko
> >   drivers/usb/musb/mediatek.ko
> 
> So I still have to rename the PHY driver..
> Andrew, what is your suggestion? Is mediatek_phy.c okay?

mediatek_phy.c gets you into trouble with the generic PHY drivers.
Most Ethernet PHY drivers have the model number in the file name. Does
the PHY have its own name/numbering, or is it always considered part
of the switch?  If the PHY has an identity of its own, use
that. Otherwise maybe mediatek75xx.c?

      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
