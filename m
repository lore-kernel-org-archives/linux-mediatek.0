Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC44C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 23:25:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0835121582
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 23:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4BY3jJh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="q7J36WgE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0835121582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OuqfhsWBezLFXTVfVnSteV5x/de7yQZ0iyxtZkifhLo=; b=t4BY3jJhkIJtBM6fPkHqu6Grv
	jjIzCe554PPu94Gs2CxYsxyjmJvNae8ghNH/52fkMGbUBTIG8pzgAaCr9iBZgfbvOkUw6+0FdQu/r
	7CzlLgHx3xGUXTOQ2qiRYpQGybgIXKkWJLF13ueg9K6gCmor048TCo8PXfhqNik5yryhwo5c6bPa3
	NS6g1aG0mp/GXIP/JIXdKhKtgMZuhbLjOEQKSqwOloZagkpXIn/StDigXgJfRlHw77etU0WcHUrhj
	X3ITAYxFjz1nkPusUIpO6BtIwN2N/V+9ZjsHh0hMKPUZI9bRxp2DRKuoptHQGsqUkP9XJ26xWDF+D
	Flh0X8osQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihMDo-0004Px-7J; Tue, 17 Dec 2019 23:25:44 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihMDe-0004Ib-0D
 for linux-mediatek@lists.infradead.org; Tue, 17 Dec 2019 23:25:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576625135; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YJEwly1+ltZDuvrkRrwDOT3yLn4EXIUPFyMApEtgGuc=;
 b=q7J36WgEzgAj5se+ZfcEZxlna3Mgt3O0wst8SGhDXO1mNo52mTP00RKmt8YZOo81afZDOKpR
 cDVxEDHNA5IRW0Oq0xleKmRtBEqBzxrgjcerffa1dak1q535CQmlrFVOrwNt5djw5NY9kidX
 dOukqxupzYvp9B9DUh+jDJGE7BM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df963ea.7f18eb62cdf8-smtp-out-n03;
 Tue, 17 Dec 2019 23:25:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8B204C4479C; Tue, 17 Dec 2019 23:25:29 +0000 (UTC)
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 480D5C433CB;
 Tue, 17 Dec 2019 23:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 480D5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 2/2] scsi: ufs: disable interrupt during clock-gating
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 pedrom.sousa@synopsys.com, jejb@linux.ibm.com, matthias.bgg@gmail.com
References: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
 <1575721321-8071-3-git-send-email-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <a36d111e-ef7f-9f9b-6f6a-692a9980103a@codeaurora.org>
Date: Tue, 17 Dec 2019 15:25:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575721321-8071-3-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_152535_354229_A49F7675 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/7/2019 4:22 AM, Stanley Chu wrote:
> Similar to suspend, ufshcd interrupt can be disabled since
> there won't be any host controller transaction expected till
> clocks ungated.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/scsi/ufs/ufshcd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index f80bd4e811cb..5de105e82c32 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1490,6 +1490,8 @@ static void ufshcd_ungate_work(struct work_struct *work)
>   	spin_unlock_irqrestore(hba->host->host_lock, flags);
>   	ufshcd_setup_clocks(hba, true);
>   
> +	ufshcd_enable_irq(hba);
> +
>   	/* Exit from hibern8 */
>   	if (ufshcd_can_hibern8_during_gating(hba)) {
>   		/* Prevent gating in this path */
> @@ -1636,6 +1638,8 @@ static void ufshcd_gate_work(struct work_struct *work)
>   		ufshcd_set_link_hibern8(hba);
>   	}
>   
> +	ufshcd_disable_irq(hba);
> +
>   	if (!ufshcd_is_link_active(hba))
>   		ufshcd_setup_clocks(hba, false);
>   	else
> 

Hi,
Does this save significant power? I see that gate/ungate of clocks 
happen far too frequently than suspend/resume.

Have you considered how much latency this would add to the 
gating/ungating path?

-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
