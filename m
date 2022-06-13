Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27114C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeNLO4M/dYN56bGHuGcvjmgECOAt3POmQEt85VdQ6wM=; b=A0o68/WFjuCRjJ
	I/wtVmaBHEvpbS7SKqGDS0MDjkygLE61jurqV2q7/gaX70PNsN/DZOa/0tAmoVbprM3sm4cBX1x/7
	E7h2N3iT5nMxq2odXlW5kPINAB5weGr3n34P9wgFTA7fSdPvY4e/yLf3pFffJSMjjgbwP/f0VwwTF
	pikEQdD+zqGehcjnyrk4LorjPLgjKkBQEZp3JKKqEufZ7qz6MsZQC9I8x1a2YM9aammtbWGXsvRvU
	3IbpYCemZ7Dao+1MzhsgKs5Lb5pSaPadbibek98X/Qpqpu4bQ7HRb+yeg7EBmLGUtM+U3t2oj6Sgs
	kiSUoiyPi7hDOz5wq7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0h0L-002ndc-64; Mon, 13 Jun 2022 10:09:05 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gwr-002lkS-Kw; Mon, 13 Jun 2022 10:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655114729; x=1686650729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m172As3IWVYcn+TF8WEERe47LseaOb5+mE8bYw135yI=;
  b=kzDjC5yxJfNDmoAAUl9xLXdxRKo+oxP7JiKnEgpGFshHH6a7k6Z7U/+0
   yllk7HAmLyH+aR5AOlRQhz+ls4hmpkFP+7qxt47ao1F15Mjn3oNhRyukZ
   O10V6YRGmHQm0NzF7w7Z00jFBYUMw0/JHj6kZWILSgeszZql78zenl1+M
   OB6G87abXBZw5SaBVg/u6NeaktlTwAglCmelJ7MCEVb0pwndaySksC7W3
   2t/yuKWR8wPIVv2nUgLfCLdK8Cke2k1k0W6S7OxR0i6U+dgqJpVAz1Lnd
   rc+cX64+a4QVVBCEbIUtHrWs/QKvaAXXabgu0APmyWtDs7OfIrktlOswa
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="258676529"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="258676529"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 03:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="726189170"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Jun 2022 03:05:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 13 Jun 2022 13:05:20 +0300
Date: Mon, 13 Jun 2022 13:05:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <YqcL4NyPD6JZkPxZ@kuha.fi.intel.com>
References: <20220309023404.1221453-1-xji@analogixsemi.com>
 <YqMaUroS87rjnCny@kroah.com>
 <YqMyxQGzPSs/HwVi@kuha.fi.intel.com>
 <20220613093948.GA1454902@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613093948.GA1454902@anxtwsw-Precision-3640-Tower>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_030529_784302_67FC6E30 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi,

On Mon, Jun 13, 2022 at 05:39:48PM +0800, Xin Ji wrote:
> Hi heikki, OK, I'll rebase on the latest code and resend.

Before you resend, please make sure you check the comments I made to
the patch 3/3.

thanks,

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
