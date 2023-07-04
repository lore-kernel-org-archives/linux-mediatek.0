Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E8C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aq47B29bXJzrFBRuSE2mt59wfTh8kGj23uIbGTF0YY4=; b=KLD9rGgZNee/t5NUd/krYzFRcL
	fxyrvHZC0meJhn+8dpWkdclkUea81YIx1wAS4ej6DKuPMzxsn4k7NbAWPwFHjp/S5NOWa83t6UrtO
	dK98C0u3NzJCzjRv4Rg1hqIr64CKLz5I2KM/dtwjrwvrI8jv0zmbtQ6k119V4dedgAeAVu2+bpurE
	UZRSdJ+hp6mqagDy4joNs46j6BOnyyIQ28G1VnNCRlfuByqy+4Ur647zqYHdfJWiVBMwqoc22e3gc
	jRTzrElLtre5F3tfIy8Rgb3F25N3jDqvdpl2PZHw3CjuwvJ13ADIoNNnwQJX6vcr2yE8uwIX0LULd
	cOiPB3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetz-00DDNR-23;
	Tue, 04 Jul 2023 12:13:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetv-00DDIa-1C;
	Tue, 04 Jul 2023 12:13:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4642C6606F8B;
	Tue,  4 Jul 2023 13:12:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472778;
	bh=CjCDfoY6i3YerAvedNb5hATHIfJzgR2uOpS4TTgZOTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W4slGW667UPKIThapHffTziQPpnmELSow9332LOXhlPN2RqMl2B2vqziApzo8iDrm
	 RaxqAks6khxIix/7LNIh6Pdn/iclPuh+68S+4Rblv5XUbbtodl9wVAs9cGKWLtJJsF
	 hBCwBWQgWNTI4SIY2eJV5otAgaLJimQXpPrcHvyZbKv+lujS/F4aTHJjijhG/dvYGh
	 i+ngfHnjih5nDLeXQgayIIqQDor9QOHGsPiW6QPq641gCCWyGCIC7pwxpaz3PcxT+t
	 3wPUh5Vrhe3K9h2yEa7hZZjlCBfgA3MpL9zBJRJDH2b2B+dyis3mugvp54W7rTNTgE
	 9rrWo970Uw4xw==
Message-ID: <421d7e5e-e28c-12ef-90ce-c976efd5b37e@collabora.com>
Date: Tue, 4 Jul 2023 14:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,07/11] media: mediatek: vcodec: separate struct
 'mtk_vcodec_ctx'
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-8-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051259_548606_208ED992 
X-CRM114-Status: UNSURE (   8.05  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> Adding different context struct for encoder and decoder and removing
> struct 'mtk_vcodec_ctx'.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>   .../mediatek/vcodec/mtk_vcodec_com_drv.h      |  76 +++++

Only one remark. "com" may mean "communication" or "common", but if you rename
this to `mtk_vcodec_cmn_drv.h`, then "cmn" can only mean "common", which would
increase the chances to immediately understand what the header is about.

Unless, of course, anyone else has strong opinions against. Besides....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


