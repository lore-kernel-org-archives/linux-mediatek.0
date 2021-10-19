Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFD8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642C86115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 642C86115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNNsaCnk8sVoiOfjQnKqBJ5ZQD1DEkLcLtoyGDB6ZM8=; b=cuEZqydUikg07+
	Z/27F/du+n37pyoFoYfMsEHWiKWuz2SItP8go1RubXYpEeed/WWVJkVHfX5lWJzskJ3KC8GYjiRTV
	pvHJSBXQjBvCmI9yLp532dGCUY5HRM4lRk8S/Ebnih+AJh5SVmk2WuVGWb8NzG4jfvhq0WOfqiHKl
	aGKOnOZr5qKb6uvVZxsMDaCgvWg9mrfp1WTaYkTmqG7t0XJg94qerwMZxltU0bhac3cRcQdgH0tma
	B2kqX8Z7+YQEJDHNJL7gwrA6B1AicfwEeNVuN4jgtFhP8ZLzcx1c80HLxpNuZGV7IFmyxTdH+FH0f
	FnQsZJO8PtNLXpNYXwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mciAJ-000Duv-It; Tue, 19 Oct 2021 05:59:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciA6-000Dqt-3e; Tue, 19 Oct 2021 05:59:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A9FA6115B;
 Tue, 19 Oct 2021 05:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634623185;
 bh=FRG4beuFMc1+FdpIgLOkG3rFrbUvdGSYdFRG5EBVUp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5cPxWcbk5thS6ojbahUasVg3cpLKhCx8hgqiHEHBcHCFhYZGDz3PzTkyV56PThx8
 C3gRfb/7GiSnBsCQ4+thbCL6jeTWi4Td8oTrT13oEoJE+gNhshpz5odbSJ+vtUo1zC
 8x+r/FO7nNsSeNyYjEDbeWzYrpmc2Jidcs+Yajmo=
Date: Tue, 19 Oct 2021 07:59:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: mt7530: correct ds->num_ports
Message-ID: <YW5ez/PySlH8WsGk@kroah.com>
References: <20211016062414.783863-1-dqfext@gmail.com>
 <cd6a03b9-af49-97b4-6869-d51b461bf50a@gmail.com>
 <20211018084230.6710-1-dqfext@gmail.com>
 <7b5e5fcf-8e7f-45ec-de3f-57b3da77b479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b5e5fcf-8e7f-45ec-de3f-57b3da77b479@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_225946_191180_6478C311 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, Oct 18, 2021 at 09:22:49AM -0700, Florian Fainelli wrote:
> On 10/18/21 1:42 AM, DENG Qingfang wrote:
> > On Sat, Oct 16, 2021 at 07:36:14PM -0700, Florian Fainelli wrote:
> >> On 10/15/2021 11:24 PM, DENG Qingfang wrote:
> >>> Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
> >>> dsa_port's and call mt7530_port_disable for non-existent ports.
> >>>
> >>> Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
> >>> port_enable/disable is no longer required.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> >>
> >> Do you really want to target the net tree for this change?
> > 
> > Yes because I consider this a bug fix.
> 
> 
> OK, why not provide a Fixes tag to help with targeting the back port
> then? This has been applied anyway, so hopefully the auto selection will
> do its job and tell you where it stops applying cleanly.

Without a "Fixes:" tag, I just backport things as far are they are easy
to go and then stop without an email saying anything fails on older
kernels.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
