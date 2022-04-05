Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDCAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in70ucA3v+WRoLx5MI+of0aQirNsuNlNuCA1K53yog0=; b=E2lRZ1U2oHRl8IV2WiR5a/VWJ+
	+AtaVOOVcV6MJXOOkySyEUyQWoFohWVOcKUtQa+txpbqX302kb80NLS0aOsrUWfi8JkpgLengn5aZ
	uUIl83FvgLbkpU3HSZPG92MY5K4mS6q58VRYDDB3ier9KxUb5zM7X5UFouXUluoIN9WWYbvx5ivoM
	elYOdMJNmuFEhp4HsNKmrtCEDAVUy30YCtH/WVuFDWfLlyd9ng9/kr6t4TxW5UxdDAKYWOZ8M0dno
	/DjW4CFqBigE4T1EylSUW2cHUJ1oeT5GR9dfXtiORfu7Akhcs5plFMh1yW+QUWhzP7SpSrTSoLyzk
	wr4/FHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbjER-0019np-KS; Tue, 05 Apr 2022 13:28:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbjEG-0019kw-7j; Tue, 05 Apr 2022 13:28:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C7E11F45039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649165288;
 bh=Z7ly7VhlEOXC12e1olu1To154Rm7ZW9SK4TYqH7rDZo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YHL0QdBT1QmRtgT1WU9noVhfECYnV9pv95Lc/V6R++QnDzUSC2k02WMDvZxPYIqfC
 gLEPY9mGBOB3Ne3oJ9Fvio2HgVmNjVcTPPJywzKLqnLMgSHzyyxNm2VU+OKPP7xUgS
 NxHwaXlNkMsQ/0RoyXHb0SeMz7dJ9xRxhR6tUCYcwGWgKSpCG91s4GtEhC5WjcfAQ8
 fdMxOZq/UtoMGw2siwvAgd0HgX4GvVXbRt1i/W+IOsTvRtIQZFxYAEieFZrDEHzDRx
 TsPLd3kKeLSeWHpX3guu/wf6Vy4idnvwHtLUOAFiBAH4HGkH1w0w6y+HElgwdZltN7
 8yKI1tAXvkkaw==
Message-ID: <4bf0e4e0-6b87-5de3-22ff-b1f6b4cde0b4@collabora.com>
Date: Tue, 5 Apr 2022 15:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rtc: mt6397: Fix potential NULL dereference in
 mtk_rtc_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Eddie Huang
 <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220404132553.28064-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220404132553.28064-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_062816_454073_9879F220 
X-CRM114-Status: UNSURE (   6.47  )
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

Il 04/04/22 15:25, Miaoqian Lin ha scritto:
> platform_get_resource() may return NULL, add proper check to
> avoid potential NULL dereferencing.
> 
> Fixes: fc2979118f3f ("rtc: mediatek: Add MT6397 RTC driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
