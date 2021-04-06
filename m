Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F593C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:30:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F57613C4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F57613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdUnXFXroaTrNCXdF7LnL8yzM+rzvHohwQUkfrX1wy4=; b=qFempb0xcQQ6A0RyGk38GdHji
	6XIczJ6qijxqMd5PiU7dhQv0Nuxh609UN0e5G+5N4KC1o2Os0ho8FjzZ88qZ/6jR8qXmv6peCWeKC
	92R3k6YAiWjQGiMScCKkwIKScPCyuoNgKrLS5craVdq9V6jXyTuMraQPFh0WZgPTbUsnVEPwMpGkF
	Tdc2hFbnP79quktMib5Zp8Yo2K8BOd4waT81tXXYxyjG25mcDtdnRxJwALTa4UYp9NvhWyrW3KYA/
	OfadeHDMEIXrvkf5PKcvE9Ze7Wa57sTDWPkT1674DNxEXusJsBT/Or+3Umt7+3RdEIwtkPd2I4MOG
	cmqAOJrUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTiyD-002C0U-GL; Tue, 06 Apr 2021 10:30:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTixx-002BUU-LL
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 10:30:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617705001; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=J7orDIS84Fhl5iLzBY56ve+IpWWZFsF/yhfnYMTenVY=;
 b=WZmI0v+JPxXZFBQW1sH7hYzg/T3ab4WNDZ/6Ywzrd/6jsgU7wxUZA8LYXiUSAqtX7kAAWrAt
 C+hGLxNVGSgTu2cynl/DqGK3cCjfAXN74rwzcXZ9hVnJXMp8W1Yx69oLAunPFzNh7/cUbewr
 CjThOjYkfLGf3fn9w9lRGMfqu3w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 606c37e40a4a07ffda04f338 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 10:28:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31548C43462; Tue,  6 Apr 2021 10:28:52 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 27FD5C43464;
 Tue,  6 Apr 2021 10:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27FD5C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Qiheng Lin <linqiheng@huawei.com>
Cc: <nbd@nbd.name>, <lorenzo.bianconi83@gmail.com>, <ryder.lee@mediatek.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] mt76: mt7921: remove unneeded semicolon
References: <20210406032051.7750-1-linqiheng@huawei.com>
Date: Tue, 06 Apr 2021 13:28:44 +0300
In-Reply-To: <20210406032051.7750-1-linqiheng@huawei.com> (Qiheng Lin's
 message of "Tue, 6 Apr 2021 11:20:51 +0800")
Message-ID: <87eefnogf7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_113001_723951_CE8973FF 
X-CRM114-Status: UNSURE (   8.21  )
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

Qiheng Lin <linqiheng@huawei.com> writes:

> Eliminate the following coccicheck warning:
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c:1402:2-3: Unneeded semicolon
>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

mt76 patches go to the mt76 tree maintained by Felix, not to net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
