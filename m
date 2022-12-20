Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B40C10F1E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS3WCTe1ly4KSuOinUBiqHb8nvKaMCf6TW6gMPSd7Kk=; b=qE2Ixl7IZchKOl137ADKldvmUE
	4PvjRENkPq71ehAg9O7XaF+NXZXzCmr9tshvb/7IgXFlZQoMD3UJY5clZZiLas/f4MLAsGsTUfoE1
	xzXg4PQmJ/ANc7iHYAWiYEjBFBEv2puJg604Q68vfzbat9epZDPcZ+fmB9BHJdHpyWFU+BUMsadJ0
	q52rwhV0u0MeorNK1++pQUpBnclbKmRqxCbmF3gmJPuAK1BwFYQz4zQy5T3kIIf8RNbaW6/TRSkmw
	yC64ilBvSoySbMZ+VhO3yn+XhqOUGOHIJpjPUCx4YuXMsCD8lgJpkOSRZ33UAdk+G7ESNGvj6KVxQ
	He56btng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZBQ-00D0Qh-Sb; Tue, 20 Dec 2022 09:45:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yzj-00Ctt4-9T; Tue, 20 Dec 2022 09:33:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CF0D6602CA8;
	Tue, 20 Dec 2022 09:33:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671528784;
	bh=h1hg3dEHDFAeZro49Tffxzn7GixzomHh8mtSfrbldaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oqyttLgFRVqBU5OPrq6iw/7Rmcrzd6IsPfIql5ftkqBrEKdX7hiYZZFaD6y6cUVCo
	 Hlz1YUP3WWE6iwFM9FbF4/CIxBk4spHAEfokcmDM85Gsng/DsZzzm+V4O5ta9tKZCc
	 r0bosJ/CnG6e0IiegqBeqoeIGjVEj5ky6YV3QOc1dZp4c8dLKQuLjBIJCXF2/XeXpw
	 kmwPun7dP1Ixk0qTz4qzlMe5/+N2RA8kPoB97KMp67Mw521EbEDUgWZI5cGyALSVgt
	 ULXtFf2Yoh0AsR16gzDrUU04k8zVc+CbmLTTUsaB1M5AaUAInXdRyau9uIZYrBIVTx
	 1fTyNgJlBqGiw==
Message-ID: <e8f4857f-85e3-d5a0-50c2-534b24c11cf4@collabora.com>
Date: Tue, 20 Dec 2022 10:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2,4/7] media: mediatek: vcodec: add core decode done
 event
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
 <20221219064332.2124-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221219064332.2124-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_013307_589004_C1360FAB 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 19/12/22 07:43, Yunfei Dong ha scritto:
> Need to make sure core decode done before current instance is free.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



