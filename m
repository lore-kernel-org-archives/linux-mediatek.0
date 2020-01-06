Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1EAC33C8C
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 17:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E434420731
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 17:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KoVx0hEq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lLPicAf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E434420731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fyUk+1S+ud9arPxrDTi1/23j5n6RVAd92rXG83dGZaI=; b=KoVx0hEqG/9TJgrlZkgKf9uBc
	w8qxOfzAVx42NatGggf0QelEqqF1TrVtif3ggwLKKieRFvI+usDQ6y664MfIUK9ki7o9tR6m3ARzv
	BgLPSQ2kMV/rV8JQgTN9J4eqJrRZ70OMpS6Wl4UX7bqANlh/8DdcgFfOOT+uaB2jCbhNSoraOyrHg
	GCvVAzPF4ub+erqJsiozQtnAa4zjrJWIegiqwzehb5vPHHUvwSdXrJhikYDe/lIFpshgiKk25hgLF
	7JLowpMpOuyP4tygSFiiXW8Tszb/icfGsMlnhV7y8O3iPfcsC1TpSQgDJ+6Dd9t6N+n9YfRDelPx2
	J5rBQOsLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioWGh-0007CH-Vr; Mon, 06 Jan 2020 17:34:19 +0000
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioWGZ-0006yo-Dp
 for linux-mediatek@lists.infradead.org; Mon, 06 Jan 2020 17:34:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578332050; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LtY77c4ckIl8xeGO5RUZJ/girLgK8v2bv5Hi6fr6xIs=;
 b=lLPicAf/WzfMQbZ1Ktx8CcZKyfBYLb/cwpF4SlvTbFScaS2QcZsOcRwcOb7uvPbyszARmeJa
 7IgpXhlKbE3+iJ8fQXxcbuUGYsKilEsNikncsqBzXHhCdsP3+E+UwC2ipLaSPyPUb1wWzlUb
 HQWUF5WPQqkvNVr33OErKnsDdJE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e136f8f.7f9b41984030-smtp-out-n01;
 Mon, 06 Jan 2020 17:34:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ADF46C433A2; Mon,  6 Jan 2020 17:34:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BC4CAC43383;
 Mon,  6 Jan 2020 17:34:05 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 06 Jan 2020 09:34:05 -0800
From: asutoshd@codeaurora.org
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: fix empty check of error history
In-Reply-To: <1578147968-30938-2-git-send-email-stanley.chu@mediatek.com>
References: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
 <1578147968-30938-2-git-send-email-stanley.chu@mediatek.com>
Message-ID: <926596b3823333bd8d31aed8630509de@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_093411_528056_E7513D35 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: linux-scsi-owner@vger.kernel.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-01-04 06:26, Stanley Chu wrote:
> Currently checking if an error history element is empty or
> not is by its "value". In most cases, value is error code.
> 
> However this checking is not correct because some errors or
> events do not specify any values in error history so values
> remain as 0, and this will lead to incorrect empty checking.
> 
> Fix it by checking "timestamp" instead of "value" because
> timestamp will be always assigned for all history elements
> 
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Asutosh Das <asutoshd@codeaurora.org>
> Cc: Avri Altman <avri.altman@wdc.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Bean Huo <beanhuo@micron.com>
> Cc: Can Guo <cang@codeaurora.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 1b97f2dc0b63..bae43da00bb6 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -385,7 +385,7 @@ static void ufshcd_print_err_hist(struct ufs_hba 
> *hba,
>  	for (i = 0; i < UFS_ERR_REG_HIST_LENGTH; i++) {
>  		int p = (i + err_hist->pos) % UFS_ERR_REG_HIST_LENGTH;
> 
> -		if (err_hist->reg[p] == 0)
> +		if (err_hist->tstamp[p] == 0)
>  			continue;
>  		dev_err(hba->dev, "%s[%d] = 0x%x at %lld us\n", err_name, p,
>  			err_hist->reg[p], ktime_to_us(err_hist->tstamp[p]));

Looks good to me.

Reviewed by:- Asutosh Das <asutoshd@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
