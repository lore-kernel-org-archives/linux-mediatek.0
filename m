Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB5C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCg2IB8RIA/rmyEdQjzH/Wy3AV68Hi230g7m0WE7pz4=; b=OHHqF6DYHu6TObuOTV60iJWQYj
	gxL9Dstjg/TE/z6rHvz7BbBT8AeVlBcSb+gYRXtri2auzGnitTDLRSm3qSc8PTUySnGR68Pkw1T1t
	5cvyiwuy9IQAO38d1DvATHLcUeHrsM7TqTRwT3Q9yW9bn86DQxYTt3ABM4IHw7uEpjTOvfNa+6oCl
	jDuwyj7fgPrOFQFaktxQRlacO9i99pwbfmCTQIzN5Z1fJ4GAeT8sLnNCxx08FK0M8NLOENfsE8ZXF
	yRkPvHRmt6RUCIo+sdtH6XmWzljaNGWZUHSjA5y86zjq0kV4U0HDWRSO6z4EVcjBtIKbb+3nWP5mv
	LUbi3/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7hs-00BiTH-AW; Fri, 16 Sep 2022 09:32:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7ho-00BiNN-Te
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 09:32:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0059621E5;
	Fri, 16 Sep 2022 09:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DBFC433D6;
	Fri, 16 Sep 2022 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663320733;
	bh=qIpPtXLE+jDdeNfuDY5kzoH7tb0gFYA1PUXnCdxlRnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiUi4IFRdZ3MPhJiLgazUDeGNR0z00SvE1fsE/Q/SUbOIb0S4UCK3dEJkqXZcnofh
	 /VKyEiOkyMta9b8vSrQPoE/cVmUl7LQM6QjOhe7rGFYiFIXicgSaKp9sg1au94bSc6
	 xmdkgyujOAQLa0wvGAuV8O5NgJDZOK5+WEc0EHUA=
Date: Fri, 16 Sep 2022 11:32:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@mediatek.com
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Deren Wu <deren.wu@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH 5.19] wifi: mt76: mt7921e: fix crash in chip reset fail
Message-ID: <YyRCtrOtPqu2oEPj@kroah.com>
References: <404d2f5ec663128342541fa392a47226a46e5634.1663219530.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <404d2f5ec663128342541fa392a47226a46e5634.1663219530.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_023217_046002_01852095 
X-CRM114-Status: UNSURE (   8.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 15, 2022 at 01:32:35PM +0800, sean.wang@mediatek.com wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> commit fa3fbe64037839f448dc569212bafc5a495d8219 upstream.

This is already in the 5.19.9 kernel release, right?  Do we need it
again?

thanks,

greg k-h

