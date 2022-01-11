Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E18BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6WivZvTke8qaFBkOqaCK3lNNo2qMYd+V5AiQgOZ+Aw=; b=1OloYVuK/jJ81/
	DabRiPk6tvJUzYaHCQ9liUc8iMk6hUWsOQZZGNnMQNavVv8Xrgw/rCjnUJpW38Op5wR7/T0rlFEF0
	m6f1O3fik8leooShOPFJwY798viAFvRoxD/y2jrreEFrkeyeDg8bR8PA6GJrax5Wkkp/mwAjozDRo
	gxQoyRpvpB4yIT2FdfMoxn0/5uMFqi3IH7BmfTifo3c91LVvJuo5TNebV0m/tuC439hDtMoVlDRr/
	z8KvBRzxDHiPYnMCUfHdSTnDvUxdBKjTsad9GdobB990xQo2VjklbK/xwS82P+8xYrdsmMIJbhgiw
	KyOTQAPkNprTXC+EHb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7KCg-00GwFu-Qk; Tue, 11 Jan 2022 16:40:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7KCd-00GwEl-Ez
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 16:40:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D40DB81C04;
 Tue, 11 Jan 2022 16:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB1CC36AEB;
 Tue, 11 Jan 2022 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641919253;
 bh=Y2IVdlDLNkGK89m2PZayELW8CqtVDCU90Z1d+TZxhgM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cNwevD4+aexC27qSFBbb+1YufQzl6rr29YeKDHvh1v5G+0sANGa/71YGTUpDdOJFX
 D3KWlmA76DWqV4CvACB/g7FsfEtYCoQ5ePQZGeZq4R6XOcpt2Ty6D2yONYfDCPrAlO
 37Lhf0O8WxV2yafNEh47n+SdahNc1gbKzlVC51Ba+bIHhZAhoym1QbK2Ra8JjwJ0rh
 54iKk8QJZvKTv6QAiY/MCImmHkRMKM0DRp/w4hBrxHLZzN8LHeRmBmqKCgzN581PrO
 ThlkwTAfmIE3k8SsFKnCDP3qWMzQE44OCLh9PekAPfcLI5FKWT3axYuRyESC9CmZX2
 wOAOZmzFiimWw==
From: Kalle Valo <kvalo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/5] mt76: mt7915: add Kconfig entry for MT7986
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <04237351a4cb3b773f68a1cc55d1b8c419ca06a5.1641901681.git.Bo.Jiao@mediatek.com>
Date: Tue, 11 Jan 2022 18:40:49 +0200
In-Reply-To: <04237351a4cb3b773f68a1cc55d1b8c419ca06a5.1641901681.git.Bo.Jiao@mediatek.com>
 (Bo Jiao's message of "Tue, 11 Jan 2022 19:59:20 +0800")
Message-ID: <87bl0ijkdq.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_084055_667907_AB2BCAD0 
X-CRM114-Status: GOOD (  16.61  )
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

Bo Jiao <bo.jiao@mediatek.com> writes:

> From: Ryder Lee <ryder.lee@mediatek.com>
>
> This enables building support for the MT7986 SoC built-in WLAN chip.
>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> index b8b98cb..8db1ddc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> @@ -11,3 +11,14 @@ config MT7915E
>  	  OFDMA, spatial reuse and dual carrier modulation.
>  
>  	  To compile this driver as a module, choose M here.
> +
> +config MT7986_WMAC
> +	bool "MT7986 (SoC) WMAC support"
> +	depends on MT7915E
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select REGMAP
> +	default y
> +	help
> +	  This adds support for the built-in WMAC on MT7986 SoC devices
> +	  which has the same feature set as a MT7915, but enables 6E
> +	  support.

Same as in v1, why 'default y'?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
