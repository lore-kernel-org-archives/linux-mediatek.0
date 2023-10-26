Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E4C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAZzo4YcFK0oLbXACoZ1QLYjDuwE6vfISmZde56/URI=; b=qOBn/i9wSgrhYoqIJNEsXy/qqz
	vs9ZLD518RGS5xKoxKqGpt9u3rclL2/yzWiM+D9X5mIBfhsPkHKm59WCXe4GWdUrCW5rQjPtkdQdP
	yW1HvD/x8OsNEfsYBESR9FZ2dCxh19yDgNCw+68GfW0qf3hJRTg0+573XrpfBxTps9jnshJthRVPL
	ikqyvJv0kf9dhgh+UBXq306CxKvzB6Vu+xd5xv50EgB869aNP24ifdO8kSLWvfsdVuiMHBeuqkE7V
	9O/E+llgIMxCGoMGATjpo4/dsX6GVYL42jhoKBDS988Qwy/cPIjke4o86UXitw+aNgIS/K4ylBWMM
	bohe/MqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvUu-00DvVM-1a;
	Thu, 26 Oct 2023 08:13:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvUr-00DvUZ-36;
	Thu, 26 Oct 2023 08:13:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CCB06607331;
	Thu, 26 Oct 2023 09:13:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698308016;
	bh=b4sv+Fx9di5WoipS7karC4btrWmed47jb0eGgVLSPHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nv1dpivhq9t0r8s27I1+mf0LG047q5JakBxxDuYEGbpJY0xlOVusLF3pMoU7xvZkl
	 8V2RbRKwXdve1jUYvq1AzNDr14d+5IV7IbjTyVFyKRE3yxE4vOxq9xiGGLuQBffjZE
	 0Zo/cWs+114VOfhIVrIHCsCz5T0VybZuCRza3fz0Vkg7MlHCfVI4o3XXGFLFguKhCb
	 jbdhSaBEvPOLMyonGaDRQUzJhyh8mhRNnACTA/ygELPzJltPuAb+G8BX3rQFGGYASE
	 01WG/GZKXMVlOQPHT1RYShYDkULFkQZwLhdorvqgd5gpZs8jRK2QOOqJ03S/pYmDu1
	 BCJd3Ox0193pA==
Message-ID: <5f2f0bad-5a9f-4ae7-86ae-45bbe12ca9b4@collabora.com>
Date: Thu, 26 Oct 2023 10:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm64: dts: mt8183: kukui: Fix underscores in node
 names
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231025215517.1388735-1-hsinyi@chromium.org>
 <20231025215517.1388735-2-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231025215517.1388735-2-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_011342_137878_A91A3566 
X-CRM114-Status: UNSURE (   7.08  )
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

Il 25/10/23 23:48, Hsin-Yi Wang ha scritto:
> Replace underscores with hyphens in pinctrl node names both for consistency
> and to adhere to the bindings.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Fixes: 1652dbf7363a ("arm64: dts: mt8183: add scp node")
> Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



