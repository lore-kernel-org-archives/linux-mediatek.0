Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A7FC7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tK+7c1kdGRjqP1Mz7EpfiWX02vfym15PqmGkANGsoc=; b=AEbDoEiguz3UR08P1IaHeN44XV
	mKgayC6+BBR0M19JAOUVJb0wW66okeSuxnBE/Y3gkKQhpr2x+me+9oX44D7q2nLgI36g6C7cImRLt
	NpMAKT9iqbYL/NsVBCjKIsXA5VVjICOGc6W99d+SFtjN1WAWFuR4MG7Eng9ODCXAyOZJk6hM/asVk
	qjcPfQYuNZ6IAnfu1Py/OowjTxw8XtXIcXj5oXg+BNvx5kTaNEV+NVAqWioYsUtbbdswC6nZN5SJz
	3+32up04sSRFQQ3hcsdAmSYJCVqRFkgZQhK3rWA2If95AL4WRDpvapu29D+zEeOfdKL1lWH5ven4u
	NJ2Qo8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q68Np-00FHQA-0F;
	Mon, 05 Jun 2023 11:28:21 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q68Nm-00FHPg-2D
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 11:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685964498; x=1717500498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MXpuxIdlezOpRNLUw2sZPpBNzgzkQEchFs7aHBxowmQ=;
  b=FKZUE3Z9mjkQRTw22Mq8rzmmNCjm1lBr1s4lYMCWFrEX5yZHOlCl8KtL
   6O/2ECyyhThtVQvsAsieyofGoWU8bBXZlLu8jwUk6G2uRwALgDD3vfxEj
   1DR81FnahPnivJzq/FAimQAr3M/jRRenobR4eaIC1+OY1FAxubwi4e6uU
   z6MEqleKEw+4VXTyfZT77bre9G8Vsr0InHoWCS6g3dIJX4jgmnohGtTde
   1kPM9oleZWhotfg8v+whtXBon5xDeRf86ciEKLClaIATQAMwC7SsMXV6v
   oMcNNnM6W68HqK1yY+UzKoyEPhq5qzLiB93O+YR/az+tJQOpPcSkOr3n6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="335961976"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="335961976"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 04:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="821158038"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="821158038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 04:28:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1q68Nb-001MH3-1B;
	Mon, 05 Jun 2023 14:28:07 +0300
Date: Mon, 5 Jun 2023 14:28:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <ZH3Gxwb7/VYzIW3r@smile.fi.intel.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de>
 <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com>
 <20230605061511.GW14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605061511.GW14287@atomide.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_042818_751429_B438AFFC 
X-CRM114-Status: UNSURE (   9.06  )
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

On Mon, Jun 05, 2023 at 09:15:11AM +0300, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [230603 06:35]:

...

>  	/* wait until UART in idle status */
>  	while
> -		(serial_in(up, MTK_UART_DEBUG0));
> +		(mtk8250_read(data, MTK_UART_DEBUG0));

In case you go with this, make it a single line.

-- 
With Best Regards,
Andy Shevchenko



