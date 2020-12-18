Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531A6C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:21:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D404820793
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D404820793
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V4W31ZQ8sOH7xAbLfjAEZLqNYQ9kQ0jZDe7IP6I/FRg=; b=lH2+/iTtgl+rhjY+Uyg8dM1HG
	WUNqZX5WLQnobGrw+ZtRjtW7YRmL/bEXcNCvc3JUqYhTicm66jPT6MnlvUWeJbClc3QDniIKQQxRL
	nEOfRrKQdVw8x3QFSxUqbKT+E9ixR9GSVohj8NQYymTq77sGzKYd1n6zZxSIvbMsGBCPoMYSMSXe3
	FwkTGovVCxxQV5uwfhk55WDm7+uxXrLH05yMhEBTnMsS6+nyfVHXCsln8zm+kViwuaYuOb33tkwKg
	T/9xlM704y4lGJMJGjEiBZ/E2wiaBJXbgfxI6/mLn4/Cz9P+2SXo91lM7+1/HKdNQgeLzi4nF7yb8
	m4ZAVxcPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq98H-0006wM-JE; Fri, 18 Dec 2020 06:20:53 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq98D-0006w1-SY
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:20:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608272451; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3I0o3xJ2Hiy9cLv5QyzG4KVqp5WoYuUKcUvkm17bXjI=;
 b=Yc21zslNY/94xrNSZyJx2JzQNX3DYHgVcJdUuIUottcEopESYx+VrG+6Qb8Hlp3Icw6m+Q29
 e4LOQEh+kgiOtQoh7QC/kWlkLR+NU+Mm83zujiHXUe72ba0+QfDooer4IH20StX5sQ2BYKmV
 akC7glZudKX85SLmDtrYxRS86y4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fdc4a3e031793dcb4f23d41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:20:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8ECA1C433C6; Fri, 18 Dec 2020 06:20:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CEDE5C433CA;
 Fri, 18 Dec 2020 06:20:45 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:20:45 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 0/4] scsi: ufs: Cleanup and refactor clock scaling
In-Reply-To: <20201216131639.4128-1-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
Message-ID: <e939a0fd4afd1691f3e1a8182515ca64@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_012051_460618_4680182A 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 21:16, Stanley Chu wrote:
> Hi,
> This series cleans up and refactors clk-scaling feature, and shall not
> change any functionality.
> 
> This series is based on Can's series "Three changes related with UFS
> clock scaling" in 5.10/scsi-fixes branch in Martin's tree.
> 

Hi Stanley,

Thanks for noticing my changes, will you review them?
I see customers manipulte UFS scaling related sysfs
nodes more often than before, so we may want to fix it asap.

Regards,

Can Guo.

> However this series may not be required to be merged to 5.10. The
> choice of base branch is simply making these patches easy to be
> reviewed because this series is based on clk-scaling fixes by Can. If
> this series is decided not being merged to 5.10, then I would rebase
> it to 5.11/scsi-queue.
> 
> Changes since v1:
>   - Refactor ufshcd_clk_scaling_suspend() in patch [3/4]
>   - Change function name from ufshcd_clk_scaling_pm() to
> ufshcd_clk_scaling_suspend() in patch [3/4]
>   - Refine patch titles
> 
> Stanley Chu (4):
>   scsi: ufs: Refactor cancelling clkscaling works
>   scsi: ufs: Remove redundant null checking of devfreq instance
>   scsi: ufs: Cleanup and refactor clk-scaling feature
>   scsi: ufs: Fix build warning by incorrect function description
> 
>  drivers/scsi/ufs/ufshcd.c | 90 +++++++++++++++++++--------------------
>  1 file changed, 43 insertions(+), 47 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
