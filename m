Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D445AC63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:02:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5500E20725
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ky2yhyH7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="BWuU4fKt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5500E20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B7QtYimo436a+ov5WTkpFnVRNDkGbAEjJ0Wf8IrrCkg=; b=Ky2yhyH7NE5ctMYgcVzF04OkH
	CHl17PnoKMEcxC2n3MMgQEO6xVT+2DACWGcyctDPgmvNDaNjrm4IudC4P0arzhHrpT/9Z0LNxKMfI
	Vs8gS9avf+kbGkH0kpf3BpKI48jabuQkieNf/qP9H2iJYxGkVdRktHWrNwEWflK1atEPitxmizYO2
	PyaEuPH3o+JifdK3gTDUkQGZRu0Q/BGEjZ34TUTRpUZJDISKFrlDm7r7EPPEa76RrW9V6GW6gemqg
	7bz1U4mdkvZ/bvkXUa89ZRoXUWkSEvjsXuneefsxW0/sdqbz2GRwPZPw64Z6uNABKf8+sHk8wUNic
	1xE3Q65iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsBO-0007lv-Td; Mon, 30 Nov 2020 23:02:10 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsBM-0007lW-5X
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 23:02:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606777325; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EISVAw61BH5Re+I7UyxCOWU0E6/dUFfyNJ18uYJF/MU=;
 b=BWuU4fKtKfDk6ryn0zNnfdLuyKL0tnITh8CRQ8MUulqTAICEnoEuTVVib9C4CbYtYkLBExpN
 brItOHH9qIctdsVM5kkdSjDuEuBtWmywAOcS0O9enez6qn5o/BurAnMJl0kcFM59xtULG9pe
 SLAV7wUNcIbMJrvhqyBagny9aA8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fc579eb1f6054cb8d60bc34 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 23:02:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 56C4BC43468; Mon, 30 Nov 2020 23:02:02 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 542FCC433ED;
 Mon, 30 Nov 2020 23:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 542FCC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v3 1/2] scsi: ufs: Refactor ufshcd_setup_clocks() to
 remove skip_ref_clk
To: Can Guo <cang@codeaurora.org>, nguyenb@codeaurora.org,
 hongwus@codeaurora.org, ziqichen@codeaurora.org, rnayak@codeaurora.org,
 linux-scsi@vger.kernel.org, kernel-team@android.com, saravanak@google.com,
 salyzyn@google.com
References: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
 <1606356063-38380-2-git-send-email-cang@codeaurora.org>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <f99ee6cd-6e09-4160-f9e8-2d8b04cbfa1e@codeaurora.org>
Date: Mon, 30 Nov 2020 15:01:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1606356063-38380-2-git-send-email-cang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_180208_842606_D9B26CBF 
X-CRM114-Status: GOOD (  32.23  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/25/2020 6:01 PM, Can Guo wrote:
> Remove the param skip_ref_clk from __ufshcd_setup_clocks(), but keep a flag
> in struct ufs_clk_info to tell whether a clock can be disabled or not while
> the link is active.
> 
> Reviewed-by: Hongwu Su<hongwus@codeaurora.org>
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>   drivers/scsi/ufs/ufshcd-pltfrm.c |  2 ++
>   drivers/scsi/ufs/ufshcd.c        | 29 +++++++++--------------------
>   drivers/scsi/ufs/ufshcd.h        |  3 +++
>   3 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> index 3db0af6..873ef14 100644
> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> @@ -92,6 +92,8 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
>   		clki->min_freq = clkfreq[i];
>   		clki->max_freq = clkfreq[i+1];
>   		clki->name = kstrdup(name, GFP_KERNEL);
> +		if (!strcmp(name, "ref_clk"))
> +			clki->keep_link_active = true;
>   		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table-hz",
>   				clki->min_freq, clki->max_freq, clki->name);
>   		list_add_tail(&clki->list, &hba->clk_list_head);
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index a7857f6..44254c9 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -221,8 +221,6 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd);
>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag);
>   static void ufshcd_hba_exit(struct ufs_hba *hba);
>   static int ufshcd_probe_hba(struct ufs_hba *hba, bool async);
> -static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
> -				 bool skip_ref_clk);
>   static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on);
>   static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
>   static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);
> @@ -1707,11 +1705,7 @@ static void ufshcd_gate_work(struct work_struct *work)
>   
>   	ufshcd_disable_irq(hba);
>   
> -	if (!ufshcd_is_link_active(hba))
> -		ufshcd_setup_clocks(hba, false);
> -	else
> -		/* If link is active, device ref_clk can't be switched off */
> -		__ufshcd_setup_clocks(hba, false, true);
> +	ufshcd_setup_clocks(hba, false);
>   
>   	/*
>   	 * In case you are here to cancel this work the gating state
> @@ -7990,8 +7984,7 @@ static int ufshcd_init_hba_vreg(struct ufs_hba *hba)
>   	return 0;
>   }
>   
> -static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
> -					bool skip_ref_clk)
> +static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
>   {
>   	int ret = 0;
>   	struct ufs_clk_info *clki;
> @@ -8009,7 +8002,12 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
>   
>   	list_for_each_entry(clki, head, list) {
>   		if (!IS_ERR_OR_NULL(clki->clk)) {
> -			if (skip_ref_clk && !strcmp(clki->name, "ref_clk"))
> +			/*
> +			 * Don't disable clocks which are needed
> +			 * to keep the link active.
> +			 */
> +			if (ufshcd_is_link_active(hba) &&
> +			    clki->keep_link_active)
>   				continue;
>   
>   			clk_state_changed = on ^ clki->enabled;
> @@ -8054,11 +8052,6 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
>   	return ret;
>   }
>   
> -static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
> -{
> -	return  __ufshcd_setup_clocks(hba, on, false);
> -}
> -
>   static int ufshcd_init_clocks(struct ufs_hba *hba)
>   {
>   	int ret = 0;
> @@ -8577,11 +8570,7 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   	 */
>   	ufshcd_disable_irq(hba);
>   
> -	if (!ufshcd_is_link_active(hba))
> -		ufshcd_setup_clocks(hba, false);
> -	else
> -		/* If link is active, device ref_clk can't be switched off */
> -		__ufshcd_setup_clocks(hba, false, true);
> +	ufshcd_setup_clocks(hba, false);
>   
>   	if (ufshcd_is_clkgating_allowed(hba)) {
>   		hba->clk_gating.state = CLKS_OFF;
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 66e5338..6f0f2d4 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -229,6 +229,8 @@ struct ufs_dev_cmd {
>    * @max_freq: maximum frequency supported by the clock
>    * @min_freq: min frequency that can be used for clock scaling
>    * @curr_freq: indicates the current frequency that it is set to
> + * @keep_link_active: indicates that the clk should not be disabled if
> +		      link is active
>    * @enabled: variable to check against multiple enable/disable
>    */
>   struct ufs_clk_info {
> @@ -238,6 +240,7 @@ struct ufs_clk_info {
>   	u32 max_freq;
>   	u32 min_freq;
>   	u32 curr_freq;
> +	bool keep_link_active;

Nitpick - How about 'always-on' instead of 'keep_link_active'?
>   	bool enabled;
>   };
>   
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
