Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0735BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dK7lmY7HkZJaOMTTRIiROXSuLtyL/mfbO6IpgkQTrMI=; b=KhhgrGETQ11AmCr1qAKxfX37D1
	dtXMlfNo89lNVEvrAJ2RqiaWoe8QE7qOW89dBezhZFiwS666SuYMGjoMfx/2jbfOJSw1H+LNgig5l
	b+8tg/nuyakitny2xfi7k4fftofOdiyTe24jwznd6cNqIvfQlCLYDlStxoJX9cV0lTprywI99tcD3
	OT12SR5wdbBNBdufZ49Wq2gJiapzMbJfQ5LcSFFOZw0m8c4YspvNisAdZZeA6FKpYqVXU/6TkW+mB
	2TIgtAqC4J9+stq3Un4YYrqq9CkuVoU3PPsCPC3ETFYj75Xv4BzOtr71l/e7mC/zc+LPVrEAxJdtS
	izlzQKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnQI-000kb5-PO; Fri, 22 Jul 2022 07:50:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnQ7-000kUx-0i; Fri, 22 Jul 2022 07:50:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 066CD6601ABF;
	Fri, 22 Jul 2022 08:49:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658476194;
	bh=oK9Kz1PhL+0HQO/x+UDl+NHHPx9XymaVsAnRkTonyio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n+ihjK0W2G8musyo/vYHs+DLFlKwGFI6OI7vY43J/IGAxzD/LR82PIFaltQXEzBzc
	 loEww3TgRY2X6+tPikC+1d4fAc5c8s3AKakFy0uGD9zioLAXx0O3EQeiXk/1kjRZan
	 HBt7w6qsVmrgNe8NkoAQ9o/h106WxmbFDY/Rw6ak7COuWOSRhB2q1QhxOtqC5nCdGk
	 zNRCGGAidKI68p3bA3lJWtZmhoSt77anX7lwYJC08ZOhoMw51hV4NHUxNySGPEcmZo
	 hlacCyDvgfe38T1Gj/2mUpkqqWW4jhevrm3kVyUksC3OgueMQPcMCChLt75hB91Le3
	 YFyGVkCiPGa5w==
Message-ID: <edc08504-bad8-35f5-b4e2-ed664ba1f8f2@collabora.com>
Date: Fri, 22 Jul 2022 09:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [1/3] dt-bindings: watchdog: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Runyang Chen <Runyang.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220722072316.582-1-Runyang.Chen@mediatek.com>
 <20220722072316.582-2-Runyang.Chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220722072316.582-2-Runyang.Chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_004959_299316_B89045A8 
X-CRM114-Status: UNSURE (   7.19  )
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

Il 22/07/22 09:23, Runyang Chen ha scritto:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add dt-binding documentation of watchdog for MediaTek MT8188 SoC
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


