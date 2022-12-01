Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8D8C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TEVsk0Lao3gWkOJaGxWYtWPHNq+m1vpsg+KeeRLbBo=; b=dEBfr5xPsNe0TZwOV2/vkLbbuu
	cFCKr0nRFWmJjxyD+RJ6Y3Vp1iY9i/av9k3/tM57ywlBqysU5EsP4aAACIDQ3Z6BvQC+pxXsSziLm
	+rQY/5rN8ydT0nwpDBLIzlNPD1iv5BIHxnOCL9Vqg/ZrERENk/GJueAMAAi8krKumJKDs1ROd3GFv
	Zr3cIhh7qCQId9JscYD1YqSe9+ivxOOeNQ0cMct0QodRJHqUEck0/yFSvlVgJDdBHg/VrmFmaG4u5
	mi7cwB2MsqWN4roGIV1L88fLh4at9oOY7P6BLRW0neZBtaBww98uyF5ujCSDQUQy8QNY52gCPaJg/
	B1x9I2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHb-007a8a-0Q; Thu, 01 Dec 2022 13:07:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jC7-007S7U-Oy; Thu, 01 Dec 2022 13:01:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7560E6602B91;
	Thu,  1 Dec 2022 13:01:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669899694;
	bh=hxMYqgOO8+sjNisCYU+hvl7cmvzjbfIO/w5932DJd0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eAGGEb3qQzp5iWBlh40e5KFk8OXyDXcHfiVNbtkhz3ogRhjAMYxugqU8pI+B7VaPc
	 UqHR3ZyCK5ahqoeD76LBF/txTDumgbDWzsX4xIgif/VzQT9E4A23r8/Q9wNGcLbCro
	 AfjGUxE+zqLK+Zsb/p2TbJkmY6hju1zHnzD4wDWpB3UD/z0o6MYKZcuLxPkyG2ri2f
	 y++dpIKKUUvkz156Sl8Kp4vJcihU0riuunI58K+Pc2w2cCpYHiHhKH26aqkSUDM2i2
	 fk10L2RxsaGtlqzgoBqJSY/JGEBgHvyATj3+cxv1LPJDz2rSmrmL7L0563CpDIjZe4
	 oe7gSJN25Rjiw==
Message-ID: <0bc7c690-597c-e49f-d406-52fd9f9a4348@collabora.com>
Date: Thu, 1 Dec 2022 14:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3,3/3] arm64: dts: mt8195: Add video decoder node
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221201121525.30777-1-yunfei.dong@mediatek.com>
 <20221201121525.30777-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201121525.30777-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050140_095560_B7189898 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 01/12/22 13:15, Yunfei Dong ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Add video decoder node to mt8195 device tree.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



