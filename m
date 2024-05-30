Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83F8C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eRgwpZO0dVf61bURPnapq4+I2UZnC8M+2Y6S9obX3I=; b=S8O+ssK+W4AkFY8BM8Ql9FoybA
	fr4Rqo9U+75cZssOYbX3RvEsd4n/1oPCGWyjGa3iGja917GmTn09R7znMVjWaIrR7MBWaWDtggClg
	x6kO7+QEsU1e/8j8PLXQs26czQnY0hu0QkXT8ry+x16o2OGOkwdmpHs9e+4hqpgxKNs8BH26M+hpV
	vGyjUBL1UO+Srvr1MPO40sx307uE+jiSusBQpVKjQ5aKWS9JttnMHfMoGQHCcq7HXRechiAPLwyuu
	a6AUj7aMP2y8Nxyg+sr+ShYIxCPswZg3/HBG9M9TX4DTx6Rqm806CUL+TDt6MiyQzK9qvvHnVkrl9
	0/BRKlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdV-00000006vLf-2Sd2;
	Thu, 30 May 2024 10:03:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdJ-00000006vGC-2dhZ;
	Thu, 30 May 2024 10:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717063420;
	bh=BpUdyerGMQW9Se3tgD7/uJMkpsV4naRte+uiUHQllLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FVVMBItQvMb1UhpUr7ebic/YB6pHY3UA731RCaqXSDX6Ey0J0NFZYVbxAY6iOhZ0E
	 TwtYYvd0kM620CTeGenKPjK67V+BECV0wC+OjkifLFYNkP/6VTTh8ZPxA/oYnHZR9s
	 xp8YGyyPYIcZ4ESwoByZyhKp/MU84+h3f/S6NU1kZFYkqTStMSd6F5yOfOjWAh1THQ
	 rXxGOk9Y9RgZJLcbh2dBkJkT8BpAdxe7acPNTVx93AwW32lWXWl4N0HfYcb5wforfl
	 WW/lPWx80YecqcpyZHlIcPCblugLeGIpKlO4dVgcm6wZXK/FbEYNsUy53jKIQvGKyf
	 cNCubjJ3jpz+Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3EE5C37821AB;
	Thu, 30 May 2024 10:03:39 +0000 (UTC)
Message-ID: <d2118c18-af98-4e3a-8113-1cb519677495@collabora.com>
Date: Thu, 30 May 2024 12:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240530083513.4135052-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_030341_838549_C1CCE715 
X-CRM114-Status: UNSURE (   5.87  )
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

Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
> of the Series6XT, another variation of the Rogue family of GPUs.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



