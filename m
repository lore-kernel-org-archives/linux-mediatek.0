Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C0CC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A71023405
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A71023405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A6nuIRTCCtRiq37tiScAT+l9NDqTt9XiaUemPiBocRw=; b=kp+Z8J4ZPJ/1eRvsc/511AVeQ
	BpzDIdTkYVSJV8vRoVQQ4USSGDkmEkMuN0d9oaH3aHi7QZcnuEQVFJv9nUb90MvvZhc6hhrzyNRhX
	umBr0WZduE79bFozigFP6ym1IupiCV3KMb5nNW1a+fHwifwCAEQgStS6FG2x5Sk0BPu8mASXK5VuZ
	FXxp11x8U2Er1P73H64uXupyfCF/3xvUDElomWcCUP56UOdWpx8sHa2tF8EIgP9JuwxPGdm93p1DF
	21ztDpW6b9tkv/hRm54cXH3NqkizVZza/0GPga0lWP7XKooEiPr/ZODcysZzzIkSFG05ujK9pnrpp
	fRqAZllXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq9HV-0007ft-GM; Fri, 18 Dec 2020 06:30:25 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq9HQ-0007fP-I8
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:30:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608273022; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f/emvhlPCHn+Sh53iWp8Ew1VVewyQayEPXGejZeXtsk=;
 b=D4j686SS2svMMpVgyLhfTNmq5jET2FbDnt7nv2248uIgYyHbO/eQKp5j+MQEXwtw85ey0lZh
 /cVFduQ1Y7JZWthkERI6ebaqgNGqBgbyLCo01WtekDgYiaz+11D32AtVEFS6xC14TekX/W+4
 Hsfd/Dd9WT/JAIKMo0960PCjvcM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fdc4c7293a3d2b1cdcef98e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:30:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2A6CEC433ED; Fri, 18 Dec 2020 06:30:10 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BA43C433C6;
 Fri, 18 Dec 2020 06:30:08 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:30:08 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 0/4] scsi: ufs: Cleanup and refactor clock scaling
In-Reply-To: <1608272678.10163.40.camel@mtkswgap22>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <e939a0fd4afd1691f3e1a8182515ca64@codeaurora.org>
 <1608272678.10163.40.camel@mtkswgap22>
Message-ID: <ee0f3ffc6d86098fc5704c1726fc69f3@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_013023_167047_A207F3CD 
X-CRM114-Status: GOOD (  22.61  )
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

On 2020-12-18 14:24, Stanley Chu wrote:
> Hi Can,
> 
> On Fri, 2020-12-18 at 14:20 +0800, Can Guo wrote:
>> On 2020-12-16 21:16, Stanley Chu wrote:
>> > Hi,
>> > This series cleans up and refactors clk-scaling feature, and shall not
>> > change any functionality.
>> >
>> > This series is based on Can's series "Three changes related with UFS
>> > clock scaling" in 5.10/scsi-fixes branch in Martin's tree.
>> >
>> 
>> Hi Stanley,
>> 
>> Thanks for noticing my changes, will you review them?
>> I see customers manipulte UFS scaling related sysfs
>> nodes more often than before, so we may want to fix it asap.
> 
> I have gave my review tag in all patches in this series : )
> 
> Thanks,
> Stanley Chu
> 

Hi Stanley,

oops, just saw it - I opened the wrong series.
I will push a new version which incorporates your comments soon.
Since the new changes would only be some words in ufshcd.h, so you
won't need to rebase.

Thanks,

Can Guo.

>> 
>> Regards,
>> 
>> Can Guo.
>> 
>> > However this series may not be required to be merged to 5.10. The
>> > choice of base branch is simply making these patches easy to be
>> > reviewed because this series is based on clk-scaling fixes by Can. If
>> > this series is decided not being merged to 5.10, then I would rebase
>> > it to 5.11/scsi-queue.
>> >
>> > Changes since v1:
>> >   - Refactor ufshcd_clk_scaling_suspend() in patch [3/4]
>> >   - Change function name from ufshcd_clk_scaling_pm() to
>> > ufshcd_clk_scaling_suspend() in patch [3/4]
>> >   - Refine patch titles
>> >
>> > Stanley Chu (4):
>> >   scsi: ufs: Refactor cancelling clkscaling works
>> >   scsi: ufs: Remove redundant null checking of devfreq instance
>> >   scsi: ufs: Cleanup and refactor clk-scaling feature
>> >   scsi: ufs: Fix build warning by incorrect function description
>> >
>> >  drivers/scsi/ufs/ufshcd.c | 90 +++++++++++++++++++--------------------
>> >  1 file changed, 43 insertions(+), 47 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
