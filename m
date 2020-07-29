Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AB9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 20:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B895206D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 20:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYHho+WU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btWkfvp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B895206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kGIVtdL03gWnenEqXs1NnypbBrp2FbgBnzf+6AR6CPY=; b=GYHho+WUL1ihOM1ysRBEFcMYB
	4auB1bhMFiFgOJ/chAr7bQak41xw8XWbc7SaNFIj3tFk8F1P/u6w1rSrSnD8kt7g7xqSvc6xgVGz2
	zISG/ijql/7aBrDlETChyphw/S88dpez6FR4g9OOSnq/Y0H2zuaqoCsC5e1hhVsLgpAQaPytowM4q
	KYa+U80lQQceexGhuMy13rUr2aKMeiUNcEjoZG4amUncbzDvYFXjcH8FIcR8ndwEbwZ3ntgnkea5R
	UQjtLbW1ALwEr4NL21VmR7wlTkvka+ICFe9XuwnL0qTY2kSLuuBYpiDdoQ3pSt9vh2GmK+7Cux/Pr
	2L2Vwslfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0t1a-0000kR-7y; Wed, 29 Jul 2020 20:50:06 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0t1U-0000j8-77
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 20:50:01 +0000
Received: by mail-pf1-x444.google.com with SMTP id l2so7335702pff.0
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2020 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZCFo51SeNUkOi0joTAI0GNw0Kvqf2JKQKS+2k/u6bwE=;
 b=btWkfvp0JkQdCpC7uMqhXszwJqeXh1l5pSFL8aj+MwGVvWN4n0+PxZBiq5CjPaKB1b
 3ruNPSm8qEV8W5hLyYr0it8cgH1lIt3QvxvFMRPPSCcS1ITuBJyfTzrlGr/sNz+CgrdW
 uqZS2dCFzNCuRJmNpqgUBe8PKtVkAWi2/QYj0XNDb9uKf0SW24RtEmORwfhlqLdhtrtu
 YFh1YD9vKn9Ky3B+kwhtXYlekEYn+iWaOznXeQw0qq6Gb7u1JedGsOlUX8G7EdeK/YmK
 48E4/CPcMv64caVasW3t78Lq3ZnGm2IMu84DgPgWiw2MFDQZcjxpNM0f/F3xhBBl8RsX
 cTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZCFo51SeNUkOi0joTAI0GNw0Kvqf2JKQKS+2k/u6bwE=;
 b=ZRoqhnGNi1jnO9CinCbYaU7tSFNRWyD5uQ0ny7q0yztfi3CRxqiuYYtk4Llm3UhkcY
 bf37Yjtg24nPdCmm+54AE+3PLYnmTAQlwbylxi7bHHvq6jzYYW5IOlyjSsaBalyfJXd2
 TD5QFwJPP2avjfeP6sQ6zQ4VWZ8H95gvS4BhACVXwweD9J+Hqn8MSR0TPxuTZ/toBAoP
 L+7Oyl/gWrBHSiHIj3jgRrqRbwBz4VmoqZoEtXzO2PfF/QejA6iNnB+TSlbkywgYc/r0
 tCSyMrpG6y3SnIqYoLiWPzxJVyioHNo7CuTqGmdWGGayGq6fM0gbUxgRHY6Rx4pBOy3L
 Z1/w==
X-Gm-Message-State: AOAM532rdPPcCsSh7aEA+b6KlVXQO/t1G74SZeQCybEawjj0fBrhGths
 9FeJ6P2siLXdAcjHqvxlj692ew==
X-Google-Smtp-Source: ABdhPJx7ckWZ845NwYLBsMDvRn/h2HR2lmuehBnFT2QcLP6PH+H6EGe1o5XMMXAGcMF9VcygBTZ9DA==
X-Received: by 2002:a65:43c1:: with SMTP id n1mr30164858pgp.67.1596055797739; 
 Wed, 29 Jul 2020 13:49:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id a26sm3025188pgm.20.2020.07.29.13.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 13:49:57 -0700 (PDT)
Date: Wed, 29 Jul 2020 13:46:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] soc: qcom: smd-rpm: Fix kerneldoc
Message-ID: <20200729204628.GL229995@builder.lan>
References: <20200729074415.28393-1-krzk@kernel.org>
 <20200729074415.28393-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729074415.28393-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_165000_366502_B4C0AA08 
X-CRM114-Status: GOOD (  16.95  )
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 29 Jul 00:44 PDT 2020, Krzysztof Kozlowski wrote:

> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     drivers/soc/qcom/smd-rpm.c:35: warning: Function parameter or member 'dev' not described in 'qcom_smd_rpm'
>     drivers/soc/qcom/smd-rpm.c:99: warning: Function parameter or member 'state' not described in 'qcom_rpm_smd_write'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for spotting these, applied.

PS. This doesn't have any relationship with the Mediatek patch, the two
goes through different maintainer trees and my manual mailbox filter
almost discarded the series. So please send patches like this
individually in the future.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 877b13850730..1d4eb46b417a 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -20,6 +20,7 @@
>   * struct qcom_smd_rpm - state of the rpm device driver
>   * @rpm_channel:	reference to the smd channel
>   * @icc:		interconnect proxy device
> + * @dev:		rpm device
>   * @ack:		completion for acks
>   * @lock:		mutual exclusion around the send/complete pair
>   * @ack_status:		result of the rpm request
> @@ -86,6 +87,7 @@ struct qcom_rpm_message {
>  /**
>   * qcom_rpm_smd_write - write @buf to @type:@id
>   * @rpm:	rpm handle
> + * @state:	active/sleep state flags
>   * @type:	resource type
>   * @id:		resource identifier
>   * @buf:	the data to be written
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
