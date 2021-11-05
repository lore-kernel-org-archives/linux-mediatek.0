Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 19:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2631361053
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 19:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2631361053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QoKOTiFgpGXP8G0+P6hbWS58CYW79vJW76BqmAezomY=; b=BHtM83otRnmsGe+UUzeTKG2hHd
	YiwdS4PlvzwuK+mLyUCk+pLaHZXLEHnq9uKjElz7Z5qH1Zhs4zrhpJYFf8isM3cSxN0lznssRXbQ5
	VwbJxeTJGlMHk2cCQin4LqB5JXrpxJ0uJGv4jbRJu+sisa/wOe8oeEWuwPt+kdglJVbqRUNlQi8lL
	4Rg9vMNSYifYLEcN1wFvWf1gVHsNai00BNrUMSEoMs8GiiavLORNouAzO/wD20bJdTEgQ1wOLn6iA
	NVRtf9hMrgnUsC6kwyg/rmvATUL8J1fDqz90YwccdLMdZBptPNbb67aIfPrGQd+eP8FglLlAGdQej
	d+T9fZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj5JM-00CFIz-Rd; Fri, 05 Nov 2021 19:55:40 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj5JK-00CFI1-2p; Fri, 05 Nov 2021 19:55:39 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="255625085"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="255625085"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 12:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="639913030"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2021 12:55:33 -0700
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, mr.yming81@gmail.com,
 chunfeng.yun@mediatek.com, matthias.bgg@gmail.com, nishadkamdar@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 eddie.hung@mediatek.com
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
 <YYVYrksU5/aCB3Fd@kroah.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
Message-ID: <b5b59fb7-40ce-929e-479a-d0605994cb53@linux.intel.com>
Date: Fri, 5 Nov 2021 21:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YYVYrksU5/aCB3Fd@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_125538_155508_3ABE85C4 
X-CRM114-Status: GOOD (  16.07  )
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

On 5.11.2021 18.15, Greg KH wrote:
> On Fri, Nov 05, 2021 at 06:00:36PM +0200, Mathias Nyman wrote:
>> Some USB 3.1 enumeration issues were reported after the hub driver removed
>> the minimum 100ms limit for the power-on-good delay.
>>
>> Since commit 90d28fb53d4a ("usb: core: reduce power-on-good delay time of
>> root hub") the hub driver sets the power-on-delay based on the
>> bPwrOn2PwrGood value in the hub descriptor.
>>
>> xhci driver has a 20ms bPwrOn2PwrGood value for both roothubs based
>> on xhci spec section 5.4.8, but it's clearly not enough for the
>> USB 3.1 devices, causing enumeration issues.
>>
>> Tests indicate full 100ms delay is needed.
>>
>> Reported-by: Walt Jr. Brake <mr.yming81@gmail.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> So this needs:
> 	Fixes: 90d28fb53d4a ("usb: core: reduce power-on-good delay time of root hub")
> right?

I guess so, not sure on "Fixes" policy here.

This patch fixes an xhci issue revealed by ("usb: core: reduce power-on-good delay time of root hub")
That original patch itself looks correct, but these two patches should really go together to
avoid any enumeration issues.  

Thanks
-Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
