Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2E0C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 16:54:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38C0205F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38C0205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xsIgdx/CJT33N14AhM1H9zHRVH5edLp47RcVYm2+SDA=; b=XXN4qgAmPoz8GhOIKyOMMXnDx
	vjn/a8as9viX+VR4I1YvDXDu0RX46yHNrq1zB5rF3NcWQ0Sp15M76F2juDjKDphdq0abE1/rJUpvc
	/CEjBgye2+BsyJjEce7Mp2qZFn4UBUYomMbUY+bv8hTmy4R194Wvmj91nXLXnW6dRWC4sNE4pbYU+
	tA8c5r+yqGaIyquTE23tZFrRXKEQLjMvoeuzuvEYR9lGlw7XYmucjwBbEGS6wwVLGTqP7eqX6CR4P
	bYJe8e8a1oZmO+8SZhkC2eEexXuPyuJonCk0lj6gR8KaioTzxrrRfVc3Oo6kXqR8WPrg8N7BiXevq
	IKOQqdodA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l05sz-0004TC-Iz; Thu, 14 Jan 2021 16:54:13 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l05sv-0004Sm-BY
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 16:54:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610643250; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=2dDSdRh9UZ/2znGwAyp9VyErRlya3vyr5Lu5YMhcqbE=;
 b=Vh5RUlaPT6jQPzgKIVLF3iJU1WyLWzhh+rBozQaCoBHHRsMp2zw1MBP83/PYHBw2Iz805Zro
 wG9qeQc0gwJ0NH9P7of3MezVAeGVxsLiXpb+tSSC1DZ1AYqNWlB3ZJKBP/LMH82dkpFCk6n4
 vpWGh8ObK1klIRuwZcANEN3Nn4c=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6000772d8fb3cda82f8368b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 16:54:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 394DAC433ED; Thu, 14 Jan 2021 16:54:04 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E295C43461;
 Thu, 14 Jan 2021 16:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E295C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: mt7915: fix misplaced #ifdef
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210103135811.3749775-1-arnd@kernel.org>
References: <20210103135811.3749775-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210114165404.394DAC433ED@smtp.codeaurora.org>
Date: Thu, 14 Jan 2021 16:54:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_115410_946994_97E6A664 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The lone '|' at the end of a line causes a build failure:
> 
> drivers/net/wireless/mediatek/mt76/mt7915/init.c:47:2: error: expected expression before '}' token
> 
> Replace the #ifdef with an equivalent IS_ENABLED() check.
> 
> Fixes: af901eb4ab80 ("mt76: mt7915: get rid of dbdc debugfs knob")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This was already fixed by:

0bd157fa2aaa mt76: mt7915: fix MESH ifdef block

Recorded preimage for 'drivers/net/wireless/mediatek/mt76/mt7915/init.c'
error: Failed to merge in the changes.
Applying: mt76: mt7915: fix misplaced #ifdef
Using index info to reconstruct a base tree...
M	drivers/net/wireless/mediatek/mt76/mt7915/init.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/mediatek/mt76/mt7915/init.c
CONFLICT (content): Merge conflict in drivers/net/wireless/mediatek/mt76/mt7915/init.c
Patch failed at 0001 mt76: mt7915: fix misplaced #ifdef
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210103135811.3749775-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
