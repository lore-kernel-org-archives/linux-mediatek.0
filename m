Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ED1C433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:16:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A552068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHp3UE2c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfOCJF5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A552068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aAcE2caAvFas6mFp5DFfXhp+2NyjlfHvDDRkwQ3l+Ww=; b=GHp3UE2chVA0VuQXNa3D1B4Og
	ydrhfUUWstLP+sIeezZ9UkSgCvHJIuyhl/b86Ph5jsWV2EHbGYfDuYQBfkAQxENlf3vyVT3zq/Ky7
	hc27i+s2pXlsSoUUutafrWmAfDra6yhyYLM8WYNPyc64xOb+QfvvqLOgSti0f+o/+cIGtY6sms+Ei
	i8tPS/uZeusecnV8DXBaQe955ARqosfbWAqslah86Og/8BA4s+EJqXwhr5e2a+biBjV795C00MnO7
	Pql0jpS9qoMgQzIdRsQdnTLfQMtFbp50v6ygiKkTJoqi0GzcjI7WIxOSq+wefl40nBy4GqOSG+KS3
	IAGUDvVCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnRJ-0003eY-Gy; Tue, 21 Jul 2020 08:15:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnRE-0003d4-Sa; Tue, 21 Jul 2020 08:15:49 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB0E42068F;
 Tue, 21 Jul 2020 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595319348;
 bh=tluKZscEZ9nIJfxjCUJrrdRWnfspR12AAYUwqx4tm5Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pfOCJF5hfwllADkTw3uNwtOY7GxZ06DPwSsn8vXOsyoDDKJAcs4WuV0euryWywuUD
 20VGj/ieL+poLPgRzsvHGgnrIZ8k2wDMSUTGiMrqR6QO02eFlr3VsEEt1pM0/mkC2R
 2PSexCAVyj0Ym8czvU4kMOIWKC4NoPgyq1wU4nco=
MIME-Version: 1.0
In-Reply-To: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
Subject: Re: opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp,
 even it is disabled
From: Stephen Boyd <sboyd@kernel.org>
To: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
Date: Tue, 21 Jul 2020 01:15:47 -0700
Message-ID: <159531934722.3847286.14813407062714740461@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_041549_081937_36EDF8B5 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Andrew-sh.Cheng (2020-07-20 01:55:26)
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Modify dev_pm_opp_get_freq() to return freqeuncy
> even this opp item is not available.
> So that we can get the information of disable opp items.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index eed42d6b2e6b..5213e0462382 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -118,7 +118,7 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_voltage);
>   */
>  unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
>  {
> -       if (IS_ERR_OR_NULL(opp) || !opp->available) {
> +       if (IS_ERR_OR_NULL(opp)) {

I wonder why we even have this check. Seems like the caller deserves an
oops in this case instead of a small pr_err().

>                 pr_err("%s: Invalid parameters\n", __func__);
>                 return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
