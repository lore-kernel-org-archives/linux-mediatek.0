Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1647BC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnoNN6tKAOoa2VHxAaD4jz93vnLmnMtUmJhjlhgp7G8=; b=sVZmyPkCTQvRRdQ33DhFyK39vo
	Vmkp+YmpIXJ9Kq45PBgrxlLx31ga8V0Gs2ln73/SCZk4ebkezGnWEFYH2gbNAnI7z2L6Wt0uW+Va9
	Q3CRRPYBqpzyf9zdXxYpKHwEb6TzEktoVEIoO0aN0D/XmQ0VuYkq4aGglXJDMmrkghphXvA0ragpZ
	en61yt98fOLUCt/d/B7JDhhglFhWhgJ5zq2bomXbY9iYYaneIrB5hXKqyd0c6pdrqzKi8Q6DLtWww
	/BGvj2yPzLRNWpn1MoGLeNLkikfmIZt0Vokh2wmjL4GXtevsPGshyRg/ykmkhJhogfUktMfgb9bNw
	gJOAofoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHiG-005xnh-EY; Wed, 15 Feb 2023 13:20:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHi2-005xkU-6E; Wed, 15 Feb 2023 13:20:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A33E16602181;
	Wed, 15 Feb 2023 13:20:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676467228;
	bh=TYzhCq0RKGP5tpidHzO4VKVYdmJ57P4wYdGQAji5b0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bu+48H/hM7AnP9NpE/sqVa6pKdlign6Ms3WEA4LvK7cSBn+NTpLnxRXaSbtKrLfV5
	 ZSgbV+MJKryaWFxrTMlex8xOLMpfcgvSum9n/ZPxwW5cEKlosnu+UcRfG/SPP0Yx6z
	 00aiMh0FoZBaMrdy6hHnojBWBNN2p0bJgiB2oxDvARo8iF7Yrvg+damxYA+RZvIINw
	 gkgUJJahKoxfkkMwhHh7fnNkv9BK7+W5NzeoJLfedpyJTparfSWBaXaOYhAZk+81sk
	 0BEvtZuRlPBZTwocn0h4Q8YFXX+qCwFV6KFlqdUGaOrDnfe+5VtdnfGZA26jqGksA1
	 e2K2VEBuv89zQ==
Message-ID: <c6b23a24-4799-2b71-0bf3-f2545980ae3d@collabora.com>
Date: Wed, 15 Feb 2023 14:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH -next v2] wifi: mt76: mt7996: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, kuba@kernel.org
Cc: pabeni@redhat.com, matthias.bgg@gmail.com, ryder.lee@mediatek.com,
 lorenzo@kernel.org, nbd@nbd.name, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 edumazet@google.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230215055650.88538-1-yang.lee@linux.alibaba.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215055650.88538-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_052030_386249_E4381389 
X-CRM114-Status: UNSURE (   5.70  )
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

Il 15/02/23 06:56, Yang Li ha scritto:
> ./drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:3136:3-4: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4059
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


