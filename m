Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E2606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MpFdyDV6;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lJBOw5y4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+hv+LurwSsAKD/1hgBOH2qR+bFYvs4hVZUytMI+WIKQ=; b=MpFdyDV6ecX+sh
	7Nz8gnJrY3V1gvrtDo/cMpABknZ5oed5uSr0ChRgb8e99carn5G3t6NHFDFAabKkaRzFL4jLlJTkH
	8YMX9i93qs5WBH/5V5dl8D9/hvr0EU2vob8ChIDWd1vv+ernXjiYH12bJc4E08r29Vvf/c5i8yaj5
	nvzHHgMSDa6nsBhH/K/SiZs7Q96U5wPuiWOmBJmd3vt555bEMKpKpexyqqdlbmYpKHM7lU1MOH0aI
	tOc6uFsnh4aqIA4Qhp/aptD77FvSGDKgADS6nrRyYq11kTlkMxd6s3c0uPPms+Fiefo7nJFcM/Nv4
	4pbkM7kzCkrlRHLlsHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQiq-00000002qJE-2zIC;
	Mon, 23 Nov 2026 09:52:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQiZ-00000002qCV-2p5G;
	Mon, 23 Nov 2026 09:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427529;
	bh=Xkw/D1TF0uOO7465Srp/1BFoL/lm3YZD34LfqM34Yl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lJBOw5y4IYTMTiPJX2XHz2/WDEVdkIiOiIpDZ5bjkoQ0lHjGzQzejtBQOcZab0vmu
	 LqTlYUucKXq2dTUa09cY74RC153/xk2prktRMGbJVS6z6Jlj0rbcXgH67DIrT+ih2/
	 RXoT2dNc8kgThWFTl//O6ERt10TQisQRa0Jv4QQOD822kSIZTm1f0r8zo8WV0DlUG0
	 4IXzHr2m6EccGyPk7pDXjr7FYrKZCUzKGy/mKftWyH1NqR68mMFiOeRdpluISjujWk
	 rS1U74e7wSo8CEVugNcD9Y4BnHqfIf4aLoOxwJrBCcg+4UnS3YSdGsUSTSM7XvhoHf
	 c7zctaqvDSlNQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E661F17E007F;
	Mon, 23 Nov 2026 10:52:08 +0100 (CET)
Message-ID: <75c71ea0-e2e7-4709-abf1-e2b99a537c2c@collabora.com>
Date: Mon, 23 Nov 2026 10:52:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8167: Add DRM nodes for
 primary display path
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261123085840.8687-1-l.scorcia@gmail.com>
 <20261123085840.8687-3-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261123085840.8687-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_015212_868022_6F1080DB 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 09:57, Luca Leonardo Scorcia wrote:
> Add all the DRM nodes required to get DSI and DPI0 to work on MT8167 SoC.
> 
> The primary display pipeline is defined using an OF graph identical to the
> fixed fallback implemented in driver code to maintain compatibility with
> existing boards. Its block sequence is as follows:
> 
> OVL -> COLOR -> CCORR -> AAL -> GAMMA -> DITHER -> RDMA0 -> DSI
> 
> If a board wants to use the DPI0 display output the last connection should
> be overridden in the board DTS. As far as I know however there are no
> devices using the DPI0 display output.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


