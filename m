Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdimPuD04upGap8BYtJ7KuDjLzqLeLwFbnaDhwhe4XA=; b=GkK22R5c8vzs/ubf/Dbq+V/KmH
	9R+UmO0YrNIX5d1xn7wxpDwW1iIg7OPQfEgs2s7A8VFXpR9i4pCZlVyHFacAJnyZGJfgtrd2oco1w
	FsdV8e1Ot3iIRCT74nzYXafC5eBhbmBByqjJrfy0aFGjsXtcTgA3galopbxKFgEiqf1BgXLR8HmeY
	47/MO2sZLHTEV/Ve5lk5TAwmLgkCJKima8YaWNb3OrHTSqr0k58Qz0G+5lPnipua1kbMYLyqmOJ9Z
	jRODAzps3kRYr+noBB5VTToB+sKVUnb23Yca3pL4+lMED3PzWKDVlE0VEIDE+8Xayb+dnLlEVf+7X
	NZy+6yWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CgE-00Grcw-T1; Mon, 20 Jun 2022 08:22:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Cg2-00GrYC-7x; Mon, 20 Jun 2022 08:22:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 978C4660166E;
	Mon, 20 Jun 2022 09:22:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655713348;
	bh=Bw8//Vr2/4Y/0JdxL5tF76a5lDkcKuJqgY+A3/ga2oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nkDYwqvAQkgqrN1VB8RcGMCWM/y8IbVV5IMjNrJSkbf3JeM4U3lsuMtlMPqHSihGf
	 LS4afm8BEm05GBgs1KoSme5dQ+/U5ll7i5/QDfai6wrtRRhKqQDKvSK2e+CJzCkT1W
	 qEarsfCUI7gQ63UpHjMZsm0JI9gwPYKksjyrfXlqsQK1S+txPemzyGI1BJCRfKmFzu
	 jXTHmAUoWo/HhfF/hFzsl5WeOJ0p1xeCEoaFqhTEtoJwNUETILjvCjgouu5IBySRHZ
	 NR8LDI5T2dZnJ6yawv3Ek1uMm921LKw2N/RDEGk41FCkEE9AsHHhCdncqnqMg8vBGB
	 yyUD7/xVGkQyg==
Message-ID: <96322aee-6fbe-9c0c-8935-1c2d10ae60f1@collabora.com>
Date: Mon, 20 Jun 2022 10:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Initialize decoder
 parameters after getting dec_capability
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220620063217.9867-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220620063217.9867-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_012230_468401_21925344 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 20/06/22 08:32, Yunfei Dong ha scritto:
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
> 
> Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into their own file")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


