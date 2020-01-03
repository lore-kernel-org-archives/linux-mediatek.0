Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7F2C3276C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 01:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F3982084D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 01:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Go6NDLsD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Y03M3PXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F3982084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6vYXimp5jmEuC0QSABqpv61PyFXwLN1mDOUiY2XjOrY=; b=Go6NDLsDz+nY+s9VRip+w+pgJ
	OWxXGnVw0Kaf/O3pi6mu4mwIfTJ7aqIoYITM8ro2IWHbtuVdEpTuGh9Rag5jqA7ROTmFDLwYiNtNJ
	XKdO3uI9USKfrlpAz+cWqM1YsT7bXTJ6+3GTEJUZIzQDgeqbgvKojcYRf2UWs31fz3IJYXK5UZzC0
	aao1zd6Cve/5JNk7ZbPIsKpKAjFfpKhA85GzMJ4cg6YBTfw1O7hfMSA5yzcY/LywExTijIG9UJZ+/
	5C/e5U9JkAOrXc0ONbx1bLxMIwWgdLpKmsWtqoFabEeJA1kuvIGfafLUWkoyB9vVvs2JdMIzE4BZR
	WZR0kOM+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inC8N-00084n-Dc; Fri, 03 Jan 2020 01:52:15 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inC8G-0007yH-87
 for linux-mediatek@lists.infradead.org; Fri, 03 Jan 2020 01:52:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578016326; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iBGH70qouVE4uKPgzHJQRb9IHWifgoN13TEvuu1+Ybs=;
 b=Y03M3PXdQl+PkvGwHQW2huTZLiAD33KEZJfcXVDkejZReOy6MPupr8zQ/QeII4UCWz/DaVi6
 cWSbd2ezJqIPvBxYx0kDvaeM0GNSoyebmZgBWFrV5coiIBHRARjbQ58qEVabRBsYpwA0GZNQ
 MxCaT6TGggfZsZuAm4M54Amh9zU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0e9e43.7faf3046a490-smtp-out-n01;
 Fri, 03 Jan 2020 01:52:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05AABC447A2; Fri,  3 Jan 2020 01:52:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E401FC43383;
 Fri,  3 Jan 2020 01:51:59 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 03 Jan 2020 09:51:59 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: set device as default active power mode
 during initialization only
In-Reply-To: <1577947124.13164.75.camel@mtkswgap22>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
 <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
 <fd129b859c013852bd80f60a36425757@codeaurora.org>
 <1577754469.13164.5.camel@mtkswgap22>
 <836772092daffd8283a97d633e59fc34@codeaurora.org>
 <1577766179.13164.24.camel@mtkswgap22>
 <1577778290.13164.45.camel@mtkswgap22>
 <44393ed9ff3ba9878bae838307e7eec0@codeaurora.org>
 <1577947124.13164.75.camel@mtkswgap22>
Message-ID: <4888afd46a9065b7f298a5de039426c9@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_175208_351847_CF8215DB 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 ron.hsu@mediatek.com, avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 linux-scsi-owner@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, martin.petersen@oracle.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, subhashj@codeaurora.org, pedrom.sousa@synopsys.com,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-01-02 14:38, Stanley Chu wrote:
> Hi Can,
> 
> On Tue, 2019-12-31 at 16:35 +0800, Can Guo wrote:
> 
>> Hi Stanley,
>> 
>> I missed this mail before I hit send. In current code, as per my
>> understanding,
>> UFS device's power state should be Active after ufshcd_link_startup()
>> returns.
>> If I am wrong, please feel free to correct me.
>> 
> 
> Yes, this assumption of ufshcd_probe_hba() is true so I will drop this
> patch.
> Thanks for remind.
> 
>> Due to you are almost trying to revert commit 7caf489b99a42a, I am 
>> just
>> wondering
>> if you encounter failure/error caused by it.
> 
> Yes, we actually have some doubts from the commit message of "scsi: 
> ufs:
> issue link startup 2 times if device isn't active"
> 
> If we configured system suspend as device=PowerDown/Link=LinkDown mode,
> during resume, the 1st link startup will be successful, and after that
> device could be accessed normally so it shall be already in Active 
> power
> mode. We did not find devices which need twice linkup for normal work.
> 
> And because the 1st linkup is OK, the forced 2nd linkup by commit 
> "scsi:
> ufs: issue link startup 2 times if device isn't active" leads to link
> lost and finally the 3rd linkup is made again by retry mechanism in
> ufshcd_link_startup() and be successful. So a linkup performance issue
> is introduced here: We actually need one-time linkup only but finally
> got 3 linkup operations.
> 
> According to the UFS spec, all reset types (including POR and Host
> UniPro Warm Reset which both may happen in above configurations) other
> than LU reset, UFS device power mode shall return to Sleep mode or
> Active mode depending on bInitPowerMode, by default, it's Active mode.
> 
> So we are curious that why enforcing twice linkup is necessary here?
> Could you kindly help us clarify this?
> 
> If anything wrong in above description, please feel free to correct me.
> 

Hi Stanley,

Above description is correct. The reason why the UFS device becomes
Active after the 1st link startup in your experiment is due to you
set spm_lvl to 5, during system suspend, UFS device is powered down.
When resume kicks start, the UFS device is power cycled once.

Moreover, if you set rpm_lvl to 5, during runtime suspend, if bkops is
enabled, the UFS device will not be powered off, meaning when runtime
resume kicks start, the UFS device is not power cycled, in this case,
we need 3 times of link startup.

Does above explain?

Thanks,

Can Guo.

>> 
>> Happy new year to you too!
>> 
>> Thanks,
>> 
>> Can Guo
> 
> Thanks,
> 
> Stanley
> 
>> 
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
