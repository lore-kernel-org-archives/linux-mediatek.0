Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E89ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 18:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgR/VP7NAhWauMOsrwcgIw4hBbhzAc1gPVaPVW58FU4=; b=HimFqCRATAlGsRkO0iIUmSHqvY
	yTZjvATJ3Rw7FcugLjOcQe245Fkw/9IBMXJnN6l+K//SYoE4GbFAT1odsuzzPp9YaJjrtztM838bT
	OPBeFMaa2qPGc/gRYkWWLaEYKbKlUA/kh9yIgniQ/JNj9aAlk93mL39ECyoHIysRtcpza1fZGNSbB
	XuZzbukhCJmXr78TAL/xiXyMeY3nw/ugNdpUmKpHp3Tqqj93gDVo6sfKu9++xOwpxeOk/asYBp+r0
	akOlmu9oIA1gmNjVYIBItumf0TzIKLbAYA1YzYvykZoNO/ya1m0Be9n+TaSufzDVp4xyEw0cqnw4t
	o3AiDbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVdLd-00GMat-AU; Tue, 06 Sep 2022 18:30:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVdLS-00GMX3-2A; Tue, 06 Sep 2022 18:30:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id 9so8902782plj.11;
        Tue, 06 Sep 2022 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=XgR/VP7NAhWauMOsrwcgIw4hBbhzAc1gPVaPVW58FU4=;
        b=S0fGy3Amy4jLKzuOHjKtRyPXTXPwsHuseA5jDpGwgXLMWKnDw9zRiwSKKo7O5Q/hOS
         LouY1sFAeHQBoDjypEXbFeLyxrjIzIiq//XsVdH9HR8vYwJl9TsrdpKS3ETQdJR7SAcb
         LDXBubAEA2lklGik3H1FSYpdt7J2XoaJlUr7sH3ht/xkgT2hAlWId1cjanJn4WNCSYkD
         qwA+UwuSZoYf5J1TeqNALYVszB4PYXcjVbLXWs7E91eAKhvFPM2byJ8TUSIrdcFZOQ1R
         xZIXH+U3kSC5zEdIPoL3lCrE1nPLx2y4A1djzpPAPsIwaqBXqYM9BuRC7NvWENr09cCq
         bLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XgR/VP7NAhWauMOsrwcgIw4hBbhzAc1gPVaPVW58FU4=;
        b=lR1aiAsAsK9b8iBTtNI+kkI++kc7R+k9K3LiEo/6o88pQIu9euAvaa40TU6Jm6DjdY
         ZBjNatvV+mtuysp/JpsOM5v1Kysf5tA0MyJfYNPRckR4CkFa7ZZNpD1fQlTuqW7qFYIA
         GGyE2zGQW+LyFeXh464yOhx2tvoX71NY0/dSs9WC3CJWpyN0AfWsoy8ZJ/IOHdXOKdD0
         gBuptF5cFLhAtM0X2X45E28MUjD5wmlgACfJxK+OmVqW1/+KYFBaqy/cmshzgqwzKAxz
         G4fEDpTK3PYSTtWJEJglQd9bPMYiO+1vuv8v4koqqh+hpwHaGK53lUjlV9LMTCnGtP37
         HJPA==
X-Gm-Message-State: ACgBeo3QK4aleNUSMx1ihS72xDdgHOqrknDMgzC1KiRaseLTNXcCyyIF
	kVbylx0j4Lre8eJ4daBRHV0=
X-Google-Smtp-Source: AA6agR7xwQzeEteyz/qsiN1TMQKL/kt8HG+oZBtL6gOlaPJR0iFY+K5yJ6jN1awDrocqkyJ2OZtU3g==
X-Received: by 2002:a17:903:41c2:b0:174:6cec:8d0d with SMTP id u2-20020a17090341c200b001746cec8d0dmr28511777ple.123.1662489043141;
        Tue, 06 Sep 2022 11:30:43 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902d2c700b001709e3c755fsm2588998plc.230.2022.09.06.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 11:30:42 -0700 (PDT)
Date: Tue, 6 Sep 2022 08:30:41 -1000
From: Tejun Heo <tj@kernel.org>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>, wsd_upstream@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
	"chris.redpath@arm.com" <chris.redpath@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Donnefort <vdonnefort@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Christian Brauner <brauner@kernel.org>, cgroups@vger.kernel.org,
	lixiong.liu@mediatek.com, wenju.xu@mediatek.com,
	Waiman Long <longman@redhat.com>
Subject: Re: BUG: HANG_DETECT waiting for migration_cpu_stop() complete
Message-ID: <YxeR0RoiTdm8sWCJ@slm.duckdns.org>
References: <88b2910181bda955ac46011b695c53f7da39ac47.camel@mediatek.com>
 <b605c3ec-94ab-a55f-5825-9b370d77ecf3@quicinc.com>
 <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203d4614c1b2a498a240ace287156e9f401d5395.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_113046_124209_9E60319D 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Hello,

(cc'ing Waiman in case he has a better idea)

On Mon, Sep 05, 2022 at 04:22:29PM +0800, Jing-Ting Wu wrote:
> https://lore.kernel.org/lkml/YvrWaml3F+x9Dk+T@slm.duckdns.org/ is for
> fix cgroup_threadgroup_rwsem <-> cpus_read_lock() deadlock.
> But this issue is cgroup_threadgroup_rwsem <-> cpuset_rwsem deadlock.

If I'm understanding what you're writing correctly, this isn't a deadlock.
The cpuset_hotplug_workfn simply isn't being woken up while holding
cpuset_rwsem and others are just waiting for that lock to be released.

Thanks.

-- 
tejun

