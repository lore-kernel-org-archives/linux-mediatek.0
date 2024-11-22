Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED007E69185
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sivaA00Cl8xZHKaBlXfRVzTIB6kUyIYmQdHF8o7aS0=; b=Gfwv25pG0Cg6tg2xz5N5lkSNgK
	e2bNTR4FfpCHa95QionCG0Z4oPoMlfu1XDuc7CKr4JXV3hO9/pDLlwNBXpNUz0eLpCAvMBptKuIOf
	hs0XiMxQ40klyjGBhfmbidw+vjlvutZkETu3/2HPB7bI2IcylxW3cR/8eoayoqY1izVc5Q2g17Jty
	ykkkd2N39pWY3tqVT491iUVeHJ5yrj8yc5+1V5TUfqM6D3TbL56weWy2xjOSqhQdQadDkyfBQklh5
	AAJafcUeFVt4R+NW6SRaoa6MS//LRMDD41QkDeGo2DtJRYP+dbwpBJsRWHxlJzQFsyR6vELwhYakU
	VrSkaRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYKE-000000036jY-0Cyd;
	Fri, 22 Nov 2024 18:24:14 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYKB-000000036gX-19HY
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 18:24:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Xw3QQ6HPXz6CmLxR;
	Fri, 22 Nov 2024 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1732299826; x=1734891827; bh=5sivaA00Cl8xZHKaBlXfRVzT
	IB6kUyIYmQdHF8o7aS0=; b=pFPG4xlZgErAaaIY6f1VcQG1Snzs+EOQKm46SOkP
	dgwdcZ7l+HnTQGFnLQVgNcvIQWpWQSEBwH7hPdhpf/1BkCLqU/TRe5E4cnmZGanU
	SbGFNSOQIRucpdvHED4eJRe3971SLdZHW2loXejQouysQhcBVeQ3OULW+FP6R7/F
	VRLSrSlGOzUwqaEVltpm/jwKpDUBC0xxTbjPweFUiWfVVAIUVRylIM8Pkf6HwiIR
	k2rp9cgi7YVtpyovZEpVUbsQAfNlaUXvj6o1ACptxMwHRLRBwPOzkh89+f8BVVW8
	dCRAtswlzNe/q3SsudTCxrHGy7L2tKlSahrpimeRbX4jAw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id KfgKYxiF_i_m; Fri, 22 Nov 2024 18:23:46 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Xw3Q54Dy5z6CmM6d;
	Fri, 22 Nov 2024 18:23:40 +0000 (UTC)
Message-ID: <f0cc674e-18f7-47c6-a39e-596b2cb161a4@acm.org>
Date: Fri, 22 Nov 2024 10:23:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: add missing post notify for power mode
 change
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, draviv@codeaurora.org, stable@vger.kernel.org
References: <20241122024943.30589-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241122024943.30589-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_102411_323893_7344F464 
X-CRM114-Status: GOOD (  13.11  )
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

On 11/21/24 6:49 PM, peter.wang@mediatek.com wrote:
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 3f68ae3e4330..1db754b4a4d6 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -308,7 +308,9 @@ struct ufs_pwr_mode_info {
>    *                       to allow variant specific Uni-Pro initialization.
>    * @pwr_change_notify: called before and after a power mode change
>    *			is carried out to allow vendor spesific capabilities
> - *			to be set.
> + *			to be set. PRE_CHANGE can modify final_params based
> + *			on desired_pwr_mode, but POST_CHANGE must not alter
> + *			the final_params parameter
>    * @setup_xfer_req: called before any transfer request is issued
>    *                  to set some things
>    * @setup_task_mgmt: called before any task management request is issued
> @@ -350,9 +352,9 @@ struct ufs_hba_variant_ops {
>   	int	(*link_startup_notify)(struct ufs_hba *,
>   				       enum ufs_notify_change_status);
>   	int	(*pwr_change_notify)(struct ufs_hba *,
> -					enum ufs_notify_change_status status,
> -					struct ufs_pa_layer_attr *,
> -					struct ufs_pa_layer_attr *);
> +				enum ufs_notify_change_status status,
> +				struct ufs_pa_layer_attr *desired_pwr_mode,
> +				struct ufs_pa_layer_attr *final_params);
>   	void	(*setup_xfer_req)(struct ufs_hba *hba, int tag,
>   				  bool is_scsi_cmd);
>   	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);

'pwr_change_notify' probably should be split into two callback pointers
(one for PRE_CHANGE, one for POST_CHANGE) since the third and fourth
arguments have different roles for pre and post changes. Additionally,
this would allow to constify the fourth argument for the post callback.

Anyway, since this patch looks good to me:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

