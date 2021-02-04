Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7E6C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 10:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A1964F4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 10:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A1964F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w6ivvNFEunRyBjoe4tPOAg1NIPqLRz0jkJyO1HEOM0g=; b=ndDblY7tT0BIdgNzJ/QHS1gOw
	wis/3IFwDb/xOjaRRrtigyYdiMGzPr+FotXVEJ96Dn7Gw51UqT31TzWa8erAEnRBPZDwcmwHk6pTa
	gv6UumvdU+GdR82xG8c3uPOTwoh5tGQ4ATUbChf8GF4BaidR7rJBlPDBYACLx3mTcRqqvUqT0/DUX
	HW+kbiN/4mR07C6is9xpP7YH8hpEkdVYjb/my88jQo0s0cAh+V3Bio4LepKfwXKTyBxlWfbY+ihTI
	P2qzRV08sj9xkTIxqSqxQsqCEOnxiSCCFgayp8YDTtHJVRwHx8jnGtnOYgSzS9SAqnoBzjvSr5wzi
	ktelx5MTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7bRK-0003ZW-E8; Thu, 04 Feb 2021 10:00:42 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7bRE-0003Wi-C0; Thu, 04 Feb 2021 10:00:37 +0000
IronPort-SDR: PFjgLbl/b6Y4qd7BcxJTq6frrF4w1KVfn2Gpz01u4+iI5/pF4uedhP3wi2HbS2ZKNpYwAsm/7Z
 HLuHHPJSvRJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="200198099"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="200198099"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:00:28 -0800
IronPort-SDR: d9DO6uJzTaVOLuyXyQdxvftReSl/DDuhgEf6H1pUjEWlXGCebIGLGLReSR95sBMVRSRWCJv9E6
 TzUUK0TQt30Q==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="393090013"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:00:23 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Feb 2021 12:00:21 +0200
Date: Thu, 4 Feb 2021 12:00:21 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: mingchuang.qiao@mediatek.com
Subject: Re: [v4] PCI: Avoid unsync of LTR mechanism configuration
Message-ID: <20210204100021.GA2542@lahna.fi.intel.com>
References: <20210204095125.9212-1-mingchuang.qiao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204095125.9212-1-mingchuang.qiao@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_050036_620685_1965FFDF 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: kerun.zhu@mediatek.com, linux-pci@vger.kernel.org,
 lambert.wang@mediatek.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, alex.williamson@redhat.com,
 linux-mediatek@lists.infradead.org, utkarsh.h.patel@intel.com,
 haijun.liu@mediatek.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 05:51:25PM +0800, mingchuang.qiao@mediatek.com wrote:
> From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
> 
> In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
> configured in pci_configure_ltr(). If device and bridge both support LTR
> mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
> enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.
> 
> If PCIe link goes down when device resets, the "LTR Mechanism Enable" bit
> of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16. However,
> the pci_dev->ltr_path value of bridge is still 1.
> 
> For following conditions, check and re-configure "LTR Mechanism Enable" bit
> of bridge to make "LTR Mechanism Enable" bit match ltr_path value.
>    -before configuring device's LTR for hot-remove/hot-add
>    -before restoring device's DEVCTL2 register when restore device state
> 
> Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
