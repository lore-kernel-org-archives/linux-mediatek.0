Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D672C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B081D2151B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B081D2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3WogARFKfEm94rplT4pdT9DjsQVXQGsJqgE56BKog8Y=; b=bOIv/nb+mrWtHic602IFjtyfH
	RtiLA81cmDZ6QOOkrOaoGlLqQnTxJpC/RwBJx6mx4/CJHxnDoawXYurdpIMzhMrCyw6GMgsr9qBAk
	ws0EI9NFeEg4whYjn8YCRFo4rXdgd9Y8dFTI+J+hLG7TzpfhImk0P7xsCOAteolKDKZsHbGszlUha
	tz4dugRcpIMJ6+L229QS1YcBLjQePeQLet+96dKMfkBKF8V1zRIAeLs6F1nk/xUYNcxRBmtNQOTVp
	I7pBJWznGW3T/07eqdTmCuyO8u5n0ca9kXu6xcOWmQi4VMxYms7Lyff+pCRQhEe1/yFuQ3AqA1Kta
	D1cU8NMzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq94E-0006jm-TV; Fri, 18 Dec 2020 06:16:42 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq94D-0006jD-2w
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:16:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608272201; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9s16Fx+eSayOPAeY7YlBM42jsEYbvw5opfyr9V59Zhk=;
 b=nMAVDbr1OfDTOLi7BNsh0EjKXnatEBoTCz78snKCIil+hIRe1NzrWGy8UK8V+Y+vTeLWVNhe
 +5NPaPOIx9+k+7xEgOoYGQ2EzZa+cj4BJYi228uBu5da39NeZD3t6QXy6Ww7zyFGlkEB69xh
 AC8Nopncy1AjbG6OtZLLstDJnT8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fdc4947944e4d2447c5f049 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:16:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 100B1C433ED; Fri, 18 Dec 2020 06:16:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 509C2C433CA;
 Fri, 18 Dec 2020 06:16:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:16:38 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 4/4] scsi: ufs: Fix build warning by incorrect function
 description
In-Reply-To: <20201216131639.4128-5-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <20201216131639.4128-5-stanley.chu@mediatek.com>
Message-ID: <57e1d462ae012108080dd16f967d5e42@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_011641_328649_762508B2 
X-CRM114-Status: GOOD (  16.61  )
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
> Fix build warnings as below due to incorrect function description
> of ufshcd_try_to_abort_task().
> 
> ufshcd.c:6651: warning: Function parameter or member 'hba' not
> described in 'ufshcd_try_to_abort_task'
> ufshcd.c:6651: warning: Function parameter or member 'tag' not
> described in 'ufshcd_try_to_abort_task'
> ufshcd.c:6651: warning: Excess function parameter 'cmd' description in
> 'ufshcd_try_to_abort_task'
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index ce0528f2e2ed..79287fdd049b 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6652,7 +6652,8 @@ static void ufshcd_set_req_abort_skip(struct
> ufs_hba *hba, unsigned long bitmap)
> 
>  /**
>   * ufshcd_try_to_abort_task - abort a specific task
> - * @cmd: SCSI command pointer
> + * @hba: per adapter instance
> + * @tag: position of the bit to be aborted
>   *
>   * Abort the pending command in device by sending UFS_ABORT_TASK task
> management
>   * command, and in host controller by clearing the door-bell
> register. There can

Thanks for the fix.

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
