Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FFBC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEnQAhpRm9wgv8Kg1ijs0suj/X9trB5tl4y5yogj8BE=; b=ieCkuGLj+1TfFwYzVf97HVFSKI
	TkNu2yT+qz4e8d5XWvq2/esggleX9746XFTRiPv5mU5TLsuO75w0wqZ8hRnpaaITeDGB52XMf2LPE
	EpELpvUiu7KuGtdx04A9JLpCs3CB6cj1qIStIv6ftiCBigFzqhoU9fSkbIFgiDcq+PNrv5sbbPAOd
	9WUYkxed+G+Z3saVS1KVrf92lKZYKQMWyIltk43hqwlcSEryPAtdKonpLOi9v+xVAnFrC8iuAjaJW
	yZ1saXd+lu78E7VLsVGuou6Irr8Ppzw45QWkabu+FjSzVa5o8Vo4Ct6+6w3xzVZxggZLQcPdTbZn2
	NvxE/QFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGmH-005nln-QP; Fri, 15 Jul 2022 08:34:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGm6-005nhG-B7; Fri, 15 Jul 2022 08:34:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D8E96601A3F;
	Fri, 15 Jul 2022 09:34:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657874052;
	bh=GqdfRsVfLCo2VWTEZGi7k9cm/HFoOJvuQH77gu2Dunk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDykdN7WZCR7CkUpY6NB2K+XHNXANiCEgbnbDDyNtLQO+Qv9R7uewhqvy+GEBUG+m
	 zF0dpvL03LKbH0xuWIZTe0YM9siRdZPpvMPwmXml/sWj7pZgzyVIuQ7LMKvzr4B1Gy
	 +o2wih/tmqc/VMear4eT7zwT5JJsM+/JmLQ9l2wbJ2C6JaK46t85ICGq3y+thP4oij
	 SdAhjQoblPVlXJr9gi1X5H2A5EVGDu54+XGwNL40UItP0cinnqzLoW3mY2pFCIT2WY
	 KZ8u9J1TpPTDdnJrIliFzslcKliKjGlIerzie0waovd8PpYSPUVI+jpDOeMjc7lFya
	 DDOQ6Kybdxq2Q==
Message-ID: <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
Date: Fri, 15 Jul 2022 10:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND] media: mediatek: vcodec: Add to support VP9 inner racing
 mode
Content-Language: en-US
To: Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
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
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_013414_541239_8B656A35 
X-CRM114-Status: UNSURE (   9.99  )
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

Il 15/07/22 08:49, Mingjia Zhang ha scritto:
> In order to reduce decoder latency, enable VP9 inner racing mode.
> Send lat trans buffer information to core when trigger lat to work,
> need not to wait until lat decode done.
> 
> Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
> ---
> CTS/GTS test pass

CTS/GTS passing is a good indication but, please, test with GStreamer (and
show the output, as well!).

Thanks,
Angelo

> ---
>   .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 64 ++++++++++++-------
>   1 file changed, 40 insertions(+), 24 deletions(-)
> 

