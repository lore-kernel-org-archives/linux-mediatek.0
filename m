Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0732DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF322177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2dL6FXhf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF322177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tWrxuDtAoppF+KJCA2AxPtuY5eUqe1mt0p5+sdyjvyI=; b=2dL6FXhf8gaOjOkGaK55NaqYt
	/k4qIHnd7SFSKtILan7xME8PSF/eUjEvgPiIfn5l3x0yebH/uKDwu0o1YhLB1uIT3lPzf/pFuJFFI
	sb3JlfFDSSPQFXiclwFoFLAmjyKD8fa2FvJQnlCfxpiPBbND2azIWiXZ5tWpllYmPCB5pZOa/EWZa
	SY93hnOlQ00u4K4AJW78Ub2EdfaY4gcYGn48+41iL45Q3UKvLL149/kd4PdZTKqhE9rwQVRTPOwev
	e2QRMr+ddZoLTN9pEDdRXgCBkQozKHU26/Wjad5thR+2rTOA2LGdWDYvU7h9mqUd2DFibmWQmwD4P
	OV7CR0VUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBIRo-0007Kp-RF; Thu, 27 Aug 2020 14:00:12 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIRl-0007Jt-LB; Thu, 27 Aug 2020 14:00:10 +0000
IronPort-SDR: tKFIFz8xA2jmOPRNcfAKXxuYRzYslHzEzzW4xz2zspYokYyUaruhw8XI8g+dGMRAqQ7Eb8tMNA
 Ib6MpY6kAwXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="156485265"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="156485265"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 07:00:06 -0700
IronPort-SDR: 2uPs2ch9V4+cMSNTnQsUhQEEE0Q8ba0a1DGS157MvdQRqo9rVDlG6U+m1CNhZdpQtd5CcvzNRb
 DsH4qQBWeYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="403408069"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 27 Aug 2020 07:00:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 27 Aug 2020 17:00:01 +0300
Date: Thu, 27 Aug 2020 17:00:01 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200827140001.GE813478@kuha.fi.intel.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_100009_845152_93F36F0C 
X-CRM114-Status: GOOD (  17.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 07:18:55PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD
> and USB Type-C functionalities.
> 
> v1 to v2
> 1. Add fix to Prevent the race condition from interrupt and tcpci port
> unregister during module remove.
> 
> v2 to v3
> 1. Change comment style for the head of source code.
> 2. No need to print error for platform_get_irq_byname.
> 3. Fix tcpci_register_port check from IS_ERR_OR_NULL to IS_ERR.
> 4. Rename driver/Kconfig/Makefile form mt6360 to mt636x.
> 5. Rename DT binding documents from mt6360 to mt636x.

You don't place additional changelog here...

> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---

You put it here, after that '---' marker:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format


>  drivers/usb/typec/tcpm/Kconfig        |   8 ++
>  drivers/usb/typec/tcpm/Makefile       |   1 +
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 212 ++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6360.c

thanks,

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
