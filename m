Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445EEC07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 12:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1121F613D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 12:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1121F613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75Cryd8RKBDPtO7/mp9BDOBb5WHuro9wTOqhlD5gDCU=; b=35dqO4WeuEX7nr
	AAFcdyqRVBkqcmWE7qMXt2OF6JLWRTKifNrPJMZ+2KRRyLkmTNeCBfqijEsfyWclFebQUJ6QzgiPi
	49Nam2LScu3xXt/GT6AvD8/KcbAN/fQ0PT9xpPIHHkpYxjqlu12IW0N2rIfI2LLpFwrtPXm51UdNI
	NZ3N1AhvLdcnuQxW5ki2HE76l6PScTFbyOkVwQHlzjWMN9qWRiLQxvsnyDHKRMCiC6Qn/EqNY50Ul
	UpOcUSkCfIiJDoD67GyU2sgCZu6Lm/9B99BzKbRo2o9TXyDFoUVWQ68ejlKYABvIj3O9zVbAhq2bi
	w3ghF18sIfkiyukzansA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0OAt-008xjU-Ge; Mon, 05 Jul 2021 12:58:11 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0OAn-008xhY-SU
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 12:58:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625489888; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=BOMJhw3Uw7/UNQgjVw/HLum3ELYSQ/KigKj1pc6MwnQ=;
 b=p24qazsyOPDT0QUDMuyYp82+s6Ukmpjxpa5uOeefC0ng8gNlMVOH7uhOHPwg8OBqcVe/b1xZ
 BrDQVQBfQIznHScOLOaddv8lbLu0bNiuVxXS9XG4jObR8hFup/nDUj6ogI6TSsbIhdefdLr/
 XU6v0FixAdOyQA3SDJNkkIWAM5Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60e301d64ca9face34bd08b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Jul 2021 12:57:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E24AC433D3; Mon,  5 Jul 2021 12:57:57 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E920CC433D3;
 Mon,  5 Jul 2021 12:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E920CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7915: cleanup miscellaneous errors and redundant
 codes
References: <20210702083949.4431-1-bo.jiao@mediatek.com>
Date: Mon, 05 Jul 2021 15:57:52 +0300
In-Reply-To: <20210702083949.4431-1-bo.jiao@mediatek.com> (Bo Jiao's message
 of "Fri, 2 Jul 2021 16:39:49 +0800")
Message-ID: <87sg0sgbov.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_055808_167980_795AF013 
X-CRM114-Status: UNSURE (   7.98  )
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

Bo Jiao <bo.jiao@mediatek.com> writes:

> From: Bo Jiao <Bo.Jiao@mediatek.com>
>
> cleanup miscellaneous errors and redundant codes.
>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>

Please split this to smaller patches, one fix per patch and write proper
commit logs. See more info in the wiki below.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
