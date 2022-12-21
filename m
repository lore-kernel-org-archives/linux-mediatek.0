Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C34C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdKVCBbGLlXJe3nMwgB5bSQjrTL9aN/KlW+CSrICN5w=; b=H3ytrQwdGvKF+xGdmvgWQBWc3w
	wLcaxXYpbW71Ge0Nm9mC9/yR2MP70P2zeqa6E5njV63sIDn/49EntmEthbMV1b3pWKZUG5DHbbW05
	u8eq3tM4ytGvsdarbZHG1FhoHFP/fqWVSnJcgRxcQai0H1Ha0GzG6lFLzlmTtQ9+VIHMb6/86YTSc
	JDl36cMOG73qr/cGvMb9Fh3CZtCAvteM65y15t1OHW4KrChJTQcdbVefMjAmTQkQCpq3kp53U8QW3
	piXrDtCYH5nZaitGSFlllCtOb6yoijoxIdr9iA1BnvF0iAeKHNyC9lFpfqG207RYzfW+YNhPNOMlj
	dCEjqJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wEN-00DMGB-M2; Wed, 21 Dec 2022 10:21:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wBT-00DKJz-2L; Wed, 21 Dec 2022 10:18:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B0056602CBE;
	Wed, 21 Dec 2022 10:18:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671617923;
	bh=S0Xrym6TAdQ6LJPpcRENqPLO8Ncf9wcw0DuZgeivVDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TcBCH7s0hcKrKC86H7//V+eGbgduYtIrU2UVXd1nVCz9fWHXUZ+gbnItM6T0j9VXX
	 guaMCSEFqEGZ6EiKY+agc14ntF1vpX/n+ytozCd1Aj/gvut38CsRZqkBJHn+OQ+6Bf
	 il5lbCI8BhInU9YQj2UqHG+e2n/bqd8oEdlDNT+yYfAPBjb10E1R+92hPKhAeMzc+t
	 SE+ELXk1y1QBK0dJj/n517VHFGZS076wafg1zab/QFWYzfPjufrFWVijL8cyELs6I0
	 EKNlz1mOZajJYr0/i/8214qMHG23jiGIFivsvf+dAL66QFNRPa23knGKcG3iqhz+sj
	 pOiOSA5e7HyRQ==
Message-ID: <2ea58598-2e9d-c048-4e6e-014206382758@collabora.com>
Date: Wed, 21 Dec 2022 11:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/6] soc: mediatek: pm-domains: Add buck isolation
 offset and mask to power domain data
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_021847_299095_79F6F56F 
X-CRM114-Status: UNSURE (   7.39  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> Add buck isolation offset and mask to power domain data.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



