Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E66EDE99F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuHdrsReza7zQnRFPfpd+FWY5a0V60zYnv5/CMUaRjA=; b=2c+XwRSuwDeFUTBv47ldBPTnso
	3MygeTP+l/h/Kf6FJTUP3TFD8mZZ/iS+JVNOSNa0QwfUZVnixNpUg1j3k6UMKLtQrK05X4ZCWAnGP
	1km4zU1Zp4vcTU/yZncjUIWmjl0XrMaMv3lT+h7OrCUipt3SE1MVYOR29NofBWk0nYZbtkmmQx9p1
	/gKRur50JUm3s0vW4KEDqdZWBCrnf7xvzCK/o42y3/pMwUi9GBzv/nVdWtrV4sznPZGtCaqnWq8k3
	NTBSk2Ua/eU7XCt9/5MaA6uCxFK7Ub5klESeQxkNokLiT3eONuQYPyXeKsffufCBZ5VI8KMytU2AM
	a9iythlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjMS-007xDq-1o;
	Thu, 14 Sep 2023 10:14:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjMP-007xCO-09;
	Thu, 14 Sep 2023 10:14:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EA6166072FF;
	Thu, 14 Sep 2023 11:14:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694686445;
	bh=OFvsdCQ1KzQj5G85fRFDOIGP6wxoxx66ab2XPVsGYNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O5eUS/j1EBqT+GT8lG7w3gmWCXNr2WoXzTo1g6W1TgY2sSvzHB3bBi3TJdiAlBan4
	 +WjXI2p4inBo+YqHFBQc/e86tTAYh+SSrDojVvTurYT4QYCNbcIp9RCBLdplp3BO4f
	 0oQTHfsVeS3RffWfG5UPpm1qh6asxrLn4fw7I8NLK7YDoPsZa5ce501l6C4R/+OD1N
	 n9z15xKyg7cdpENK/KbCGPyTsMgitMdqV8MarY+8xbWePdNJSK1QtS9PpGjVi3YfwM
	 cZezC6cCVVTomAhDjI6+L+evhMvinI0oqdQxpDTHyq7BG2S0L0Mm/3Qb5mbUcn9Hvc
	 vo8IGJqCve3/g==
Message-ID: <712ab5f3-eb61-f7e5-fc67-c6c175beaac0@collabora.com>
Date: Thu, 14 Sep 2023 12:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] usb: xhci-mtk: add a bandwidth budget table
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_031409_234945_B1A9A34A 
X-CRM114-Status: GOOD (  12.69  )
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

Il 30/08/23 14:28, Chunfeng Yun ha scritto:
> In order to estimate when fs/ls transactions appear on a downstream bus,
> the host must calculate a best case full-speed budget, use a table to
> track how many bytes occure in each microframe.
> This patch is prepared for introducing an improved bandwidth scheduling.
> 

Hello Chunfeng,

it would be helpful if you add a cover letter with some test results for
the BW improvements that you're seeing here.

Thanks,
Angelo

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk-sch.c | 113 +++++++++++++++++++++++---------
>   drivers/usb/host/xhci-mtk.h     |   4 +-
>   2 files changed, 85 insertions(+), 32 deletions(-)
> 


