Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB4EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6IpmpgwkdMWkruNUI5BFct/Uuzzn+nwGqAqaYDlvYE=; b=rvwAwvKacyatyP
	oK71i3Cg7Yrl0g+PwATgfPmqDlztdVJqOwroBs6lATD7HtjdFyTftEGx52uFM/7QGi9zTcqBtlYx/
	TqePxDTZIVmMr2nqdj/RguIV/zbhGbZoWy8DH37T5syxDVD/6MyLiIgQ/GNpa6uzblLArgoJAEbGW
	kolHEowleBQj/dvQvKmmzeRW6wkm4h4yl0p5aZ8c2OVGzxRn5ZNLPI2KCyAdRWcP0Qr/YnrEuXBS8
	Z2GxZqjs2odkilzF4tqLpTCDqxPb+75DB6YRphQEIbNV0ThXCXA7mku8S8ewOsL5Ps2zTmzeKu3Fu
	GwMTHhh+ntmfULL9fOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdLT-0083Le-MU; Fri, 10 Jun 2022 12:02:31 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdLI-0083Fe-40; Fri, 10 Jun 2022 12:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654862540; x=1686398540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CF4rL1niuSX8BlxbQ2DWT+o2UndchjX+l6DFPinEiIM=;
  b=UizzSFL3FKQCuwNpMjuqsepDnR5VyN+Vte/LwgMICyMaI6nMXqPPcNkN
   5Ac8m4f9zxaIcHJY73FSfx3hLp6gxxErbmLMufMRRwwdpOfnKfZE42H9L
   3ZPJ5zIkc4/0tZ2/blp3gx9IbXpiZP39wqQRF7C0ZevBAmnSFK+YTaE39
   dPxYHkzEJGuOd4KnXSh27mfYncDwjeCt7BZW0tK9nmY8yXVPBCJoBhTT5
   WEZgQWE0t+uoJD9V0rSGmMuwmzHoB7Hhf3Gs4nvwNp8QCAzaRKKHKzfd+
   YM4pxEWR48fLf2PEV5+tDZvJCsis6y08iIpjoCRAsOQp9GrSEkoFdXgLl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278408834"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="278408834"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 05:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="724937990"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 10 Jun 2022 05:02:13 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 10 Jun 2022 15:02:13 +0300
Date: Fri, 10 Jun 2022 15:02:13 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xin Ji <xji@analogixsemi.com>, Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <YqMyxQGzPSs/HwVi@kuha.fi.intel.com>
References: <20220309023404.1221453-1-xji@analogixsemi.com>
 <YqMaUroS87rjnCny@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqMaUroS87rjnCny@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_050220_284360_30F75B1D 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, Jun 10, 2022 at 12:17:54PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Mar 09, 2022 at 10:34:01AM +0800, Xin Ji wrote:
> > USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> > and a port controller (TCPC) - may require that the driver for the PD
> > controller accesses directly also the on-chip port controller in some cases.
> > 
> > Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > 
> > ---
> > V8 -> V9: Add more commit message
> > V7 -> V8: Fix Guanter's comment, remove unnecessary explain
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
> >  drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
> >  drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
> >  drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
> >  {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
> >  5 files changed, 5 insertions(+), 7 deletions(-)
> >  rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)
> 
> I need an ack by the typec maintainers/developers before I can take this
> (hint...)

I'm sorry for the delayed response.

Xin, you need to rebase this. It does not apply cleanly anymore.

thanks,

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
