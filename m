Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAECCC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T96X6kAUoilkF1zuUm5DL8ThYAv/mZueKldULmWE/zU=; b=q8/q5g72Nl0E5C3f1CeFYADyA8
	1BjsCdw2/1s+px+M304KlnXuS/v1fGnkD+sl1x0hellchVMbBwDihs0JXko3FJQHjjzcNWQGYHk8e
	DAWPUeftRI4/4G7Xg836nYo4U13OsNFuyhN5QrMM64Zj0l9neI9w5e/8x0vltETfHIHKMcDPotQ47
	9PYiUhnviyqisGGUCKw6fGHx8+M7rjAF4J3038ywuyOjZ0O2tjaVFl8WdGY4PXSVwTq3w7kC54AGM
	9dyguia5pcfm08tFHZ/WoVJzpNsnNtesJFZZBxbzD/3ii1qILBBOLJ6N0/uT6KdFkBUuyurjQzmLc
	ZggvOhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFaS-009shL-AU; Tue, 26 Jul 2022 08:06:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFaA-009sKm-Ky; Tue, 26 Jul 2022 08:06:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86A616601B12;
	Tue, 26 Jul 2022 09:06:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658822778;
	bh=MNrUc27nvflxHBWPOSWvk/R35+T8mTF6A6eoo+o6KFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m8Zq9Vjs+nhENoayJMvgrwpgB5uvGMP+uuYVanZXnTCE8xWHNgUk3AZLPUjabXhQQ
	 hPpcR8z502BdXcVxgjYXZThkEz6BejjZVCYIAjDHTk+Nj3dOiaqOyRpUNciGZoZRsJ
	 HTYZQCIZrLwc9ao/CYRAUsNFJDj7/aB2pKHe2jLMRI3ZD9hjPsqGFuzQOddmBXUOhj
	 u4GHvSffq7ebvMgj7LG2jx18krnOiVywOJA+ZS9RoqGVeA3dlWy6dvEg1X20ddmN5u
	 1TnuhWJs2TWsYwk85gLVnGDvYaC7+7Ay71lETZAlNx4dsx8eQKjV9i2STnttsBsWOn
	 pSQycEr5SJdCA==
Message-ID: <22404581-c58e-9703-f0c1-ecd6d44db4f5@collabora.com>
Date: Tue, 26 Jul 2022 10:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] media: mediatek: vcodec: Add mt8188 encoder's chip
 name
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220726040155.17206-1-yunfei.dong@mediatek.com>
 <20220726040155.17206-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726040155.17206-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010622_946458_8C44406E 
X-CRM114-Status: UNSURE (   8.11  )
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

Il 26/07/22 06:01, Yunfei Dong ha scritto:
> Getting mt8188's chip name according to encoder compatible name.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

