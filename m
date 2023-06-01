Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBC7C77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qu/GBbEX8zCYb5qPCGa0xKItTjHurP1ty5jahnnrWak=; b=VxSf9/az6WsHG4bj316ma5o1Ef
	yYbU8UU9THklUfoZCXnzZ+/pmfhN58oK5N/oMpHke09/heACrjtGlgZyARULRRDJYQhWQX//3ESc2
	m52+qdRd3U6yTAjF8f2Pi5WsvZSbGEdE7sLmlkK8oE4dZmSd3Hg8+igCtWWGhnMvO43CzaLcDGepD
	jWba0Vntw5VG7fS2qyfTOFvaQ6fm8VP+qdOhBLu4vKd2k8xYvRheyHHcyGsxuxtZw+XG2IcXSJ3Ei
	CHRyIW82C+qC5fmhKBGDXCr1g9gCOVCi8Tq9p8yFqIMcgKHaJjABmM4R0YAnqsM3v+q5WoGEH3cC3
	QmTwXULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4efd-002jvr-1z;
	Thu, 01 Jun 2023 09:32:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4efa-002juu-2i;
	Thu, 01 Jun 2023 09:32:36 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 675986606EBB;
	Thu,  1 Jun 2023 10:32:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685611953;
	bh=whFU6RQfTu4aMGzHChOYJW6hVSKs9682QmXsD693FIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CjJNE85gZL9TSf82fMtJzz4ok6OK9dj9OJTjXF4pabMi0hP8POLwTXSXbf7TlribO
	 RV/w50MZnSyOrVz+aT1bUuqDZ39NulSM7Ayle56TSdD/dCECzIo2hu9zAlieXgvsu4
	 qV2+91Tfq1EWs8YDEMNLB4mmhED1wlr3gKLzIZ9nDgoYRQAEZix6LHFC6oVp2tJ6c/
	 xaBcFEbKhHF16ngSWzcVBti5DROgVubYnUq4AXweCmEyZM0YY8FZkDWIC+YaLw9+zz
	 KCwVZPa89v4TZzMlvYFrAhejXcpvK8cH8Xr2q6Mb62E+1ikNvu683cictWmYVitPyk
	 QdnN2Cknpn0pA==
Message-ID: <937fb46e-7e52-5689-9c49-efef477211db@collabora.com>
Date: Thu, 1 Jun 2023 11:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/8] media: mediatek: vcodec: separate encoder and decoder
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230601030256.29875-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601030256.29875-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_023235_009738_ED534671 
X-CRM114-Status: GOOD (  10.20  )
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

Il 01/06/23 05:02, Yunfei Dong ha scritto:
> With the driver more and more complex, encoder and decoder need to add more parameter
> in shared struct 'mtk_vcodec_ctx' and 'mtk_vcodec_dev'. Encoder use about 40% and
> decoder use 60% parameter. Need to allocate extra unused memory when encoder and decoder
> working.
> 
> Separate encoder and decoder in different folder and use independent data struct.
> 

Great cleanup initiative! Love it!

My sugggestion here is to change the new folder names to drop "video-":
this is already in folder vcodec/ which means that it is video codec related.

So, instead of having folders "video-common", "video-decoder", "video-encoder",
we should have "common", "decoder", "encoder" instead.

Cheers,
Angelo


