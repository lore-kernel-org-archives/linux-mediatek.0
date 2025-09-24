Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262A1CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udWgztjDUiB9W6ZnEUtbUf3xU/6UjPPH50FXXYOw9l4=; b=VWupYfoMVGMMnLdR24kKYv5gFU
	YyYiD1QlPRMLiv8O5ZsGSdtbXoN6GdB2xeycdE9MJJjM6zN4LID35pZe+CzIEYQlTKuD3W9V1g+bb
	KvXqSygSaeRW6V86WzraWdJ19y30cT3kAS3bW1B6s9hurS8+wOvBGJLpljX1/AFIG7Jr6xb/KOvCN
	Cy6jXUBQncRSwFjiVciKo2ncx2/KsMPKLSfQ8vvO88ysCNlAfgvWQXmOSUvh+QNblR7w9GcwJHQJ3
	KJ7ZuBzEAHOmtUjGP54Xu76Wf+IivsJKp0MsLfJ9V4hi0kUAWZFCPIWFmflgrEQRYM10PmOGav2k4
	AztS7GOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Mu5-0000000GZzs-1PDp;
	Wed, 24 Sep 2025 10:39:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Mu3-0000000GZz5-0wXg
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 10:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758710353;
	bh=VQ8VOZmpdDGrQxu5JvAU61J13zwKbyZ5/3P7rrRWAdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iIsn9hQ+xV1cS8Kxaeswc1Kb5Tok5ZzW/txEt4ryXjW+JVbp7UaVItzTWHQ4jlK4w
	 uebVDe+MvllN4sLMmJm6Z+49p741d0gJLkwk5zLcauI5m9ziG6/ly5fR0RHpM10eY3
	 WQuzIeI6o2hNgQcTK4TCDkDkF2qHeeDue3ZUAGblrJ7r1fYPIcl7Z4RDLMImq2lEi2
	 tu4OBaQ6bDvXdohCkZ+iXX24RnGPvlv3ge+agRzrnnp3WM1N1zWnrkGvoULwp7kIn2
	 ledvoYaWcTDWSEO2TnlqdwQvZMsIvf7RNFeS8A9sAAjPr9/HySKxb1FwjuXybrNkf5
	 nG6Y1AKpGu2Qg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E46817E068C;
	Wed, 24 Sep 2025 12:39:13 +0200 (CEST)
Message-ID: <7f3a096a-fb49-4d43-be60-9cb25c4e1d16@collabora.com>
Date: Wed, 24 Sep 2025 12:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250923152340.18234-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_033915_420400_2C9791EE 
X-CRM114-Status: UNSURE (   5.18  )
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

Il 23/09/25 17:23, Johan Hovold ha scritto:
> This series fixes various probe resource leaks in the mediatek drm
> drivers that were found through inspection.
> 
> Johan

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



