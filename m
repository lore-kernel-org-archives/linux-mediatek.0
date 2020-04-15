Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA791C2BA19
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 23:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F3B20768
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 23:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VsPJm31B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbf+wIu4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F3B20768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBx0M7cWjCLUjUcGfB9r1fZjEyjTnVOknIokDQaRXhg=; b=VsPJm31BfTeXe4
	dgdGT3gGzM0zsKIobrKoqOtiiMmozqUHhNbI2P+v8u5WgVVTM5Eku7byyi/WOR5EwhwLr6cpYy78d
	cmt2jqnmhatuwhkphM9r5tcQ1shl5Rj07m6/TaCqP2fQeMkexRGix3paKmaVOBLC91Onj182jh3MS
	XQle0JmIovpMpRIqAH104DHEt4QD+tTME8GbryozRfQuFdDSCuCVTwW4RT+EIIokv+oqy5sLtNfZG
	kBQZeiS4UtKqSRHp+nQqaKBE0xZWVGdYfxtXn18dKaMPq6j35z9p7orh/kJGy+lcEXnj8r+1mzHZv
	d15bRHLqeYYPO/TwG/jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOrCn-0001MJ-Ck; Wed, 15 Apr 2020 23:12:29 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOrCe-0001Fq-Fe; Wed, 15 Apr 2020 23:12:22 +0000
Received: by mail-pj1-x1044.google.com with SMTP id q16so467234pje.1;
 Wed, 15 Apr 2020 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F4xy1ePNo4/sZnGsQ3y2Wap+w9rXMc+z0VuLe1xlqjQ=;
 b=jbf+wIu44k/DfZ3pl3RN+n8kY8thZUYIw2Ipq5qKiQqOd/un49pRkXwqToVPR3gfGM
 5lzD4YNJtHJ0TGIWKmkezhGKrohuQUNdMiKAzjgH4WQ0s5uhMDPh+7VtzTnU6ZF7LMYL
 AArC6zrxH/IvRd+ZEHod9VC+ODN/CPXgaHPQj7INdhHFYuBjxAOOaGhNwOV7dUpyS2qz
 vvderTdPOUm401Bji072y+qFP0V/DdRRmegOHp2CObNYas3awA3FjgTC3n2QM+RjU7d1
 sW2K1ZtsER7ExRKQfhhSylNPe65vHzYtoQLWVx1cmcLnuRLqHO/Y05+1qQq5GFHPRxgI
 KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=F4xy1ePNo4/sZnGsQ3y2Wap+w9rXMc+z0VuLe1xlqjQ=;
 b=A+XpXVTgd39a0oKxerFoV1V8kRtqAAJz+g1sIR4hcw/coe7EUXI826UaK/CkBvMBpL
 briFysuNi+/MHC8tJtizxmmt6xj2L09LQf69DXLu0kOsgA8osrS8BmKaJwBEN46OrGPI
 IF5sVilxLK/0FCAqICfhgby8DEyLGUBi9CTFWfn2FJF0y+6WIzOuWgmnCssikZgl8pBu
 sRHJk1awEohXyiRIhTbM0Md6OaiqPN0wP63QYNTn18eUBMG4zIdcH37ehgKtTz0vLUE9
 aZ0KlfQ4i9wXWq/UEwFRaNrKYVUzsAx8/wNH3vNR2bh6hMpvgHXuYPgDRDmhzeA43RDD
 BMtA==
X-Gm-Message-State: AGi0PubH1bRlykCg2K35+2Jw7JaWA9rdaNP4yjEib8aQGIoDdc/xvX9L
 uWo+7vgKNBitN4E4NrDlvZg=
X-Google-Smtp-Source: APiQypIYdvm0Liaxe68090I5H87tFeGCrKfeq9nu/dduUJbnTStMnEQZdx4m1HvArqBCM2DSzI/AIA==
X-Received: by 2002:a17:902:7289:: with SMTP id
 d9mr6991775pll.49.1586992337834; 
 Wed, 15 Apr 2020 16:12:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l71sm9190804pge.3.2020.04.15.16.12.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 16:12:17 -0700 (PDT)
Date: Wed, 15 Apr 2020 16:12:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure
 Monitor Calls.
Message-ID: <20200415231215.GA182398@roeck-us.net>
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_161220_546213_1B75DC32 
X-CRM114-Status: GOOD (  20.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Evan Benn <evanbenn@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 15, 2020 at 03:29:29PM -0700, Julius Werner wrote:
> > In addition, It looks more reasonable to use the "msec" as the unit of
> > timeout parameter for the ATF fw interface with SMCWD_SET_TIMEOUT:
> >
> > - The fw interface will compatible with the uboot generic watchdog
> > interface at [0], and there is no need to convert timeout from msec
> > to sec.
> 
> I think we're trying hard to keep this compatible to a Trusted
> Firmware counterpart that we have already shipped, so we would prefer
> to keep it at seconds if possible. That's what the Linux watchdog core
> uses as well after all, so it just seems natural. I don't really see
> how what U-Boot does would have anything to do with this.
> 
> > - Some vendor's watchdog may be not support the "wdt_trigger_reset"
> > reset operation, but they can use the method below to reset the system
> > by the watchdog right now.
> >
> > watchdog_set_time(1);  //1ms
> > watchdog_enable();
> 
> They can still do that but they should do that on the Trusted Firmware
> side. Emulating a missing reset functionality should be handled by the
> hardware abstraction layer (in this case Trusted Firmware), not at the
> Linux API level. So Linux would still send a PSCI_SYSTEM_RESET SMC,
> but then Trusted Firmware can choose to implement that by setting the
> watchdog to the smallest possible timeout (which it can because it's
> accessing it directly, not through this SMC interface) and letting it
> expire.

I agree. Using a watchdog to implement reset functionality is always a
means of last resort and should be avoided if possible.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
