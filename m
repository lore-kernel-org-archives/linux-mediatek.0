Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7D3C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 21:40:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43659617ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 21:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43659617ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lzo/hsZqB2cryt35WVCU2vFJTFcNHXquZCw2dnQczpM=; b=x1RsSRq+jb9Eis
	uj9eQcVrjHDVm7OPTUnEBY11ot4fGNvQmpjVpdRba6T6pWGtfu7vfec44DyAtVj6Juoq0yUHT1QUz
	RsSAs2FhFLvNksVEg0mlqvBDBoqPhtJHuPKaN66LUga99hAUXyMQPQNWWlcUTdoqXlK2B7XOE4Kms
	D/MIMBl2QrsU+GVh3+Tci2l9MKxe0Nu6jVKaFhA5sD2HRpJwhyB+RPWqwdZtFRbt5zij8uBUdxgtj
	idX8M0yGe1Eg4KpM6WgaolKkgaF7acLVB9tbpk6D+2yCkaY9M2jCRM67k6jKkB0YpzzhcX3rjt/cz
	rtUCgvkXNG90Zpyz7R5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1bkz-000LWY-I2; Thu, 08 Jul 2021 21:40:29 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1bkw-000LVG-9n
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 21:40:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id c5so3560059qvu.11
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X04tcKXa7hFEehVhGpumTDGOPBdfX4n0IkKTDrQdgMI=;
 b=W1oZZzqpf6gxAFkRB9yGMvnIAM8TSfq+X3VRQUEVVXMXrfR2ZwUNGHs0NA5Vofb94J
 7v5Y+vSGdYpRXRz9xGFt9ANLqHvJkHv9dBgQlHNU/EimvI4nTd3jhdvnrxghP4WGvmuM
 O5eZGSMna5lzQ/fN4xemsrRE+IH2AfSWerxc6NBuJ1nbKa3juenlp347rrYTij3hKIkP
 VGJp6cpQeAvlTRL5vl9nH0utTLIZA8UX8271PJ5YvN7Yz5MHMT+yPkCdxM3X8160mCJV
 KBLRQbUSLSRzuwV8HYmcGmJUXf+2jqHJoVeFVf9aoljCxwSTBrcBjc7r2g2NwnuSIue6
 H+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X04tcKXa7hFEehVhGpumTDGOPBdfX4n0IkKTDrQdgMI=;
 b=SO5MrALln+X2/eBaCMPNf1xtnikkRXdeP5MXF++TZ/I48aixqaKEZkbAgfrjWCqKDy
 VvReCtp5aiNtlEAWFcrBMSQhCn+Wsy6zHctZaqLyxHiM5hkwT5ZH/EVUaym8/UCOCrLl
 yDAOsK1ACvd80Cloohwl+RMPxuB0VEM4rgPTxEEKMUVGSDsUW1jeBGtrVfngEws4Ko3z
 TTvZi1193U09xDsqmLnWZzxRMWViROSWSoP0F3x9Bl3sov3GF9l0YVxFCCItduMX+Dz3
 EpXTrcIVvb+O1Fxwbyt/xG72TgNeoxBjLBSmoIzWHfmj0YdDb0a+FcuijAT5eNhFD15o
 fjFw==
X-Gm-Message-State: AOAM532w4gzwGlWsGvcy22KqA62DJsrjw6lMvFpqcvjGq3PmhUvNjJJt
 NqmXmSGEvxiI/bsJSwLWGRDWTA==
X-Google-Smtp-Source: ABdhPJyCj0Bip0e8fLTg2zNGYdN69r9A0+iv9qeSlSw4AqQRYRpiDcI/avhqQZQnUQiZVSO4BPtW1Q==
X-Received: by 2002:a05:6214:29ef:: with SMTP id
 jv15mr7195839qvb.1.1625780424291; 
 Thu, 08 Jul 2021 14:40:24 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:8649])
 by smtp.gmail.com with ESMTPSA id k6sm1458865qtg.78.2021.07.08.14.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:40:23 -0700 (PDT)
Date: Thu, 8 Jul 2021 17:40:22 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, matthias.bgg@gmail.com, minchan@google.com,
 timmurray@google.com, yt.chang@mediatek.com, wenju.xu@mediatek.com,
 jonathan.jmchen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team@android.com,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v4 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YOdwxh3487PeMHRX@cmpxchg.org>
References: <20210708203648.2399667-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708203648.2399667-1-surenb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_144026_419357_4FAF6E07 
X-CRM114-Status: GOOD (  17.83  )
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

On Thu, Jul 08, 2021 at 01:36:48PM -0700, Suren Baghdasaryan wrote:
> Psi polling mechanism is trying to minimize the number of wakeups to
> run psi_poll_work and is currently relying on timer_pending() to detect
> when this work is already scheduled. This provides a window of opportunity
> for psi_group_change to schedule an immediate psi_poll_work after
> poll_timer_fn got called but before psi_poll_work could reschedule itself.
> Below is the depiction of this entire window:
> 
> poll_timer_fn
>   wake_up_interruptible(&group->poll_wait);
> 
> psi_poll_worker
>   wait_event_interruptible(group->poll_wait, ...)
>   psi_poll_work
>     psi_schedule_poll_work
>       if (timer_pending(&group->poll_timer)) return;
>       ...
>       mod_timer(&group->poll_timer, jiffies + delay);
> 
> Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
> reset and set back inside psi_poll_work and therefore this race window
> was much smaller.
> The larger window causes increased number of wakeups and our partners
> report visible power regression of ~10mA after applying 461daba06bdc.
> Bring back the poll_scheduled atomic and make this race window even
> narrower by resetting poll_scheduled only when we reach polling expiration
> time. This does not completely eliminate the possibility of extra wakeups
> caused by a race with psi_group_change however it will limit it to the
> worst case scenario of one extra wakeup per every tracking window (0.5s
> in the worst case).
> This patch also ensures correct ordering between clearing poll_scheduled
> flag and obtaining changed_states using memory barrier. Correct ordering
> between updating changed_states and setting poll_scheduled is ensured by
> atomic_xchg operation.
> By tracing the number of immediate rescheduling attempts performed by
> psi_group_change and the number of these attempts being blocked due to
> psi monitor being already active, we can assess the effects of this change:
> 
> Before the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           684365   1385156    1261240
> Immediate reschedules blocked:             682846   1381654    1258682
> Immediate reschedules (delta):             1519     3502       2558
> Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
> 
> After the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           882244   770298    426218
> Immediate reschedules blocked:             881996   769796    426074
> Immediate reschedules (delta):             248      502       144
> Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
> 
> The number of non-blocked immediate reschedules dropped from 0.22-0.25%
> to 0.03-0.07%. The drop is attributed to the decrease in the race window
> size and the fact that we allow this race only when psi monitors reach
> polling window expiration time.
> 
> Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Tested-by: SH Chen <show-hong.chen@mediatek.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
