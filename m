Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0FQ2MbAUjvyJaNZ01TqcJiezYUHYj/9e1HSsOsWoLA=; b=tanVXUeMxjpHsX
	LsC+brMyiTnaBXAsxzapwUP7DLyB0YJXNq4ZXNWCnYd5edPD9CEnP0LJIlRML36zFNicZGNsIDl6Q
	WpIZ47mnxyamimMNxWb8d1Kyewp+DYGuXGm1WvPVf4eKsAieEgqhhtpSQPXUwmR2yRIKlBroTEkn2
	H3z173sE/uRuwX9aZCZXup04BI8ba1oaIcdtll3048y2GYCCJ1z96nrlMXvpCYHVRK4smP9s3TxaS
	9umQfhENvMdc3zOoFieOhPxbypfErIaq4uFMKJWbY45e0lVOxlqBEue84rUjjJUlu8U3gt2gNkT4I
	V0T4mPwszu+w1wE6pkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfk4o-00DBEi-1d; Sat, 16 Apr 2022 15:11:06 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfk4b-00DBDY-Lw; Sat, 16 Apr 2022 15:10:56 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 35DD06C006BD;
 Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1650121848; x=1650123648;
 bh=KK9C41l79QaB3TJiC3RV4T0lUXme7J8u5KVG2q+8QHw=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 Content-Type:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:Reply-To;
 b=xTU201XbBCuHBaMi53sGK3esB55DOtLIPvaHFo22pPPWz2qZSznD+rEVYMWNc+b7L
 Q83hIyigv8kkN4aQ9KGne/eiHNvXE9L3d61rQzI1fMrnCe3fWim4FU30ceXatdCK1h
 Plm6r52aJ7zINqDq7DfUPiYQoYqNMLmP8vn4HtQ0=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 254D86C006BE;
 Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id DgtGkDb-qW45; Sat, 16 Apr 2022 18:10:48 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id E05746C006BD;
 Sat, 16 Apr 2022 18:10:47 +0300 (EEST)
Date: Sat, 16 Apr 2022 18:10:41 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <20220416181041.31ec5f65@pc>
In-Reply-To: <YjRodtoWRhlNUg14@shikoro>
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <Yh45nDwqnLInrzzE@ninjato> <YjRodtoWRhlNUg14@shikoro>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885mlYNLBD+si0CgRH7ABAc3s1k3Ua26u/vYoxBcgBmOPC+Bd04PWBSzmW9qPg+1ykoX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_081054_468032_6C0EC4F3 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, 18 Mar 2022 12:09:42 +0100
Wolfram Sang <wsa@kernel.org> wrote:

> On Tue, Mar 01, 2022 at 04:19:56PM +0100, Wolfram Sang wrote:
> > On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> > > This small patch series removes mt6577 support from the i2c-mt65xx driver
> > > and devicectree binding documentation.
> > > 
> > > The existing i2c-mt65xx driver relies on DMA since it was first
> > > introduced. mt6577 does not support DMA [1] for I2C and SoC's Generic DMA
> > > engine cannot be used for this purpose, too, which makes this particular
> > > driver incompatible with mt6577 and other similar SoCs with same I2C IP.
> > 
> > Qii Wang, what do you think about this series?
> 
> This series makes sense to me. If you do not disagree, Qii Wang, I will
> apply it soon. All the best, everyone.

Hello! I'm kindly pinging you on this series. Has it been applied?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
