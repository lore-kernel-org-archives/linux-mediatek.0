Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D5CE7A9C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ms+6UcbvTIwIRzvwY9hIW9x1xlszuFEBvaySzIyYSw=; b=J1+CSVZnbv3i8CkyEmJQOJdsaK
	DfZZjU5aN3pfRgVReOzOr9p8OhWeJdCsZeLbeTENYVlJIRLOHvjR2daaSWwAfqmlilJ+cL5z8WVkp
	QN4Hhzc51+dJN6Ym5UycU+AHl5Np+ReQPRB62Nb15R3koZn3lJeK6BqEPMX/wHQv02atXuhbYhqaC
	KwpBs6pUI2qZBVvhX2bNwLCPmm6xoEfGgR1tkgiGyGJWaypvMtjsBH1ExoF/cL8eFXHCE1p7ZkfJq
	6bCuYbo6EDAPDaPWPA5ZHMakuKYks+zdIJWG7dBy6Yqson6+hgwmRCTL4ZqZiR0Y56/H8nFguqNE3
	OsTjlJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJgt-00000009q0y-19yy;
	Thu, 05 Sep 2024 21:06:55 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smJgr-00000009q0Y-00D8
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 21:06:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X0BkN38PDz6ClY8w;
	Thu,  5 Sep 2024 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725570404; x=1728162405; bh=/ms+6UcbvTIwIRzvwY9hIW9x
	1xlszuFEBvaySzIyYSw=; b=WOP1uGqRQIX8qFxmTDEkjFRgZWF5Muc7eSPjLalH
	fCfwNBVqhLIvi96ab+YJ2BGdE/ZSIVS/9Wks/spCRrvZsg8k8LbIKmQX7yD+NdRC
	/h6HtPTUSYApHzPN+t1nBQ+zNQjCNGHhT2OX8/dwnqQIUxNOI+HOFWq+Y15eqxAy
	a4tHbcBlmyIEW60yNNT8mtqWCnWZbxa2OKevCujWvQKipO86y74fK9qkJ/iZnYVx
	o4qb/YdVzoJSpkHvMMS0nD+ueWmyzd014O9Dw2vuWWToB2/XWeyel8/bTUXEtMHD
	5RXUcI6Yj4Ue20cySLF2iSz3huveA7idDCEFKSptAk3odQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aKsyXEyfVD2T; Thu,  5 Sep 2024 21:06:44 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X0BkB0DR9z6ClY8t;
	Thu,  5 Sep 2024 21:06:41 +0000 (UTC)
Message-ID: <f5274603-3687-4386-b785-129183d84f4c@acm.org>
Date: Thu, 5 Sep 2024 14:06:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ufs: core: fix the issue of ICU failure
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20240902021805.1125-1-peter.wang@mediatek.com>
 <20240902021805.1125-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240902021805.1125-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_140653_099268_08F26913 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

On 9/1/24 7:18 PM, peter.wang@mediatek.com wrote:
>   	/* SQRTCy.ICU = 1 */

Feel free to leave out the above comment since it duplicates the code
below this comment. A comment that explains that "ICU = Initiate
Cleanup" probably would be appropriate.

> -	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
> +	writel(readl(opr_sqd_base + REG_SQRTC) | SQ_ICU,
> +		opr_sqd_base + REG_SQRTC);

Is this perhaps an open-coded version of ufshcd_rmwl()?

>   
>   	/* Poll SQRTSy.CUS = 1. Return result from SQRTSy.RTC */
>   	reg = opr_sqd_base + REG_SQRTS;
>   	err = read_poll_timeout(readl, val, val & SQ_CUS, 20,
>   				MCQ_POLL_US, false, reg);
> -	if (err)
> -		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%ld\n",
> -			__func__, id, task_tag,
> +	if (err || FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)))
> +		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%d RTC=%ld\n",
> +			__func__, id, task_tag, err,
>   			FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));

In the above code the expression "FIELD_GET(SQ_ICU_ERR_CODE_MASK, 
readl(reg))" occurs twice. Please consider storing that expression in
a variable such that this expression only occurs once.

Thanks,

Bart.


