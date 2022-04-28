Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZeRl9cqt88PLUqKPpeVIegfTm+rdQ1B2ZQqjqvrji8=; b=T68NIVVy3LTI7d
	dY4CqLBF4USC7jQdr5BnPSNjYnIRVxoR3NQnldMuoF//D2eo4Nu27YIQIIGnUGgMLcj80LanGpowV
	fVemCkKvfYsDtk2i7xZXa78KFy27mBQfIFqzLjGdtmRzL2SsHHVnFrWGcKQJokgjJ9D8YkzI2nW/n
	5jEK1ckQxGPVGkygJRXbVYz5coyrDppilfxphYBYTxpIHqaMpjVYZsE5Th9VqabghBSb/jxL1PlX+
	1zhLXdlX5mFmIbMBEQsenOWH54wJZAsdZMFr7+n3Chf5++G8nNrths+SW8H8xCUSIk5KK3AU0eI5B
	yfgdpP9jv9ntCt0q0xBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4bj-007Edg-IV; Thu, 28 Apr 2022 13:54:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4Ps-0079MH-9u; Thu, 28 Apr 2022 13:42:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CD87C1F4516F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651153362;
 bh=iYZrQyYDaLcwiw1zmixcr5Bi+R+FQl0Qqzr4h2rIpAg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Je7BTlfRn/a3tWlEOvFgYsukbFtu7bK5qQ8Bo+FmTlcItjfbEI34AvlLw/h71C6UH
 0LnW8NT71nVeg/Z8F9eoai7khoDT8/en5bPRpGJmHrQbz51VNNH7ZQMho1+PQXqP5K
 5DEPiIzKdK6rmDUeq85JFM86o75i+YZr/Fmevxfmjp4d60l+wD1BBUZfLnZvWjLKXE
 d1VPbsp2qbAG/l2WobO1lVvPO/NtjC5w/gfO7CLbJDPNuAibZJg0vCfTgvNvjFz45d
 OXTeetGwRRUFnXa7HuYY0nj41jMFQ1YDAAVo/Yhbp8O2ERajhKIFcFdE0edc+P6u3B
 DkjqKnFKwgUMQ==
Message-ID: <211b2227-5057-a48f-f813-f50f9c304805@collabora.com>
Date: Thu, 28 Apr 2022 15:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V5 12/16] dt-bindings: reset: mediatek: Add infra_ao reset
 bit for MT8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428115620.13512-13-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_064244_585124_31D93B60 
X-CRM114-Status: UNSURE (   5.56  )
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

Il 28/04/22 13:56, Rex-BC Chen ha scritto:
> To support reset of infra_ao, add the bit definitions for MT8195.
> The infra_ao reset includes 5 banks and 32 bits for each bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
