Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6D4C07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 13:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 117ED613D8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 13:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 117ED613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5qpBIka5Oc0kYlcg3SNq0PRG4P2AMvZBpNo98FeeUs=; b=dN4vkAPDqLpWW3
	r/8TeWTjgVDVXg/HhN0gMu4JpprU6y0EzYCK1QLbrvsvEGuiyZSKOpdA9cHP4hbSxxn+mjgStK9ov
	dV/+Wc1m8uxvcCl6MYlZscpEpO5mrloCtzAgzmI4nr3ViWvHMgjLLqIhQtdYTr5PSc2/K+JKV3yqT
	9qCog9cGKX2yodeyGJhxYxPEXPWAamQm487sKoQQKAjiMuPVRKQLy2S3MAFyM1ik02ziHiSZSoMcO
	qmJJBs5fdXy4Gf+E9B3T79BCQ7GGygJIYeSyqp9gRd5cWXlndmMXQ1XC19+Er2sw918c9MSICgVKq
	MVQaabI5COEl5OztdFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9ej-00Dfcl-Ei; Fri, 04 Jun 2021 13:14:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9Z5-00Dcra-T7
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 13:08:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CECAE613DE;
 Fri,  4 Jun 2021 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622812123;
 bh=KI99+JpsSvrw/euAyvNNi9O6oeNyFP4qHjSyCwvSlsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwDwX+tS8ztwlxFXP6nshZOawWQO8SbaFMCfrOyqsMPfUX1n8+J2G+RneHWflCh1a
 0zkWyZrvDvWeZK1vqjqeP+RkH700F0GLMFks1jb4ATAiivgkZfLSvYzCg1YCWapqJn
 myAZfGfHsRR2HCBeVxqGHuLG3Vw5n9gmeLe7IXNc=
Date: Fri, 4 Jun 2021 15:08:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next v2 4/4] staging: mt7621-dts: enable MT7530
 interrupt controller
Message-ID: <YLol2QFW9XMG57m0@kroah.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
 <20210519033202.3245667-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033202.3245667-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_060844_007019_93F9FC70 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 19, 2021 at 11:32:02AM +0800, DENG Qingfang wrote:
> Enable MT7530 interrupt controller in the MT7621 SoC.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> v1 -> v2:
> No changes.
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
