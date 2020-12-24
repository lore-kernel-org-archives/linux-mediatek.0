Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C3FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 12:02:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3562B22288
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 12:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3562B22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xC8Vw1cMQu4HUUPR9KaECRaITSNh/Rhb3f5A6UZVV/s=; b=pjkRwJ4llzr3IejwZNWBoDNm+
	3RMzgGfLUtp9D2/qEwnrbhPLIfmszUxTEPaBY9d2fim5MkMG7rJ/Ar4sxOEx7Ou6+wSszzQA8VKMe
	ExUo/wSIIxBFJoD8uYIElBWY2pn7DHqNP5lcdocrKQd10sGko8YBis4qVYwthqhMIMxy9VyeU3iBc
	+43ShkfwT4tJ1SFPnfpIDlZLu5Iih/pUFseaofz2Sip2YIwtH1wMF0LSYEqEwGCDN5+XMo/wuUwtV
	MRcbS74taVrNBVciqyJ497oRYNMsrkgOov+3rClCoS2hcpGQQEgtQgNVClLTA6O6B1oPkDK+lZEXe
	9/oKEadAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksPJX-0003mr-Gw; Thu, 24 Dec 2020 12:01:51 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPJV-0003le-2x; Thu, 24 Dec 2020 12:01:49 +0000
Received: by mail-ed1-x52a.google.com with SMTP id i24so1939720edj.8;
 Thu, 24 Dec 2020 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yzsn8Vxs757yl7BHdUzFyubVzeoZHsr9IiDUX1zD8zc=;
 b=FpJp+IlhsmMdNnsUqF8aI4pdK4FqwjQh3HB1yyOQIt5Oo0ZFqETQgxAIFM75ALPYTC
 FvCI6KxRazcUKJc4c7WkI8DPN6DB+hJJdNJCddYF72hMQSFIuqNK9O62j7zRLj80BCLH
 ozLQeLNCX9wiChonQ+oaCk5T8vEUXITckpEqLJ951854ggOsigYdJXWWbrV6C9pJ1Emn
 g8WMns50PjTT0KBOneP7R7ulTEJccOt3fC93pewVXTJbouAgu/g/A/fUDnjLFXhbpYJo
 2f5QQJa1ZuZLmzOFiMSNNIRfnsj39mZ7NuL1eui6Z2dfv/0vNVm96mrM8eF9z0hzBimw
 YSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yzsn8Vxs757yl7BHdUzFyubVzeoZHsr9IiDUX1zD8zc=;
 b=O/xPX4oruuw2nAwavucyZA27ujEOJF4GcZoNi1cKJ9ecGZ3D6wldrx9/GFVn8piuL6
 1YmwHQGr2ChLSpiueoZPiEvYGCLmejtD5mOqXj85P4J3SuhFrQlOsGgK3AD1+rJOROBP
 ief6SWTktRPgHKVGCOhtPM1vUeEBWhY+M/z8xGi9pVadj0I3+RL/CtWWrx3v3jFuZd8S
 xNvLOWkSnQNHg1zUiizrEQgvyamS9XV4hBe8yY6sEVuMvLmZl0IlP1dg1hKGt7YzTYtq
 cXhRry3sEI+GQIshMwDO0xTkUPir604VoQSuwUUP6BeOf+h8YSug7EqDk3fo/P8A81Hd
 5MKQ==
X-Gm-Message-State: AOAM531UtkGP+hANR8KWUSgLE/6bxikBil28B7/q1jE9VoR7lIKSc596
 2CCksNlw/kFzLLweGbMYVfg=
X-Google-Smtp-Source: ABdhPJxLczptfWF++SxwxaJX138UWcvlI/ti2uNMxZ4xxghDoEqg027sexvcopSPGShyw+hEBUxv+w==
X-Received: by 2002:aa7:c2d8:: with SMTP id m24mr28190070edp.300.1608811306048; 
 Thu, 24 Dec 2020 04:01:46 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233])
 by smtp.googlemail.com with ESMTPSA id i13sm22800403edu.22.2020.12.24.04.01.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Dec 2020 04:01:45 -0800 (PST)
Message-ID: <5eb12622222bd9ba5e705801a204f3160ba3966b.camel@gmail.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Bean Huo <huobean@gmail.com>
To: Avri Altman <Avri.Altman@wdc.com>, Stanley Chu
 <stanley.chu@mediatek.com>,  Can Guo <cang@codeaurora.org>
Date: Thu, 24 Dec 2020 13:01:43 +0100
In-Reply-To: <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <ff8efda608e6f95737a675ee03fa3ca2@codeaurora.org>
 <1608796334.14045.21.camel@mtkswgap22>
 <DM6PR04MB6575D0DD2C04692AEF771494FCDD0@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_070149_166455_EEA4E2A9 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-24 at 11:03 +0000, Avri Altman wrote:
> > > Do you see any substantial benefit of having
> > > fWriteBoosterBufferFlushEn
> > > disabled?
> > 
> > 1. The definition of fWriteBoosterBufferFlushEn is that host allows
> > device to do flush in anytime after fWriteBoosterBufferFlushEn is
> > set as
> > on. This is not what we want.
> > 
> > Just Like BKOP, We do not want flush happening beyond host's
> > expected
> > timing that device performance may be "randomly" dropped.
> 
> Explicit flush takes place only when the device is idle:
> if fWriteBoosterBufferFlushEn is set, the device is idle, and before
> h8 received.
> If a request arrives, the flush operation should be halted.
> So no performance degradation is expected. 

Hi Stanley

Avri's comment is correct, fWriteBoosterBufferFlushEn==1, device will
flush only when it is in idle, once there is new incoming request, the
flush will be suspended. You should be very careful when you want to
skip this stetting of this flag.

Bean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
