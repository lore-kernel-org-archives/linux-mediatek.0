Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2729BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYZL3StMGmZt7BqdVvW83a0rsm282FnZYvdygNVF/Yg=; b=ijXXiXzU0nC0UQRkZygZo4H5g+
	AIJTZDmVZ9PDBzYlKr5NKfn69LgPLcHF6yH52HEsYnEAGezC/xbr7etXxcQCU2VLIySJHpyrZCcjP
	me/u/3cDlkRtbIMQl7pSXd9XyHSLlI4v9azh5wdz7gTPn2PcGpBIEzkIaHrXu8oj1xicxrE27ukKD
	H9d8qQh8LIctSFB9ZOoT1vJlYnYzR8J7IERhDMj+SDEFVnF2LIrYHrI/JipVo/SDSAcQnfmojerMS
	Mx2/uaru8dolhKpigwlGqv8pib2wYLxHbOMOpXB6Ar1/xHb8GtxsGJwF2xdc/9F7DlgCXNqkY1gv9
	SyYIb5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5meW-0095Iv-MP; Thu, 15 Dec 2022 11:43:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5meL-0095F5-0M; Thu, 15 Dec 2022 11:43:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 124F961D73;
	Thu, 15 Dec 2022 11:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF120C433D2;
	Thu, 15 Dec 2022 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671104618;
	bh=Oh7qR3FqKNXC4yCGOLnMkkPDHqlsorxxWcum/D2kYSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=addAOdAOJbgv/HjUd9rHl7Y8DJhOUktDJYvGf2S5HfPG0YRYHukY28mx8j5AdMhAk
	 AbhpZ1gVXitHPYQSqyqC+dZI+GH2q0SStlZodKJYge9lfCtEAXkx6TbRD/4VEGC+Wg
	 /j/75CrEg4TsZ4sG5aI0QR0HGKjJZhM0yWT94mJs=
Date: Thu, 15 Dec 2022 12:43:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ChiYuan Huang <u0084500@gmail.com>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com, tommyyl.chen@mediatek.com,
	macpaul.lin@mediatek.com, gene_chen@richtek.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <Y5sIZ3zC6o4ARDEn@kroah.com>
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
 <Y5rsdo/SGHJM4UKG@kroah.com>
 <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_034341_112185_A8A6C96A 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 15, 2022 at 05:53:44PM +0800, ChiYuan Huang wrote:
> Greg KH <gregkh@linuxfoundation.org> 於 2022年12月15日 週四 下午5:44寫道：
> >
> > On Thu, Dec 15, 2022 at 05:21:36PM +0800, cy_huang wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Why not send directly from this address so we can validate that this is
> > the correct email address of yours?
> >
> It's  the company mailbox policy. To send the external mail, there's
> the security text block at the bottom.
> Except this, some mail address are also blocked. To avoid this, I use
> my personal mail to send the patch
> and leave the SoB for the Richtek mailbox.
> It's lazy to fight for this.

Please fix it, otherwise your company's email address will be spoofed
and people can claim to be sending changes from their domain.

Please fix that up, abusing random gmail addresses like this is not ok,
sorry.

greg k-h

