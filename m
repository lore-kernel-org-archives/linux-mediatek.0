Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4331FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:19:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6DD255A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCEJrDzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt/jc4Xm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6DD255A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlW/vnkEJI1TX1/i61i/XhB83VLGeb4zmkAlatBVC/M=; b=fCEJrDzYjoOBy8AUU5Pw2Ta6F
	kbMln9nTpO5erXT1qm25SojIElDPdvWJAAR04GlYJdA4FOcBofoeYhp/6pJBbjRIYWogpMqJscx4P
	+9XSrPW196p+yiPoPu793YO057qgVIhw6JYbx/2QyQRcAf4qI8U6oJl32RbDBNHObM89nmj21aTFq
	xD7dYlfA/QsfIo0385EqMVsMAeB0esYHVkKSZmI//UC8ov9UMPSAZn4r9XMWWxqTXaWLOwIGzpRo1
	8Bav9baVBPaAaCjOgBXcXIEQ9kDI7qMrQ7hJiWaAf1khW/XD9n9XJLG/EYXnutCV5LmjKD+WQE/HM
	Lx64nPZ+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxRW-0002XF-31; Mon, 29 Jun 2020 17:19:42 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxRU-0002WS-9P; Mon, 29 Jun 2020 17:19:41 +0000
Received: by mail-pg1-x542.google.com with SMTP id e9so8587183pgo.9;
 Mon, 29 Jun 2020 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kyRzeVuvIOnKhsJ+5uonKu8f8yeOpAny5n1VdDosRFk=;
 b=Nt/jc4Xm3mvn5WqweNAwuOw5XVFPe3sw7g1bxrnFrB14aW4N+u8tzFVgRTc90SHXRB
 ZiXp58toYoc0ODij/6SbIdGrnrSdEZo7/jEOUGj0GahDzCeX/xMZNKq2+bK/otDzj4cz
 9NsaMQbXza8P6bwQW3R7MhLu/ahcGjau2xeGrfvMhoIIviu7q/uSvncMPj4rd4I8V58E
 G2z0UuGPGV55wArpeJlarXOVZfwvYi8EM6ltHIpaAoMlUzAi1xe9MmrQkStUPNzjyJa1
 DYBGvYHBHW56EC5ACRP0KFpMU3rjMPnfG5B26lphNu2nqAxgbskxmS4SFidlzo5ff7l4
 QSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kyRzeVuvIOnKhsJ+5uonKu8f8yeOpAny5n1VdDosRFk=;
 b=FMxnzrwEffrCVfQDC46zQV90JD39+68O+8SMGqad6WL4HUfKwez231ydNHKRz3tVwF
 Cj2n0nvNK1OiH6jndT10+zXQ3xjfUHH872fdGItGId8vOsv++nsJMk8BK2yNlFQ8mnuD
 T9Rc/ClAqkwjofVbwkDJieatyU6hDP4ItHrEfrZV6vLizz964wlv/ngvWqJRKEAmHjtC
 VI1W9LoB6x1AU15xhDpMdwJUMcQCKHNsSOAbmTEPHidYLo6qP0kUCWiL72k7eycUxzG4
 5D4nAJKxP3nRq2tBXGuZW3hnOK7AcUZkm6OmeTl1wAQsJaH211JwpIHgSMlSUFrf2QIh
 3QfA==
X-Gm-Message-State: AOAM531hnSL1YY+Xh/hyU8L64FAksEOQSvkIp66CSDK7qIHMiJAUG63q
 Yflf8Fp6phVn3BSyc1DNDiY=
X-Google-Smtp-Source: ABdhPJwBz4zO1nux6YEsGIypPIa2qPGaoUx75nn3Ar1oull1wcbktACCA97kxB2CT7b9kqFFkD3b1w==
X-Received: by 2002:a63:8c5d:: with SMTP id q29mr10983595pgn.249.1593451177944; 
 Mon, 29 Jun 2020 10:19:37 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g12sm257852pfb.190.2020.06.29.10.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 10:19:37 -0700 (PDT)
Subject: Re: [PATCH v2 05/10] phy: un-inline devm_mdiobus_register()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-6-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a88026d5-8a4e-52be-93fd-e683fb2ff05d@gmail.com>
Date: Mon, 29 Jun 2020 10:19:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-6-brgl@bgdev.pl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/29/2020 5:03 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Functions should only be static inline if they're very short. This
> devres helper is already over 10 lines and it will grow soon as we'll
> be improving upon its approach. Pull it into mdio_devres.c.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
