Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E3EC0755A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrrDYJhGTVbA8PCblVkOYVDWrCkSKdqsbEVUgdvBeJ8=; b=mm+eC4vPeVybYeKMn8xMn5Buuo
	xbDB0pvErfYc7U+sLogT5f0nkEWWE1ZaqfcFm4v2y0YGvQxhp7Yl2geRjr2pEHbfRCdExCtcxyq5E
	7LiXYHqfCOKH+lXi2dxZpZ/+h0Pz+yDL1hdIcwK9sHWikwNY0uKTJXL6myqLJ/bqV9AVYEVxxZCaB
	QR5/AGEaJkP6kcp9D/1jWtGSUspr6rHGOteIE698x96/7IzZyXX6vbyH1QILVnefOH/tXOY9t+ETG
	STsLLKYT8mQUY6963R+vq+XBtci2OQvXE8m0+oweJA3jmW5ALgb3uVA45k08nQJN2A0GksYPuKcWh
	h4MJ5F8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7beb-002Zjv-2y;
	Mon, 27 Nov 2023 13:28:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7beY-002ZiQ-2Q;
	Mon, 27 Nov 2023 13:28:00 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB0326605835;
	Mon, 27 Nov 2023 13:27:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701091677;
	bh=WyKaXaY9IzcwDuntRtwn1KfZMZ+q8dvY9ZGvsdF2Gto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hiQgqnMDcTYURCWDPzqiIQlpItsv79TXZcGJ6vw5AxxRRFIfYnpMUn2a/TxLaQ6KV
	 e01Bd4tZAp8LCnO3a+gKfv4GCp90GRwU9n25NeQfOmlgfcwqnZEkeZiio3l05WlPVm
	 z+4jhQRtXuUwPwX80y/cZvB7eId9PpTwQl0wr3NtHo1QiKK9/aHwXzZukGJ46bdKL2
	 8iyy92Fpjj+8gePTp30EPpKRMH0LQrjOn7n8vQoV/hZ5OycHEyGYiGX0MAqgoYC9Ik
	 cFUIARjZ4xBNw9BJ0JaZ6TgqPJIGJ26FfSNbXpPgzuTkJnz60d2d6/qHtr7XFnQkst
	 ee4V29F2DPi9A==
Message-ID: <4cf1461b-53a6-4b23-83ec-de97c8db3b20@collabora.com>
Date: Mon, 27 Nov 2023 14:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/mediatek: support the DSI0 output on the MT8195
 VDOSYS0
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-5-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123133749.2030661-5-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052758_920945_270DECA6 
X-CRM114-Status: UNSURE (   6.57  )
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

Il 23/11/23 14:37, Michael Walle ha scritto:
> With the latest dynamic selection of the output component, we can now
> support different outputs. Move current output component into the
> dynamic routes array and add the new DSI0 output.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



