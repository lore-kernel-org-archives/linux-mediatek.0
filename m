Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3E4C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 08:44:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B1B2086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 08:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s0tHy9Ut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LvoKCakW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B1B2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bdbHBPSiKlwSQJ2NL/iNdra7y5SkTQK13Y+NyJ+zTlg=; b=s0tHy9UtsMr+dGJUrkRZYJOrj
	KHk+X1K52F3bpaecWrSfJ9ybffxdvEJUJPYRIYnz8A6NtUGV+XW/fkE8WCOggEOqvoP5y6Y3ht358
	kI//0SACjf4FH5H5bf5hHsQngh41Yu+OkBaf/usidXs2VbSicLsgHyGcmsHa41p8g7WsnmjbqkuMv
	ucwkEJ1qe/L0C7rmgvkgiANtj9pJbqjibaWFZZJj6sSfVTl5etVTeVekXCEh7vKORxMfl/1oXLIqT
	8BbH47/0rpCn0i+j5vrdzIH4iOa/42ATCa9QQtb3wPmz9DBKuKE++G+q198FNnN1DUCN+idogHA/T
	tYgRtxTRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBZzg-00053z-Ax; Fri, 28 Aug 2020 08:44:20 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZzc-00051j-8q
 for linux-mediatek@lists.infradead.org; Fri, 28 Aug 2020 08:44:17 +0000
Received: by mail-ua1-x944.google.com with SMTP id y15so137719uan.9
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2020 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeXlfnXZ4sTJswhwNtffWf0Y5RYZt7CDOEurreh9XAI=;
 b=LvoKCakWRKLvx/0BHLE5JGzq92yOk3o/lHDjeCNYJRZW2x4PnX4osD+BUJKunyCUj2
 /bqB9UVotpxVrZ5G923Rznp1fq4DzwoO4tD3hKWIMMQNSfyK3iXaOd14ozrYm5Ye5HCq
 0Rzr3iNz8cf5rlznhBgAvVEGYCLwb4S4oXh7MRVdr9zhOVoLT4PZvIkIJuc4utbIjTcz
 UqJF64cJ6Jk/hR8jwWu49mRJ8G2l8vDf+TK1xPJS06hCvHJZ7/rD3Laa0bSm+pCy/iJL
 0Mb1WU+Xtn3sOlJLpNsl3jOqTIEXq6svmJo31r7nkA/4n6OYkyyD33PSoncLANEO2ydm
 Em/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeXlfnXZ4sTJswhwNtffWf0Y5RYZt7CDOEurreh9XAI=;
 b=Z487pL9HXalT/3q06W7p6cBRCmOrjMDKr6CMy3I8TPNTDGiVR7ysU4UmEkGL+qZT3j
 2eZDEauaFdpr6IJo/ewCjdghfwwEk8TTP3vfabriAFTvMI5rlk6mUFvVTdNcFL2JWOT1
 f2WmoCK3ntX1GOjS8+5UBOfAuyp3efgc4WNDeTgKpTCyMSFpzH3hSddZ/mtcxVhfy8X2
 5DgcAzgs+okLJ6B6UUfm78LQJbYm4UzMN3Uvmo1f5i2GVuFdvA6A+g5UQI0Zm7kwoSVU
 E8JZZ6kM9nb+znIVQdlZt2VTaT7IjROVwwqFRtwAMcUYhhCEhUOh6ehBWlqLICTfi/uB
 2Hig==
X-Gm-Message-State: AOAM530qnO/fCf5FsNZfgAwg+UYAgke+ahimCSJxT41Z1cvjjeTsAlDV
 aeX7qCcJZR1flUbMC5yyVHZmIUuFg9xgRQukUzAQ6w==
X-Google-Smtp-Source: ABdhPJxDXAOV/vb6si47r9ICjb8OmqVI+/7MJPxURFzZTGQqh0+TR5mXHiyTJTbQAY+DumtfmYUO31qltv4NzpdAdck=
X-Received: by 2002:ab0:2848:: with SMTP id c8mr283199uaq.15.1598604253138;
 Fri, 28 Aug 2020 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-3-wenbin.mei@mediatek.com>
 <CAPDyKFpt6-a+pkTXb2RZdx=yTONetugSCKbtSsRD2xQ3PRPhDQ@mail.gmail.com>
 <1dfc1938-f5e8-c4c8-57c7-d7b6c33dcb1d@gmail.com>
In-Reply-To: <1dfc1938-f5e8-c4c8-57c7-d7b6c33dcb1d@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 Aug 2020 10:43:34 +0200
Message-ID: <CAPDyKFp+nFq11YcnNSe6sfDx-gkBHiYAjNE+r-OQ8HdrK1LBKw@mail.gmail.com>
Subject: Re: [v5,2/3] arm64: dts: mt7622: add reset node for mmc device
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_044416_337924_A2112A1D 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 4.0+" <stable@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 at 10:23, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 24/08/2020 11:50, Ulf Hansson wrote:
> > On Fri, 14 Aug 2020 at 03:44, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
> >>
> >> This commit adds reset node for mmc device.
> >>
> >> Cc: <stable@vger.kernel.org> # v5.4+
> >> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> >> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> >> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> >
> > I can pick this for my fixes branch, together with the other changes,
> > however deferring that until Matthias acks it.
>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> My understanding is, that this will land also in v5.9-rc[3,4], correct?

Correct.

Applied for fixes, thanks!

[...]

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
