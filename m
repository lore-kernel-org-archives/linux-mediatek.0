Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98487C83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 20:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE9D208E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 20:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJGQBZN5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lxlBvAi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE9D208E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ue7MoHZJMSd747IpxPLiIxg/sWepTKIIixBB58k/Ngc=; b=hJGQBZN5fGFkCv
	Ngcj3jKtGsuAF497Oyo0EwvOCd570FsNVGwJaM6lKO2Bq68L7clFgVULRn3W3gL5esaR9Op2OKvTz
	UWHhG5WZiw8b38EzF5mPOcmIyPliFE9qlS4dKtjes+5CywNZIUHViWzqTbVCyaoDaNEhf61tXxdxl
	9kXqeRlFeMSaalSvh8eslVVv9X6xEVOUk/Xocv1xKYpmqcxEDzlubeXsDVXAzBPWhypJrbTL1rtBW
	RA6qJdDrXfdKM5cMgJo+ti0HA2es5u+gVquTMPb7Pl4Mc09onGZtKgG+ClxrHxgJ0/wZp6iVIser4
	cJqRIaBT6T4LexkLe1DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTWV7-0007ud-DD; Tue, 28 Apr 2020 20:06:41 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTWV4-0007sP-Oj
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 20:06:39 +0000
Received: by mail-ua1-x942.google.com with SMTP id y10so22820590uao.8
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2020 13:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NWN2pTS6iB36h7DaRZrhXtMe3/2D3xJNS6+5ajy+5jY=;
 b=lxlBvAi5+Kp0E1kvuLZIfX3f5amfiRbPoT6rwz3YRt6V2J5+GvjYw+NTGMfqvzrN5e
 8VVsWcLM3UTsASESHTZPQ57s3QqSBVpqWcc2FO4IpeAbwUgcS0LVqe1vsODS2nG7Bz+d
 FscPV1JN0QyruGS7iIFxIIT5zT9F53xrKisX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWN2pTS6iB36h7DaRZrhXtMe3/2D3xJNS6+5ajy+5jY=;
 b=WxVxu/rAoE8XDOiKc+VZzJMt5Vy8ydGBGoHbWfumwIsOjES1xXImmNSQw3+4FW1vcW
 C3wxpWpMZdJoRXWAmqTWH0XiqkFzZEPHhU2ln6SDmD/i7JQvVaFAMtgaVJwkkt80G9sr
 xuPuEhU7SVTDCY7IQWyys3Sh0lFs1HkIu+Xxa4kAWt7pirSgcjNZD+/N4wNqwpCmOUW/
 +LjYB36UODul5jNAuKSy4WJFHn6OvBBBC8g5GxS38I1pU2DkWlvTPJ5WncKqu41pNf1W
 4FJl4AlVXmIqZ3+tO+LRlNavQo136rwOQBtkOLnS2KeDDEXUjdGcGwtSeFJ/dY01jDeS
 laVQ==
X-Gm-Message-State: AGi0PubFCfjt8Lrib9t+gL2aDhNOnaDqOkZJde/F5jL54FsXEL7w3KAj
 yHqvdigakG20N3zDQWtgxqXAYthNSey4eVWKyCRLEA==
X-Google-Smtp-Source: APiQypJ5GASwyuTmq6vb+mMs8GlOiPOB+ZU/74cFC69Z5RtuhkUtZGHT2TQvquei4X23XLIf2FoJH6WJiKs+6iDLpWw=
X-Received: by 2002:ab0:689a:: with SMTP id t26mr24178132uar.105.1588104394359; 
 Tue, 28 Apr 2020 13:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org>
 <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
 <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
In-Reply-To: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2020 13:06:21 -0700
Message-ID: <CAODwPW9STGmh5EZjhxARmY+PFLC_UoQYxbfGoRTD5w4BvMv=0g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_130638_798198_7DA7728C 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> I think I have misunderstood the device tree json-schema spec.
> My intention was for the device tree to fill in a default value in the dtb for
> arm,smc-id if it was omitted in the dts. But now I see that does not seem to
> happen, I cannot really find any documentation of `default`, so I will just put
> a documentation string in instead and force the default in the driver.

The bindings in Documentation/device-tree are just for informational
purposes, they do not have any direct effect on anything. If you want
there to be a default, you'll have to write the kernel code to fill it
in.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
