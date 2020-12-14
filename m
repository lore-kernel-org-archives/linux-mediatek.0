Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C19EC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 09:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 180E4207A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 180E4207A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pI97WZgxcF2LJ1qXm2qrghxwDfjXxyTKmkr9kF4oooI=; b=pxOENjnOYJ5Kbybv6mEwSjNeM
	qMu8+/AhtP4kOxCEzCuCGa4lEZMQ76DDI+7phhbiWsKEQQiAs5FyqacX31uxMoufE9GSLQouQ0S/4
	hc3tMw9QKqm+ZfICSzNe1okhR4/WJCCiAoOPbAQLkBl6Y7Fh2vgashFpWCiGts6n2V489U8a+AHE4
	ZVtzNZO5jCvL24pMqJBaM2sZXj78zOnP5pB4/JlbuM3/pMRdI1rH7O4UUhBApEKBDM6lLzizig7HA
	sgJFnG99AbwTIoqzfzSQeCAeUOHwov5o8IANNwOg7pMK+bbPJtU/8JD4+cWiVRER3oKMW0PwNowy4
	whiO48wBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kokAD-0007te-9k; Mon, 14 Dec 2020 09:29:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kokA9-0007rp-E3; Mon, 14 Dec 2020 09:29:03 +0000
X-UUID: fcb97c96024a42428bf34593044afd28-20201214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vft61tmg3RNw1iqFL3eSm8OhJTICQW/0dIASQtTGjog=; 
 b=fVN8riiNZR4wBm6BIkoZ1D09cMtY4EbrsgwkGRqTc3hlYSK1NhzP2OZECY9joFONDZSitzdHi1VlmbEFpC6dz9/atXKVGEotEopD9vJ+EobUzHUExf+oTvgaB9Cs74Arx+GB7AxQ8/UysWn2TFI9Eh9IU7B85m8T5JZv5BRwUrc=;
X-UUID: fcb97c96024a42428bf34593044afd28-20201214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 688152073; Mon, 14 Dec 2020 01:28:54 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Dec 2020 01:28:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Dec 2020 17:28:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Dec 2020 17:28:50 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Date: Mon, 14 Dec 2020 17:28:51 +0800
Message-ID: <20201214092851.16741-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201125103637.GC70906@C02TD0UTHF1T.local>
References: <20201125103637.GC70906@C02TD0UTHF1T.local>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_042902_290487_13CAE319 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Could any maintainer help review this?

Thanks a lot for your help,

BRs,
Lecopzer


> Although most of modern devices use ACPI, there still has combination
> of APM + ARM64.
> 
> In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
> default is y if ACPI isn't configured.
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Suggested-by: YJ Chiang <yj.chiang@mediatek.com>
> ---
>  arch/arm64/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1515f6f153a0..5e9e3694015a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -260,6 +260,9 @@ config NO_IOPORT_MAP
>  config STACKTRACE_SUPPORT
>  	def_bool y
>  
> +config SYS_SUPPORTS_APM_EMULATION
> +	def_bool y if !ACPI
> +
>  config ILLEGAL_POINTER_VALUE
>  	hex
>  	default 0xdead000000000000


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
