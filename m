Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284A8C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 10:21:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC43360E99
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 10:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC43360E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQNnvO5UILSChrgGGNQyNYtxFf05M8YWbmx2PD3XVyA=; b=XQETxy1sFMfzqJ
	B17EhI1yEwcqhDeu+ZL3sejv7nmnSk/hRRcQ5vrfO/12A7dQkJ7RQrx0TQzYsaVPQKZPcSLXnOQMo
	a3dW8OokyBzqIocRU4E83kuhdwSSsmNfWVJehH4T6meV9M9NiEQygwOS1H5kiwNr5VkcuynQDxWS7
	ok0B2kRoGMMXEwARFwq7XujqG21ZFPQiTRSYlyyAvu67lp/bioDY+x/nTok9jPo04osGmlLpfOEcL
	hc2u/cGrvrGjd3B+RGV8vZ4q6WY8kuq7UArxyNEwNlOFk7TH3lGLyvu4DoDT3vTlzadimIzSEtpHd
	KlxRnuEnClh/EHXkecZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJYyi-00CFpT-4A; Fri, 27 Aug 2021 10:20:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJYxL-00CF7o-Mz; Fri, 27 Aug 2021 10:19:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2510060F4F;
 Fri, 27 Aug 2021 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630059567;
 bh=EOO6pKRRm3/g0M0RTzHPyA5sIKLS/eIq5VJThmOrCEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tSWxtIl/NPkTQ+WN8KhkK2/CGY68e9SPzcz96GYq8DQDLZj+lR6JyJOm5lERl4GRf
 jAfeQbjuo/OQ/PZWP8pPTuxkcUqcArquIRHzcRRhB95mtj9pphex7YpebmAVaIvN4Z
 NQVgSZvHUzrTPuPHX/PExgvqfsFYW+73WX1C4eSE=
Date: Fri, 27 Aug 2021 12:19:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4.19.y] net: dsa: mt7530: disable learning on standalone
 ports
Message-ID: <YSi8Ky3GqBjnxbhC@kroah.com>
References: <20210824055509.1316124-1-dqfext@gmail.com>
 <YSUQV3jhfbhbf5Ct@sashalap>
 <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65ja3hYGmEqcWZzifP2-0WsJOnxcUXsey2ZH5vDbD0-nDeQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_031927_816738_FAE8413B 
X-CRM114-Status: GOOD (  15.11  )
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

On Tue, Aug 24, 2021 at 11:57:53PM +0800, DENG Qingfang wrote:
> Hi Sasha,
> 
> On Tue, Aug 24, 2021 at 11:29 PM Sasha Levin <sashal@kernel.org> wrote:
> > What's the reasoning behind:
> >
> > 1. Backporting this patch?
> 
> Standalone ports should have address learning disabled, according to
> the documentation:
> https://www.kernel.org/doc/html/v5.14-rc7/networking/dsa/dsa.html#bridge-layer
> dsa_switch_ops on 5.10 or earlier does not have .port_bridge_flags
> function so it has to be done differently.
> 
> I've identified an issue related to this.

What issue is that?  Where was it reported?

> > 2. A partial backport of this patch?
> 
> The other part does not actually fix anything.

Then why is it not ok to just take the whole thing?

When backporting not-identical-patches, something almost always goes
wrong, so we prefer to take the original commit when ever possible.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
