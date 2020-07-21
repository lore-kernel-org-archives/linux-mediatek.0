Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5EDC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FCF920714
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kB5ifIct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjv+YZ0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FCF920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EViq0hTlwttgEiaiaH/sddZpIE0vIg7FAerKnv/ahOs=; b=kB5ifIctfinH6RH5sBh54yanI
	ctOdPkf8JmLsLZUUtm/YVhxWuM2SS8uWL2jVgRVRWTHQ7wel/G5zSHkV8sCwmbL+6P4mYNYI8XjZN
	pXjVaVWXz2O+3gBxvaCBcZjIyIxOCz6OL4MOuOIoRI8WLJafIWPRbbiTtnlq9JGWslJG5eeUS1VIW
	ciD7Zcm92Ju5+l90hcLCxkFaeM51GUyi+Y9v81ePsMLZczV4yBjDP1YTVmbJ3egJYij6MEA2r458c
	UcWPASb3VZpU88Oor4/Ji0RYBVaprQZ3zQFvSFiiAk62gZnb4JLNZDbnIvlvPRWBVq7P84XYXRug+
	KfNYlo+ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnWf-0004z9-92; Tue, 21 Jul 2020 08:21:25 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnWa-0004wn-Hn
 for linux-mediatek@lists.infradead.org; Tue, 21 Jul 2020 08:21:22 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mn17so1209994pjb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2020 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=74cnB8WV/DeG8ebhvgbl1gl2LfYmiA9yZ3/crf8NgJ8=;
 b=vjv+YZ0xo7bDx59HHkmJVxpxxb804vgOrNic7EXsXohB37XDmdDvAkDLDjWUHl1ryq
 TUR7ZVchoL9gVzggDAnFMJjJr685tDFrRySrReEc8Q2L7dC866AzXuJBLs/d98o5eZDu
 t+wVyYg3dIBUMtrSO12IznO74pZhxizVfwqPq48P1DIINB9DpCBfzSoxgoBGuoI8ZsPv
 n68AH2q4cFb+JmNO4pofnMvNzvWmUnUPwY+KmSWxADLcZBalATNrG4XBsY3voIfTQ97p
 GsQN9wA8nbtnVIVSwkfdVsPGiUbdbTQHZxuSDwLMQj1+CK862YkrgsnQB55LZZgw6Ipd
 4pCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=74cnB8WV/DeG8ebhvgbl1gl2LfYmiA9yZ3/crf8NgJ8=;
 b=CkJaC1rhswjb423WqnT444BWwPe62UmavnjFMFGj0a14x1cqXO4I/yYEZ/R3X/FG+z
 2btiFCekdQwbuBhL+MKuZwCFXCKrt5lBpE4vexyutuW3AEnpJb6/pOFOZzn7xH55Dj2N
 It31iGST/OnkpZEbrufWTloVXApTIrTH+oixfjpq/lITFodGJZh7NKkSaNa76VOI5EgU
 ws/BrozLWZ0isZj24xvEH0p6kGoWj6Ewr4ADG+YXdkj1iKOTX+fMnIz5hsPW/k1bRXV7
 rMzCYPq3lF5FgKjKbMSKtrsxI4DiOVyaN3lcU7jcMjahtFE/IL7xiCIkTZ7kN90WADVF
 P5AQ==
X-Gm-Message-State: AOAM530bG2jz5sEW/EtowJMXElZaWLjRVXFtOLOQ79AawyW9+0ezUTwF
 /fqq41NIHllT4afAW3sYjjCYNA==
X-Google-Smtp-Source: ABdhPJw2z2+N0MEss1NXQOPpFBPqV/i3Scy9lXQPLEKMgs7UGAIGKsx3pG54CUXrYnzgC56bil3DTg==
X-Received: by 2002:a17:90a:fa02:: with SMTP id
 cm2mr3812131pjb.52.1595319678241; 
 Tue, 21 Jul 2020 01:21:18 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id n18sm20123125pfd.99.2020.07.21.01.21.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 01:21:17 -0700 (PDT)
Date: Tue, 21 Jul 2020 13:51:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp,
 even it is disabled
Message-ID: <20200721082111.les32oe7hrfikeew@vireshk-mac-ubuntu>
References: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <159531934722.3847286.14813407062714740461@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159531934722.3847286.14813407062714740461@swboyd.mtv.corp.google.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_042120_685424_FCE8537F 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: Nishanth Menon <nm@ti.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21-07-20, 01:15, Stephen Boyd wrote:
> Quoting Andrew-sh.Cheng (2020-07-20 01:55:26)
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > Modify dev_pm_opp_get_freq() to return freqeuncy
> > even this opp item is not available.
> > So that we can get the information of disable opp items.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/opp/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> > index eed42d6b2e6b..5213e0462382 100644
> > --- a/drivers/opp/core.c
> > +++ b/drivers/opp/core.c
> > @@ -118,7 +118,7 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_voltage);
> >   */
> >  unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
> >  {
> > -       if (IS_ERR_OR_NULL(opp) || !opp->available) {
> > +       if (IS_ERR_OR_NULL(opp)) {
> 
> I wonder why we even have this check. Seems like the caller deserves an
> oops in this case instead of a small pr_err().

I think the reason is same as to why multiple subsystems do similar checks.
While many of them don't do anything if they get a NULL pointer and simply
return, which is fine to support cases where NULL is passed.

But I do agree that maybe we may want to make sure opp-table or opp pointers
passed are all valid all the time and so just remove these checks and let them
crash.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
