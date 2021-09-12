Return-Path: <SRS0=wX2S=OC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FD4C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 15:48:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D4461050
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 15:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20D4461050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42yiuHSHPqPxFw3JrcPL8jG9vKtJPAsXFhLWIgsZFAQ=; b=Gcvxe1j50eCI6f
	gz0bjCgJ3+klHyL3+Op2Dkb1FO52PRUGwnpwrlPRigh/NtlcCd477Ox9HyaLFxio/EDaXiVdfMgQT
	5ccqSTWNkLR6LPmqfTCMMTGu0Fe3/DhDfmAGiTJgI+iQ+mw26VjwYGNTiEUAWJd8NUeD4efBGX5Pi
	YEAtMqG2qlWlry3YFxNoVgKsd3l3MOIH3GvRqY/iW8ixLJupcQEhPZbpBrGHunsWbdqQLAhz/fEdu
	5riRtUsWyD4tKPWmo9T+1/STPGbU9TEkefs8vmcBkYE02Ms4X+w0wGJ75zx5ur35wDexfmef/Z9L8
	WPZ6Yz+Y7scaDB6q1Yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPRiH-00Ge66-Oa; Sun, 12 Sep 2021 15:48:13 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPRi3-00Ge55-TM; Sun, 12 Sep 2021 15:48:01 +0000
Received: by mail-il1-x12d.google.com with SMTP id q14so7481985ils.5;
 Sun, 12 Sep 2021 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cPkzcfwNwxgJOxDHusgDua/GLlzUyV1sT7cRLrqVIY=;
 b=T0B9UeEXX6XuXChfxeEaa1HyFgsxyOEs0AvFV5fmc6Yl5dxyuQ8npoilTObmTPf07C
 Vz6dqthacOzTAI3kJR9r3U39J9lkkvCr3LGRiiql4QWpOMyC97HMjcxvQQ6LlJA59til
 s1AZetRTeTTNQlfOdM+cNjV/pxj9E4y3W8sZDBqOiLA5U63Fx0z8EfYP/01Oip61qXIP
 tGnsspjmBXHCYlkQksBbzusXi+hT5i/PtBnKS4Quug1OW4Gk9TUwnvvRR1HpTvl1mluS
 D8rJOPJzq5tMd/zONY/asv1nhUnXo3OEQfZ4XdGHdPhGBmtKcCms3Uq31lqe8/vbCZxJ
 2krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cPkzcfwNwxgJOxDHusgDua/GLlzUyV1sT7cRLrqVIY=;
 b=DQeaad6ZRxiQ46rd7c61cYK/gFFtW6e3L24TqUbrBkdV6TEfbwwQ1eKev+5TCDeh3Z
 YjHO0D/GlLXbQweFKeYMCSFDkX/crI04799CJuPsrIBcfcLX/bW+a2CpmZ1u7qnZaLx6
 X6DJ6F9Q3gJdN/ifa/Pd9Lq+CJtWiZ9fI0MonDzmV4uC7p8hx7Rt2hjH1sARnxtVflVB
 Aw/UWZVDT/Wv/nf2JOYaIsFzcKIBHEI9HK3dkUB+tYNBzzVXSteCvIcNAjNxzCRydAqb
 RANh+30IBwRQwqm+jSxEaNOPzAD7p+JRukAJxYzFIofMYDPSMpek4/eu20VwXt11HHqx
 Jy2Q==
X-Gm-Message-State: AOAM531vw2Fet8hYEnu+6lIiMtmR0J6BokHU+nx7EyaKM3BvWeCSlACr
 R+Tz0aPJBlx9J+hx3hXDXDxVcJ6++IIEnAC24Cg=
X-Google-Smtp-Source: ABdhPJx2+2K2twbtnoUH0gCCdBnbXVeSkbhjZE7YqcnTanAlNqyA0bYVUpRhFw4wE40mQOuL1FawwN02PbEtoEqVpU4=
X-Received: by 2002:a05:6e02:48d:: with SMTP id
 b13mr603680ils.171.1631461676527; 
 Sun, 12 Sep 2021 08:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
 <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
 <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
 <6a8f0e91-225a-e2a8-3745-12ff1710a8df@gmail.com>
In-Reply-To: <6a8f0e91-225a-e2a8-3745-12ff1710a8df@gmail.com>
From: Mark Smith <markzzzsmith@gmail.com>
Date: Mon, 13 Sep 2021 01:47:30 +1000
Message-ID: <CAO42Z2w-N6A4DmubhQsg6WbaApG+7sy2SVRRxMXtaLrTKYyieQ@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: David Ahern <dsahern@gmail.com>
Cc: Lorenzo Colitti <lorenzo@google.com>, Rocco Yue <rocco.yue@mediatek.com>, 
 "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux NetDev <netdev@vger.kernel.org>, 
 lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, 
 rocco.yue@gmail.com, chao.song@mediatek.com, 
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>, 
 =?UTF-8?B?Wmh1b2xpYW5nIFpoYW5nICjlvKDljZPkuq4p?=
 <zhuoliang.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_084800_013144_495A1608 
X-CRM114-Status: GOOD (  30.87  )
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

This is all going in the wrong direction. Link-local addresses are not
optional on an interface, all IPv6 enabled interfaces are required to
have one:

RFC4291, "IP Version 6 Addressing Architecture"

"2.1.  Addressing Model

All interfaces are required to have at least one Link-Local unicast
   address (see Section 2.8 for additional required addresses)."

Regards,
Mark.



On Fri, 10 Sept 2021 at 05:13, David Ahern <dsahern@gmail.com> wrote:
>
> On 9/9/21 12:20 AM, Lorenzo Colitti wrote:
> >> I think another addr_gen_mode is better than a separate sysctl. It looks
> >> like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
> >> the ones used for RAs, so add something like:
> >>
> >> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> >> IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
> >
> > I think the real requirement here (which wasn't clear in this thread)
> > is that the network needs to control the interface ID (i.e., the
> > bottom 64 bits) of the link-local address, but the device is free to
> > use whatever interface IDs to form global addresses. See:
> > https://www.etsi.org/deliver/etsi_ts/129000_129099/129061/15.03.00_60/ts_129061v150300p.pdf
> >
> > How do you think that would best be implemented?
>
> There is an established paradigm for configuring how an IPv6 address is
> created or whether it is created at all - the IFLA_INET6_ADDR_GEN_MODE
> attribute.
>
> >
> > 1. The actual interface ID could be passed in using IFLA_INET6_TOKEN,
> > but there is only one token, so that would cause all future addresses
> > to use the token, disabling things like privacy addresses (bad).
> > 2. We could add new IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN,
> > IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN, etc., but we'd need to add one such
> > mode for every new mode we add.
> > 3. We could add a separate sysctl for the link-local address, but you
> > said that per-device sysctls aren't free.
>
> per-device sysctl's are one of primary causes of per netdev memory usage.
>
> Besides that there is no reason to add complexity by having a link
> attribute and a sysctl for this feature.
>
> > 4. We could change the behaviour so that if the user configures a
> > token and then sets IN6_ADDR_GEN_MODE_*, then we use the token only
> > for the link-local address. But that would impact backwards
> > compatibility.
> >
> > Thoughts?
>
> We can have up to 255 ADDR_GEN_MODEs (GEN_MODE is a u8). There is
> established code for handling the attribute and changes to it. Let's
> reuse it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
