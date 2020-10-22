Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E8DC4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 07:02:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBFD21481
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 07:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojvivP9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEBFD21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s/oOMaAyztTvn2E2N19qiPJZVmfYNe2+++7EUDYp52Y=; b=ojvivP9iJm7DEUQEms/lb4o0g
	E7vRPNy4LFQ5g38acEbnHXpotGktFXzHNj1FdVKPxrjdQSe0qACj9cvsZeX1yjqN71G1XB9ZZ8crm
	/LH+ttOxQtV6UwjEEVDI1hNSnHgnteuOGyvt06nsX5Wmsmli8ruvElmRjc6d66atuvs5hxNcLwb14
	jLbr7zQP65kSs/SwLrS36C+iJueTEpuhMbWwonq6+lGvYDusmijTKgXI20KhlaDyZtdXghWVcRa8O
	3iWWTMuqSLQf7iNoHZDIrEx7o409dY6TGCcXv6RiKRQ4b5pyBM59W1h/+jlJMoZr7mYNu6bwNiiZJ
	Kfft/Hjug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVUcM-00010l-6b; Thu, 22 Oct 2020 07:02:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVUcI-0000zu-F5; Thu, 22 Oct 2020 07:02:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84D70D6E;
 Thu, 22 Oct 2020 00:02:29 -0700 (PDT)
Received: from bogus (unknown [10.57.22.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 581C13F66B;
 Thu, 22 Oct 2020 00:02:27 -0700 (PDT)
Date: Thu, 22 Oct 2020 08:02:19 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Claude Yen <claude.yen@mediatek.com>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
Message-ID: <20201022070154.hqvksoj4nss3er2e@bogus>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
 <20201022061748.13730-2-claude.yen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022061748.13730-2-claude.yen@mediatek.com>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_030230_553057_A1E8EE39 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Len Brown <len.brown@intel.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 22, 2020 at 02:17:48PM +0800, Claude Yen wrote:
> As suspend_set_ops is exported in commit a5e4fd8783a2
> ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> 
> In this way, kernel module can hook platform suspend
> functions regardless of Suspend-to-Ram(S2R) or
> Suspend-to-Idle(S2I)
>

If this is for arm64 platform, then NACK. You must use PSCI and it will
set the ops and it can't be module.

-- 
Regards,
Sudeep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
