Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A93C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E40223D23
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E40223D23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TxodeoO8LWhT9oia7dbUiOWlfokkRn6Biule9ZUoyVw=; b=orIT6lUsCziWVNZgL3YpFuXXX
	GV9hzbWD8lJXxV2TDuM3x6OjVsvDhx42Z9wL/eQFPkv4W1k5KhjzSKbO2ptOS+qxtsYsw76mkgF0P
	J7F7i2Lyp9r27dVj+wIrn7fqYBrFIrZMWe4YEg22UhCMmocs9OjltKobeAqmElQ4uXpnDxHEIXJH5
	p0dZ8ZOxtLXvrlz+MADDgiiy9DaT7Ff6lBM2mXAmKJzgcWTiaVBUoBvz/OrVQXjjZpK7ZBdJr+YID
	5cyFNR1YhoV/+25nKDuBPneWdsV2ospU4+kYQ11mrC9qTxApnDOVV3x2JyaFeaS/XQb8HfLPXU6F/
	92qPYFfvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knGBm-0005nX-44; Thu, 10 Dec 2020 07:16:34 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knGBk-0005mx-0H
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 07:16:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607584591; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=MulsTy2xpIxQLZhs1lE1ZqTDtAkjh+cX5VXMZpxMts0=;
 b=wSZsG2fcA1vSQwmRA9tyW0Xc4wMW/0q/gNx6Eg3IeWzj3zqR0QsrI0e4/iswfk6Uyzs7ZPzB
 VkTSeZkb7ks4x3Plb7bEue3OqQxNEMA1vrwpn/2mUM1IsgeN7amScJVP92dWcyEKy3yV/Fxi
 xczV5LzCx2OttuF5wYaPDfKcX7M=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fd1cb4d6d5c2f1d207e7bff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Dec 2020 07:16:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 82A46C433C6; Thu, 10 Dec 2020 07:16:29 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C7255C433C6;
 Thu, 10 Dec 2020 07:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7255C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] mt76: Fixed kernel test robot warning
References: <1607542617-4005-1-git-send-email-jrdr.linux@gmail.com>
Date: Thu, 10 Dec 2020 09:16:23 +0200
In-Reply-To: <1607542617-4005-1-git-send-email-jrdr.linux@gmail.com> (Souptick
 Joarder's message of "Thu, 10 Dec 2020 01:06:57 +0530")
Message-ID: <87ft4e9lmg.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_021632_089612_8F19AC7B 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Souptick Joarder <jrdr.linux@gmail.com> writes:

> Kernel test robot throws below warning ->
>
>    drivers/net/wireless/mediatek/mt76/tx.c: In function
> 'mt76_txq_schedule':
>>> drivers/net/wireless/mediatek/mt76/tx.c:499:21: warning: variable 'q'
>>> set but not used [-Wunused-but-set-variable]
>      499 |  struct mt76_queue *q;
>          |                     ^
>
> This patch will silence this warning.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

I would like to take this directly to wireless-drivers-next, ok?

I'll also change the title to:

mt76: remove unused variable q

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
