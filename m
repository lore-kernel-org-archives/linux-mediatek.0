Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F35C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 20:13:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A9360EB5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65A9360EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:CC:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VPlF/n//LwED66ALwX+Pcy/NZ4lt74i7MonaJ23bQ48=; b=ZVPhMALYRxHUP9cDOt2ITBLSGe
	GDDrdMpiO/8PD+IgMDpKn2SfD6Cy7PIANpmKcqc7zCtDqMyt/e9Usw4ZV2Od6cQPQwznc9ANkCXB/
	xKgQzMWrV7fSZDfoIly5ezYk101noFsH2qoMCCl7VfX2G8ASgv/V7BUg+fjOblwXJ2KBGnCyjHdoK
	hheG77wfBEMwsF4RChKBfOO0D74Fu1xyjwqTrNqRvB7j6nfKltIz6ddXRaSIyJwOlNJlKLr2QakRE
	ZX5XotFQ789AOae7N6zSujRaTzAH5RXp3nX75J0hYvg3vqvt3JBxhU07P7SehTg+5HBk1WdFtCwma
	BohNIRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDubH-0081ob-Uk; Wed, 11 Aug 2021 20:13:19 +0000
Received: from mxout02.lancloud.ru ([45.84.86.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDub4-0081mW-C0; Wed, 11 Aug 2021 20:13:08 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 73A5B23345A7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 0/5] Correctly handle plaform_get_irq()'s result in the
 i2C drivers
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>
CC: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 George Cherian <gcherian@marvell.com>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Organization: Open Mobile Platform
Message-ID: <83767306-be1b-3bcd-723c-92483b4cc612@omp.ru>
Date: Wed, 11 Aug 2021 23:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_131306_638759_BB263B5C 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

On 7/4/21 5:32 PM, Sergey Shtylyov wrote:

> Here are 5 patches against the 'i2c/for-current' branch of Wolfram's 'linux.git' repo.
> The affected drivers call platform_get_irq() but mis-interprete its result -- they consider
> IRQ0 as error and (sometimes) the real error codes as valid IRQs... :-/
> 
> [1/5] i2c: hix5hd2: fix IRQ check
> [2/5] i2c: mt65xx: fix IRQ check
> [3/5] i2c: pmcmsp: fix IRQ check
> [4/5] i2c: s3c2410: fix IRQ check
> [5/5] i2c: xlp9xx: fix main IRQ check

   Wolfram, hat's up with this series (its status in the patchwork is still "new")? 

MBR, Sergey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
