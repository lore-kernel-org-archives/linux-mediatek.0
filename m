Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522BC001DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQv5+yIZVakzuHno7wUJ8e8AF9x2EyNJ9PHEkvSUu7Q=; b=fqF8Bfx5I+Uf279I1CYZs/ok3O
	4QkydY1qWV8ckrFgi48Vz1qLBo5TRn4mcb6XVc5uz8Ry6pDhNs4LjMkuogodJpoSy7w5vmV8W1uRW
	9GVffEWRP48iiO8q/1hRpzKbTL4dcYu/Y1w8/MWHkfmtUATqo89WpsgKf8to00jEdduVEAB9DFCMq
	zlYW3P3Pq6wE1U7YE0fkEXqGpBHq/OQcbLojpJ69zbZ/Er+LpI+IdRMTHFcdKnftBy3vhHVHq0aqF
	lQl1MJNtEoirg6RUiTOHk87q/kzMD6yCslGo1GGMjNRjLGOHuBYRqeHDEftkB8hEhpUgEu+3f/y7f
	fnkzrBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwGY-003Oox-2y;
	Thu, 13 Jul 2023 13:21:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwGR-003Okp-1M;
	Thu, 13 Jul 2023 13:21:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 943C01570;
	Thu, 13 Jul 2023 06:22:26 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3EDF3F73F;
	Thu, 13 Jul 2023 06:21:42 -0700 (PDT)
Date: Thu, 13 Jul 2023 14:21:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: stanley.chu@mediatek.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Remove surplus dev_err()
Message-ID: <20230713132140.azamscgceh6yyy6j@bogus>
References: <20230712064832.44188-1-yang.lee@linux.alibaba.com>
 <20230713131123.uo5ofltbhvktkevd@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713131123.uo5ofltbhvktkevd@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_062147_503568_E2D511CA 
X-CRM114-Status: GOOD (  12.73  )
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

On Thu, Jul 13, 2023 at 02:11:23PM +0100, Sudeep Holla wrote:
> On Wed, Jul 12, 2023 at 02:48:32PM +0800, Yang Li wrote:
> > There is no need to call the dev_err() function directly to print a
> > custom message when handling an error from either the platform_get_irq()
> > or platform_get_irq_byname() functions as both are going to display an
> > appropriate error message in case of a failure.
> > 
> > ./drivers/ufs/host/ufs-mediatek.c:864:3-10: line 864 is redundant because platform_get_irq() already prints an error
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5846
> 
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> 

Sorry for this, I didn't mean to ack this patch, no idea how on earth I
managed to do that (must be some wrong key combination in my email client)
but I wanted and meant to ack only this [1]. Sorry for the noise.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/r/20230712062853.11007-9-frank.li@vivo.com

