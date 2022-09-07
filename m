Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F46C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQcC/MuTwXER3Fk3pTkmfsGu8/AW27uF6DMj9e4ZVeM=; b=bo5ArSmAb8ARMb0v/S43y+tlCB
	9sP9VYl5wLg6KlLHO+XTjjIlf8J6RMDwqtc62f72huyqWSZfkOW7JTpANMqqqNWZnL8UJVQySFz84
	/Gs6zIRpEF1qvh33ef82A4BclYUDCpPZWTQxKrPQO2q+D/BI8vRcaBSnE27ZFH2dXm1hmWNZzT+mj
	BSdzb8BmAtMG3ZkA9ZQsMJEgK/PvkdOzHcr2epjMUT76EpDqhYctDRZW/zfNH+vx/sJHa4aUb9wny
	fuQg6HN5BJZXSYWTKziSrwSfpAatgM4KK7/lgS8vFmA14NjZVKImc5ePvNZCK9KHQ6ndWOCw/lPKR
	KskC3DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVqbj-004OgM-Ny; Wed, 07 Sep 2022 08:40:27 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVqTZ-004IPp-SF
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 08:32:03 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6306D33B69;
	Wed,  7 Sep 2022 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1662539513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQcC/MuTwXER3Fk3pTkmfsGu8/AW27uF6DMj9e4ZVeM=;
	b=uyLPzlsRIGuQdITOAHCzMjT689KH7zBjEqf8ecC89Z6tOURVAF7h2M9mc02HuJ/1Wn0utE
	zZkwMmhbsGSMw2tc2FZBkfYnkVBHv30Qt1lF/MSOeaJkNQ0nnP2JfxDEfkhZ0RuQIO1GR6
	S8dolF5DcB8q67PTNlZhz+SQg1bJ4Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1662539513;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQcC/MuTwXER3Fk3pTkmfsGu8/AW27uF6DMj9e4ZVeM=;
	b=seZhZwbUAvusV1tezHal7EPPhIPPVMUGUYsoz/BYVQAJj/qq3+TJPPyWpfBP2Kagi+viNb
	uTZVMms7lMgtIlCg==
Received: from suse.de (mgorman.tcp.ovpn2.nue.suse.de [10.163.32.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A3FFD2C142;
	Wed,  7 Sep 2022 08:31:50 +0000 (UTC)
Date: Wed, 7 Sep 2022 09:31:46 +0100
From: Mel Gorman <mgorman@suse.de>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org, jing-ting.wu@mediatek.com,
	yt.chang@mediatek.com, jonathan.jmchen@mediatek.com
Subject: Re: BUG: list_add corruption while doing migrate_swap -> balance_push
Message-ID: <20220907083146.lp6eyv4txjbhuevl@suse.de>
References: <6dab6e564e43c952f63f83ef868da6ed829fc1a8.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <6dab6e564e43c952f63f83ef868da6ed829fc1a8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_013202_240393_4231E0C5 
X-CRM114-Status: GOOD (  10.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 06, 2022 at 08:54:58PM +0800, Kuyo Chang wrote:
> Hi,
> 
> [Syndrome]
> A list_add corruption error at kernel-5.15, the log shows.
> list_add corruption. prev->next should be next (ffffff81a6f08ba0), but
> was 0000000000000000. (prev=ffffff81a6f05930).
> 

Is this a vanilla 5.15 kernel or modified? Does it happen on 5.19 or
6.0-rc4? Given that this appears to be a bug triggered by NUMA balancing
racing against memory hotplug, is there a reproducer for this?

-- 
Mel Gorman
SUSE Labs

