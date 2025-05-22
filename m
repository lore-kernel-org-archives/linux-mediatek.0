Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23373C54ED0
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 May 2025 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=; b=LD7zhI92AUVSDezopFkZIRLWdX
	o7pY70tqzA/19x3JjpHeX9OK0500RqHSmha49BOwsAduiueOYPt8hiPQuTb0ObkC58sNN126Ax5xz
	9MP5gzLj9JfBuRel7pzx3zZHohpvL0Uq7t37rq8FiZtIzwqkD5GPyq5XNGZIbR88SsKmyY8PKqSpI
	dGWehPHqFhDXnulRX3MQjgx7eTTQT6FLZl2EXVukTq+wtRLurcIC2uNmBafKhC/gBY9HkStQ+nTXN
	254fp+dy08FRdsJNj6MuwZ/oeyjAPmATwj1GyQtQSFmUt104akkvuP8V11C7KYK+c/teEhRnJLA3b
	2wCpxJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Vs-00000001Nc6-3tjz;
	Thu, 22 May 2025 15:07:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7DA-00000001JUB-13sd
	for linux-mediatek@lists.infradead.org;
	Thu, 22 May 2025 14:47:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-310e1f4627aso242474a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 22 May 2025 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925275; x=1748530075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=vCnc152j/+1A96V1FfSspDloXCqclZiPLG8morhfKW3FW2Pmz5gdHC4ehieqH9cEVu
         KHmlxJb/lhjWproxHtfA8WRttriv6hZwk/vRZYRTQ7esxSaPFW/OVgvmN8XF83yOCXVI
         HCjO2HSHGedJIIBdSs5crxDWJO9SgLlZ/YZ0d7DJsAtGJ6Rdf0a3dSud8AzwrZst/sFx
         Pn392fUg0lpl6CBsJOSMgkhlCyFg5UPuQSAQCnYUp8oP+Fvmmt1l4UvsjKYkWzHABQtj
         RQSA4iK1hqwMGVgSJGEpOgGuJ++Yc9OFWbc4bM+pdgejIqt88O0WAQXL0g9YsYryrkWf
         QrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925275; x=1748530075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z1fJZAnO5gbEdE9pm7QO/Ig7e59PsYGFh5eZL9ezsU=;
        b=hn6UlUJKTcxzBr5q7Z+2njmtquCWpoP8OyW1W9rOyf+fRoEiRoxoSK9tdzuJTfQpQv
         8gT2a/mtBFC6g8SqueNAjkxIsX88fyy+QWl/KfxKJYQwW4Lbf3edCJGvzwdzLxA1JKdP
         0Lnxuf04YNuQ5OtgMYMAXF7dJjyEUtsxu09r3GSCLpw2zNObE26SNZhyzbd4/LSVAx/N
         KBaLa0LNtJiv7WKYx2y89dowWakrx+3DOV8zAUrIeD4MJbDkvYH75N41KP9kmk5mpgq9
         /kfC2pz+0GlPHpF5xsaJMGbWr34NYpSSccQOJnOCjxZk1Ge+Q/1LuB+raR3WDXyhh4xV
         iJOw==
X-Forwarded-Encrypted: i=1; AJvYcCWLmPhW0IgtTY4/XOzjXNqUShUjgZ5qqYytejpuzez5bvMN7YoPFrPNDNnh87zB2/l5/OZGSF2QlRPKMqi/lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzor1IKpu636HfBW3S8SkBXajciXb6QMvFqSQKWGnK7lDx4eW6U
	9CLb2UogTxdcxOL9q/KbR/0MKZVxW/QQLetI/IZ6/Bg2fIbYw11x6k33TRTbu4Wkxdg=
X-Gm-Gg: ASbGnct26qxxPurdpCaB76skRz1ggGKzCPi3HrNPog9ls3p0p6kXSbp5GKVtfQSmZ+L
	kiEdl+7RPdl44WQbYK8omR4rxiyrsDAO+pYO7IN6eGNQCmcQFv/8pFiCCXVm/LSlMT4v2zMrweQ
	2YRJlTbugvWdiuaqSSimQQQFbRhIXhn8JFJ79grrN55gxeminrxmdlrCOqOq/8+wf4x0DGFCDQg
	JV4BJXlqi8P3REDKj2SEWrj5XYYjFZVaJA04Yos9bwWObXw/zeaogJQ+PN3or2su7tGnsF8+XEa
	/E+yeGo8UdU79mrMNHyU+t7baJnd03qjVM1y/DKAAU5Q//a9iumDra8=
X-Google-Smtp-Source: AGHT+IG5YDZqJMGCNUR1bl3lh55nwJynldcZarNJfaMbRBZQnBUy0qDHzLUmT4VJ7H8G0EhPmNRC+w==
X-Received: by 2002:a17:90b:33c2:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-30e830f7b18mr38271134a91.8.1747925273816;
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adb8:3fc6:e0a3:9f52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36365d9esm5641713a91.7.2025.05.22.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:47:53 -0700 (PDT)
Date: Thu, 22 May 2025 08:47:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andersson@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Add SCP watchdog handler in IRQ
 processing
Message-ID: <aC85F1Rua2dn_qTY@p14s>
References: <20250521142404.1077-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521142404.1077-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_074756_292976_0FF89972 
X-CRM114-Status: GOOD (  19.96  )
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

Good day,

On Wed, May 21, 2025 at 10:24:03PM +0800, Wentao Liang wrote:
> In mt8195_scp_c1_irq_handler(), only the IPC interrupt bit
> (MT8192_SCP_IPC_INT_BIT) was checked., but does not handle
> when this bit is not set. This could lead to unhandled watchdog
> events. This could lead to unhandled watchdog events. A proper
> implementation can be found in mt8183_scp_irq_handler().
>

As pointed out by Markus, this changelog needs work.

> Add a new branch to handle SCP watchdog events when the IPC
> interrupt bit is not set.
> 
> Fixes: 6a1c9aaf04eb ("remoteproc: mediatek: Add MT8195 SCP core 1 operations")
> Cc: stable@vger.kernel.org # v6.7
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..316e8c98a503 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -273,6 +273,8 @@ static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
>  
>  	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
>  		scp_ipi_handler(scp);
> +	else
> +		scp_wdt_handler(scp, scp_to_host);

I would much rather see a test for the watchdog bit than just assuming it is
a watchdog interrupt.  And while at it, please refactor the bit definition to be
platform agnostic rather than reusing 8192 definitions on an 8195 platform.

Thanks,
Mathieu

>  
>  	writel(scp_to_host, scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
>  }
> -- 
> 2.42.0.windows.2
> 

