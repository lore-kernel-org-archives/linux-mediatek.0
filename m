Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B1FC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 01:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFDF61050
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 01:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BFDF61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QIJO3XXAWYngYKRJHoiay7fkUszh5G2OoHYkhEXvq1I=; b=W8FEbkbCFFgKj+DW8r0ac24+hA
	++MKdnAhTNtOIEinm4ph4DdARMaOUdqIYmKIr+H+7/tvFbXzfEN0ABzLwY/t+8LT2iVmF46fn4GoC
	rbTZR58kDopWXk/XZMB64Y4LXnlmsr6CCiaqtTW13biJyETaFzgMSUXI6LBBurjCzwTF+Fa1FbYKm
	72tYzmIHikQ6s/EW/9hcwaEtFKCXpjPeI9rr2bzzngDKuXqRQn2naiSKUPE1oF/cwWKHMl9ZWcD7d
	eNESwHntqloVeNWTofDSN4bNxtIt0TH9/JV/k4o0JQQ7YQ4WF+9ofDRtSyhMkzBjamFICxEqzPwso
	GCMdI7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBSJs-007pBK-K0; Thu, 05 Aug 2021 01:37:12 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBSJf-007p91-9e; Thu, 05 Aug 2021 01:37:00 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4GgB6d48lDzQk3V;
 Thu,  5 Aug 2021 03:36:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628127415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fIs68ssLG5+hEm5E5iV7zpAj7/6ONqn6FWiNVUPIhg=;
 b=R8biJ9Rjg141WlHgICdlt4pPtmWtlE11HrCDZlrDlAUhat/K+fN1ruH9ti1gY1lmUv/503
 mCUvUyEnD/MjXfvLPO7rCF3niM/VYL4Xn6j3zCzZympTanDnvIg9GyF8tU0E108WSqwO/A
 98fgqSKY4V5TAoozDXqiiAF+hVaSPzDvhv2qq22frS/KBihyTJj99eWYmGqN05vTk5koLM
 KApKgU35c0GYYWZichbShD2v9KaOdXp5PV2lt+HSTuRbG7JlqxfkkEJDs9e/l461RZUDQx
 C0SZce8t42NVQ/3Z9lIyw1PYgagr0doi96ZXzpJmCccT7cemeWXdzwlS1eIgIA==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id qU8BpQ4RqCOB; Thu,  5 Aug 2021 03:36:54 +0200 (CEST)
Subject: Re: [PATCH 0/2] Add MUSB for MT7623
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210803151320.71531-1-mans0n@gorani.run>
 <638a4526-2688-e7c6-c71e-0ebaaeb773b5@gmail.com>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <77ec6aa3-95b8-3328-1587-ca4eaa4c1ef1@gorani.run>
Date: Thu, 5 Aug 2021 10:36:46 +0900
MIME-Version: 1.0
In-Reply-To: <638a4526-2688-e7c6-c71e-0ebaaeb773b5@gmail.com>
X-Rspamd-Queue-Id: 625661823
X-Rspamd-UID: 19b2d8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_183659_545765_D54738F8 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Matthias,
Thanks for your kind review.

On 2021-08-05 00:01, Matthias Brugger wrote:
> Hi Sungbo,
> 
> On 03/08/2021 17:13, Sungbo Eo wrote:
>> These patches add support for the MUSB controller on Mediatek MT7623.
>> Tested on Mercury RUSH-318AC Wi-Fi router.
>>
> 
> Nice to see you are working on Mediatek devices.
> Are you planning to add the device tree for the router to the kernel? I'd be
> happy to see them submitted.

Actually I've never thought about it.
My router device is not for public sale, and the device might have been
locked up in recent versions, so I don't think anyone can ever use it
for that specific model.
Come to think of it, I've tried another model before, which is more in
public, I might submit its device tree if it gets ready someday.

Thanks.

> 
> Regards,
> Matthias
> 
>> I got to know this from a BPI-R2 forum post [1], and managed to make it work on OpenWrt snapshot.
>> I'd like to know if this also works on BPI-R2, I can happily share the details if needed.
>> And I've just copy & pasted nodes from mt2701, please let me know if I missed some big differences between SoCs...
>>
>> [1] http://forum.banana-pi.org/t/bpi-r2-otg-port/10551
>>
>> Sungbo Eo (2):
>>   dt-bindings: usb: mtk-musb: add MT7623 compatible
>>   arm: dts: mt7623: add musb device nodes
>>
>>  .../bindings/usb/mediatek,musb.yaml           |  1 +
>>  arch/arm/boot/dts/mt7623.dtsi                 | 34 +++++++++++++++++++
>>  arch/arm/boot/dts/mt7623a.dtsi                |  4 +++
>>  3 files changed, 39 insertions(+)
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
