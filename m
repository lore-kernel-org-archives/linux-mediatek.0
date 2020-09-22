Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E89C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 08:17:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52672239E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 08:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIOs1DWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52672239E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qqsr95/AmRnHp7AKXEwWAld5lwju975V6eFRN3Zxi3U=; b=QIOs1DWPnhev5xdMmEdrR1B0V
	boj0RNw60WbRp4BlG3R0VImX6JNUQLEQztQITBqUYj9wZvDNkSfm69VlVs8TwkIdNfv4ykEGpYjvd
	kKDZ8Yua9zsFKHI5jTGCkF5iCVxIjwIMAFMRlqDQ2gLJdyKQM61tDgRwRnFAaJWogSSwp9x/hXGal
	YK7p/yBoG+HKS+NPmJ+X5/UOyNETePGeuvsES5NdSD4JE+jiVOFVoGS4rHUFBi0ATHeHXQHhfwbUi
	VAceFSle3PIjuvIvFx2AWIKUUINCgLrCr2D6VwBCXLMqSTGp49kF8TEkkL3AFuPEQ6xFTCfvIidYX
	kPwIa9A5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKdTr-00052w-CJ; Tue, 22 Sep 2020 08:16:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKdTo-00051n-Bz; Tue, 22 Sep 2020 08:16:53 +0000
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net
 ([80.193.200.194] helo=[192.168.0.210])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kKdTm-0008TT-7b; Tue, 22 Sep 2020 08:16:50 +0000
Subject: Re: [PATCH 1/3] stress-shm-sysv: exercise shmat with invalid flags
To: Piyush Goyal <piyushgoyaliit@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <c867a2f8-5046-ce14-e36a-3d48780c317a@canonical.com>
Date: Tue, 22 Sep 2020 09:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_041652_535954_7F51A356 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I believe these patches should have gone directly to me and not various
other folk.

Colin

On 22/09/2020 08:27, Piyush Goyal wrote:
> Exercise shmat syscall with invalid flags resulting in more kernel
> coverage.
> 
> Signed-off-by: Piyush Goyal <piyushgoyaliit@gmail.com>
> ---
>  stress-shm-sysv.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/stress-shm-sysv.c b/stress-shm-sysv.c
> index aa03d718..5a3e0cc1 100644
> --- a/stress-shm-sysv.c
> +++ b/stress-shm-sysv.c
> @@ -128,6 +128,19 @@ static int stress_shm_sysv_check(
>  	return 0;
>  }
>  
> +/*
> + *  exercise_shmat()
> + *	exercise shmat syscall with all possible values of arguments
> + */
> +static void exercise_shmat(int shm_id)
> +{
> +	void *addr;
> +
> +	/* Exercise shmat syscall with invalid flags */
> +	addr = shmat(shm_id, NULL, ~0);
> +	(void)addr;
> +}
> +
>  #if defined(__linux__)
>  /*
>   *  stress_shm_get_procinfo()
> @@ -337,6 +350,7 @@ static int stress_shm_sysv_child(
>  				goto reap;
>  			}
>  
> +			exercise_shmat(shm_id);
>  			addr = shmat(shm_id, NULL, 0);
>  			if (addr == (char *) -1) {
>  				ok = false;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
