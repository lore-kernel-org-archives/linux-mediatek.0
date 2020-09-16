Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCFAC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 21:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554B620770
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 21:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ph/ywYr/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVzVtSCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554B620770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V8dwMwTzMvREF6qEwwiI57BZ2eLZS7bhKVdVytYKJo8=; b=ph/ywYr/+ndUqkdvKvpycP67K
	n7ld9ADpNIRZSmfa4bhbEuZ27T756ar3BZhbr8yPnwrTnhR6EA2agZZsyTGuCh+iE6aPgJY+zPk9h
	IGP5zwEvjQQNv4SjnsqpcTVeAMhdKYSm4dI1TP9HLOfGiG1v7EhwVlsEuiJWJalKNSkAtXw43KnCQ
	lcQCYtgDNJ3AA4tgUYH+H+qeCcAOAfCKHJ94C60EjPa+hT4LSuAbIvJnWTFSclL4taIXu7F2HeTfW
	B6M2rXRm8gbEEoQ3ohqhIcTKn0HvKR9r60/wiR+pIGq1KyzTyVZmI93s7tjrkPNzbcMYPsynRd9NL
	SJnf3Y3hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIetg-0003OE-Nt; Wed, 16 Sep 2020 21:23:24 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIetd-0003NT-Oz; Wed, 16 Sep 2020 21:23:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id t10so8374679wrv.1;
 Wed, 16 Sep 2020 14:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uaALsWfF1D9xfoXjRco36/wFZIs5nH3vP9iLlTuBzEI=;
 b=IVzVtSCo5zE8dA/LZXtqUtUi0zKuFNGC+mJ5LvdUJS7FqoV3PfJBEnOoCwc6voQD8d
 u4fJYBAdu2skJ4IDhuqAWWiS/qN7qCVr4BZUzeocVw/Yxip385UxSN74cMUb1ZsWEfcw
 BcLPVu1EInwBAHC9UaQvDV6umf5EGtZYFaga4SQVGJnJyvzoVtrXF65FxxEPNgcAG3s2
 mxBijNOHmlMQ/TNax2vaCnwxfwLLAvXhI+/50xajOlZ/mCaFGDEKkCoi5DBF+C4Xg+tX
 Klyu7DCO4cHfkmgHI2l40ia7tICoDXJ8QnOWeCdDgxQIKBjj/vq0MBMdBAEppvb9Z7aI
 5J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uaALsWfF1D9xfoXjRco36/wFZIs5nH3vP9iLlTuBzEI=;
 b=nwINBYKWJfaQe5X6VMks3Cw+/dy5vwazudPcMEZx7ExaDV8t3y8K3p+z7K+z8kmBWL
 2kQWSyR7ps+7avPFgp8ep7p5mp2gSoMij6LZDaBoms0wY1hBpzzlL/89LSkjPXHzfM6g
 LXQpIiOviJbNz4fEUYudydLtz2X1tBxjRVUMJkyVzgAI5AMtWaqw8UFZUgToPTuVf7Kd
 sd5FkEsvKZXW7Tku+q5YNQhJbIfw3SFG6E6pLCTMqUrKw/OGecD1xn+xawL8RhmsWLBo
 A0slLoUTvfyjGUDcwcPy/BvW0YVRW8BzAWJoPR47DeCZ9GOO1dgjxyOvHqYO91tCn+7d
 gnRg==
X-Gm-Message-State: AOAM531sYEEBb9mIRcGhh0u23YGYSYmzQS3fSfnasMQoM846rVCQUyv+
 yJINOQbNvYczOmhJLlJbT90=
X-Google-Smtp-Source: ABdhPJwAp8siCWVhzUlSaubwjsROnTD/0x1q83znU0D1hEnn3QuMUTNSsnI1iypqQdsZxlO1bIgt3g==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr28884355wra.344.1600291395868; 
 Wed, 16 Sep 2020 14:23:15 -0700 (PDT)
Received: from lenovo-laptop
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id n10sm7743823wmk.7.2020.09.16.14.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 14:23:15 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date: Wed, 16 Sep 2020 22:23:13 +0100
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [PATCH] net: dsa: mt7530: Add some return-value checks
Message-ID: <20200916212313.w727cxx5tzo2ttm7@lenovo-laptop>
References: <20200916195017.34057-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916195017.34057-1-alex.dewar90@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_172321_852162_D1F1F2C3 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 08:50:17PM +0100, Alex Dewar wrote:
> In mt7531_cpu_port_config(), if the variable port is neither 5 nor 5,

This should read "neither 5 nor 6", obviously. I'll fix in v2.
 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
