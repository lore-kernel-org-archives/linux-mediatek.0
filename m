Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C559BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BxPDweyR5gqNmSdQ1XQrgx41cgNOsQkubQJiQ7XSHk=; b=mS1wKsyd2GzBqe
	qTg8yJi71XDbw/Do2NcCa3XtvTQ/rFvhCf4BA4EWnUpmcUhDNX/LeqZmPb1biRSxhI6JJ+xzXhEx4
	/2MECXtAexms5/hG+yxLrGlf4PxbCSRMSiz67DfuvloJJ7QFBFn0XasRmN70RcRGGfLv454glUAw1
	fU68TlR8foJPuVMqtRRNLN/UVZR2OqxziRU5O1dSu/VuYLX5hmeuE7tBj6i5n1hJD2OSQe6TY3TKg
	tL2iOuoQa5wSSbFRl5Fs5v8k7PU+xpf59EbHR8AF1avqYNpLXsc9jIx6JEteErdFRK1+NWbYwTJnF
	vke3uaG3mihiYc7Nrj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPbr-00FoXx-QY; Mon, 04 Apr 2022 16:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPbg-00FoWy-Tj; Mon, 04 Apr 2022 16:31:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 520B3D6E;
 Mon,  4 Apr 2022 09:31:07 -0700 (PDT)
Received: from [10.57.8.9] (unknown [10.57.8.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65D843F73B;
 Mon,  4 Apr 2022 09:31:04 -0700 (PDT)
Message-ID: <74a2f038-50dd-91e5-227d-a1c633a87184@arm.com>
Date: Mon, 4 Apr 2022 17:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND][PATCH 5/8] PM: EM: Remove old debugfs files and print
 all 'flags'
Content-Language: en-US
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-6-lukasz.luba@arm.com> <YksWj8GhZWUimF74@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <YksWj8GhZWUimF74@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_093109_054903_B50AABCE 
X-CRM114-Status: GOOD (  17.40  )
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

Hi Ionela,

Thank you for reviewing these patches.

On 4/4/22 17:02, Ionela Voinescu wrote:
> Hi Lukasz,
> 
> IMO the debugfs files were fine as they were:
>   - They offered information on units and inefficiencies without having
>     to dig into the code to see which bit is for which flag.
>   - I believe the artificial EM power values fit under bogoWatts as unit,
>     so that part would still be correct.
> 
> On the other hand, your new file offers more information: we'd be able
> to see in debugfs whether we're dealing with an artificial EM, despite
> needing a bit more looking over the code to understand the output.

I have consolidated them, so we would support more features in the flag
automatically when there will be a need.

In Android kernel we don't have unfortunately the debugfs compiled-in,
so this information is still only for kernel testing with some Linux
distro.

I have been thinking to switch into sysfs interface, so we could
have it in Android as well. This patch change adding a generic 'flags'
which would be more 'stable' (which is a requirement for sysfs contract)
is also a closer step into that direction. But that is for longer
discussion and not for this $subject.

> 
> I don't have a strong opinion and the code looks fine, so:
> 
> Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
