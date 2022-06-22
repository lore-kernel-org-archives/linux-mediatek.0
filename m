Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEvyHC/V3o+KcdfeT4iOEKnwu5y44NftQ4d5zwCT9TE=; b=3j3bZE0LDCFDRZ38huNFNJNn3f
	u86jhCE4OhY4sZXC6FK2I56zzaq63Na+QerCRIjn3PoUZkpQIfvTiY7kkuhKoFOt9fsCzxi+gAOh4
	5AcWZeGm6GyXyv7aXcbuAta7cBzaRcEj82QED37nLqT25xOCAaOXd3Aw2YL1LbCV4Bm6HkCyA9ls2
	FlvsIeUDBwHAxh7oyrshVLGmyZRvFOEjvZQc2wrpMUrScrTkkeM9LyizdaBvHEk3udCc38KBRmfhj
	50DsBzRBa1fZhMidDdTPjMvdlefCq/Y+GtFhNrXY6CcRlPsNUjn/2KvOeAJi9mUzU0J+z3I0PxT0k
	WNMtskeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4360-00BT9T-De; Wed, 22 Jun 2022 16:20:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42gg-00BIQd-FT; Wed, 22 Jun 2022 15:54:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2888712FC;
	Wed, 22 Jun 2022 08:54:37 -0700 (PDT)
Received: from bogus (unknown [10.57.36.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15B53F792;
	Wed, 22 Jun 2022 08:54:33 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:53:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
	viresh.kumar@linaro.org, rafael@kernel.org,
	dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
	cristian.marussi@arm.com, matthias.bgg@gmail.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] firmware: arm_scmi: Get detailed power scale from
 perf
Message-ID: <20220622155322.g2idz2623nxi6mu3@bogus>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <20220622145802.13032-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622145802.13032-4-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_085438_650201_FFE6F0B1 
X-CRM114-Status: UNSURE (   7.85  )
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

On Wed, Jun 22, 2022 at 03:58:01PM +0100, Lukasz Luba wrote:
> In SCMI v3.1 the power scale can be in micro-Watts. The upper layers, e.g.
> cpufreq and EM should handle received power values properly (upscale when
> needed). Thus, provide an interface which allows to check what is the
> scale for power values. The old interface allowed to distinguish between
> bogo-Watts and milli-Watts only (which was good for older SCMI spec).
>

Assuming you will take this as a series,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

