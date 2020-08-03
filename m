Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5472C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 09:45:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F6420722
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 09:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aB1KUaPk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dAaHRELa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F6420722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sO4Jv7oKrPV36u5cXEVeI+Wyj9xsqBbKSqC0OQ4tyNE=; b=aB1KUaPkocGHdFLzJbyumtfgp
	Fm9b4zexjNiVb4qXoIiHbT4gzRa6FDK9SsaK7wjFfGKUQSI3rt+2IzTcWKOuSw+Ju2AVusZyRWXuH
	XWPQuEtgaBnZS9v6wNsi0kc7I+o+/S2mHIeqH25rtlnjagpaauFbxgt1fdMDtoU3FnFcCYVmlESCl
	5CeIzwO+iJTNYmIXf9qh0w5nAlnfPIqln4aiJdCt3SXO3bwMyuC5yCnbDtpmGvifE/KfPMeBkV/94
	grRFUE20YtU9NS5YrDX5T/PRlRfg4qTgd03v7lAL7pgfITV/XHvL0izs7hwAA5Ms+5LQaPHhcyOAo
	5pI3nyQiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2X1S-00014o-Sf; Mon, 03 Aug 2020 09:44:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2X15-0000oT-9U; Mon, 03 Aug 2020 09:44:25 +0000
X-UUID: 159649abaec74751ae58fdfb89706413-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZhKk3+aYfBtmyDfjmtzRdC9n/uCOzIpf/GjJwiyB4Og=; 
 b=dAaHRELah656k8mrFCHfIOihZ5+eBWflnkiktZdcDtNO+x/0h7R+gzMEyhQleGlB4XIhuxUMxJTZMXOxC1Hpm00CQst2EuxseGTHesvJ0uK8waLOXZbXikTFlD9os4UmsNevcFm33nCXMclVjk/c2sFB0dnT+WLlqN2KwuUV7ik=;
X-UUID: 159649abaec74751ae58fdfb89706413-20200803
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1465528572; Mon, 03 Aug 2020 01:44:12 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 02:44:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Aug 2020 17:44:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 17:44:15 +0800
Message-ID: <1596447857.32283.24.camel@mtkswgap22>
Subject: Re: [PATCH v9 9/9] scsi: ufs: Properly release resources if a task
 is aborted successfully
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 3 Aug 2020 17:44:17 +0800
In-Reply-To: <1596445485-19834-10-git-send-email-cang@codeaurora.org>
References: <1596445485-19834-1-git-send-email-cang@codeaurora.org>
 <1596445485-19834-10-git-send-email-cang@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_054423_698147_6C5C9460 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek
 SoC   support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 kernel-team@android.com, Bart Van Assche <bvanassche@acm.org>,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 02:04 -0700, Can Guo wrote:
> In current UFS task abort hook, namely ufshcd_abort(), if a task is
> aborted successfully, clock scaling busy time statistics is not updated
> and, most important, clk_gating.active_reqs is not decreased, which makes
> clk_gating.active_reqs stay above zero forever, thus clock gating would
> never happen. To fix it, instead of releasing resources "mannually", use
> the existing func __ufshcd_transfer_req_compl(). This can also eliminate
> racing of scsi_dma_unmap() from the real completion in IRQ handler path.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> CC: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index d7d2758..9a48389 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6635,11 +6635,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  		goto out;
>  	}
>  
> -	scsi_dma_unmap(cmd);
> -
>  	spin_lock_irqsave(host->host_lock, flags);
> -	ufshcd_outstanding_req_clear(hba, tag);
> -	hba->lrb[tag].cmd = NULL;
> +	__ufshcd_transfer_req_compl(hba, (1UL << tag));
>  	spin_unlock_irqrestore(host->host_lock, flags);
>  
>  out:

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
