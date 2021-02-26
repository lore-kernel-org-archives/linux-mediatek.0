Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F6C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 15:38:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4889464EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 15:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4889464EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=moQ5owZvUzSMi+TrXZACpfRcsiBHmHmlQRGSJFh6aig=; b=cJBQFswU+L3tsOHKS/ALZ4Hh7
	IiLgdrVLFtkpCkwaNPJdzvxIMzAuoSm4JjZoNvyGsab2ni2X1RcbZ6DQuzbmrz906funVuiUZHH+O
	dACFGywUoU+JqawfBLn2q8k3qcF2ykG70qBSDYiByDRUxgZ02YHsy8el8wd39itliv1xvYg0Wy6oC
	AHU7cVIqisfkhVR30oEDgZYyFbfASqQtzHG6VBykP2llOXJpzLUlS9oCApaB4sDkQZ2vKLVp//6mb
	GehwJdPIzqbXiC0BnPln5tYHadqiWZysEAZI8qKxl1kpFDHgvedvWIA7ppab6RxUaUXER6lBFsNjS
	vsvV2e+EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFfC0-0005vP-BH; Fri, 26 Feb 2021 15:38:12 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFfBv-0005ub-M4
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 15:38:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614353888; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Y11jeY4eLgaDwVm86bt5UA29oOY9D+tX6VVltEVFFPs=;
 b=lH6JqIj2xmRJ4Iz3kIXjXs/NYVrbseST4yehaRV+2f0aPUi0U9UAUhq1Jt5FndlVtPMGwiYL
 MiEEK7Mdxcc/D8VRIbGr+O7CI9giNtKQkHAzGJU5TJ4gzS8bjd3uPQQ3Ml+BZRcA1U7Pl758
 SYVTtXtrIv+PCcSTvNXB7edUW60=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 603915d57aa94c52e7cd27f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 15:37:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 375D4C43466; Fri, 26 Feb 2021 15:37:57 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1ED7BC433C6;
 Fri, 26 Feb 2021 15:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1ED7BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] mt76: mt7915: fix unused 'mode' variable
References: <20210226142215.3482168-1-arnd@kernel.org>
Date: Fri, 26 Feb 2021 17:37:50 +0200
In-Reply-To: <20210226142215.3482168-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Fri, 26 Feb 2021 15:21:27 +0100")
Message-ID: <87lfbaalgx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_103809_271973_4C421E6F 
X-CRM114-Status: GOOD (  17.45  )
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
 linux-wireless@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ linux-wireless

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out a possible corner case in the mt7915_tm_set_tx_cont()
> function if called with invalid arguments:
>
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: variable 'mode' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>         default:
>         ^~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:597:13: note: uninitialized use occurs here
>         rateval =  mode << 6 | rate_idx;
>                    ^~~~
> drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: initialize the variable 'mode' to silence this warning
>         u8 rate_idx = td->tx_rate_idx, mode;
>                                            ^
>
> Change it to return an error instead of continuing with invalid data
> here.
>
> Fixes: 3f0caa3cbf94 ("mt76: mt7915: add support for continuous tx in testmode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: remove the extra 'break;' after return.
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

You forgot to Cc linux-wireless and hence patchwork didn't see this, so
I applied this manually instead:

c490492f15f6 mt76: mt7915: fix unused 'mode' variable

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
