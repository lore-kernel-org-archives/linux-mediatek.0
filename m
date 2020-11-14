Return-Path: <SRS0=9X0+=EU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D8AC55ABD
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2020 20:57:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA3C2242E
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2020 20:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CODPD9ly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA3C2242E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l/5YYO3ebLbzlPXc2kjUCPXveGcw9UskarfRxWEcmuo=; b=CODPD9lyhO9+Usl+JxiOolHhH
	r7f/zatr1yqhySYKN0pnYhw2ZW4POacKdeG8cAZLHUfrwCY2PaIiTZ/Keed9JYm9jQv9tNCBwdsjY
	9Pm9xyKI7djQ+ttyZn2e9gLLJGcUERr77uJMs17gIe5J4qC04lCcFnOnCzHapzbIAhZ1SZeJM+3lm
	wJvu9H2AeoI3htKiyWj6OpP9ZAoZUVFzBNv/zNCzxRvL6j0BaJRfsip1dbKf9wmtTU6kp2Jy4ysQG
	p0KuWefg2SGTXC3VNSuLTnei6+z/CTbqmmnXJ2EyeC8rvQqJ+fOXldYwOBm1Gni1Nz90lIA8kPcDM
	CiCNkHOyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2bz-0008SI-TA; Sat, 14 Nov 2020 20:57:32 +0000
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2bx-0008RH-Jp; Sat, 14 Nov 2020 20:57:30 +0000
Received: by mail-pj1-f67.google.com with SMTP id gv24so1977279pjb.3;
 Sat, 14 Nov 2020 12:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16xSpaXhAEOF0N0U9OOB7ZCXwUuMywa2m2HceEa9Iw4=;
 b=FMCPdfgRc7By0uIjdDpAwn8QLGj9tUP0r+N8GLv8aoYNBaj9sFUab1rTaKk4vAn5aL
 BzrQGK2n8axCYiUF1rwADdz4+UH7W+gkh5xt9kAOP24/p10ORPzEYf5GnFKKQ+/K6vTG
 x4uBoxho+euKShX6+Sk1TqNMlxq41Vj067eJIixFe8iRVSHfGDKAAdHWTTCS1JFi4gDh
 2Uf4Xsqxzv2hezyV7W8o5AKlVY5GCqCaRQFWaQsyc/DpDLXCxzqLEg6sUL49h+GTvNhy
 ar/5/15FJo7avwQJD//O9gsAp2uFb0yiayy1P4U8NORwQtNmmj/SHIjGfpUC0CQMJXIU
 Ggog==
X-Gm-Message-State: AOAM532F8UA8VQWTD1bjzGm1tTI3OUl4gaHli/wHcDcurAqEl+ZW4KB2
 l2BTgiO61rUO1O2GPp0Fm/WifDxpHtU=
X-Google-Smtp-Source: ABdhPJxN95asfd2nvQMo510YjA+Wku+VpWqlMQg1JxXwovicCEenAsosTW2ocPXCqEjyuH7KN1z7vA==
X-Received: by 2002:a17:90a:7409:: with SMTP id
 a9mr9219187pjg.48.1605387445013; 
 Sat, 14 Nov 2020 12:57:25 -0800 (PST)
Received: from [192.168.3.218] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id g1sm14268854pjt.40.2020.11.14.12.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Nov 2020 12:57:23 -0800 (PST)
Subject: Re: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
To: Can Guo <cang@codeaurora.org>, asutoshd@codeaurora.org,
 nguyenb@codeaurora.org, hongwus@codeaurora.org, ziqichen@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
 <1605249009-13752-2-git-send-email-cang@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
Date: Sat, 14 Nov 2020 12:57:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1605249009-13752-2-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155729_681463_FEF1BEBD 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/12/20 10:30 PM, Can Guo wrote:
> If block layer runtime PM is enabled for one SCSI device, then there is
> no need to forcibly change the SCSI device and its request queue's runtime
> PM status to active in scsi_dev_type_resume(), since block layer PM shall
> resume the SCSI device on the demand of bios.

Please change "along" into "alone" in the subject of this patch (if that
is what you meant).

> +	if (scsi_is_sdev_device(dev)) {
> +		struct scsi_device *sdev;
>  
> +		sdev = to_scsi_device(dev);

A minor comment: I think that "struct scsi_device *sdev =
to_scsi_device(dev);" fits on a single line.

> +		 * If block layer runtime PM is enabled for the SCSI device,
> +		 * let block layer PM handle its runtime PM routines.

Please change "its runtime PM routines" into "runtime resume" or
similar. I think that will make the comment more clear.

> +		if (sdev->request_queue->dev)
> +			return err;
> +	}

The 'dev' member only exists in struct request_queue if CONFIG_PM=y so
the above won't compile if CONFIG_PM=n. How about adding a function in
include/linux/blk-pm.h to check whether or not runtime PM has been enabled?

Otherwise this patch looks good to me.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
