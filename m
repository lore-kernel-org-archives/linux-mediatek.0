Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1198CCAC598
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVWWdaHQZD1GZEwaJHMAjd283K7L+qVAUwqsc04oUxU=; b=36E3If63Cew2pamUUQ2WTqhZy3
	oNSIz5KooMSoxPdg0hWlvWgsLGRsIwD2Sf14FoUn0C/mOWRPzl+bN2ImA0Cz26Wh8VyUIuqIi4lyW
	5CvmpYywEKcgQnAfIF1fVXCUt+bRw7K0Cr7AWpDF6lJx+6Lrq7aPO5N7VutrHn777FSvyX6mA23bo
	cBDDtVsJmSAHRqSC2afjNf8cJgReaI9YoYN8DG8X/Bd/EnK4xzdQz+JaRTuks6mAkHd72TPRexgjp
	hSCkM7IgAp/XDYWQpiIhhFP04T6B5FeCyNsxGwvTv2w+ay/veK515UNrvfBh0sfdXlbzPHRmudZRi
	3m4yFEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cx-00000003j4K-13E0;
	Mon, 15 Sep 2025 10:40:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cs-00000003j2O-3cwm;
	Mon, 15 Sep 2025 10:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932800;
	bh=Fy7uV+xkKUqBG1sU/IFfs8aiKJMJZwNs+dD346+mO5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYbuRPRFty00+ZkInmrSFyikBi9+lWNWRUO6hIzykWy4TKhnA06qzfvj0RVmttS8t
	 MlwK2KMSkTTqxN+avBqSltBR56NI5BHE4UCfplyNQCy9QMAPhF+6mpeLcIWumRyRkg
	 wOYkfj+m44m9QRFY1IAiNggkN3oKCzpk9aPdxdxX4iASJe7Qo9ydMuN/6/gO7yKgFn
	 i7AqTEs5Zi0T7l8VLs06Z1lxSWxWNDTbj/s05TI6DaBH8RU9tFNXMf0C1M3CVF3lsK
	 4YmugPoPbpAra88iuqbWD4NhInwxpwrsVJWJrJwQvJ5C/I48mQFI1hubyhDNvd5o8A
	 92Iw/50xpR7SQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0B4917E107A;
	Mon, 15 Sep 2025 12:39:59 +0200 (CEST)
Message-ID: <9d0c1fe8-07eb-444c-8bd5-867f1f366188@collabora.com>
Date: Mon, 15 Sep 2025 12:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: mediatek: encoder: Add MT8189 encoder
 compatible data
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-9-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034003_064214_51D7E8A0 
X-CRM114-Status: UNSURE (   6.23  )
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

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> add compatible data to support MT8189 encoding.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



