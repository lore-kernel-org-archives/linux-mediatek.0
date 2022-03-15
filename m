Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C503FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzOUcDpq9jSGRgBgtSr44FZ3JWs5qv/F/zKmx2dRJ3g=; b=HzlgWhfZ3DCYFy
	pTF3OhZCoOYBxFCWOPAOMcDZ+hS+ZseImu/RTrwQoyFZDFluAxdHRQMXzsmeyFKfb1K0QjHDii5MN
	ho7zL7KPHfLs4+bsC+YaVjHhwFx6CYcCxsJ//ro8oc4oH1w5RJ1PPnhymNdurbYptfF2F4wp4QsKg
	InzyX1bNFUyjOZpn2yGBoSUvwEKXX6jF2iiIEg+Lw6D2HPj/7jsntQSwA0al6cdK6omQ3HCoJQAaN
	DQWfLhwJCHbkN0khUaO4DvFW6bbdz29LZIOB1F/tZapwDHkS3x4LGjNeEVnGtNERbGMXBGXs6/rB7
	o74vKcbQj4wLFIJZ71Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8G0-009T1O-DS; Tue, 15 Mar 2022 14:34:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8Fd-009Srd-HE; Tue, 15 Mar 2022 14:34:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C51861F4435A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647354856;
 bh=kLtRyexwPOxP/7DhTGXQAbVkALDJ09X3sqtcFjM1jNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UIv4yiTcdQBudtb0dKsDNyRX7RD7nSPYXCK4VCVy7qmLROC5Z0mUs73w9myRe5egs
 p+LuY/5EaNElKAjLtQ3Ux/aHB/AvVkC61SXeD04w5nPNQKT0YDSC5J3HyDdTdeM3uo
 Fxkf58cURju7KWg6BuLH5oCRYlrPcKBjR5WCQdWKREzK99eYTT7a7uiT6xgo04q2/e
 6xkmQPPOxgt3PqQB7PhlqopTlhE6IkLoh900xPcokeND3vAbQwoorG3fsmj26F83IU
 AKcxkW6lqcDyjR1s2pWsPydzD+/zKJ868QQcp1BHVRc5GinY724IQ1bMD2jMSFtnar
 BN0ndg+Yvaq6A==
Message-ID: <37041cf2-1ed0-13ee-eef4-e2b644c97cb2@collabora.com>
Date: Tue, 15 Mar 2022 15:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 11/21] arm64: dts: mt8192: Add efuse node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-12-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-12-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073417_775476_628803A0 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/03/22 14:07, Allen-KH Cheng ha scritto:
> Add efuse node for mt8192 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
