Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6D5C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:43:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CFF2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DWe20TGI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Q0ahj3Wt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7CFF2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PpeDEF76AipQiVCnSxj1ugHfCjxY8uJG4I5PxGeVBVg=; b=DWe20TGICa7cpqVMh2DguQB9t
	FAPx4ECT9N+CVPqFE30T4E19DaDZfg857RFel6zSx+NAZILZT22nbU2vdufuGWJbasbtvGMs8oCDM
	5heb7Q+/CRGGNWtQT6aSMNbQiR1hXe/ovzGK6ZIA1eVRre6mnmYj1b8DCMH+ey17BR49ltwYEPr2f
	V7m7QKOp3qwG/Se4ysmkwH4fMrJJSOi2sEH+W6DUqNlK3tlK8QkcKPJ+idsHsTnq+JxOOHJemRafk
	3eXBLniD/8OjI0weVMcBzcWmD9/ZqPaRqd7pmoCJC4qUavTNrRgebcIJcEsaniMwqT+r/8RU0qUuQ
	txNJcp3QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hgg-0008WI-Hu; Wed, 29 Jul 2020 08:43:46 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hgb-0008V2-7w
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 08:43:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596012223; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cIxFU1Sf6NzJjHO4VHHHl57xTd4T7Fn4JzLrmk5w8xk=;
 b=Q0ahj3Wt7O8Xwgf6A623KUA4L74WkX478XsqGxj6JtFgmuxFZsLmLzh+4rhF3l7Q3r4iMp2b
 dCjN4z/w3VuioYjN2r98UgV2GFTtaY1TR4GcIET5/1Ny+mlKoMo0UfKARRnxEieMHFtbm3KE
 Hu2AYEiA0KK57ieLyV0qa1hJ5c4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f2136b198acebb4e9ec403b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 08:43:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CCED6C433CB; Wed, 29 Jul 2020 08:43:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 988A4C433CA;
 Wed, 29 Jul 2020 08:43:27 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Jul 2020 16:43:27 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2] scsi: ufs: Fix possible infinite loop in ufshcd_hold
In-Reply-To: <20200729024037.23105-1-stanley.chu@mediatek.com>
References: <20200729024037.23105-1-stanley.chu@mediatek.com>
Message-ID: <bfbb48b06fa3464da0cbd2aee8a32649@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_044343_916433_49DBA88F 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley,

On 2020-07-29 10:40, Stanley Chu wrote:
> In ufshcd_suspend(), after clk-gating is suspended and link is set
> as Hibern8 state, ufshcd_hold() is still possibly invoked before
> ufshcd_suspend() returns. For example, MediaTek's suspend vops may
> issue UIC commands which would call ufshcd_hold() during the command
> issuing flow.
> 
> Now if UFSHCD_CAP_HIBERN8_WITH_CLK_GATING capability is enabled,
> then ufshcd_hold() may enter infinite loops because there is no
> clk-ungating work scheduled or pending. In this case, ufshcd_hold()
> shall just bypass, and keep the link as Hibern8 state.
> 

The infinite loop is expected as ufshcd_hold is called again after
link is put to hibern8 state, so in QCOM's code, we never do this.
The cap UFSHCD_CAP_HIBERN8_WITH_CLK_GATING means UIC link state
must not be HIBERN8 after ufshcd_hold(async=false) returns.

Instead of bailing out from that loop, which makes the logic of
ufshcd_hold and clk gating even more complex, how about removing
ufshcd_hold/release from ufshcd_send_uic_cmd()? I think they are
redundant and we should never send DME cmds if clocks/powers are
not ready. I mean callers should make sure they are ready to send
DME cmds (and only callers know when), but not leave that job to
ufshcd_send_uic_cmd(). It is convenient to remove ufshcd_hold/
release from ufshcd_send_uic_cmd() as there are not many places
sending DME cmds without holding the clocks, ufs_bsg.c is one.
And I have tested my idea on my setup, it worked well for me.
Another benefit is that it also allows us to use DME cmds
in clk gating/ungating contexts if we need to in the future.

Please let me know your idea, thanks.

Can Guo.

> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> 
> ---
> 
> Changes since v1:
> - Fix return value: Use unique bool variable to get the result of
> flush_work(). Thcan prevent incorrect returned value, i.e., rc, if
> flush_work() returns true
> - Fix commit message
> 
> ---
>  drivers/scsi/ufs/ufshcd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 577cc0d7487f..acba2271c5d3 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1561,6 +1561,7 @@ static void ufshcd_ungate_work(struct work_struct 
> *work)
>  int ufshcd_hold(struct ufs_hba *hba, bool async)
>  {
>  	int rc = 0;
> +	bool flush_result;
>  	unsigned long flags;
> 
>  	if (!ufshcd_is_clkgating_allowed(hba))
> @@ -1592,7 +1593,9 @@ int ufshcd_hold(struct ufs_hba *hba, bool async)
>  				break;
>  			}
>  			spin_unlock_irqrestore(hba->host->host_lock, flags);
> -			flush_work(&hba->clk_gating.ungate_work);
> +			flush_result = flush_work(&hba->clk_gating.ungate_work);
> +			if (hba->clk_gating.is_suspended && !flush_result)
> +				goto out;
>  			spin_lock_irqsave(hba->host->host_lock, flags);
>  			goto start;
>  		}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
