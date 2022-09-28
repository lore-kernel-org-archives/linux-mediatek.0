Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AF3C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNpNb13tUWVPOOyCeFQQgqnR1qYkgzR8LXZVkmGqWAg=; b=VsY4Kownsd1vUAV1cxYQ95PPhO
	C1dMPCHz5PcNsRz6KXSOz1fIxw6Ujc0KbO7I4uiGrNctqUc+rbSuJ7CmJqTM2KG50c+XmQJ2x8Hbe
	Xinbn2NuoI45XgTxReqjLCcsPIoXnFr5HShKQL/pmtjm/BDzgTP16aaqt+bAD9zIBQxpEFaE7VbH8
	3VhPm0Fr56agmuTKidzbuHVLqpVUv6MGZXCu3jCJpocLS65V1EDfgOeiRQCEaEDMLyI8kymoG9xyp
	5H1CsXS6Vk2kUmjv79RDpl5Aj30CL6Te/DVNZ3BVOf1kI6p+oollIxoqXjkQ+zNS/lZttEWNLqj9W
	3yyszWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXLu-00GXmy-HL; Wed, 28 Sep 2022 13:43:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odXLe-00GXgq-OM; Wed, 28 Sep 2022 13:43:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EEBDC6601FFC;
	Wed, 28 Sep 2022 14:43:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664372617;
	bh=+RIOMcayb6puczD39TL+7nJiokkWKWlbI7Oy2aC8qbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rivs3AOrVx6ktJZpOAaHnhTghpDRhU4a0d52a2eN6LBIcDUYZx8X/rbjXmAHJmICF
	 OKmXUb4e9iRM/edZpbvxvsxyKqOHX+CfT5Bb4ClQLfrxSRKqteDT8H0MzG9KCIj4XO
	 AzRJcmgBvCh4kcRvbHdvSvVt2ao/nq2rd7/RRSEsn5qDjD8HBEnDZ2F1yrmFl9ls7X
	 6fONol+X6XW6JvmIWI8oTZeQe0cA/eGru3SSeXlyf/kuezeFLNVatkPLW6tLDU1eNn
	 6Rnq/YmhH6+Cj1ErycVA6vgBt0QNLQItevQqMBTWkrXHObwuNRVZb/F8478P+MaDsm
	 9d6zUA9xtIAFA==
Message-ID: <5c3765e1-6bfc-2a20-a647-0e651c40f48e@collabora.com>
Date: Wed, 28 Sep 2022 15:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] usb: mtu3: fix failed runtime suspend in host only
 mode
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Min Guo <min.guo@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
References: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
 <20220928091721.26112-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928091721.26112-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_064338_946581_BBFC3B76 
X-CRM114-Status: GOOD (  10.19  )
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

Il 28/09/22 11:17, Chunfeng Yun ha scritto:
> When the dr_mode is "host", after the host enter runtime suspend,
> the mtu3 can't do it, because the mtu3's device wakeup function is
> not enabled, instead it's enabled in gadget init function, to fix
> the issue, init wakeup early in mtu3's probe()
> 
> Fixes: 6b587394c65c ("usb: mtu3: support suspend/resume for dual-role mode")
> Reported-by: Tianping Fang <tianping.fang@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



