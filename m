Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4209C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCZGlY7Q7NBvn/k67Z6CmmGHzEj9R22KXyCD2FXvTqU=; b=VLGjoWOHlkCQ2cINNPdbUpn6Br
	GAYf7TbtHVWwlBc1TAt2+2GTJLm7sgMbRllXRFtZPFTnjOrRLgJM65+mCp/6RNxw3iRtosawXQW2Q
	nTvLKwspZz+QWxQB+gZqE9HOTkz9UjN9W0Nxh61n2+OMnvcELnxuC/JPsKbd/UbbFJZRZJTdko1a0
	RrV970vrvgd+bFRHB3Yhw47yScpGPL19O54VoB8S1QEA7gb6/JQrjNn+TVN6cQKhmE1tO5CmnC4w9
	d3WS4dB01kVSFb4epTFEbccN2/AL6MuVqUZr4pR1E4gmbjN7Rci7tgyj6fdAk4dXcpZpGnb5gL6N7
	zcGhFNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRI3-00E9pt-I0; Mon, 18 Jul 2022 14:00:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRHd-00E97q-9R; Mon, 18 Jul 2022 13:59:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 04C2466015B2;
	Mon, 18 Jul 2022 14:59:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658152775;
	bh=k4xbc/KxSu0t1ZuCXLylgktrPrf4etvCU4uHHfVpdvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MSQPo+QJyrJGPQjPwq4PVuS8usKOjr0hRhGugecZWIPQD4L6WP6UFPX1u7R6MyM0s
	 5a/lfRMZJBPiHj4UX2fDddUh/ZHOQuXBntdyOCBk+022s/FvtuzabMr0Aq7TYefGGj
	 +HuXnJyaotczIGt4rYxWtkEm8AXuktNB+5ro0QFHTyYLqkM3MbpluhVsz5QnMr/xU/
	 4oZtGAZjd7DLELZhXCjXy+PI/8i/r9faWKTV01ZZ9gWkfGwT20+IC0lkyXug5czaLI
	 0m7vZZmTSLQe26iSolOJMnjqMntteCkxFk26LPF/poT/Rv8opk3mMV0cUkVHiMq2Z5
	 7+5grMXlQU+ow==
Message-ID: <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
Date: Mon, 18 Jul 2022 15:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: add power-domains
 property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, hsinyi@chromium.org, fparent@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_065937_501006_A36635EE 
X-CRM114-Status: UNSURE (   9.71  )
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

Il 18/07/22 07:22, Allen-KH Cheng ha scritto:
> DPI is part of the display / multimedia block in MediaTek SoCs
> and is managed using power controller in some platforms. We add
> the power-domains property to the binding documentation.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

For the contents of this commit:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


...but I'm not sure whether this one requires a Fixes tag (because, effectively,
the DPI hardware *requires* that power domain to get up) - and if it does,
which commit to reference: the first commit for this file is a TXT->schema
conversion, but the TXT didn't have power-domains as well.



Regards,
Angelo

