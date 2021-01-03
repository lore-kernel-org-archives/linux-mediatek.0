Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8775EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:32:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3700E207FB
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3700E207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jxqgwphPyCJFtVWJHyg5hX3WZmeMQj0LVG9uahO6h6Y=; b=XDqgk0dUrfy3jcuKN7lVKmri7
	+hXHVoJ/xpuS/5kmJ0WOQJvPQpLxCmidsCD4z8fCOpwEpbk+sN3engWqE5mZw6bm/K01FYgpC1aVC
	ivp9kDBnXMOFLOUNprYDgKZ0wG0sZwBMAA4Hkss38u1S0eg0WZsWfhoRGvcGs1Ywn9iTOcqNHWdu/
	Bx5GGkdXaoBzPIvgfba8iGm4UuRAFGLRq/0tpFTG5MqzZbwFYDNEJJSt6V9A6XLhiUummNqyyS5mN
	zUp8Zxoe5Nl+zmEkxsdD7vcUkyi4ztfpZCu613k3UOoG1vfuFxY3H+80VgdgOjytMveETAjXpe+sb
	yzdyZcfjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6Is-0002Me-JM; Sun, 03 Jan 2021 16:32:26 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6Iq-0002M0-Ea
 for linux-mediatek@lists.infradead.org; Sun, 03 Jan 2021 16:32:25 +0000
Received: by mail-wr1-f44.google.com with SMTP id c5so28493566wrp.6
 for <linux-mediatek@lists.infradead.org>; Sun, 03 Jan 2021 08:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DZPDq3UkeCzOg15tzSVPhbD2fBT2DOgqfaJYiQmKMQc=;
 b=Bz0EfAVMCC9rm6PhDHYUEIOFNICojBDJu88JTzbZ5aAShELvgQKU0yBjDKyc9hEGnr
 5p4whHyu6pkpcU8aTwiIeRE7gAQEYmZEAAtmhIBFl8vEjHGJUP6aTLD2G8jiDsVC7cED
 aGet/ScHxhyn5a/lzkvAiE5oZTioAEfMvS3L1g4c/z5v3qbfsc2FrkNNNCPgoEPFqAhC
 JUC2B3kfubXyzi0ZNZXNaRJrjpo1lFOC5Y38nUtHAuaFQZk9zvCrAX/Z7aozTJWgClrV
 zNjxRqvfOf4CwCdYVRSvTrbgV0JAcpXewGFvZoTF6Bc7SRDmuSUOrw9Hl+Uy27igGtss
 G40Q==
X-Gm-Message-State: AOAM531Ip2+VL1VbmONbrT2YRV6IVLly+7SDMMuxsnMuJyDrFVA+6m/R
 h0CkyIdB4pyFrEmrD8TPJGE=
X-Google-Smtp-Source: ABdhPJwNq2ZAK1KVrT+rB4PX3O/mVlB1DtJbR9hLzXoM0EQEIwsM/oAERomyB/aXiD3wboTQg3vsbg==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr77875757wrx.170.1609691541715; 
 Sun, 03 Jan 2021 08:32:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id l20sm91848400wrh.82.2021.01.03.08.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 08:32:20 -0800 (PST)
Date: Sun, 3 Jan 2021 17:32:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix PM usage counter unbalance in
 mtk_smi ops
Message-ID: <20210103163219.GB55804@kozik-lap>
References: <20201123102118.3866195-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123102118.3866195-1-zhangqilong3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_113224_509707_B6BF43A7 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 06:21:18PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
> Fixes: 4f0a1a1ae3519 ("memory: mtk-smi: Invoke pm runtime_callback to enable clocks")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/memory/mtk-smi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
