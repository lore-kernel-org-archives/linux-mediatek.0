Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03675C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 17:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADB260EB4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 17:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CADB260EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXW8tXqmGpFtg+2cPrcwRCSiskxuswqHRk0k0onm0Xg=; b=EUyO7etPhTr+xU
	FCAyxy+PeDvrY2Akx5ktpnmR1O96i5woRnpiugX1HUMLlUURl0lFwdWcoudhibvpgD9sSiJb4IaGk
	fHJHpl8GAi9n1q47GgGH/IVPWkVfp8rI822s320qq898bbstESM0PXzkpzB6Di3oUtm87ZMnOtlbR
	oV3R1HPV/HNGVsr5JcTCd8KqkHpxLoBsNbHJv7Kb32SzPlGuweLsyt+x4f4JBVRzvu/uQ8LvbcnqK
	7qxVr5CHN760RYtDIiXcPxlsQ36pLLXCGaQobB1Agw8gYWyv9RDfiaGBNyHh2QMaWAQ2nL2CMo19l
	+ba7wiOm1izWIOiFvibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj35C-00C4yu-US; Fri, 05 Nov 2021 17:32:54 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj350-00C4wh-4Y; Fri, 05 Nov 2021 17:32:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id r28so8966141pga.0;
 Fri, 05 Nov 2021 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2OWM37nBksJ7gayzdgOjUg6cXZHlid4wQ9drsluV0C8=;
 b=DQRxCNEXF7tlNikiQLw63G8Y+Dsn+L66+H84HjfKEy4BscuewNUkH2sgfXMLDJHfAn
 70hvD+26uYuolr0JBLTX7LtSCK6egOPeJcWkkXSUqR47XBKqYXNzph3T2TD/mTuAlTFs
 lSnLFZ6A7rH74GeBag2mVNjv5gEry5gBlqYGUO+rQKkDtTrT559Rxam15FBmwuh7s7M5
 QLsW7fuznfV9dng22XiNlj+vpyAL6rnI5cnRTja8k7MrhEX22LWkKABdX4Dnj87Nfrly
 8XKsVaHG3cvhJMfAKbLZlnEEYT5fXydHJ+ZzsJMDbF//OLuIrxEZEkMCcJwQ0c96nr7M
 ZtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2OWM37nBksJ7gayzdgOjUg6cXZHlid4wQ9drsluV0C8=;
 b=AYFLvGODHZ3VpSWu1Z309Zu0rBF4QdYROPvxDAbD09kw0eCFVet7CgUNgl/N0NmX7q
 wWbHbT1DG3KQXP3Fgti9x8AcOoeM21+hbpph70gZp9Vn+Bpb66mQ7c6v2b9FpQcV/XPn
 LWaQjsqwxCneYUHgMjwHzXeOnzN36LMOwRG3jPFkBRACUFZxBxXZZBvXteSELJuOKU1w
 erpglTVY2GkO7bWJ8JgOmY9T6moZUXVwpt9ALhMBQghk4w+jf0njuyHRr6bMXWOB/qyq
 d2gtiszy4kFmTTextVKgRCrXFaoWDu2gvG1s3hihpDCYbdxJcuhpF87P2+aCfehDjNtH
 s1Ew==
X-Gm-Message-State: AOAM533H7Q58fOW2GSdmmqIf6j+pAs1pMS/eg0aX4jbF+9GFbqYDvWZU
 fpdgIXJXGGUWwtZYPRiEpog=
X-Google-Smtp-Source: ABdhPJykHZw2/9QJGdkoo4Kk9zk/Gp1KOr83+sK4tkJl24z/KpiwOjB5LZro7ajFk49kLCes0PrJww==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr46146521pgv.453.1636133560906; 
 Fri, 05 Nov 2021 10:32:40 -0700 (PDT)
Received: from [192.168.50.188] (67.218.130.61.16clouds.com. [67.218.130.61])
 by smtp.gmail.com with ESMTPSA id
 s25sm7683062pfm.138.2021.11.05.10.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 10:32:40 -0700 (PDT)
Message-ID: <8301c7f7-4c63-5681-af53-9edc67d96d17@gmail.com>
Date: Sat, 6 Nov 2021 01:32:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xhci: Fix USB 3.1 enumeration issues by increasing
 roothub power-on-good delay
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: chunfeng.yun@mediatek.com, matthias.bgg@gmail.com,
 nishadkamdar@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, eddie.hung@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>, Greg KH <gregkh@linuxfoundation.org>
References: <20211105133050.GA1590803@rowland.harvard.edu>
 <20211105160036.549516-1-mathias.nyman@linux.intel.com>
 <96925c96-0f87-f110-e279-5b669337948a@linux.intel.com>
From: "Walt Jr. Brake" <mr.yming81@gmail.com>
In-Reply-To: <96925c96-0f87-f110-e279-5b669337948a@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_103242_214869_91EA7AFF 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/11/2021 00:09, Mathias Nyman wrote:
> On 5.11.2021 18.00, Mathias Nyman wrote:
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
>>
> Walt Jr Brake, just to be sure could you test this one as well?
>
> As Alan suggested this sets 100ms for the USB 3 roothub but
> keeps the 20ms for the USB 2 roothub.
>
> Thanks
> -Mathias

Yes I tested, it works too.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
