Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9180BC83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 641A9206F0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MK7FYwTO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="frRLy30h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 641A9206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaYTHI7HvWV0jC4XEJTIhKqlF27+L8/cckzYekBLf/0=; b=MK7FYwTOQtb2ZX
	e3NT16zb9RhV0DSMEKAKNECkmRRdpPqWfEjGAEWY1EphKxweZ4LubGh5IeVdSiydMPVGrKnGj7yJ6
	NnpnWAkL9sLu368QiCpOvAj7OzBirH6fWqjKRvOr4S0aLKwVziybI/aQ4USYPrD2rudfulisqNv1G
	n/DOyECG3DSndn4kv3H2GlcFO18h9OS6KtbYhy34+bpnNN8H8PcamXmSSUAHopxDDkZG+Wa8VvZNX
	8A+qPYQdUZODzDt/QLIFBsj5h8o21YwIipGwN9QenbMMH8XM6Z/76t3K7h260SwWK4nDBPY9ou1+l
	uY2UeI4Q532SWU5YNVDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTO61-0003ZA-Vz; Tue, 28 Apr 2020 11:08:13 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTO5x-0003Y2-9d
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 11:08:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588072090; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=fl4Alxu4pKzzxjaUtTsHaIHRPRq5mkpRWAVTtpGhavE=;
 b=frRLy30h8eLLFYPUPmTbpvmr/BCPnlWtrPzmHe3t3zD6d3XZ4r/EXBl57mk3LvfBjaCdhmtu
 SG0ckEt7dlJLPRJeX8aAKCAwLy59wBQ0UvpmAYnN+if4rg/B0AUxApZ7rGofC8HYomkW73ql
 1kpJaPopWTZA16NESbkihpz+pTI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea80e89.7fa3e07a9308-smtp-out-n05;
 Tue, 28 Apr 2020 11:07:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 90856C43637; Tue, 28 Apr 2020 11:07:53 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A921EC433CB;
 Tue, 28 Apr 2020 11:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A921EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH] mt76: mt7663: add the possibility to load firmware v2
References: <db72b648024aba3243ee3b7deceb548c9bc2bdf1.1587911939.git.lorenzo@kernel.org>
Date: Tue, 28 Apr 2020 14:07:49 +0300
In-Reply-To: <db72b648024aba3243ee3b7deceb548c9bc2bdf1.1587911939.git.lorenzo@kernel.org>
 (Lorenzo Bianconi's message of "Sun, 26 Apr 2020 16:40:18 +0200")
Message-ID: <87ftcnj2be.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_040810_967374_D37154E1 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Lorenzo Bianconi <lorenzo@kernel.org> writes:

> mt7663 firmware v2 is used for embedded devices since it has more completed
> features in AP mode.
> Add the capability to specify in mt7615 Kconfig which firmware load first
> (v3 or v2) and fallback to the other one if the selected firmware fails
> to load
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/Kconfig | 13 +++++
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 50 ++++++++++++++++---
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 ++-
>  .../net/wireless/mediatek/mt76/mt7615/pci.c   |  2 +
>  .../net/wireless/mediatek/mt76/mt7615/usb.c   |  2 +
>  5 files changed, 65 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
> index e25db1135eda..c04d6a182bf0 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
> @@ -38,3 +38,16 @@ config MT7663U
>  	  This adds support for MT7663U 802.11ax 2x2:2 wireless devices.
>  
>  	  To compile this driver as a module, choose M here.
> +
> +config MT7615_OFFLOAD_FIRMWARE
> +	bool "Prefer client mode offload firmware (MT7663)"
> +	depends on MT7615E || MT7663U
> +	default y
> +	help
> +	  Load MT7663 client mode offload firmware (v3) as primary option
> +	  and fallback to MT7663 firmware v2 in case of failure.
> +	  If MT7615_OFFLOAD_FIRMWARE is not selected MT7663 firmware v2
> +	  will be used as primary option.
> +	  MT7663 client mode offload firmware supports low power features
> +	  (hw frequency scanning, scheduled frequency scanning, WoW,
> +	  802.11 power save) but is more limited in AP mode

Why does this need a compile time config? Wouldn't some kind of runtime
configuration be better?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
