Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAFEC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 16:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0080323B4B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 16:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0080323B4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WM20ZdhoQwFroThDMWVdGCvBaQipnvNpO0c10wfROVo=; b=nnkzbQ+u08l3HC5WUjXC0tVGa
	/Y9Mdybx0qk6csrgH5MhOc1Wh4d3HCs+v4T9yW88BDi38tV3TQXoDApxGIB269QaQkK/3EJbH65W7
	puhI3N8t8IeVKAUfVzPgKfxZAEbmVJu2Mn5SwMZiaYtvVDK2i7/frqOCsf1Y3L9YOFyTRHBjceacP
	zfEdTyLZXxZAotcB6H1TYIFWPZKg8FJvPNV0AcsV+NdZvGCiUMEo2Hh8P7gs3Y67svQL9ACMzh8dv
	XW/dYqHdhM/CFXXRlJqFcCvTVxDq6VgRVSsVe1wuiMbWPE6v1ZOo/UC1owOvDP0/CFw+RvX7URrdi
	vi4gp4PYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l05oI-00041o-8K; Thu, 14 Jan 2021 16:49:22 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l05oD-00040a-Va
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 16:49:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610642959; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=pTOhOFjKTSVZKN1D0SJ1Pg5lWOEdKXufF+sYmOfnZOw=;
 b=Jb5iHUspK94KGXmj8Tpr3+sVMq2t7poLZYma6JfYe/KUtl0RBtl08At96KrpNN+O49kruVN3
 O0FZjlg1hU2kRobIGr7ETfIrUyqRUT+s5nSlBebzyaFPZWqfv/BY2hNtjNZ3OAMHDnQbrGcn
 WOWs9AD0yx76lv2cW2bIRID2WOU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 600075ea2a47972bccbeacdb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 16:48:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BB69AC43463; Thu, 14 Jan 2021 16:48:42 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D370BC433C6;
 Thu, 14 Jan 2021 16:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D370BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: Fix queue ID variable types after mcu queue split
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201229211548.1348077-1-natechancellor@gmail.com>
References: <20201229211548.1348077-1-natechancellor@gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210114164842.BB69AC43463@smtp.codeaurora.org>
Date: Thu, 14 Jan 2021 16:48:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_114920_081018_81733ED2 
X-CRM114-Status: GOOD (  11.23  )
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
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Nathan Chancellor <natechancellor@gmail.com> wrote:

> Clang warns in both mt7615 and mt7915:
> 
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq = MT_MCUQ_FWDL;
>                     ~ ^~~~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq = MT_MCUQ_WA;
>                     ~ ^~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 txq = MT_MCUQ_WM;
>                     ~ ^~~~~~~~~~
> 3 warnings generated.
> 
> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 qid = MT_MCUQ_WM;
>                     ~ ^~~~~~~~~~
> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
> conversion from enumeration type 'enum mt76_mcuq_id' to different
> enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
>                 qid = MT_MCUQ_FWDL;
>                     ~ ^~~~~~~~~~~~
> 2 warnings generated.
> 
> Use the proper type for the queue ID variables to fix these warnings.
> Additionally, rename the txq variable in mt7915_mcu_send_message to be
> more neutral like mt7615_mcu_send_message.
> 
> Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1229
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Patch applied to wireless-drivers.git, thanks.

b7c568752ef3 mt76: Fix queue ID variable types after mcu queue split

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201229211548.1348077-1-natechancellor@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
