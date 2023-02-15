Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB36C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8H8mu9i21nD9T/tLzphFD5xIasNjV5ytwds1TrKkMF8=; b=S3rOViNz4uLToiiuTLiNbeX4sR
	U2mgibBzHMy/oM7z+CDTnUM0zRjCgIMAEI14wBy5Y5hlgL3IKcZI7l2um4GbxGQRfJeWzxHka2UFh
	OM+Egfgdb1EcK/A1xlVlT51wbgUIpB/l5rDdKffJgMekHl/2hKzjJQCrEkKZPpjUlstzxVJd17066
	Vlm7/yQ1RDH+QAEE2M5LU8r46KInpZTvMhbd+Jz4Dm0HlVl/3Bio3eHb5oRyxIjbxvWTVvkBJiqS0
	3jUGOBI8KUhBRPqKyPFgCuKNg4SZy316y+6Q3zHJMtUvZBWiylYxFTuypqOWMjsotsOwiNTnTVxbv
	qp93Gg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHk5-005yFW-IQ; Wed, 15 Feb 2023 13:22:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHju-005yCT-O6; Wed, 15 Feb 2023 13:22:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E47DE660218A;
	Wed, 15 Feb 2023 13:22:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676467345;
	bh=8H8mu9i21nD9T/tLzphFD5xIasNjV5ytwds1TrKkMF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AbxZjP977pQ/LXxUFxyMTCiOvBm/px39yNUb1Y3KW3ZAVWR6J68paW4DXlhBbKMWY
	 J6vKmbagRTSzfYpSaBbPru77XJBbDx0AGbnMRH28c0C9GRGXts9kV9U9uYl+L4ap6L
	 52DhYbhF4TlJ4ZcM5kGSL47eM++uQsoZ0xuJRCF90DzfA2NFQ/twU0Y1sYx4HJWRdb
	 p/7QX1TPo9mNq58MfAuBeSu4SKnRxHwm5qb+yt5q3FSronItrUGvk17nst7lTtHyIk
	 VaOUFyIG+5FstrwqYY/qO1AE/yJts4kMAD8VU918pE23VTcFkl7yKoHm72uTShhEpa
	 5MnYDKNXfIYug==
Message-ID: <6ebab3c9-915d-0655-6ef9-6bf0ed2eeccd@collabora.com>
Date: Wed, 15 Feb 2023 14:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH -next] thermal/drivers/mediatek: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, matthias.bgg@gmail.com
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230215005457.21242-1-yang.lee@linux.alibaba.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215005457.21242-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_052226_940656_E1BA210B 
X-CRM114-Status: UNSURE (   6.13  )
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

Il 15/02/23 01:54, Yang Li ha scritto:

Please fix the commit description:

Remove an unneeded semicolon to solve the following warning:
drivers/thermal/mediatek/lvts_thermal.c:520:2-3: Unneeded semicolon

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



