Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F3C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 15:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D31821925
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 15:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmpAZhfn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aNg9ioEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D31821925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFLA3tbQlRbW0BfNgRkZnk+CJLQIqGw9SI3K57gcszU=; b=mmpAZhfnDXGKXu
	pwLMdEZe3h7PITpgyLzIH2BPxlWiCBY4xPP4Aj+7r76lKodubwrPWMyWRxv6l0O4I74Y1X8r9X72t
	QG+BGb5b9YWQL7P4ksN/oXw0xePUl0hf2aPMUwVH/DH9lEBw85EF5IlreWCTfYNUiRvl3N1UI+XGh
	MnebVO4x2LnYQRFFv+qZWI34ECjOTJ7fTDwYQSEjgNbynxV+lcDv+1gUGLhgFP/tH5cEjyhBOHBPq
	rOegsHlii771J9Qf3NPfR7JSoM2AnpylifyHAE+G6PG8TCyOxPT4FYVEHerN8lrWK/nO0NTVoQcf3
	iCTs8exrmWqmR5Ouh9YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUXye-0005Io-1k; Tue, 12 Nov 2019 15:21:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUXyV-0005BK-IP; Tue, 12 Nov 2019 15:21:01 +0000
X-UUID: 52c0ba2c7e15426eacd45d86468fb3a5-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=00tgKT8PrLUAKPdNow52sT3g7JzrzlOSLvjva9U8+i4=; 
 b=aNg9ioEjCTD/UuYmx8I4EXhlGq50s4f+4LuI+vC5bWHhtG48cfYoCBtno9Ajr0h99ttHRs+Quo6opAPXAJzhd5W/64euQwWYXsntYJvEa7I32kjrnZKFUoS8NXK1PzF3Bb2k9UdKHI1T+o/YMZpffUdob4Zihe7ll5WTNcQwzjU=;
X-UUID: 52c0ba2c7e15426eacd45d86468fb3a5-20191112
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1419718016; Tue, 12 Nov 2019 07:20:55 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 07:20:54 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 23:20:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 12 Nov 2019 23:20:51 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <lvqiang.huang@unisoc.com>
Subject: Re: [PATCH] ARM: fix race in for_each_frame
Date: Tue, 12 Nov 2019 23:20:51 +0800
Message-ID: <C1108AB0-9156-426F-A933-486B4F5C91CF@unisoc.com> (raw)
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191112132937.19335-1-mark-pk.tsai@mediatek.com>
References: <C1108AB0-9156-426F-A933-486B4F5C91CF@unisoc.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9C74EC90DFF44018F894B585C421D81AFE7E4C3710BA51A8D0AC3CF6940C760F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_072059_616076_60630FBF 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: kstewart@linuxfoundation.org, mike-sl.lin@mediatek.com,
 alix.wu@mediatek.com, tglx@linutronix.de, eddy.lin@mediatek.com,
 gregkh@linuxfoundation.org, yj.chiang@mediatek.com, phil.chang@mediatek.com,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, mark-pk.tsai@mediatek.com, info@metux.net,
 enlai.chu@unisoc.com, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
Message-ID: <20191112152051.Ddes0X4wMrqMeXtSkWZG7emYcEA5WwFoTGmvob10U8Y@z>


> . 2019.11.12..21:31.Mark-PK Tsai <mark-pk.tsai@mediatek.com> ...
> 
> The sv_pc, which is saved in the stack, may be an invalid address
> if the target thread is running on another processor in the meantime.
> It will cause kernel crash at `ldr r2, [sv_pc, #-4]`.
> 
> Check if sv_pc is valid before use it like unwind_frame in
> arch/arm/kernel/unwind.c.
> 
> Signed-off-by: Mike-SL Lin <mike-sl.lin@mediatek.com>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
> arch/arm/lib/backtrace.S | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/lib/backtrace.S b/arch/arm/lib/backtrace.S
> index 582925238d65..84f06381bbfb 100644
> --- a/arch/arm/lib/backtrace.S
> +++ b/arch/arm/lib/backtrace.S
> @@ -64,6 +64,11 @@ for_each_frame:    tst    frame, mask        @ Check for address exceptions
>        sub    sv_pc, sv_pc, offset    @ Correct PC for prefetching
>        bic    sv_pc, sv_pc, mask    @ mask PC/LR for the mode
> 
> +        mov    r0, sv_pc
> +        bl    kernel_text_address    @ check if sv_pc is valid
> +        cmp    r0, #0            @ if sv_pc is not kernel text
> +        beq    1006f            @ address, abort backtrace
> +

The sv_pc can be a kernel module text. 

The module text area is ok for kernel_text_address().

> 1003:        ldr    r2, [sv_pc, #-4]    @ if stmfd sp!, {args} exists,
>        ldr    r3, .Ldsi+4        @ adjust saved 'pc' back one
>        teq    r3, r2, lsr #11        @ instruction
> -- 
> 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
