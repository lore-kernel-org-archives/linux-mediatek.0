Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9012DC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:15:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B6B6193A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B6B6193A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S69c2fZG63Q6Sw1/l2QlxiBgMLgHrrVLBBMq/IvTLew=; b=cfrCb2l6P2RFYbVBTxLo5FVQ5
	JfCHeV1hWJDAFZWlmhP358OPyKuYZlEUBKY7+yr0rCkx0SRU+Cv8075OK1uwDbASOV20POem2U5Z3
	urCO3CAytYxFvqVg/H7FPVhNFSfM3ZtDMgXvGGwhHyib+UmZ9/wGpRTyQCdtm2/MtbrPhtauxu2Ff
	SCPGg/Lc1ZntWnuY8uAoHz8GJTSBwcix7K+FEji4XOgk61KDcCrzpUYqbTbAMso2B/Ke7Dtn9L0Bu
	nNtOcLkDpF52eUx5A4cQ8j/GKLWPzj2ig9D/vp5Zfa2p13VLpAW0NpJxe0nFhmyKVfrc50Cmi8GON
	p31IlJtqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0A8-001dhC-Nm; Mon, 29 Mar 2021 22:15:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqQz-000d0b-Ab; Mon, 29 Mar 2021 11:51:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id x26so9753795pfn.0;
 Mon, 29 Mar 2021 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22q/rnIFf04g2bHvYP9IaYNVB6ChoxCOoOAEpANlF8c=;
 b=PPUECpN3NaU1LOUyfkCBNOjUS7K/DWzfzhdYwYQzBIT7urdLleyKkp2NITseQblARU
 AjmYDrFj40KoDHE+MH586Q0zI7GdiLzKTUMrfrJpvW9jCHX0IDEy+qU3wk8HIJoUV+Tx
 VxcxUANtGOBZtQPnmyLdoCL/MwUA/lNQbAs+glDDsvaF5Y9eoMWqX43pCyGEQyenlYtx
 W6Yv4sApBIioMI6HWQtHrw5QPj390J8tZNk3MGEAvJkISWyyOqg0/ObPKxJRBdJyIp7M
 9iGFm4lwX4FfCjHI/HDNKKeeh6kAc6qMPVWrat9QBtkdutHgpBJTmF5tP8bkuSrWSjkF
 Fr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22q/rnIFf04g2bHvYP9IaYNVB6ChoxCOoOAEpANlF8c=;
 b=bv2SggSijkcsr+8GIo+9JiKvtpttHe0iYBXY5NTW/zCtr08noULrEK7Ux2fg/6sCxd
 zy6b9AEs2wao81qnch0/JT+dfpe5hvS22ndWVujwaP9ExfzL9yT9jJnnr+GAJNuzujM1
 rjAi/iwOqVWRvnGzq0ScFq/9Fk5+YCCej9wlZBcW45R2dakrkbJm/6uQzz5OBq7oBQlc
 J9hDZN0bADvAd0HkIj3ArPTjlPUGyyNYBMwbqe7QcEpXQmJT7cWfuc6XUGGJcPy0hnWh
 AK3+byyYrTiA2a8sqVup2qgdB4XNfamS635W/AF5yHYavZHT8mazJI1txyvEk/u8SsbW
 IXNQ==
X-Gm-Message-State: AOAM532S7FP6aJCfQqKC6zuUeFP1aMgyhmUR2HRPNs+PnvF57n7GP4QJ
 oajkoOTS79wSauzN3d+8iAmEc+JDVtbEcPC/n3w=
X-Google-Smtp-Source: ABdhPJxeX2YKkkL1Wn3mbW30JRjOL7XccqnaAdP2WI1jlb4FtEfmc9Etd2/R693+HElvCs17nwB2CpttKjuT4fEOc9M=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr1003785pgi.4.1617018711823;
 Mon, 29 Mar 2021 04:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
 <1617018585.10316.9.camel@mhfsdcap03>
In-Reply-To: <1617018585.10316.9.camel@mhfsdcap03>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Mar 2021 14:51:35 +0300
Message-ID: <CAHp75Vevt4aLoCj5rFGErPjKYqs=Ve1xohYRzET1cg3LCrb3eA@mail.gmail.com>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
To: zhiyong tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 sean.wang@kernel.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, jg_poxu@mediatek.com,
 biao.huang@mediatek.com, 
 hongzhou.yang@mediatek.com, erin.lo@mediatek.com, 
 Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com, 
 Sj Huang <sj.huang@mediatek.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_125153_652064_E78C7A9A 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 29, 2021 at 2:49 PM zhiyong tao <zhiyong.tao@mediatek.com> wrote:
> On Mon, 2021-03-29 at 14:35 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 2:32 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> > >
> > > This series includes 6 patches:
> > > 1.add pinctrl file on mt8195.
> > > 2.add pinctrl binding document on mt8195.
> > > 3.add pinctrl device node on mt8195.
> > > 4.add pinctrl driver on MT8195.
> > > 5.add pinctrl drive for I2C related pins on MT8195.
> > > 6.add pinctrl rsel setting on MT8195.
> >
> > Patch series w/o version is de facto v1.
> > Dropping to v0 seems not right.
> > You missed changelog.
> >
> > So, send v2 properly.
> >
> > Material to study:
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
>
> Hi Andy,
>
> There is not any change between v0 and v1. so we send "Resend v0" as v2
> in this time.Is it also properly? and we send the version which is v3 in
> next time.

Sounds good to me, just make sure you put a changelog explaining all
these history twists.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
