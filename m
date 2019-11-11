Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE77C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 23:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60EBA2173B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 23:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IIzh1qSb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWtyLPCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60EBA2173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sx2wWhF9SZnp8kp7QwnHPLJppk4rH03jVej8jfLOdZg=; b=IIzh1qSbsKwXOI
	PsUasNoin/GfYoYEwV1PqpISFoW5hs+x4bmVNiltKBkP017iaLI9kbf+9qn7PQHl8QXQZm+IuwmLW
	05MNYbb4aXY5BeCVJrUGQMBec7yWtFZ9sJ7sJiQqygg1NEUaeZmnxIDZuCvZfSzW3qryRA0NtZRpj
	WODUDet2XzDCKa042GAkoHvob5Dw9otnrN2ol5/DJDCFnAOtbdbTIDgCQiVxtpd5rZIdhEDdv51No
	b9tAlY3YMA/ymNEUR9K3rq3pO5j7ga1DVLAvVam1jA0DUGerfb0lc0KecVpbO9dRg376VAwY/uWHw
	oUilJzzes8jyMFwhAWjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUIpP-00086w-Us; Mon, 11 Nov 2019 23:10:35 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUIpH-00080J-VH
 for linux-mediatek@lists.infradead.org; Mon, 11 Nov 2019 23:10:29 +0000
Received: by mail-pl1-x643.google.com with SMTP id j12so8454147plt.9
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Nov 2019 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tWeesDpDIKQpiy9KR8LKYyLg9H0SvGAo1V8+RtWjNIQ=;
 b=rWtyLPCIGyCdKarivLzqhQAJ+Hfooyus39lh21jI8xk1IYdM21EMyAhyCiMAj6XU88
 YHLkNv8fVvIZ3efdtCk8MC9ENjAuY75QGb92jJ9eWgZzeVmOmV6etIloPQOvhoKPytwU
 tdOsNkLLNnRJK7Yn8Glfv43FVt5EhmxeNqWuKKWoAjcQdRMMcJbNiRh0EcraR6vw7s+i
 KHwWFP2ROBBWbeDY/9Ub0aQ29J4YyF5s7sjGRMoHM4ItZh5loT9UqfcfTH1o7CLuFfzx
 lTdWaY6ydbeL1yhm2XLyeaVjzDiaoTGPeIDVV/PMsf2zuXu1ITVhz4muProW2lYrqDPq
 L1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tWeesDpDIKQpiy9KR8LKYyLg9H0SvGAo1V8+RtWjNIQ=;
 b=c3X0l4wcQbYZxCB81OCESP+N0jofekA3CJCECdKnByBt0qx+hz5rThcTf+/+ahil9u
 QbgCZtE32t2TMFRagBbAYQzIDWGk2PfkZqwjF4DAe/I6WefZh881gm2nol1Rfdk8wu4t
 qSATKNuze6bsXEwE+V27sddn2WOKYuxoXwCBhwAtVsE1VJbGZYR3JcvWdh2NZgUZFniC
 YLCRmtbsY2QxvYXOjb2XE7euH5xjNhB9RcKm0s14L5TOHB+CERkCgn1Q1zOcvCiGlucW
 aBgqubIOWqiOhbh7yugui2c6v47speOOghDqTQTviwdulNV4qEqujxQCIbjLZpc5tYRq
 JjHQ==
X-Gm-Message-State: APjAAAWojwY9cICP1hp4RC+Dq86x9UMyALvBRTzllc+30QxCQIm3Uwzu
 e5he+5Fq3+WxSDFiEVi6+59bTA==
X-Google-Smtp-Source: APXvYqxVslTCSWygyPseQoAhgUug6WvxHkgXjnEMOZD0F6D5+Rt7ew8BNgRcm46QVtnCEjQ90fs3Mg==
X-Received: by 2002:a17:902:bf4b:: with SMTP id
 u11mr2843807pls.40.1573513826584; 
 Mon, 11 Nov 2019 15:10:26 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q4sm7296199pgp.30.2019.11.11.15.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 15:10:25 -0800 (PST)
Date: Mon, 11 Nov 2019 15:10:23 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
Message-ID: <20191111231023.GD3108315@builder>
References: <20191014075812.181942-1-pihsun@chromium.org>
 <20191014075812.181942-4-pihsun@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014075812.181942-4-pihsun@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_151028_014682_04B9ABDE 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:

> Add a simple rpmsg support for mt8183 SCP, that use IPI / IPC directly.
> 

Hi Pi-Hsun,

Sorry for not reviewing this in a timely manner! This looks good, just
some very minor comments below.

> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
[..]
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index f2e5e70a58f2..7896cefb2dc0 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/remoteproc/mtk_scp.h>
> +#include <linux/rpmsg/mtk_rpmsg.h>
>  
>  #include "mtk_common.h"
>  #include "remoteproc_internal.h"
> @@ -407,6 +408,31 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
>  	of_reserved_mem_device_release(scp->dev);
>  }
>  
> +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> +	.send_ipi = scp_ipi_send,
> +	.register_ipi = scp_ipi_register,
> +	.unregister_ipi = scp_ipi_unregister,

These are exported symbols, so unless you see a need to support
alternative implementations in the near future just skip the function
pointers and call them directly.

> +	.ns_ipi_id = SCP_IPI_NS_SERVICE,
> +};
> +
[..]
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
[..]
> +static void __ept_release(struct kref *kref)

Please make this __mtk_ept_release() to make it clear that this is
not a framework function.

> +{
> +	struct rpmsg_endpoint *ept = container_of(kref, struct rpmsg_endpoint,
> +						  refcount);
> +	kfree(to_mtk_rpmsg_endpoint(ept));
> +}
> +
> +static void mtk_rpmsg_ipi_handler(void *data, unsigned int len, void *priv)
> +{
> +	struct mtk_rpmsg_endpoint *mept = priv;
> +	struct rpmsg_endpoint *ept = &mept->ept;
> +	int ret;
> +
> +	ret = (*ept->cb)(ept->rpdev, data, len, ept->priv, ept->addr);
> +	if (ret)
> +		dev_warn(&ept->rpdev->dev, "rpmsg handler return error = %d",
> +			 ret);
> +}
> +
> +static struct rpmsg_endpoint *
> +__rpmsg_create_ept(struct mtk_rpmsg_rproc_subdev *mtk_subdev,

__mtk_create_ept()

> +		   struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
> +		   u32 id)
> +{

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
