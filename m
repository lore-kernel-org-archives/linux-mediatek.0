Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B05CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFjREwfqAJH9grPOMD/xx4/Kbi2oQ3OgpbxjWZn/p1Y=; b=dAYs4c1CS1jc67iyjz/qUcEZq5
	IGFgau3sxXLjsKpzIkNx7HRNcFWVNxRgLxjY6By5yS7Kxur1cqD+8Hsg/a60swNSE3yNS/zSR8daS
	RRa/C6XjSFjSz1+chxc/VZCbqmf1aFJoz0PNV5B4OFL2OP/DdtagUTTL4sJdw1cizQnoqF5jH/2Cm
	idpl8GY9SaHKEr8vK/OViur9ame63b/yZNB1TthMAhOTUTZX5Haiz5udYRpbb5wft55PZzmQfRDs1
	EsxT3TUT8P6lNZEppxD7enZT8PDNuZPwQyI6szExmwsVH1WEcwcFCKD/2UgwdvwR7zNzy6ektgDdG
	GD3YuvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st227-00000001qVV-3xtW;
	Tue, 24 Sep 2024 09:40:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1uA-00000001oTM-0VrQ;
	Tue, 24 Sep 2024 09:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727170340;
	bh=Z3JCLYjzNd7msx1Ny3RqtXTqySQaWsTVeh5jTNek024=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/ABPmBUR09eEP/LirFN0dkQQzs9I3bLKAUGBUz7P7tYZ7ZEV2NVQyPWPWMvQWeGP
	 ram4NjwrVp7G95RkMxaQqzwb22+fC84CqJzuWj3GSwRiiSwWj0hmKyCGUGINXEVu/Z
	 URA5sGE3z/buVmkeXTLYRKn8nGzBBoxIUmDhkvQvAqP0JN57/RVgEr3mmKCURvTkDV
	 fAYlu+vQqMn3wNEYFIMRicm7T3CIPtdroONx86x3ctg32+xSiXh/wd0gAa3Bch04/s
	 MlLNi9Td9oK6nBWHO/9hhTQhc+/+5aDuCLHlAdHTYXwibcx1oZbY6Z3N2mxXrNDwsA
	 x69RXAyDlBFtw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB63C17E10AA;
	Tue, 24 Sep 2024 11:32:19 +0200 (CEST)
Message-ID: <f6f40eb2-83e0-4588-baa7-eaf8c41bebb8@collabora.com>
Date: Tue, 24 Sep 2024 11:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/mediatek: dp: Add sdp path reset
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com,
 peng.liu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240924083715.18620-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924083715.18620-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_023222_346665_D4B10E6A 
X-CRM114-Status: UNSURE (   9.48  )
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

Il 24/09/24 10:36, Liankun Yang ha scritto:
> When using type-c to type-c to connect to the monitor,
> the sound plays normally. If you unplug the type-c and
> connect the type-c to hdmi dongle to the monitor, there will be noise.
> 
> By capturing the audio data, it is found that
> the data position is messy, and there is no error in the data.
> 
> Through experiments, it can be restored by resetting the SDP path
> when unplugging it.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


