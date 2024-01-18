Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06519C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTqptDIHny1bEln1ba/irbkgtO9qh2gMXK3kozS6rgY=; b=RE06lYi9gX9leW
	tbUnToFCgfKs5eruIL8RewloXB4aIv85Fk+bD+LnvAELxgxMKvq++OesU0tsTDFsexHXr1DWt0cqg
	uCzG67NlCJ5Nwj6yJd7FrLvkj6R8WZ5qH6rSp1+PbfOsMSFRHwWTcQKYhW4yteYYYI6yVEdBgPNk9
	5vEIA0TryCdRrNvIJXrveoXfDvPeBBdktmWbhZCgGkotEL+DN4Rq3f4JgEcQjuVIIiT+2S4/WZand
	8fPjdw2eihALTqEzu7AnKBpgoxE0lRCItMvdeA4ytrv1IzXeXZgpJnX0Z3dQjUSOo5B1FP26Wi+nB
	HTsgfA9/Sh+B8909JDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQO0P-002ASy-2o;
	Thu, 18 Jan 2024 08:44:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQO0M-002AS3-1x;
	Thu, 18 Jan 2024 08:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705567441;
	bh=elIh/94bvPXJELGHnVmWZ7ke0f1XwdKbBhbPGPcgORE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DbgAGbtBLwy+2IqYLx/JhDHigmEEQxKza4lLnOlNbauGD09/VK7YcvkoQQhDs2et1
	 FmG3JqAPVgobOQ3JtEuZcGn5elUUy5TFoFp9kI/47nujyGymQJ+VJBzlR2n/i/lIE9
	 UPX2BJCxVYHHY8u/9FTaxv395/JAt1ag6oNoy9zFAmg9+8OMKv+C98o5O9Vd8bxDYT
	 HL1MUBLYyE/60LjDbtxQ/j2IUQFgFQYYsib+OmDZaFc175K3Zi4sTym8GckaIPkYOo
	 Z+Je5gk8Rzm53ElAz8HzaJFhm/lD73AQJ6UIdnIQvIgW9qRcQJ9WSNbLJQyVG5oErA
	 G3vijAgdXOEFA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A9E903780C6C;
	Thu, 18 Jan 2024 08:44:00 +0000 (UTC)
Message-ID: <207da963-2a1e-448c-bb63-3debb5af0071@collabora.com>
Date: Thu, 18 Jan 2024 09:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988 reset IDs
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240117184111.62371-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_004406_831738_1B516128 
X-CRM114-Status: UNSURE (   6.58  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/01/24 19:41, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add reset constants for using as index in driver and dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



