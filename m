Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C99CD342E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N0aGqQdKZ4/FOmXaj8+dxLMkkmc4gIwz/ZpE0vU5qA=; b=Bl13nT8mlPGXcdFBmYFrquiI6b
	vMZUT+35PqMtmY5luyR3xkXlwSDh3XdFVyxlyi6wXNgsDsbAgfyAiaij1mlpSn/oKstHQ3L+nedUH
	aR3mNmvSOtL7HKAs4Je/r92Bk3KNvlGWU2hzhmmPva02+13B2HBx/JjrIbgmaqjLvQQ7Mt9vcvGdB
	wemU0r2XrYmR+hTll9aIYl4Gym9zjxjONnZnGK5JusdNA5TZCNPO2fjQhWdv6ynl3hlzn0/5D7hmb
	UdPdes4jHAWxWF8SUA15F+h/e5UfB6yzu7q7Tpi5hmCrj8XfFGbehJKjquw+0jjwxM4VlQSWvJnmj
	4dKpa+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDyB-005MOH-10;
	Thu, 21 Sep 2023 07:19:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDy8-005MNW-0Q;
	Thu, 21 Sep 2023 07:19:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61E406607298;
	Thu, 21 Sep 2023 08:19:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695280762;
	bh=NCoS11TMBletQQuR/cD/4ifg4uBFUuYSpa3EvBEYdzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i4+tGfrj8stBs2bJPHoKS3fkXMx674udFF6nMweSkbQZAM1oRcUGMmgsrC0ANk/IM
	 p5WZyhVu7imzLd5ljB5qAdGdwor+nPpE6HgTcUT4l11c7aJix2qEZORBozafr/6biK
	 fpcFZ/SbW7kHwdWvd0toRpIyekypbiPYWWxl/kNcI8ZyFjbw1pd4zWkG+5u/psAhxn
	 b6TSBP8e2qeHclUEaOUT9shuGM6ZCu2SuC+NxFifjUwkfwFt2BKj4JuaUMLo/8tCAk
	 lfT0cWxdKmYqr+6lMMVdhaw+KgOXJWPWK7uvRNC4aAInjpSyAhYNPTHvDeoN4hSwKe
	 HiWgx14suzSOw==
Message-ID: <c5d331a6-b5af-f5b4-ea9d-059d3c3c78db@collabora.com>
Date: Thu, 21 Sep 2023 09:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/3] soc: mediatek: svs: Add support for MT8188 SoC
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
 <20230921052637.30444-3-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230921052637.30444-3-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_001924_295025_D0DF7C34 
X-CRM114-Status: UNSURE (   7.75  )
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

Il 21/09/23 07:26, Mark Tseng ha scritto:
> MT8188 svs gpu uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



