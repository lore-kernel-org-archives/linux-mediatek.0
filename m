Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD80DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1W7oNfy0w7R3XNzkCkvmx83ADjB13nKrsDaj31g5DI=; b=sFHC2G5Z+MAKM1
	kk7miAh6Ht+D0vg8RA04x//izJiQ1Y0/Koif4OJQK2Sg0TkoeMtD54T53amNYNY9j/O48L6iRPMzb
	UDoXtwd37dtqUWbezYLcIuwfpr+rk6hwmPTg2OsrA+UK1WLBTUQkIewdFdmX0v1TKYy+qJbO7yNE4
	Fa7bLZBQklj5dxiV/n8yspEC3IwXTVUFVfEXl2Ni3FJmlFo5yUXpSMW6ulGie34qHrJyrXSMjOKHu
	ncVWlA3fr6u5ulW+cJ0XG+K0GJHlLmR3YdGw5O9eNeOuZKQVsJEwoGkI3zLxbTA6LWY1ba+Keka1Y
	PeJKw7siFzSJpwzE2M7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSn3-00CalH-VP; Thu, 21 Apr 2022 09:07:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSmr-00Cafh-Lx; Thu, 21 Apr 2022 09:07:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AB8861F45275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532059;
 bh=0HWC7ec+glvIpCeURwckv2JXqZkHzdllhtNLJ63db1c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n27EksOKKfO70UpAqE050D5D0Kyw7zOs/Lt6uNLZ+m8P8b9/hPVG/0zgfJo8X1npi
 AluSwqObfgMJNjSrDIAT1v0rUmXiww1rp8Y+awXOTldin7il0UsbcKMdJIbDNWsSOX
 KnIIwmr7aD+Aevmp5WDyWGTFxthf2jYlhmS35VyYFkjd7HL+463rc60Rynx77Dlthe
 uhIyAtf16kLw3fnokjXw7FRj6A9gl/DGLNEQjPQ/5MzmvrbVuJSPT3hC/YeMEeBwvS
 AlGvIWrHC8tqdq5GFxujBFjrjrUSE2tPeEmknw8xKH7hNK6ka63DGh3u5urrYqyoNf
 eTwz6Whgxjtkw==
Message-ID: <e2750949-72b6-6a7c-148c-221c01eaa0e7@collabora.com>
Date: Thu, 21 Apr 2022 11:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 12/12] clk: mediatek: reset: Add infra_ao reset support
 for MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020741_951407_0CD5AB56 
X-CRM114-Status: UNSURE (   7.80  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> The infra_ao reset is needed for MT8195. Therefore, we add this patch
> to support it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
