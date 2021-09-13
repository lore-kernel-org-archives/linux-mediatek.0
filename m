Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A0BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 09:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BE860F23
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 09:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38BE860F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5jPltfsc/dP3DBsl5CgA4UrnhTWRMkjFHk2yPE2ztM=; b=qXzIO4j2r+27AP
	bsi0z5hrijHKngMAmh4PqYF8ddMa2ewho94I+TMqgEsEPcQZnYe76H3nR41S5+32F9nFKa1908nL1
	Uapgtu0nyAGFUxXgLr9ZqSesfXRyz+CpC3C9+/+IGL0CMfds9BSSw/dKjRnVn4i0WLJqaJ3iDi/AK
	Te19ML+156PwyRds61auLhf0Hpr1aadepqKwx+2hwxIo9bGWl8VL6TkF3g6CXKO1yY36P9nNJqvvB
	I3U7U2aoSy1lip3rJP0wrQVflgh1R3vzxcFQpKpkKcm8p+0al03CMai7fTZ+qvnOLQ8aO/aF9Xlk2
	PhZLY0BHq80L3l7RXjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPiXc-0017bm-Ul; Mon, 13 Sep 2021 09:46:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPiPw-0015yf-Dm
 for linux-mediatek@lists.infradead.org; Mon, 13 Sep 2021 09:38:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so6113461wms.4
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GgdGwtNZAbTBYuLX1/1vRJaXhwTs+Iu+RSqf/65W9qI=;
 b=iUDhQQW0GwwEZyLSrD/MdTQAwu0lwZP8K9T2F4I4/CZdhgjMplIXUxAATPchIzVnRU
 WOIMc12KJK7jY0mVzP7F20hbpwPJRi+WFETkBv+Y02d64GXFDMCsh1pRLiDc+pW159rF
 I/8MKdcHuDAnKzcauVZULM+HrMFVqgLkEc/5pUDxBEhPXUGE4CoP6HFID9WGFxVIjIUF
 JcqBLhtmP9B/4jUaJ1V0f1ETYXnl2AkyhGnhoErpEFJDDPz7XNRbDLvO86DlV8PXKwED
 3Y+GhatOSf2bXqNlyF3lHI4aLGXxsYjyNf8PBS/EGJcLaN8LDadqjB69Ogp8uTE+7oiD
 92rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgdGwtNZAbTBYuLX1/1vRJaXhwTs+Iu+RSqf/65W9qI=;
 b=AsVrEc+6U+H9VoZmX1YLp8hfglpmPSscIY3gFFFEmX6K5GYHnp+fDBT4L3jRBt9JNt
 UtWA+r3h5CdxCktoBXNklWJalp1RlQbl8ZXquEymjecch1Z5pnSTJVVEI0lx8OklwvOj
 awVfs5MpgvzJd0aHGTzIKX+oeRwCd1ch4WMCHy6QlHT2GvJfkMEWiPp9rWCROMKoqQdx
 pPEoI3uHKrA0pgspGP1R6bhtBZQTi+MqjtlN5pFrKy7++ZCaVPKIjaXh6OynMsjoSHRi
 qDbxcuUXAemDwc4+UFN20B+oKKg96B6Ko7Ib/y8wu0KTgr2yHgxt/dyshYjy1jRfbVC8
 u5MA==
X-Gm-Message-State: AOAM532HtujtJgHnz+CFsaBsNoAdR6uLM9r7PO1FYfae1niCjlQkK3xj
 gsCygbDHuLgt3jAZ3hjNwAg6OMM0XiPuQK2fgyRqkQ==
X-Google-Smtp-Source: ABdhPJyW9K4gP2TJxkjRNTy5yov3L17WhGLT+BYWYSz7chVK5eZMsnjTqAs6t07eU237vsAJ5I1XI6GeJmQoYyhUhwc=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr10484211wmg.88.1631525899229; 
 Mon, 13 Sep 2021 02:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
 <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
 <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
 <6a8f0e91-225a-e2a8-3745-12ff1710a8df@gmail.com>
 <CAO42Z2w-N6A4DmubhQsg6WbaApG+7sy2SVRRxMXtaLrTKYyieQ@mail.gmail.com>
In-Reply-To: <CAO42Z2w-N6A4DmubhQsg6WbaApG+7sy2SVRRxMXtaLrTKYyieQ@mail.gmail.com>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Mon, 13 Sep 2021 18:38:06 +0900
Message-ID: <CAKD1Yr2jZbJE11JVJkkfE-D8-qpiE4AKi87sfdCh7zAMJ-tiEQ@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: Mark Smith <markzzzsmith@gmail.com>
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
X-CRM114-CacheID: sfid-20210913_023824_609791_FA079E88 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, Sep 13, 2021 at 12:47 AM Mark Smith <markzzzsmith@gmail.com> wrote:
> This is all going in the wrong direction. Link-local addresses are not
> optional on an interface, all IPv6 enabled interfaces are required to
> have one:

The original patch did indeed disable the generation of the link-local
address, but that patch was rejected. It sounds like the right
approach here is to provide two new addressing modes:

IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN
IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN

which would form the link-local address from the token passed in via
IFLA_INET6_TOKEN, but would form non-link-local addresses (e.g.,
global addresses) via the specified means (either random or stable
privacy). I haven't looked at how to do that yet though.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
