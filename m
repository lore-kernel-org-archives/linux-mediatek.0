Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA644C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIwBPaeoHxZEUvAMEE2HAY9F42Bi6wW1C3J9fLyLNLQ=; b=Tofaietm7jThYTv8jdvSNH2urB
	T8NKrqPF7lz8IP0Qv/IoCpS7Fwpcw3/bPU/gBIcl+SVLUW1GK+vo6xQ2VTs3v4QwRH/W9rtGEeQiL
	9htHU5SLaBFikGP7Q0ST2+vR5jwj8Fus5xIDYMK1td92Shtp+OWLmUeUQ8E7N1wJemXb2msdjo+Z0
	C7BV/ZwtDd5akmzyanhx90GdjORicG3ZYD6IHdQ2qlipG+gKwTrITHY2+BKKdMn1HJgmjeBS6S+k7
	WnOh6PiegF6OFbyLzm3SJkLR0/n/0hmhz/2cG00K/546G5Hf54XuCY9dTfXHWmZZ0yuh7fFvTk4is
	jTWRqmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGBK-00BT6L-4Z; Tue, 12 Jul 2022 13:44:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGB9-00BSw8-0s; Tue, 12 Jul 2022 13:43:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D602B818B4;
	Tue, 12 Jul 2022 13:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A813AC341C8;
	Tue, 12 Jul 2022 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657633431;
	bh=Qb/oUeQurbQ9x0BxaRhTtPoP0Rue+w9iCNr3XC122bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKJm9saZQJLyT7txlacfxKQhiRYO2mgMqWSMoSF4rBGk2U2eLzJt/dPWBYiN//8uE
	 mE8YiOrmiTYxuOJj2Yy9pr7naWd8pWnDtQMNn3RSKZY1cp2HioL4/5oHbOa2G+aCsm
	 H7ytYiR8Pj9r9Az3wxx/jAkJyNZvOa1GrZBxTy1g=
Date: Tue, 12 Jul 2022 15:43:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Xin Ji <xji@analogixsemi.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v16 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <Ys16lEvhVSSSRMP7@kroah.com>
References: <20220712090534.2783494-1-xji@analogixsemi.com>
 <0bd85140-f006-8b29-0a43-500733f1654c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd85140-f006-8b29-0a43-500733f1654c@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_064355_250173_22BECB89 
X-CRM114-Status: GOOD (  16.45  )
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

On Tue, Jul 12, 2022 at 06:31:22AM -0700, Guenter Roeck wrote:
> On 7/12/22 02:05, Xin Ji wrote:
> > USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> > and a port controller (TCPC) - may require that the driver for the PD
> > controller accesses directly also the on-chip port controller in some cases.
> > 
> > Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > 
> > ---
> > V9 -> V10: Rebase on the latest code
> > V8 -> V9 : Add more commit message
> > V7 -> V8 : Fix Guanter's comment, remove unnecessary explain
> 
> We are now at v16. The change log has not been updated since v10,
> making it all but worthless.

It's also already in my tree for a while, so I have no idea what this is
being generated against :(


