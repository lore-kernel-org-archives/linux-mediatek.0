Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD375C10DCE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 22:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6521D222C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 22:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqKDyXq1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXz7Nuyq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6521D222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDB9M7ZFlVH5J7x9CRScO5bwFawHVRyEtgUWinEwl70=; b=tqKDyXq1SFwtH9
	MePRClOifMWDJWeCzAp9c4naApdq6P/6VtkmQtW7YiNVtrGSuYAxzw2rCIQfNzZ07y3Tx6iLvQb7O
	ek3bzEUvXeiGlwVewMOhSgUANJAtQXQhtjjqMbUNHcf/qqmCImHOZGOakGWe21fBAnvS4W1djLhIZ
	hw5niKto0FYW5sldDokhbNeFGPXG0SpNDyO2OcIvCZZiK3adwsjmdUVeirOHthm1loCijZisWjrw2
	2nxbGJ+Nv5SHjflvlVssbRits8gHEyfjid7DNDpf4DEYC3x4ai417/XzqtGVCQL1fNwhMj6L3s2Bu
	Wrb++L2U06cHce+BsHxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBnJs-00043B-7V; Tue, 10 Mar 2020 22:25:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBnJp-00042C-PR
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 22:25:47 +0000
Received: by mail-pf1-x441.google.com with SMTP id b72so128505pfb.11
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+SMw3KzwW0qIsxOajP3cV8dZM1F0dvmhCHxZU/Nkvn4=;
 b=kXz7NuyqUXk06IqGmoTk11IMzDW5AzrbJi35Fg7DHg8FyMNbD2e7cBObxGFy6GQFaZ
 dbNZPDzIsV9c6hMAlwZKh4x5bUKzT0J7VK/vU68bKIga53ppfumHvMB5M7I9GByTA+E0
 usgCHNvznKWBrJNV+rJDfZjjITw4IHL+w5b86vHZ8EhxRJnCyFJCGMHuJvrlFaTY2Fvv
 o2lIdi4kOS1rtjP7m8kRlSBig0jyNKN3ISii8t4Iv1RSoyNziWIZvqJG1OdTckQX2LN/
 IGer/J6Jg9aoAZPgRZcw0PbwTw7bNUHUATwHip1aKHSA2JlD9GvveB7fJDj+RESHDNTV
 q2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+SMw3KzwW0qIsxOajP3cV8dZM1F0dvmhCHxZU/Nkvn4=;
 b=tqUKydYxICbd5RMw/dSP/5pXheXzD2rC25LVLrp3uDKKBWlVpT5W+bnH87KxIMSZs/
 +0iTD5f4a5833hA55RKmPmK3LVQ78+aEtZRFKbYc0y7mv8wynEHyqMjPlyTRJZeFeV/k
 0NH5lF1l3A25W9X2UIsJ6RA+rtYOQAg/ZUPVh2fkKqqR58n88a6IY+/pMJU5lPl9Jo4w
 obJVZvWZUvMlvb5xVzsPBB3ZGyfjm9asIYs2tZujbw/Xlef7uqu3Bq9nxt7k6hDnUZk3
 Ndhj2BLpDE0KU75MaFC++cIJWPFULY641fN7iIg+LyVIM2GzIOKV4Mn1fvomu0Wm9t6a
 DkGg==
X-Gm-Message-State: ANhLgQ3S+sHUPtnqKZlV0nThaaniqkfOUoOHTmjAH7DN9tP9P+j1630C
 zo0H9EhHnmkl8GWkFwAUGX915Q==
X-Google-Smtp-Source: ADFU+vsP3GEkD/yGCbjWZr9amUrSp8lGkyIkcahbLxq5xe/LUQjUc2fdKy0+00IllBQ6HMvbgl29QA==
X-Received: by 2002:a65:5905:: with SMTP id f5mr21428215pgu.87.1583879144413; 
 Tue, 10 Mar 2020 15:25:44 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id q9sm47191418pgs.89.2020.03.10.15.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 15:25:43 -0700 (PDT)
Date: Tue, 10 Mar 2020 15:25:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: Use size_t type for len in
 scp_da_to_va
Message-ID: <20200310222541.GG14744@builder>
References: <20200310211514.32288-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310211514.32288-1-natechancellor@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_152545_834320_CFECC3E8 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue 10 Mar 14:15 PDT 2020, Nathan Chancellor wrote:

> Clang errors:
> 
> drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
> pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
> 'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
> expression of type 'void *(struct rproc *, u64, int)' (aka 'void
> *(struct rproc *, unsigned long long, int)')
> [-Werror,-Wincompatible-function-pointer-types]
>         .da_to_va       = scp_da_to_va,
>                           ^~~~~~~~~~~~
> 1 error generated.
> 
> Make the same change as commit 0fcbb369f052 ("remoteproc: Use size_t
> type for len in da_to_va"), which was not updated for the acceptance of
> commit 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183").
> 
> Fixes: 0fcbb369f052 ("remoteproc: Use size_t type for len in da_to_va")
> Link: https://github.com/ClangBuiltLinux/linux/issues/927
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied, thank you.

Regards,
Bjorn

> ---
>  drivers/remoteproc/mtk_scp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 7ccdf64ff3ea..ea3743e7e794 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -320,7 +320,7 @@ static int scp_start(struct rproc *rproc)
>  	return ret;
>  }
>  
> -static void *scp_da_to_va(struct rproc *rproc, u64 da, int len)
> +static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
>  {
>  	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
>  	int offset;
> -- 
> 2.26.0.rc1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
