Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC1EE95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHiWTZQACnYs1tjp8e8Bh2Re/Fz5NpS2zf/8qzYPPhA=; b=BUNgPpOvWC2k8/zkYMXi+OUaaL
	3KUpwpMkAisL6YdOPXOTOoOoclvjOEv7aYsHlq9ujadNVKtOF3R516SsiEWxhTqT1416qPsitnUhI
	DmwjOBUkyiPx3t11T70ZB4XzpxIoNcGGMLZUXvJJJfqB5XIrouEZtl2hyhWLYNerb08eFpPVYOnGu
	kxxoOtURy9zSKUQZ0jVmo7ztrc6jLWgpGYrKDqGcN4+ZJ+0RAmLFu75YlJ5yTHHzxC+6XXoi47+LG
	Z8hTNHHFX0mGOsz9v4XklANF3SZuAl1WDh3PC67LyUtvbHGwYHnCuRS0ya921qSroDE+mzFTYVCc8
	Ld1rXttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppYD-00AhP6-0D;
	Mon, 09 Oct 2023 12:39:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppY8-00AhNg-09;
	Mon, 09 Oct 2023 12:39:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 203C0660716C;
	Mon,  9 Oct 2023 13:39:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696855188;
	bh=lS76ocpZeANuMGXYVZLnsbTidODtHxIumr0VpieWrD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jt0iKC8R9Wx4opcqtrMmKH9+AOy+H2tE3ng3w9EAmYZrzqYuUq6bBw6Z7slm2epCe
	 uH9u322ItomcDCaU8FcYCIbF3pERqrSS6KRPTE+rWJ2qkaPkTyQ6DfqBeLxlIcVAjQ
	 whRmSl0RtPyi100ru/U3zXY3inNCRS+sQqZiesHNd3yCimktFDLqCERXiGrhyYoT25
	 3ZC1PvmfLUT2mYHpiLPFsdr6X8K2rBppKavy7NJc6DlM9WOH7FnhgmcvCC8QxJ7CK8
	 Ev+c7I0Jytua3+XQO5/6tKiAklBEcUpl2rvKjqdZ9PBkk5XAp/7xfc9iIepuIDYsuq
	 OGijxSaQnzERg==
Message-ID: <ee6598bf-312f-d76d-93e6-16ac7f90b335@collabora.com>
Date: Mon, 9 Oct 2023 14:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: Handle invalid encoder vsi
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20231007113347.28863-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231007113347.28863-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_053952_220296_05C8F05E 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 07/10/23 13:33, Irui Wang ha scritto:
> Handle invalid encoder vsi in vpu_enc_init to ensure the encoder
> vsi is valid for future use.
> 
> Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



