Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9532EC3A5A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1SeatHRNVCbxvLGNbY5gaOqfvsIu1kqmZgroe1ns1k=; b=XmBy/o5YIPDthtuVBnyxCi+M9Y
	st06+Bur2ZsRGVVU+ZEf2bCDLIt0Sj4+3jX75/CN2wdc3lKzn3kxE2/L+TBSpCwOHGO+Avg9kduOy
	g0SikZAPFherjR8/dlBHem+LmWOWHPopxpeWl10TITHhsxlEQ5OOIS+bv0ohRM2At++JH71n/d+ny
	begeV0oAlaBbiTve6rGlCIpG4vmN4TqWRRzZsHdNfYPCWhIjbXzpjRNV9lnLpyT8tZQFNMTTVgm3r
	Ap6sjQkb0DoxpaUNj8aDJkzp1yARJnaWvEm24sSePAsXBWPCFSTvZTqAIpOMkhTJmtlbX94SjZ8TX
	DXDtNh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Tkv-005Kd5-VD; Tue, 06 Dec 2022 08:56:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Tkj-005KL7-CZ; Tue, 06 Dec 2022 08:56:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A7C16602395;
	Tue,  6 Dec 2022 08:56:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670316993;
	bh=nmh+741Te48C4jhFLsKlSBYv13YZbBa8FduTkcMHUUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkZDZWMdrTXhKeVBieD/5JS27LGYOtQfzc76kfdntdPkNfe48vn7artKC8e8lijIe
	 7IjVFuREBZU+/VgbLMqQSOMyljYh/kPULjwFQaATrYOOJ0EJ7eOVyeO6/aZtKNn9bT
	 l1QJ05UGU9bFRD5lEL3UnKOVPcO0qImoVtaDSxu8fXyqL8GsA7kVZdPJAut+F4O5iY
	 OwoUhlXTsuaIuFGmy5qexUMJQ3f6ncXRgYYAtcC5jtek/j7Egx0pvCkEodXg0emKN5
	 M85hbXe8m3sONkeeFcpNPOPJcFXfGPZKoANq5uPfcRFYbLe8ftqPxyMqgKcrYeE8L+
	 7oLW5PEjK+lPQ==
Message-ID: <b41bd5ed-bd95-90f0-1907-cd99a63b402b@collabora.com>
Date: Tue, 6 Dec 2022 09:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5,1/3] media: dt-bindings: media: mediatek: vcodec: adapt
 to the 'clock-names' of different platforms
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221206064536.16592-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221206064536.16592-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_005637_587265_3D7DFE7D 
X-CRM114-Status: UNSURE (   7.04  )
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

Il 06/12/22 07:45, Yunfei Dong ha scritto:
> mt8195 and mt8192 have different clock numbers, separate 'clock-names'
> according to compatible name.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



