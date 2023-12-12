Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ0gHSM5QolSKGue56H8+wfS9w81kMEkjRMjlgPqxl0=; b=olV/MJwKA6VClS
	Bbb37rgfZhbJvVyxHxHBGKZhdNx7mHmgU4TjgzsYU9vbFo17KcArkzFB6Xix9BtdmE1/zTAiONeni
	CeS9nAhvMs1wttmvThA4Sww+vceG0qv8c3PCA8dU0VTsAe4f8Y4DcAqkbRbrMGmNZswNjCwED1j8G
	J2seGoe1UkEWsRV5Vg9j1U0K3bKIVnV616ciL0/YoLwMDjaS4uDFFCLtVpzs/p5iadNiiLarKB8cH
	4c41hiBFjmYswNa5j3ZoldA8htw/0hhx1JcvIF543iefsNQlksgDl/6+LnOCZuK1mcyjzuHbfuxPE
	got/YtVP0WhVxUXgvigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nT-00Bnnk-1t;
	Tue, 12 Dec 2023 13:27:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nF-00Bne3-1I;
	Tue, 12 Dec 2023 13:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702387644;
	bh=EiuZhr5Xmzs0FwCEPG+Ew4eAAMJCP2ZsrkEzvE1VxkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d+QQcCfZGvmR6TTIxeqCgLgChC9poL3EWtIVAUDH49RE8VeFzqRJNNAjX21Ns5vun
	 yoWvaEqc1H/HX7edIyHY5JfTkD++6o4vY3/WVs7Sj24KhAEoN6aeP12gsWLlsO+qos
	 vXL+L5eCT4uNgy2QSLr7CLXeexvQ/68TLdTLueoNCwyIvw4Ko5nUR5xFGvbhQoqhmk
	 HRYmepsXuz6BoWDCIphamzwlH1dSR61XKD1maU1kPtoQ33NMo1f5yIDDfYl1dFpgai
	 1S4czM+xMLsW6i16llsWF1ubeeSzUx/ehD39R9BpM7yNsIGYc9RdbM74N3EBcqSBGP
	 WD3+0nxoc0RXg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31E293781463;
	Tue, 12 Dec 2023 13:27:23 +0000 (UTC)
Message-ID: <fbaa1652-8402-4f6e-9f68-fbe16c78ce73@collabora.com>
Date: Tue, 12 Dec 2023 14:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/17] drm/mediatek: Add OVL compatible name for MT8195
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-5-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-5-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052725_692501_0E324621 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Add OVL compatible name for MT8195.
> 
> Without this commit, DRM won't work after modifying
> the device tree.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



