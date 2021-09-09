Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D65C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 06:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2C861176
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 06:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E2C861176
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZBvc+Dd8zZsmNtenpurYInE+/gnamJpi94ujre3xA0=; b=NIoZQhnIbd8KDd
	K6ulPlNI9TMgwBQtcCYd/mnvAdcaLHkW3gtbbqT50Z85Bg5vQhGn2HEvSh+m4YAJanLWQ4G/hWtoU
	nfdyMPBDN4dIQOxk8VFr7n56cfQPktaBw+UB6r/FrWw5kGnmzcmQgv3ZMhFHqCQefhvCfptvq/1an
	veGhR50cCBBlyzBsqzUR8JtQfq8COxUzeq1H0W5oG7ldUAIIXW24SKh93c0REgCDDKYN2yezIfZ5H
	srX7AVSfY92XIhWdXeg/lc7aYJckygQg+bTJzSnVjmi+m8LZfd6NPYwlVBYdt541Pv0dEmlqk0fOo
	4BX0pHc8TJ3qcwSPszBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODR5-008KrG-N8; Thu, 09 Sep 2021 06:21:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mODQs-008KpK-EW
 for linux-mediatek@lists.infradead.org; Thu, 09 Sep 2021 06:21:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id z4so839119wrr.6
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Sep 2021 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/P5hwYJvg55379EY5nkL2g9RcUJ4Qk0S6irJ7oXfp8=;
 b=W+UD259EkPe7yVYD54ZeuUDK2XXtVw69FdeGCgGEBFc1CDLvunR753GUf7WT+iFzR1
 xKkUS2lpR6AbLXNiuWQgOD2aXBsGT3nBfpYjCUFVAzKHREzhUg5++GCq2MsukyfSBP7b
 fFxDJeEUkHnMc8wr3sq2R49fFTTHOnO2wTn9hQAhEYiqz1YEkTAKWCLklcErvSthgQgA
 VgnyeoAC0pWRRqLkHxcpUjba7yBB42qYhy/UwLJsXITFm/G0vNpwoPqszFJrkRIIWHPc
 Ev3bQPSU9UB7aIrWBNw/99QF9jmLn9igvp0kXG2pJUOVVqjwd05txfn2cKz5S3xQoJ+Y
 U0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/P5hwYJvg55379EY5nkL2g9RcUJ4Qk0S6irJ7oXfp8=;
 b=EaD9GWvEcQ4S02IHiF+ghVm0rp0cOwsaUcWUfhhttXuYeGKqkrFHVBOWI9wNnMb/k3
 g/SwtrUkc1jGGTBz5YNwwyovGcxsnpxWe8qBxMj/6ghcDMzTqzyDwNrboaKzlcjb9/gB
 9YSyHiqVBJcAKUZQEVYdgP+Q1EHmT7A5kd22sYFeyT6N1ZRNrAWdRWhoOEgHkp4XcIKT
 BYFNclaTXKatJVfgeYDGYVECc20G9dz9KJQT//lsy1oP+FdkAxR+lUk4r/IGwZcCSctZ
 GrKSvCpIQmznXn7yWWHxP4Dj4QPZsAzFXsPv9dcUUkmfqw7tB+kvDUYF8n9ZwQND2Xma
 weOg==
X-Gm-Message-State: AOAM531X7ZwPZ+BRFrInu5CmVXgeEhYoqsPjFQFbxZSNI1XglxFgHAWf
 TGxh0RWl+gfCkYkSN717SWuZm22iIryY0Xh6QMo/nQ==
X-Google-Smtp-Source: ABdhPJxyurFAMG5Msr0Cn839JPUJCDt89L5/yYp8G5tPTW+OD2dBuR/hhgmhcIWQX75+UQqZ+PPPAmO3vMDP4BklB9M=
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr1427926wrr.173.1631168464833; 
 Wed, 08 Sep 2021 23:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
 <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
In-Reply-To: <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Thu, 9 Sep 2021 15:20:51 +0900
Message-ID: <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: David Ahern <dsahern@gmail.com>
Cc: Rocco Yue <rocco.yue@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, 
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux NetDev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 wsd_upstream@mediatek.com, rocco.yue@gmail.com, chao.song@mediatek.com, 
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>, 
 =?UTF-8?B?Wmh1b2xpYW5nIFpoYW5nICjlvKDljZPkuq4p?=
 <zhuoliang.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_232110_560360_5DB71B8D 
X-CRM114-Status: GOOD (  15.06  )
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

David,

sorry for reviving this discussion, but it felt better than starting a
new thread about this. We (Android) added a vendor hook for this, but
IMO that's the wrong solution and I think we'd still like to see this
fixed the right way.

> I think another addr_gen_mode is better than a separate sysctl. It looks
> like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
> the ones used for RAs, so add something like:
>
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,

I think the real requirement here (which wasn't clear in this thread)
is that the network needs to control the interface ID (i.e., the
bottom 64 bits) of the link-local address, but the device is free to
use whatever interface IDs to form global addresses. See:
https://www.etsi.org/deliver/etsi_ts/129000_129099/129061/15.03.00_60/ts_129061v150300p.pdf

How do you think that would best be implemented?

1. The actual interface ID could be passed in using IFLA_INET6_TOKEN,
but there is only one token, so that would cause all future addresses
to use the token, disabling things like privacy addresses (bad).
2. We could add new IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN,
IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN, etc., but we'd need to add one such
mode for every new mode we add.
3. We could add a separate sysctl for the link-local address, but you
said that per-device sysctls aren't free.
4. We could change the behaviour so that if the user configures a
token and then sets IN6_ADDR_GEN_MODE_*, then we use the token only
for the link-local address. But that would impact backwards
compatibility.

Thoughts?

Cheers,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
