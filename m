Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C43C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zq8fAmRp21IDRMTo0h1rtDtJR/Vhj062WFYeuWQTxOo=; b=W8c+i08w2/+1nH
	F8ObDIK/AMnErJHAZuh11FxpwcqUH78eBbBuROyH1smoQ5QSJUBRazpizazGDzMAAi9FiHfHmfIeO
	Ax3+xv6smxGcnCium47PiQz2NTPfLR+eLDX5KQDuAy4IXIwgY2Imtfhlx+tx2RVHAQFvDGtrr8vPv
	I21M8AAqRKNZlRwT5RZclXJjkXgEujQEtJ0YeH3dQIppDuMAzxqYZIFVev8XDTg06dY7+01sAVzzJ
	+1fmQXcLsSlTkGgq40Ao7/taa6O3iTl2oKoVcOMI+E/HZxjp89+5j5qvrbshlDi6UnkE5jkBA4y1a
	XaQOHRrwy/m9H+vFOYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETTI-008kMN-3a; Mon, 31 Jan 2022 09:59:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETT3-008kGK-IH; Mon, 31 Jan 2022 09:59:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D88A11F4304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643623164;
 bh=+hm6ZImxvBGa+HA0+ijccYU5XbKiUj9BJvCO0RBev24=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mrObOY6JAhNU2uhmAWi5fG6Rt2KWM/8j1W+HN7v5pTEawV1ZAPXHOw7XfVhFiB/ZX
 NHrvmOpbG3NsxjYtHSi5U/0negLFEps2UHQAL97qEr8VRI7SLc4PuLB2thGq/5eLps
 zWkTCfcdq3/nZdohiMzZhz6/dLqxF67+rKsMd7y3mmJZbB4IfgBjJWD64/fO+RsxT6
 saJFZ+k21/Mpiwr2y7LmrqMvycfCfCurDXcCqpA1BM+bVFhZFkwTRo5b1MFjc7ZrTk
 Atcgl9/rkXu2DN232INqORjE7nXB44dvIA6b2FXykn4u6ahqnfe5shbCFzXhW4iahf
 Gk/Kg0UBwM+rA==
Message-ID: <6707a581-b42c-de13-c8d6-0528955d0218@collabora.com>
Date: Mon, 31 Jan 2022 10:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8195: enable usb remote
 wakeup
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
 <20220128062902.26273-4-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220128062902.26273-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_015925_785562_DA640268 
X-CRM114-Status: UNSURE (   6.46  )
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

Il 28/01/22 07:29, Chunfeng Yun ha scritto:
> Enable USB remote wakeup of all four xHCI controllers
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
