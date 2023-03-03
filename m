Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C81C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvYSfC7+Lqorqnt445wGxupPk7UW20mKHgbIyJIepcA=; b=brA/x3++GWGWpetm5HZa4YCIin
	xwFoHftMV/kwcKDDfldRlJry83UXFWAYtEcIsHS9ipjGyPZv/X47Q0lgvnwVlVGUh/GqLNWMvD+Il
	lvRqnJk9tCDH2WhskHDT2BP4yVfklY0H7uiQuJW0TZXb6mGBWMeBBGGrlDalFWAkxHheS1VrOTH3E
	gBSVpxWobIzIFSo6wXR7gLB+PRV9hOoFCKznzpX7ZwPrytTGeg5ALZDIn9JTCt6FonjBbQ6rF8tYN
	j8RTMw7poqxnGkbegrXiAIVmhvGLL75ijm/BSRPNkDhi+LMouxCDYiuYOwsujB+q5z8Q1OKc5e/iR
	eoWFklKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3ZG-0068WR-FD; Fri, 03 Mar 2023 11:27:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3Z6-0068Ul-IK; Fri, 03 Mar 2023 11:27:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EC3F6602FA9;
	Fri,  3 Mar 2023 11:27:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677842827;
	bh=YOdiyVocRWnKoCPWq5cS5mp6lxsznD1YBZVANJrjgDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pbdy4W83JDrysdCy2zlShbtAWdRXZ/9EwWDFFhHJQo0HyMjzyYIpcLaAHEKFpu8sn
	 MgBHsniXEVNPi4GYMMnXoL1hWM3KvwocnZYa8W6nzNthRzHEMrT7S09NtrjyLnXnkB
	 x+I/CyEyAIavT+gySa+ytdEIx++H6DnU08vjTphFpsJVlcDC9A0uGtMnURfcNOodKe
	 hiRgZt3W7XSliUxgspg3dIudXBTzIhAuf4+DYb8uDaNXvehhcjEm17hZfyw0phUVzv
	 MNn1V0rBrlnbFzePwIh6i5GQYNxt1Zhv8PNHH/HLOkXndL/zb57GfRspeVTYTQhY6X
	 b009/OeqvObeA==
Message-ID: <030d17eb-ca0e-866c-623e-3fa31a1a3aec@collabora.com>
Date: Fri, 3 Mar 2023 12:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/7] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230303031728.24251-1-allen-kh.cheng@mediatek.com>
 <20230303031728.24251-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303031728.24251-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_032708_784138_052509A1 
X-CRM114-Status: UNSURE (   7.79  )
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

Il 03/03/23 04:17, Allen-KH Cheng ha scritto:
> Add MTU3 nodes for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



