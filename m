Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD5AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cx5H8BWZqdob/+w+ryH53Pc4iQ3pDlYkzXChf5VlRPY=; b=OgjutUIwx09NbA
	tsEv3mOO8Jk7oMDj97bpF+q0lA58iQfOXk4RuxXt3HHBIoL3dYD2f0o/ntIMrU7xip/9FUmfv24n/
	Uz1UYa3P6CoMno8YtQ7NJWa6A02nJVz1m3qO3tLr63f1cvLa+xaItzWn+Y0ztTEja/bQpBbnBu2sV
	fhzQsrwZJusGgvFL3I7Z0r61s639P76JUsikIp97dg8L7A3CSTNLQKjjmTzECkA9uPtDWvgH/7KOn
	ARHRF3j/wXw4IU8xV3WOY0epHS3EsCVwF6/B6AI1h/JHWPtjXUe4skpNZUERup1ODpEpgyRJYJhmF
	6TMIt4alX/pxMp1C5KWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbLw5-00EtWC-4n; Mon, 04 Apr 2022 12:35:57 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbLvs-00EtSH-Ji; Mon, 04 Apr 2022 12:35:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51424D6E;
 Mon,  4 Apr 2022 05:35:40 -0700 (PDT)
Received: from [10.57.8.9] (unknown [10.57.8.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2074F3F5A1;
 Mon,  4 Apr 2022 05:35:36 -0700 (PDT)
Message-ID: <76230a1c-73b8-c471-c62e-3ec9b33461a6@arm.com>
Date: Mon, 4 Apr 2022 13:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND][PATCH 0/8] Introduce support for artificial Energy Model
Content-Language: en-US
To: rafael@kernel.org
Cc: dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, daniel.lezcano@linaro.org,
 linux-pm@vger.kernel.org, mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cristian.marussi@arm.com, sudeep.holla@arm.com, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org
References: <20220321095729.20655-1-lukasz.luba@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220321095729.20655-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_053544_736534_37E43FC6 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Rafael,


The patch set has been on LKML for quite a while and got one ACK,
for the code touching something outside the EM (thermal cooling).

AFAICS there is no interest and objections from others for this code.

Therefore, I have a question:
What would be be process to have merge this code?
(We had internally a few reviews of this code)

On 3/21/22 09:57, Lukasz Luba wrote:
> Hi all,
> 
> This patch set adds new callback and support for artificial Energy Model (EM).
> The new EMs have artificially generated performance states.
> Such EMs can be created from lean information sources, such
> as the relative energy efficiency between CPUs. The ACPI based
> platforms provide this information
> (ACPI 6.4, s5.2.12.14 'GIC CPU Interface (GICC) Structure'
> 'Processor Power efficiency Class' field).
> 
> Artificial EMs might require to directly provide the 'cost' of
> the generated performance state. This patch set adds a new callback
> .get_cost() for this. The EM framework does not force any model
> or formula, it's up to the platform code.
> 
> Artificial EMs aim to leverage the Energy Aware Scheduler
> (EAS). Other frameworks relying on performance states
> information (i.e. IPA/DTPM) must be informed of the
> EM type and might be prevented from using it. This patch
> sets also does this by introducing a new flag:
> EM_PERF_DOMAIN_ARTIFICIAL.
> 
> The patch set is based on current linux-next, where some
> changes to OPP & EM are queuing.
> 
> The patch set also contains (patch 7/8 and patch 8/8) logic which prevents
> two EM's client frameworks from using this new EM type. Some other approach,
> using 'milli-watts', has been proposed and discussed, but refused [1].
> This new flag is more precised and should not leave space for
> wrong interpretation.
> 
> Shortly after this patch set you will see a patch set implementing the
> platform code and registering this new EM.
> 


No one from Arm is an official maintainer of the EM code.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
