Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A740DC71153
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBf4911WHoOIemy4BRbylsaQiFKI7AASD9DHXoJdoY8=; b=oqiyINkexHBSf0EYwsQL5Bnufm
	92vuACrBeYyPbN3Y2zoauacz4j7WM/2kTBGrkdTolN5xN3wHvoCKzyN8ngTMXBRcw5MSYrxHdM+pW
	5+STkJG9yuMJzos134P74j9CSRzbM04S/i1y73X61BwDUpCW2728+s9YKBkSuQkabcITe138laYGS
	iI87FoSkmdAPxVWp1WLukhPKL//DhafsDxeaIUMsPCUdHq/vLPQ9oRVUHGBpl7gszJ3dEIOAbejcN
	TkW2cGMx48nabpv8/gpCd01rZxKa7/puOCjXfUtu3CfWuopg9nRBRROyjSBOWG118LV0xPQNFbVf6
	rpImSICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0GE-00BkYD-0L;
	Tue, 29 Aug 2023 15:04:06 +0000
Received: from forward501b.mail.yandex.net ([178.154.239.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0GA-00BkW1-22
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 15:04:05 +0000
Received: from mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:542b:0:640:97a7:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id A88D75EC71;
	Tue, 29 Aug 2023 18:03:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id o3SX2WDDY4Y0-6J6TcNPr;
	Tue, 29 Aug 2023 18:03:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=filimonic.net; s=mail; t=1693321432;
	bh=MBf4911WHoOIemy4BRbylsaQiFKI7AASD9DHXoJdoY8=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=F/m23RXsvbogd5EMZyFLm3KDuowi3Tk5sW4leleDYuQL5iVzmSKY4BS3E3r32yIRZ
	 69okdPxh6Lgoo7nM5XaFlr/LVilHvy0rgq6gAcZVRMZENUQQOa/YJvaJxsaq8E6w0Z
	 WNPttdksjKxblS1AhuQam2xS6Pv6TfWrvOwYVo+8=
Authentication-Results: mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net; dkim=pass header.i=@filimonic.net
Message-ID: <58cbe52d-0093-eef7-fa9f-4d5b2fc904c5@filimonic.net>
Date: Tue, 29 Aug 2023 18:03:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] wifi: mt76: add ability to explicitly forbid LED
 registration with DT
To: Kalle Valo <kvalo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
References: <b08ef4d7c91c54e273c61784272e5c6f70c3c137.1692896654.git.ryder.lee@mediatek.com>
 <87edjmtkr0.fsf@kernel.org>
Content-Language: en-US
From: Alexey <alexey@filimonic.net>
In-Reply-To: <87edjmtkr0.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_080403_225103_8631F283 
X-CRM114-Status: UNSURE (   5.83  )
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

DT specification 4.0, section "2.3 Standard Properties":
 > DTSpec specifies a set of standard properties for device nodes

DT specification 4.0, paragraph "2.3.4 status":
 > The status property indicates the operational status of a device.
 > The lack of a status property should be treated as if the property 
existed with the value of "okay".

On 2023-08-29 09:39, Kalle Valo wrote:
> Ryder Lee <ryder.lee@mediatek.com> writes:
>
>> Add ability to explicitly forbid LED registration using DT led\status = "disabled".
>>
>> Tested-by: Alexey D. Filimonov <alexey@filimonic.net>
>> Signed-off-by: Alexey D. Filimonov <alexey@filimonic.net>
>> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Is this a generic Device Tree feature and already documented in DT
> bindings?
>

