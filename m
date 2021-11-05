Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3227AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F002061252
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F002061252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vcjWldg4ezHD5+w0KypmwCCway6t4uXCssCPcdE7ASo=; b=FOXaiy1wqxvf+JZbPO2Cl+kWZq
	RoPDJ3aybKl97Yn4RGSB0rkHYCWW7mlgr4DbYUq3guZ0CRU1K3T0ohBLxVUlUJ0xe0tYuNqzuNf8J
	akAHiZOlVa09ZljIeJrgXXTcpumD5Vgi5CLKstLOX5WEYphzQpyCwcIhTjUVmfQqMspJjEPDUryGr
	rjLQRPVZLLNNgA8ScouYBx6Mkd5kBPSf5EYP3dRips7EwTGwEXUaeHgMJxVrZC6hwE6XPaR/7nDm2
	vK/7pfAEHkf+xzrgvjWOBeEdmbxar1sUExWu9ZgX493qFpPzWhVt/9DSsFhOSsTQjS1+Ct2lL/yJN
	zH40RHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1rl-00BvVZ-NC; Fri, 05 Nov 2021 16:14:57 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1rj-00BvVB-3x; Fri, 05 Nov 2021 16:14:56 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="230653994"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="230653994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 09:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="639860271"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2021 09:07:37 -0700
To: "Walt Jr. Brake" <mr.yming81@gmail.com>
Cc: chunfeng.yun@mediatek.com, matthias.bgg@gmail.com,
 nishadkamdar@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eddie.hung@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>, Greg KH <gregkh@linuxfoundation.org>
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
Message-ID: <96925c96-0f87-f110-e279-5b669337948a@linux.intel.com>
Date: Fri, 5 Nov 2021 18:09:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211105160036.549516-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_091455_192951_997B0B6A 
X-CRM114-Status: GOOD (  13.45  )
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

On 5.11.2021 18.00, Mathias Nyman wrote:
> Some USB 3.1 enumeration issues were reported after the hub driver removed
> the minimum 100ms limit for the power-on-good delay.
> 
> Since commit 90d28fb53d4a ("usb: core: reduce power-on-good delay time of
> root hub") the hub driver sets the power-on-delay based on the
> bPwrOn2PwrGood value in the hub descriptor.
> 
> xhci driver has a 20ms bPwrOn2PwrGood value for both roothubs based
> on xhci spec section 5.4.8, but it's clearly not enough for the
> USB 3.1 devices, causing enumeration issues.
> 
> Tests indicate full 100ms delay is needed.
> 
> Reported-by: Walt Jr. Brake <mr.yming81@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 

Walt Jr Brake, just to be sure could you test this one as well?

As Alan suggested this sets 100ms for the USB 3 roothub but
keeps the 20ms for the USB 2 roothub.

Thanks
-Mathias 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
