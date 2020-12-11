Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F57C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 06:52:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F7723F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 06:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F7723F2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I6m2SKXvLVxn22OINh0+bHuBhDW5WPLfmLN35nY0IDw=; b=b02419+vBEFhKxp1LUoVXeqgG
	4a+SJDgy7qM5+t94kSYCJ6pu8lwe10kS7oM3gxgjI8vdFpCtZ2h8oo5xp4IZ4aAmBONq/kFe1Y0Z6
	h3QDSm6GERcsmzWR24Tq0YLuSwgeslJ3HPvOVWSchGh12WcPB0oG9qxqsP21mg4wSBQnshEyDJn+3
	2RV0NcMv4Vy+60p//mJO4bTFqcgkkZZLV8scvCJ1NmGsIsafkY+hhocBhJAt4nAyvTZyxKAy+UXaj
	AgNILKGMjVMWArtEPz3BxTVsvfCY5FIji8hm/ieXFxTbMfImxv2mLHcaw/fR2+79DjyedSWR5c6I3
	gcDK+DwWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kncHU-0000YI-Mu; Fri, 11 Dec 2020 06:51:56 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kncHR-0000XH-8o; Fri, 11 Dec 2020 06:51:54 +0000
Received: by mail-vk1-xa43.google.com with SMTP id i62so1840643vkb.7;
 Thu, 10 Dec 2020 22:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+kfsQcREhjj6iUweM6iPAiozZ1/2mIevjtLhHtCEI8=;
 b=LcVvyaW8krm/Qx/WlnVFzJFkViCLf+MBIdWHyrLn3STwe5vC8M2b2nLO5coS9bEyWU
 KBfLI2fN/zqgXok+phpVxpGul/mb0KKBSgdzwaOlrektD6PGMAykG7aTTKn66SoC6smC
 ORhepN3WUO1fNoSD3unJXKlGnkzNQSFzH1g1OC+ZnxvvPkCyole4PMN/TypnFxsiEkkb
 kaD99glswq5M/VGDsFdmAivN060XpCKeBDxZqge9Ju71THKusL4IAd6MTPTbib2pBifo
 uBLSkrkSlTPS9Gc+v5hUULOULvZt6CIAnJEU5DCHVJ+DZ6jQtRf45EnYqzsfha4J+V5p
 3Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+kfsQcREhjj6iUweM6iPAiozZ1/2mIevjtLhHtCEI8=;
 b=qcRKfow+Sp5j8pG/t9h96i1xUsejVwn6L/cXBQ5oV9+udlJYyV02RxKtJV02ovbdFz
 XmvG05o8VRGtXWlINic7Z2wlWWuin8PZ+dds8gijAvU5XG4uwzgOW7QuG7Uw4AiGFW95
 mx6+E2UE1GU73+TRGi1DwSVnDJFyx+lpWbJPKKZ8PgeI+6reu+wom8SZEeFAopxaJnA5
 ndvtoWcdscVpL1EIQdMyl90IcVLP9hZKFTK+xDDkSMc9Xr0f2LuGrVkOjhL3k/LRyRnq
 G9AzlsykinILCMP3LtlvJ3dyki6XLt5fEjwwBZA2+bv9Mjkm+aTSXAPXZxehfgW4fSJl
 PAyQ==
X-Gm-Message-State: AOAM532jLHKC9cjQbderPbsLVykggG4IP9aBTNDKY/g93lwhCdAe8pgA
 sK17Zquu7hFERWhcmpGD1mjnbd8kTh2KtucMbKQ=
X-Google-Smtp-Source: ABdhPJyGLEO+5mA6kP2n0J+TYi31DJbJy/NQ9a8ts0oVRZdMFNFCtcKaFFmD+6E9VvLtBmqTtuGf+pyTvkEGNkhdXj4=
X-Received: by 2002:a1f:c545:: with SMTP id v66mr12563955vkf.15.1607669510097; 
 Thu, 10 Dec 2020 22:51:50 -0800 (PST)
MIME-Version: 1.0
References: <1607542617-4005-1-git-send-email-jrdr.linux@gmail.com>
 <87ft4e9lmg.fsf@codeaurora.org>
In-Reply-To: <87ft4e9lmg.fsf@codeaurora.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 11 Dec 2020 12:21:38 +0530
Message-ID: <CAFqt6zbgFuQWzmjtYFVcMTLd5zo4g9B1zvEyOzXmWTw=2jPMJQ@mail.gmail.com>
Subject: Re: [PATCH] mt76: Fixed kernel test robot warning
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_015153_348033_42787104 
X-CRM114-Status: GOOD (  13.94  )
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
 linux-wireless <linux-wireless@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 12:46 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Souptick Joarder <jrdr.linux@gmail.com> writes:
>
> > Kernel test robot throws below warning ->
> >
> >    drivers/net/wireless/mediatek/mt76/tx.c: In function
> > 'mt76_txq_schedule':
> >>> drivers/net/wireless/mediatek/mt76/tx.c:499:21: warning: variable 'q'
> >>> set but not used [-Wunused-but-set-variable]
> >      499 |  struct mt76_queue *q;
> >          |                     ^
> >
> > This patch will silence this warning.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>
> I would like to take this directly to wireless-drivers-next, ok?

Ok.
>
> I'll also change the title to:
>
> mt76: remove unused variable q
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
