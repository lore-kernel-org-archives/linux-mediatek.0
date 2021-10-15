Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C23C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B0A60F44
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 11:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45B0A60F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOeDJUTpskmo9E76m/8e9ntpWCRXCDOlvqaW3nev6wA=; b=e3Wg2muuzkjchCplg4U4Gkd70/
	0ttRzjGolmxytW3FyYhzJ4dnfuyh0vfWnahOdzxSJlmOxiXb116fZhRI1eWmbDcAdWDPGUEKnqGqL
	aejqWVHrm5QbFAWtrZ+Dcn0qIZl6k2bQJVgemoEGxVNbFUfbdNjd6jD4zBuv5DRuBpJQ5t51/GOtS
	LClT5+6o5EBR9HGNhSpfgQHkOj0K9ukXGW6q1OfwMr+9Vp86z+xmwBs9wueChvbnIYZ5/sQfjCngf
	V90Ai63KEB2YfGbuAoUXnNZmZOSZ1zulICPJrlXBWf3EtEfXn0B9YPF6Nu6uvv08ecpImDFxbtc1k
	fsvwf1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLKZ-006hvu-LT; Fri, 15 Oct 2021 11:24:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbL2V-006d4f-ON
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 11:06:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 23EB81F45170
Subject: Re: [PATCH v1 7/9] soc: mediatek: mutex: support mt8195 vppsys0/1
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
 <20210917032728.22367-8-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3ffc783f-857c-2b69-f709-7c25859c6564@collabora.com>
Date: Fri, 15 Oct 2021 13:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917032728.22367-8-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_040615_986044_1C722D31 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mt8195 mdp mutex info to driver data of mtk-mutex
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c | 53 ++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 

Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
