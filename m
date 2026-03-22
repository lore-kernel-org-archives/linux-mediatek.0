Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15136FC72AF
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHCc8YdbXAd4tT2+dhaomC2NfJx3IFIemBPUrXZaJMc=; b=nCLrvJ37ktdGUtYZi24jOUNWCk
	JONvC3ekvR+11Z/vmsLsIn44KMsdm6AYQDsPDo84Cmr4YLz2A/dwJli42t9fD2i5qjkBcmn+Uj9//
	+2UY00FeBGtQngmFNtNafEm7OpVnJK2Zkf7XJnCsd1JjAhxMe/I5WL0v5xgnLaCnRYcOc64VLGb+t
	57VEzeRibhO4wnE33FizBVri4AdNBZgaA+ZB2A++4rtoTKMq+m5vQOhm3pfhpPKcpZ8v88ljlV53+
	MtV1MTrHYC9+NiSpM/WTryIGV11ki7oNXhj2JdBWyV2SyAbSNumOJcqRtwAHju9hd8+acbH/DgAA3
	R4gH5vKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Do7-0000000FAfm-0Izb;
	Sun, 22 Mar 2026 08:05:11 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Do4-0000000FAfH-13Uo
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 08:05:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92697422AA;
	Sun, 22 Mar 2026 09:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1774166701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:
	 disposition-notification-to; bh=XHCc8YdbXAd4tT2+dhaomC2NfJx3IFIemBPUrXZaJMc=;
	b=aIffeeDz8Z7ukSglxBiFW2JVW4etELCMzU6hX2Sv0BB7pT7eFSrFJPOKs6l146Olefvzjn
	ZMf1a5NtvFT0aLsexQpORxaFdoJ78qMgvF8qEbyiP4tvc790P6nZV8TguiB1S0Imx/skpR
	m/3dezGwUvg28ajXknhRwLAF3nGVqopU8aoCHNve/CzXF7XKRseenlwCMYVsv733w8M43V
	YZ2UUDEggx80VeqDrcOYrhYnULQuxu7MtfnFbo4p6uzfMndJVcOnkpzbUX1BOjvb4QVFx7
	EFPvVaAvVNmJLRoRiZGO04wa0BCR8CGic3Tp7TH/ZgR/8UTFnUSofhnzBKdmGA==
Message-ID: <4041383f-5ce3-4904-b03f-1084c72c7c8d@manjaro.org>
Date: Sun, 22 Mar 2026 09:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] wifi: mt76: connac: use is_connac2() to replace
 is_mt7921() checks
To: Sean Wang <sean.wang@kernel.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>
References: <20260219004007.19733-1-sean.wang@kernel.org>
 <cab3c9a6-5563-40f5-9389-42ae3ac877ac@manjaro.org>
 <CAGp9Lzr85cNvveAzpb6SaB2TofY06SGcVRuUq_xTWpURuc1AxA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <CAGp9Lzr85cNvveAzpb6SaB2TofY06SGcVRuUq_xTWpURuc1AxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_010508_559243_A71C7FD5 
X-CRM114-Status: UNSURE (   3.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/21/26 21:19, Sean Wang wrote:
> Thanks for the catch I’ll update this in the next version.

Hi Sean, thx. Do you have already an updated version of this driver and 
a rough idea when all of this might reach wireless-next branch?

-- 
Best, Philip


