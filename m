Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3436BC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 09:57:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FB421775
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 09:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uPINjBZj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQBiu1cO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02FB421775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IznFpURRpbgvw0KkS4p9CvddEh77k1jwY+KL1JxKvCs=; b=uPINjBZjKMRP3cijT1eTsdn8W
	p0e1ujebEg9kmwJ0Gi6abFD2DPMixlKztHNBE4fCpJ9Lz92yX7mTHV9Bczgz/Njy664pUQ4SbcI8y
	EBnGFcJ/h6cFb8aTMOSZg+qeBk0tJB7crma+bGm/K4XoTLdVoCANPbX3ilDPNgFhIBKmDYqNtDmJ7
	H6UPSKOr6WmyQQpnjBWOaWxtymN8gIV9IM1JbTEzbfV3TZ7GxuHbdTn1CblmYrZ9PASEO8CyZH2e7
	hn35H36Ahb81fo1gMyWb9XwgNoZ/DTrf7HF525UPslW0I/ucCL/zrBZn9dlScdPov2u9m0jt10LQh
	8m84nY9KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxSYE-0005BD-IA; Mon, 20 Jul 2020 09:57:38 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxSY9-00059N-1q
 for linux-mediatek@lists.infradead.org; Mon, 20 Jul 2020 09:57:34 +0000
Received: by mail-pj1-x1043.google.com with SMTP id ls15so9975167pjb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2020 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6XyZ1vebKO6SQCUsj068hhsBNuOKRm7ZmD8BgAuoHaY=;
 b=NQBiu1cOCISh1k3U4y2l52I5TOrTbmZzL+gIeTHwlzmCjlDf3IZD/ASeQl0xonnttT
 BEBTV4O6+LnVxFo/P67buZg17mjeeDzQ6YW9F5upr2VTBMiQYdnb6LmiMrZPNLo2+AvX
 FsJAD3xO/Y1XACZxNmQn5zgKtsx0Eu+Q/07copNlruVNsS3eDO7l4BJy7FS/XMOlVJAH
 5Th+Fgrh0sVI/M+/7oxKgEHskmAki/NZIoebAOMDGHZHUq3J8eEwmT9bpNlf6LYbSdrz
 KlJie1QrAVSirzAarzo8Xi9oPUU18PND6e9uVj5H5NfTEeulHQWwkzA5hfrywQOqvzd0
 rptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6XyZ1vebKO6SQCUsj068hhsBNuOKRm7ZmD8BgAuoHaY=;
 b=k6oQ1INqGk9sDS12kpBJS5f3fH8OIRwQr5OmTQi+w69Gppw0Hv5Ub4ZC537oWwhUJY
 fWEsZJJNDxwdS86eXjoWWDUMNVPnG7HLOwua+72/DdN7nZTA2Jgvtv0AVj7xSkD16TNs
 ZQlOlrUsBN5gU0g0yxMxpN9ZV1uhMiSfPATsjX9MAjtSUm7rL2glSgfOUHvJp0EvewXI
 f08rhdxJxZqYF+twEQbonmQTg+bNPcQG4kk0dapkEYFrD4KPNIwpbsmYrvB3X4OQr8XG
 k0D9cTfIDG1WfnRup7QpLXsDuv15Cm4JbEiDgd5Y432KE9lOqRpKPWzZzlmLCQ1PfkAi
 Mw4g==
X-Gm-Message-State: AOAM532FcETs2sLtPD2CLZbT4k9GBZoOkMFcVjFROwM69NixYcdRny1T
 ehB812HyrgT41fugIVSvzBxs9w==
X-Google-Smtp-Source: ABdhPJzkmZ+GQFeE1cVYyN6xa/AAWSvHNvngWQItcmxRGFYYYD7B/0wV++gqFg1j+Ya++WKQMwlFCA==
X-Received: by 2002:a17:90a:2367:: with SMTP id
 f94mr23548839pje.20.1595239049209; 
 Mon, 20 Jul 2020 02:57:29 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id u20sm17765622pfk.91.2020.07.20.02.57.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 02:57:28 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:27:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp,
 even it is disabled
Message-ID: <20200720095717.eer4pnh3y4stkems@vireshk-mac-ubuntu>
References: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_055733_122166_20793A66 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: Nishanth Menon <nm@ti.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20-07-20, 16:55, Andrew-sh.Cheng wrote:
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
> -	if (IS_ERR_OR_NULL(opp) || !opp->available) {
> +	if (IS_ERR_OR_NULL(opp)) {
>  		pr_err("%s: Invalid parameters\n", __func__);
>  		return 0;
>  	}

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
