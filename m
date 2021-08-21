Return-Path: <SRS0=N9OQ=NM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E4CC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 10:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B95561207
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 10:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B95561207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+PNPJIJRbT3Dy/aqCjGHajALg4Q8Uy3XDXu4UiYcfo=; b=bk2S61NKFnbrqk
	7gf7Yf6ps6zkzfXwxijv0l/qZxHzfRj/GxhqFrBdSQO9ZFNPVHOJq89n/1hb2+jSA9iZlqyL/t81T
	ZFO0it8HpsI5B3vharQScsRTQ30+iJoUQuw3/yDAN6fXz6ztDFvbfb+9+dlhiQGDIXA1mD+ehLXhx
	029VYope+8moGxvyCjHgjWkNxSo8VGEuLhQDR0jZpgNk8b7qYkZkRkOaWr82l+QXU4rac12NxXl2B
	hLohAA3yh8Bqqt76nzieeFPrbqRVHpWbcDL5LFKRbwxHKZwLMywdpE2lvgbohMqGUxCTbxhmrH1U7
	5AGAlEJjLhcJCPWhRIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHNw1-00ChVh-9U; Sat, 21 Aug 2021 10:09:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHNvw-00ChUd-4n
 for linux-mediatek@lists.infradead.org; Sat, 21 Aug 2021 10:09:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629540539; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=nOvqcu25C6/yT1j6aF71MaY76ONTEhRWrcplxPoxqGQ=;
 b=whokVD9WHuyXs8+m8//ifRLttVKq7BIlrMZYniQOc1x2+2AMRH5XHniF/801JtTiI/rH9lCj
 hqpIMWiLgdgTJpm3wuoTvdkC93RvZnsZmHZiVJYA8ZjHPIHtagjrHkfBoZpwnTi0JWMciEP1
 0e63w1J0UyvLOH2o7ynJGFJkPhg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6120d0b689fbdf3ffecb4fb2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 21 Aug 2021 10:08:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23ACBC43460; Sat, 21 Aug 2021 10:08:54 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E074AC4338F;
 Sat, 21 Aug 2021 10:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E074AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] mt76: mt7615: checkpatch cleanup
References: <77372f644903053e09d671325c0cd44cf75e14ac.1628301615.git.ryder.lee@mediatek.com>
 <1991c856459c2014386d1a16f6657e9ba82b6d1f.1628301615.git.ryder.lee@mediatek.com>
 <87wnoha1rd.fsf@tynnyri.adurom.net>
 <45c67ffb65debdd62a417c0b68af2ba7f1932195.camel@mediatek.com>
Date: Sat, 21 Aug 2021 13:08:49 +0300
In-Reply-To: <45c67ffb65debdd62a417c0b68af2ba7f1932195.camel@mediatek.com>
 (Ryder Lee's message of "Fri, 20 Aug 2021 09:29:00 +0800")
Message-ID: <8735r3un2m.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_030900_273945_4DE1A71F 
X-CRM114-Status: UNSURE (   9.84  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> On Thu, 2021-08-19 at 18:32 +0300, Kalle Valo wrote:
>> Ryder Lee <ryder.lee@mediatek.com> writes:
>> 
>> > Fix reasonable checkpatch warnings.
>> > 
>> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
>> 
>> One logical change per patch, please.
>
> I prefer collection all checkpatch warnings into the single patch.

But in upstream we prefer one logical change per patch, for example
makes it a lot easier to review and bisect.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
