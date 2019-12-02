Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D553EC43215
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EEBE215E5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVD8hgZz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="uTPBkofE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EEBE215E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0GEBiKOStb3ZmIXjxyagSdK2+XWx0NOQXEIsmoqL2Uw=; b=pVD8hgZzjuUpcd0c3TFDrUspC
	YXHufpMuG2rgTEFHbH7C/pZ3HU9lWVKFgauMZglHefn/Ry8Hez/awD50cyWKZAUV7ps7g7nsEstIN
	jQibgj2Tm8XULg+/w4xB9x4EZPA+vEzHmrqvmxP7eUWj5X1Olf2Oe1zmm/M7aanv+A6qRvYO1hGa6
	tuQaTv8D5nMA2YcswVVkCwhyeo5yxaT7XiZ249cf3axLsAUc1mdEAh5OpFo3oKNVl0BniBs1ci7dQ
	IMKDRdi3+uUFFHTK8IIKwpjHlGuZkbb4BuCSDW6BsiycITUSqWdxGb5gOm4YcZ9gbwpLQfNcuz0mz
	ZTuiyFUUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibhqv-0004B1-7R; Mon, 02 Dec 2019 09:18:45 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibhqs-00049m-5r
 for linux-mediatek@lists.infradead.org; Mon, 02 Dec 2019 09:18:43 +0000
Received: by mail-lj1-x242.google.com with SMTP id u17so11793932lja.4
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2019 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ja9ch4L0w7bAa4bcbmZySUMxjC9CzLUpvj1cQSMwa8=;
 b=uTPBkofEFIQC1nYNeb3vu7LG+NQ2nRnifiuCq4czf9Xq9Sw6sSQloZymgl2qZ1CDFs
 RPDy6rBjA9PIdmwDXFJtzsW4jQKHkCQCw8J8uQP3w3y54R7jgHpgAwV9hviCtrCphXxn
 40MeEzGl4xX05vlCMNrLZ/Jzt6j6ZsX1PSPi2EOppkBQaGROJ8VzTtlWoikjZt8O1mms
 UJ4BilLQ2Q01XGvwaRCLI3qZoEbSuUKzxZQPz/+7rggWsCiOJ+d8c4q2z7TY4GdL3iF1
 pPagjRHFNmYnFeot7JpNyLGTEo280oearTe34ZzyVXuKchY2o7cICtf51vtpzqPqa2rA
 M6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ja9ch4L0w7bAa4bcbmZySUMxjC9CzLUpvj1cQSMwa8=;
 b=aZQzqxLqP4QPNJVAiyQfuZm70886nfdwyq9SYiJwCGA8F5zaJ4QEafz9AWGdHeDmVU
 NcFiaZr2DdwgL4wZv5314amcUp0aj4UgtdQW8av2oQFH/9AY/DWtGPVF4nM7rg9XUdj4
 KTA42Dzw0tyycRRYAF5JgXdFdYelJdqzYNtrMaoBsb3wC3f+ZrFq/uQCiYeAkCGadx94
 Yn3GAJvMelFb2Sq8Ms5H/FH9dhr2f2IjuXfJZuHhOL0EUMEI6c1FLV5miqSLG8w41yxP
 cgKZXA6WZMppHhYnfTLHK8GSHyPTaLzG6Lhy/Qlfy+rd7DJXTJO7/2kKTR5nN6AFVvQ7
 zGMg==
X-Gm-Message-State: APjAAAWJEs88Jv3d9pwZu9q5KDudBYkwYgOHmL1ET1Ksh14tsBmi2W+s
 1EqyY44asJYjtz7xQtQXBcUoxw==
X-Google-Smtp-Source: APXvYqxwpAVRrTt+ohqj3sU9ZfRrVqX02o1vwts4WBMtf4EDXl5MbSuF6EQGuhRhWwZFug6WCJYv4Q==
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr13855009ljn.31.1575278314710; 
 Mon, 02 Dec 2019 01:18:34 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:61d:753e:cc38:6b74:7e0d:a1da?
 ([2a00:1fa0:61d:753e:cc38:6b74:7e0d:a1da])
 by smtp.gmail.com with ESMTPSA id l8sm14769303ljj.96.2019.12.02.01.18.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 01:18:34 -0800 (PST)
Subject: Re: [PATCH v1] mt76: mt7615: Fix build with older compilers
To: Pablo Greco <pgreco@centosproject.org>
References: <20191201181716.61892-1-pgreco@centosproject.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e18d798d-cdf3-da05-c139-403dfc80e8a3@cogentembedded.com>
Date: Mon, 2 Dec 2019 12:18:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191201181716.61892-1-pgreco@centosproject.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_011842_221388_60380242 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 01.12.2019 21:17, Pablo Greco wrote:

> Some compilers (tested with 4.8.5 from CentOS 7) fail properly process

    Fail to?

> FIELD_GET inside an inline function, which ends up in a BUILD_BUG_ON.
> Convert inline function to a macro.
> 
> Fixes commit bf92e7685100 ("mt76: mt7615: add support for per-chain
> signal strength reporting")

    Should be:

Fixes: bf92e7685100 ("mt76: mt7615: add support for per-chain signal strength 
reporting")

    Do not ever break up the Fixes: line and don't insert empty lines between 
it and other tags.

> Reported in https://lkml.org/lkml/2019/9/21/146
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
