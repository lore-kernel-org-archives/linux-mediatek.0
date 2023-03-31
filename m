Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5FEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGa1PPcPqkIUdmkkLtWnSINwwpTDi+pwhNJGHcyLjtI=; b=Pi+PZSS97VFwcL5HXvhplGD2sm
	tfUzHA6GePM78OiA+KtPV7kqjvhuh1s44GTf+/9TXjx+hgsOpqLdN/SYc0Hgud6fxx3rE27q3i3Hh
	3NmOh+V1EMENmp6ODNgGu3gZkvnuNQkUGwQXRdiWhpWvaV+AUi1iDDSjD8axuJORcnzDNyzzkeOVJ
	0d6WqTx9iXNtMlHpkTibF1HsTN3h+nlG1DoAsR4Sc6IUs3Hqh8NEgu765r1RP7YyrLz7ST86BAc1o
	Uc4QVHBZHWRXOh2LA0lO405Uqicm2jUHWmlVlFLkAEYrV4rXeNPza/kD73+xZ202GiTqkCVC6UYT6
	Cqbvs2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSc-006nVF-2F;
	Fri, 31 Mar 2023 09:54:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBRz-006nEL-14;
	Fri, 31 Mar 2023 09:53:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CB366603192;
	Fri, 31 Mar 2023 10:53:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256418;
	bh=deLqx63P1coOF+1pVILuu8j8ewdBvYytvCncdnzv0ZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2YVaMzDNC2uqUpwNIkCRyCb+7iHoXILrlpssq0yVJ0bEmsFImmRh03y8o77kha/P
	 8Xa8cGHvjVc8B/6/b3PIqT7OoOOFzhlwroQDe3khvrf3GPCxs01/vuoz9n1fAdyW1r
	 DWD6lTGsSyTw4qd9zZPNSyn1fLVhB6YkKbk3Pj9kl4CGoXLmglo8yFop52/p5XorB7
	 5BTUVeOJh5KaS+oEc0OKj95JNoA1YvzR78pfseNujPEvm23zjpIVp4Ailtbh+ID7eu
	 ZjqQb4D53nL0OnWsnvqqWlZoRpLJlO9Sq40WbSV8hC9AVKA+c7yyDOBxk5VOwbjRLM
	 Ht8Dfath4816g==
Message-ID: <5e55a616-8439-7ec3-0c47-f7eb8c4abd44@collabora.com>
Date: Fri, 31 Mar 2023 11:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 03/19] clk: mediatek: Add MT8188 topckgen clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-4-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-4-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025339_625586_2EC04116 
X-CRM114-Status: UNSURE (   7.42  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



