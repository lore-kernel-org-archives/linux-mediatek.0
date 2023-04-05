Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA139C76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxH2RPg6J7zXesbiQGi50JFtUolxVlN2Eg12XBxDIlY=; b=kjOsXJIkMMTzRk0Fq4LZ/bRw1m
	PX/YVgwwlwgqAWeOuuMDpG6g4ooYQF8BSIo7X1A0E5hhwtXEbggcKWuxxbj3ZiWvPDvQg5+QQfxXd
	cAvnGrBFbzx2YAnsV6FHbGTaCFmVziUIlRZJB5uexZhvsXTE8S++6sFuazfT6/vz8gOeXfZkEhnLs
	1DzjTMH9BmXYJ6Wgckx+ZkmKXJpCrEMqbexP+mAlC5dd9smyuT/Iuhn+pc2Zj1wIpOUb4c6VKtKgA
	qTB3Yu66yLPcnFDOnQtCmofnVzlT2Vsra/f5jAfQuowvEnFNW0YjSvA13tYttEWBZMiEddPG2JnY5
	iTsap75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2na-004T65-2i;
	Wed, 05 Apr 2023 13:03:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2nW-004T3A-2e;
	Wed, 05 Apr 2023 13:03:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C6456603187;
	Wed,  5 Apr 2023 14:03:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680699808;
	bh=6sDDJG3Wyb9fV/04iwo5RqumN7KepPjmsLUQacDBkk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cGo9VoYEm4PuTrXVh5c4xqqenDZH+sGlUefOYdUCBblBW9aCN580bUxhnbwXOGSdw
	 AQV8Ab9cGrHHrydj3LdUuNxqQWX9Pmg/o/rFto15TtHnG0rBOZnIDSE0xOwPYML7Tq
	 vKNWACsnLZSgaS84Po8VUSe6i4/1Nf90D4JPEqtvw5ZOSv80hxZQr63e/c/Dt5lJUW
	 wOIXzhUgMZ/FWkURqKE4i7q6lp92sNOnT2CyD19w3LgevChKUyYU0J7BhvnZpPrdhW
	 6kdLat9wDmTcjZHz/IHYIQlqXXbQ4dqVOl/G+w+KydV7wqA76G7fXeIPGcdGnrGl/O
	 RuBJONBATxPRQ==
Message-ID: <c8a335d4-b621-8b65-ee77-87870425411c@collabora.com>
Date: Wed, 5 Apr 2023 15:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v8] media: mediatek: vcodec: support stateless AV1
 decoder
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
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
Cc: George Sun <george.sun@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230130123816.16568-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230130123816.16568-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_060335_014357_194B98C9 
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

Il 30/01/23 13:38, Xiaoyong Lu ha scritto:
> Add mediatek av1 decoder linux driver which use the stateless API in
> MT8195.
> 
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On MT8195 Tomato
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


