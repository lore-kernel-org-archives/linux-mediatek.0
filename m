Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EA2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BQr2ofrq0cXJz6SZiO6VLHUuzIgqJt/Ic1HSSE1t6W0=; b=LCym22rh1BnDtvyTE7neo4bEm7
	PoOMnCLDMHBad2H9k7tb553aH2cP8M+AJ1+l1CHMBqx5DooEnIz3xpc4OVMTE/lRJemQ4PYNSgsKC
	ioFSbZi1mUXR0y4VdEVWX8oM1IrZCD239eUpAETwVYK8DsV5MPPBzK/FGVW8Q6UafBmZX4VwArk7q
	awEsTpKF9i2bzto1Wlxb7yOV+Qk+2nHRb1VpsMSojkHyZ6mcAvAN2/CmK2WnHtDEcBIz1AXcLP6O9
	fB6Q2O/FjMgqyGmdkCKIJzsLP+mMt00V2kpPcssRXY9YY3SX9oc755jK1cfjNgnNMx5u/Sk6B8GFA
	Mf37vybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvg0O-001zbq-5J; Fri, 10 Dec 2021 13:32:08 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvfzy-001zQU-4z; Fri, 10 Dec 2021 13:31:46 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218366667"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="218366667"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 05:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="659578144"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2021 05:31:38 -0800
Subject: Re: [PATCH] usb: xhci: skip re-check pending port event if hibernated
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Yun-Chien Yu <yun-chien.yu@mediatek.com>
References: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
Date: Fri, 10 Dec 2021 15:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_053142_271377_295E137D 
X-CRM114-Status: GOOD (  10.38  )
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

On 9.12.2021 9.22, Chunfeng Yun wrote:
> When xHCI controller hibernated, the root hub lost power, if controller
> support Port Power Control (PPC), PP is not set at xhci_resume() and
> set by hub_reset_resume() later, so no need check pending port event.
> If PPC is not supported, device is disconneced, seems do not send out
> U3 LFPS wake signal, no need re-check again and drop 120ms delay to
> save resume time.
> 
> Reported-by: Yun-Chien Yu <yun-chien.yu@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---

Thanks, adding

-Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
