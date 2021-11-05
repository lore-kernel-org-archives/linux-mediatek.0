Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F831C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 19:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E2960FC3
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 19:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E2960FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=48Pg/+ZxlyZmlZTJkCmTtbdBQEs6ynOGDZ8BPntlyV4=; b=tFKPuSllm6+IWLqp/RWJ0dasaw
	R9mXAc0PFpcgrVYY9FM15Xs9AbwlELN+mZVUFPH+sOTj0vixWh4MCcVNrG+Xl/EgIRbWd9XkDFuoO
	Nu8V/H6zoWb06QH5YtDahGa4iordlKE8GiQ4W+tn9hjTsuYT0KzirosBYLQqD34ug4PGaHABpHiH6
	fut+0SUoV3yyEjWTlAZ6pC9x7wffurFKRQN/2jP5EBcuIh+9n++vryjm0z3D0lIdgtIExDxOLOPpP
	e8gyJLpS0q32J7+Q0rlS238WsxhRmj7PFNc/Xbq27Q88J1IPZt9w7rrPnmC06lZf2XHlv2QiPePrs
	J21d2CPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj54G-00CDco-MF; Fri, 05 Nov 2021 19:40:04 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj54D-00CDbb-Tm; Fri, 05 Nov 2021 19:40:03 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="295414624"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="295414624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 12:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="639910310"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2021 12:39:58 -0700
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
To: "Walt Jr. Brake" <mr.yming81@gmail.com>
Cc: chunfeng.yun@mediatek.com, matthias.bgg@gmail.com,
 nishadkamdar@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eddie.hung@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>, Greg KH <gregkh@linuxfoundation.org>
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
 <96925c96-0f87-f110-e279-5b669337948a@linux.intel.com>
 <8301c7f7-4c63-5681-af53-9edc67d96d17@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <5fc1dc0b-6fd0-2162-4e1d-9420ecabc337@linux.intel.com>
Date: Fri, 5 Nov 2021 21:41:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8301c7f7-4c63-5681-af53-9edc67d96d17@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_124002_043874_08474475 
X-CRM114-Status: GOOD (  13.09  )
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

On 5.11.2021 19.32, Walt Jr. Brake wrote:
> On 6/11/2021 00:09, Mathias Nyman wrote:
>> On 5.11.2021 18.00, Mathias Nyman wrote:
>>> Some USB 3.1 enumeration issues were reported after the hub driver removed
>>> the minimum 100ms limit for the power-on-good delay.
>>>
>>> Since commit 90d28fb53d4a ("usb: core: reduce power-on-good delay time of
>>> root hub") the hub driver sets the power-on-delay based on the
>>> bPwrOn2PwrGood value in the hub descriptor.
>>>
>>> xhci driver has a 20ms bPwrOn2PwrGood value for both roothubs based
>>> on xhci spec section 5.4.8, but it's clearly not enough for the
>>> USB 3.1 devices, causing enumeration issues.
>>>
>>> Tests indicate full 100ms delay is needed.
>>>
>>> Reported-by: Walt Jr. Brake <mr.yming81@gmail.com>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>> Walt Jr Brake, just to be sure could you test this one as well?
>>
>> As Alan suggested this sets 100ms for the USB 3 roothub but
>> keeps the 20ms for the USB 2 roothub.
>>
>> Thanks
>> -Mathias
> 
> Yes I tested, it works too.
> 

Thank you
-Mathias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
