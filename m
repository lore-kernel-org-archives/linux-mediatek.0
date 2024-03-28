Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF9FCD1283
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdxd4yA1iOItAik8lIBneAxWZtJ8/8FIdec+MTmzTBo=; b=0v7qcP+CqWrDwhrbykRXmqRMMV
	SKH2GdkyE6QNiXawD7WyRu5y/HE6E8VxBi+b8AaJjPRJqTxSdbxN8CJCzAdzzjPc9DCyFAY5aFxg3
	EQItYwGOzj7RDKxq2zDl8F0lC+lhaBshV0xUqW79i1TI0p8mRbGvNxT2aXsqjLblMEtWahzdMvNJl
	IzLSk/PkFBOyTUOzjEAo+boPEyJ+3YN4KvBcXFKo8Hzk1k2Yl3BxK/r6BnfpJNS/Bc0PLEhtutUQt
	0Pa024hH4OcbZXod0Kz6YSggnc4Axq6MHbUGx9JDFUbzPuei88Ml904c7NbQ8n2tm6ZR1euLKNKqa
	ZBoNU37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptbq-0000000EzNh-08Jn;
	Thu, 28 Mar 2024 17:32:14 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptbm-0000000EzL2-4Aen
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 17:32:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4V59Zp6sd8z6Cnk8t;
	Thu, 28 Mar 2024 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1711647116; x=1714239117; bh=Mdxd4yA1iOItAik8lIBneAxW
	ZtJ8/8FIdec+MTmzTBo=; b=UMdCXKw1maU12bphPks3/jsKZXUrPr+Br64eq/In
	YlBgS1n+q5JfdFea9QKMK9JeLUcWypv2NBg7Q8g4x7Ftr2rzELCPAmcFHVlHZXkg
	m/5UBqaHZ/u9YKyog8gVdSVq3r7Q4GAAeDMRlyzPLg9PhGxAJIdkCdZZU6CHVz5P
	uFyeeJ0O5cv3LV4ubFqBQfY/j5fbnkYZZKHORrM9fFZXqiqK0zV6jGCQgam1UXOi
	mkzrtwaEsMyazeTpqZvZR7LCyPQ2hxXwUv/v/bxnNGQs6eypDcsETSBn0lNvg9zl
	HLVMFGaD7pF9yqJPIMJEQGviQ3f1b+0M+tWcdoX4hgiHDQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HE6PiFj-vzbY; Thu, 28 Mar 2024 17:31:56 +0000 (UTC)
Received: from [100.96.154.173] (unknown [104.132.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4V59ZZ3TMSz6Cnk8m;
	Thu, 28 Mar 2024 17:31:50 +0000 (UTC)
Message-ID: <bd8ca5a8-2875-452b-ae99-26eeca15ce13@acm.org>
Date: Thu, 28 Mar 2024 10:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: wlun suspend dev/link state error recovery
Content-Language: en-US
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240328104707.1452-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240328104707.1452-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103211_059194_3221E005 
X-CRM114-Status: GOOD (  11.73  )
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

On 3/28/24 03:47, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index e30fd125988d..0a32f423f6a0 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9791,7 +9791,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   
>   	/* UFS device & link must be active before we enter in this function */
>   	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
> -		ret = -EINVAL;
> +		/*  Wait err handler finish or tirgger err recovery in this case */
> +		if (!ufshcd_eh_in_progress(hba))
> +			ufshcd_force_error_recovery(hba);
> +		ret = -EBUSY;
>   		goto enable_scaling;
>   	}

Please fix the spelling in the above source code comment ("tirgger").

Thanks,

Bart.



