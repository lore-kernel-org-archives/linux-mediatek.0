Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC18C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:59:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A30E720721
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 13:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkynjWta";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TZEsQQmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A30E720721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4mODckew1abwQz8vELD3A5BDsW4rjaPN/nbvQbfzmQ=; b=nkynjWtaydtbD5
	0B377oiVKphv0sCnirzORIxUlbzc2fn1gSkDm7KHM4SFdanw+lcRx+bve4NMkksbdStWz15cvwt2K
	WmlHv5Mnp07a4pYI8liXka4r7rt3ljFtvEDmFeo415ydXSEEKhe7gCqxv4zQ2CMCDr52Xr588+dJG
	xt7oZ3lO8YbaIrcjWi3dX1fib1yjD6HOimhC7kEI0ROdOSrHkEBeOFfhIwySKYBOryha09cMJEP3J
	BGUkyC84ql+LCYoc+xAylnLvb8Ylw7XXsztaTnWv0KukFeUmE08ZXLjJibG8WFYBsua59UK9LenkJ
	I/k4ldNo4dlEvMb4167w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbljc-0004vi-UF; Thu, 21 May 2020 13:59:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jblja-0004v2-8s
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 13:59:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id s8so6738655wrt.9
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fd27zalAyz5wmnk1UFuL/3CVJVB2Mbru00pqm3YvwKU=;
 b=TZEsQQmRmAtlsPZ6hEPx1lfN+WVfX9faQiHdd1FC5rdGKNoEokI5y6RqM2R5AunejI
 u538EoIRYq37DBlxBdB5BCNFnYNB9Adj3e0xFr5JZI02zmw4mzuluXYm9cnjbvpKyKgs
 AgA/U/12lSi6ar8khG8bQKCe9ydhwDp5gYliM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fd27zalAyz5wmnk1UFuL/3CVJVB2Mbru00pqm3YvwKU=;
 b=PfZAxVUM5OKPExye5vZdaKxfaYfGWUHjYF3tJ3aSGjC/Bi9E4BQIniguwQRdYWra4+
 TjaJ3T7Jui+a+yUPQlp7a+HPwjVEXxwD9qPGXQHKeVr83N9wetu89RfpYZMx18HSyEqj
 lH4XocPdl1VpHPrYF8MD5N51zEEkVmUP6rwyspoEi2dDbzStaRb7G1NJA6MRxiqWFzbB
 NLnA3edlIFTB7FNKDmotW2bYR08CUHL9B2Jp7v8lQr2wGIgm1XHmD0Sxh7S6Lix7co6+
 CVcIQdXJbh9vXjy0E2cBuj2gf2EuBEHISdDUYgfs1/I1FEK3KaDYVZ86FwhShXKYQyOx
 VW8g==
X-Gm-Message-State: AOAM530boDhIikROXs3T6I0mLC09/UyBDi8dD310iZeO0xVo1cXvHqqD
 tl7j0EdwTgnVpuhZE+/varRIbQ==
X-Google-Smtp-Source: ABdhPJzYH1Ehd7L4WwVhzu2u//nGcgv2AbmGEgmxLvE9GqtTmu1vDDGQKL8r/UbPrLf9oXWCdRfLAA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr8426488wrw.349.1590069580276; 
 Thu, 21 May 2020 06:59:40 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id c17sm6505348wrn.59.2020.05.21.06.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 06:59:39 -0700 (PDT)
Date: Thu, 21 May 2020 13:59:37 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v8 04/14] media: platform: Change the fixed device node
 number to unfixed value
Message-ID: <20200521135937.GD209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-5-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-5-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_065942_341839_28719153 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:23PM +0800, Xia Jiang wrote:
> Change device node number from 3 to -1 because that the driver will
> also support jpeg encoder.
> 

Thanks for the patch. The change is correct, but I think the commit
message doesn't really explain the real reason for it. Perhaps something
like

"The driver can be instantiated multiple times, e.g. for a decoder and
an encoder. Moreover, other drivers could coexist on the same system.
This makes the static video node number assignment pointless, so switch
to automatic assignment instead."

WDYT?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
