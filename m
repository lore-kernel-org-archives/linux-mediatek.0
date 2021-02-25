Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C95C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 16:01:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E73B64EDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 16:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E73B64EDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7tCwialETlmngeSB0nf3yyMAey9tlfWggb1RA/1YkCw=; b=KBQEgR0A2BDJBmPU+9a5iEnqv
	Kn5e1DhgRKLHaiorzQxytHV+MdmgrNG0UHJSGzYxA1h820NaiMcLv+Z62XWRREigs0dk9VUv1YRTj
	w9tZxmqP2thUEOPRiSaBST1WzsB06tunB9CMjZfgP8sHtbhfEDgJtlzZ0Ltop/rpSduXi5A7BRA9L
	BBZsVEkTq245nH1r0JRI/vrSvWkQ7ww1FlxrM1ZV2KRYJYfyhtFnrNrXE79d5pJpIX1sdw3rLOk54
	/vg+rj59FZ2GMZKBf9LBvK2ze7mniQnLR8ApSxNaG+FMHh5xLCPVaKyjFIULf+vQAkKDD9quu25Bc
	XOhkrtJaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFJ4N-0002iM-Jx; Thu, 25 Feb 2021 16:00:51 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFJ4I-0002hi-3E
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 16:00:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614268848; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=nax/2qkYZxFNNsM/IxQmHhHuh8ylQMIKgrDBwB+k6Ek=;
 b=vcXu8HCI/6fqPMKFm8xTA71GrfUpZaUwFsHC/7HsqSTAK05h9SspU/iKb+UHcjPYCBooDKs3
 Pt5nftm1orStE6X2l23loRSE7WDHSoa/H9EkFd5mSciObMSoxvifxrnSmOrmve+2igf1oDqF
 BfSoDlzOfPyksu2CZ1cKliA9Qa4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6037c98eea793fa3032bd38d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 16:00:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5C864C43464; Thu, 25 Feb 2021 16:00:14 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 51CAFC433CA;
 Thu, 25 Feb 2021 16:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 51CAFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/2] mt76: mt7915: fix unused 'mode' variable
References: <20210225145953.404859-1-arnd@kernel.org>
Date: Thu, 25 Feb 2021 18:00:07 +0200
In-Reply-To: <20210225145953.404859-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Thu, 25 Feb 2021 15:59:14 +0100")
Message-ID: <871rd4f88o.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_110049_017511_CEE59E8B 
X-CRM114-Status: GOOD (  16.42  )
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
 clang-built-linux@googlegroups.com, linux-wireless@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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

Felix, can I take these two to wireless-drivers? An ack would be good.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
