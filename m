Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C23C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 15:23:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FE96103B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 15:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88FE96103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmQ34e1bERRnoXV22ShaatE8It74KTMD+KszHylqsSM=; b=vjujiFVwGKwfXH
	nuTp9pfjUwRsWlSVZG+LZLDMTKIg0VmPu7Q4KxDo9eXF5YEJIcvRoAfndLA0NcxwUccSV5Zs0d1hL
	mY/hkgYxhrs4fZQl/8/IQxdAezBjp7HZFUOuHhywn4N2UPFw8b6L6/afw8ZhyyHA7rd5hC7iqZ1Yx
	spA/+cPUY4eS+qSu4TK3aK18AYfKKUv+/iFIO7KUs+A96ohHmBFf7Jikzf0JOOK5IYllyzR3uEnmw
	mltH1cGOuayuBG1qj3YH0xIHR0dU/hGgYoXfvEqgq8VO4qJf7W+c0vuN/DEXxQQX0708z3Bg+/95V
	m1O6KnFg3deoiX58PaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPnnY-0029VB-Se; Mon, 13 Sep 2021 15:23:08 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPnnL-0029Sl-Mh; Mon, 13 Sep 2021 15:22:57 +0000
Received: by mail-il1-x135.google.com with SMTP id a20so10494130ilq.7;
 Mon, 13 Sep 2021 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3xQ+qOmUBpF0Ou2q2vDoKXn215jIxD4ZZAE7jcxIbx4=;
 b=Y81hrVKOK9tYm05otw8d7wclpAAMZSGhbSXyEOHLioWGSmgyk0e3KmBtGgDzf/v4S3
 bcoGBjLV56VFnnuVW2VlQYXcPMTGZdJh7FpG5KerB4iLbmTiEfPXaFQT4To2o1rti3I+
 Ty/Z+oIeCCpdtrxV8rfFS7m/+chrh/zD+SDSJF42o/53qnGnGdXCqRfL48ed0KrPnTMz
 CGZYxcUJApwkNl0NHztEPjmhh11tAOht+4Ui98kj8O3zYWFEnoh90Ki7LLQ6RL7hZnJv
 xAtDueGry8LowtTuzAjfQmADuYwi35UVsjcYrcpzN25LtK5G3NkNWBADz/Nx2Bb7qMzB
 BJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3xQ+qOmUBpF0Ou2q2vDoKXn215jIxD4ZZAE7jcxIbx4=;
 b=xrz57i+L9Yqoe/aaxZTGSNkDeV+7qdy+RB2md2blvtQRxpqOCnBecuPinY3IEzu/Bj
 yg5YeIbAmeweF/3lUi2faGcg7wlNMz2eHkfilwyEYtISMD/zw4dOjkwXfOyFJmrqQ237
 g2jbBIJckDxwdHfh9e1agra5LCwL7DRieDlfvyGziVCPJEF7SCCmaFta4RTOgdrpnPQR
 OIKXcrOTpfwITk1b12ebczoKFYIErHTOxkcyEskYu7rCIKC7RFRNDzTtrDMvCZzE286t
 VPcDG9+kjk2GjDrfafbgmUxneNGDVAPhex0UNiCy02ugcFZIcQkuQPREmP7DWl24mwkv
 PhYw==
X-Gm-Message-State: AOAM532wCVg40NMMwdajYdcJ6z6jxPaL3+TXMDpfFdnWfnMHpSKyb6Dl
 OOb2Mq3DHUOUVCZGudzRVdDQ5asoy27jw7vK5Ng=
X-Google-Smtp-Source: ABdhPJzzbFmXjdHQqSdX4Jm9ZMFbQEwcjIYeWzjMD1oRLTc8vnnWyBGHezf3xQYAd0kJtZ12NvWMLjFruqb+Xv36cJs=
X-Received: by 2002:a05:6e02:ea2:: with SMTP id
 u2mr8664451ilj.133.1631546574861; 
 Mon, 13 Sep 2021 08:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
 <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
 <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
 <6a8f0e91-225a-e2a8-3745-12ff1710a8df@gmail.com>
 <CAO42Z2w-N6A4DmubhQsg6WbaApG+7sy2SVRRxMXtaLrTKYyieQ@mail.gmail.com>
 <CAKD1Yr2jZbJE11JVJkkfE-D8-qpiE4AKi87sfdCh7zAMJ-tiEQ@mail.gmail.com>
In-Reply-To: <CAKD1Yr2jZbJE11JVJkkfE-D8-qpiE4AKi87sfdCh7zAMJ-tiEQ@mail.gmail.com>
From: Mark Smith <markzzzsmith@gmail.com>
Date: Tue, 14 Sep 2021 01:22:28 +1000
Message-ID: <CAO42Z2wxZf260tupJSZVxJi-Tt4Y5L5WHja3JKTrQOSxixgViw@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: Lorenzo Colitti <lorenzo@google.com>
Cc: David Ahern <dsahern@gmail.com>, Rocco Yue <rocco.yue@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20210913_082255_812438_EF7D0059 
X-CRM114-Status: GOOD (  18.80  )
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

Hi Lorenzo,

On Mon, 13 Sept 2021 at 19:38, Lorenzo Colitti <lorenzo@google.com> wrote:
>
> On Mon, Sep 13, 2021 at 12:47 AM Mark Smith <markzzzsmith@gmail.com> wrote:
> > This is all going in the wrong direction. Link-local addresses are not
> > optional on an interface, all IPv6 enabled interfaces are required to
> > have one:
>
> The original patch did indeed disable the generation of the link-local
> address, but that patch was rejected. It sounds like the right
> approach here is to provide two new addressing modes:
>
> IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN
>
> which would form the link-local address from the token passed in via
> IFLA_INET6_TOKEN, but would form non-link-local addresses (e.g.,
> global addresses) via the specified means (either random or stable
> privacy). I haven't looked at how to do that yet though.

I think there is a broader issue here.

If RFC7217 is used to generate the Link-Local address, then the
likelihood of the Link-Local address being a duplicate with the GGSN
is very low, because RFC7217 uses a function such as SHA-1 or SHA-256.
RFC7217 also performs DAD just in case, and triggers RFC7217 again if
a duplicate does occur.

RFC8064 recommends RFC7217 for all stable IPv6 addresses by default
now, which includes Link-Local addresses.

Following RFC8064 by Implementing RFC7217 for all stable IPv6
addresses the Linux kernel generates would solve both the 3GPP's
duplicate Link-Local address concern, and also make the Linux kernel
compliant with the latest SLAAC recommendation for default IIDs and
stable IPv6 addresses.

Regards,
Mark.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
