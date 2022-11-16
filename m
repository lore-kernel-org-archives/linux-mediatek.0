Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B0C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83PTl+tFZHcuKG9yTkIpmcYXgraG3GmGoWrAcHahQS8=; b=TM3nNZd71r+pxj9e8ErojfiGvt
	0T/+HhcsTBCvCBQzXN7VLKsrRPx3TwBYdMxFGHr0fik/G3Nm2pq3WctWwebnaJvsXjiBL/D+EApkQ
	0Hv925jYHsDdJ+q65SKgoEVEOhw9I0XHc0+pcWADWZgLy5z0+nb0e7A429wC9hv3TAmCHyFerIWK9
	D1obn8IxhXChnnPmKr6yHVwf4/Ke3nJYSlmLf71BbZs878F269hmNWCbLQTQaowt5yhjDDgNzv5aL
	OaqyaMQSQvrekNTF5FOCZbmI/QOtv2FU989gDsyiv9I53hef6Bi/3g3bqUuEPyxvpdYN4F/auvGkR
	pdPYBWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDxD-001FVk-82; Wed, 16 Nov 2022 08:39:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDww-001FNb-0l; Wed, 16 Nov 2022 08:39:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DEF1E6602A83;
	Wed, 16 Nov 2022 08:39:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668587949;
	bh=xqWKxOEqVNkY175Qvpn8lbAyWJPaRCsExy9oPiB7P+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gvTqOxIzkBgDghiNiAFzxCeuyZIT74hFkxzRGdyjVBeSS2vbEL9b3Xn6Nny/XIYIQ
	 Jaz1baC4GVF40hgw/Dwoixaw3VpekB2l6aSQs6bTZs88MomC3ghx6R8c7VFs7yHMHm
	 s++wH48khIvhmZ7uRNCYa4fBpYH9DKuAmf6ZzSWLVBqn2EZDN30wMqwwmkMsBqUTdT
	 3fyQzupGuwyMbU4HeIt8k+AWd4P+vQKsw9DBbZ8adWHfpJN//qM+stjep68LUN3b55
	 gu/0bi89Ba8ofQzc9SghjH5B72HEpYwk7mNWxDJMZva/R8SIAH/wxty79pknb6KPmW
	 gk/3KTgNisX3A==
Message-ID: <5a1c9206-03b1-8ee7-546b-7981fc4294f1@collabora.com>
Date: Wed, 16 Nov 2022 09:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] media: mediatek: vcodec: fix h264 cavlc bitstream fail
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221116055613.13991-1-yunfei.dong@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221116055613.13991-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_003914_413642_5AA8B7FD 
X-CRM114-Status: GOOD (  10.47  )
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

Il 16/11/22 06:56, Yunfei Dong ha scritto:
> Some cavlc bistream will decode fail when the frame size is smaller than
> 20 bytes. Need to add pending data at the end of the bitstream.
> 
> For the minimum size of mapped memory is 256 bytes(16x16), adding four bytes data
> won't lead to access unknown virtual memory.
> 
> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



