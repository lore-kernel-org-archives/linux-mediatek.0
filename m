Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B64EC369D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KxqETONOqSnJgyLWopav5TeKEN8VvaIzdel7a3UXws=; b=P1qrJ7ftdgE5pq
	/xSizzN0jXvUM7Hu4XXfKzmsOLo8yGlQH088OtMO2+uyQ61dDtoDWN5CofpCB14TgifGfb10OdLy0
	wCQ3eKsLUdOQkCr/ecv0+0rHq2f8aH26geal0oK0zT8B1z5TiwD3PJ9QN31/xEj19M+vz5C4AlkIg
	cbbhBGwOHsSwQWJjwNMMfIKUkfCM0+4FOwr7ifdva9rYUlzHAdKQH7a3esqNnDJbzQLctLSARhs03
	TuAkporesD+nX2KLoxTvD+oSZNNum1AgsCwqRPmfybvY8gprFVVB41lAKiF0lJaeRIJtDGzDka45e
	rE1aGRefwY3OGEqLf3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7F98-00000007cFF-3tgz;
	Tue, 22 Apr 2025 15:02:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dh8-00000007Itf-1LM9;
	Tue, 22 Apr 2025 13:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328588;
	bh=tXx2918oT0BpXYspIGxIB19cZfL4dPd2d06FlPbhsJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XyzTFNFQ7AzdBltJU3INWGMxUJc8Y5V4IETesCUWMIChBlPks00F78XHwVMq+xS6Z
	 c2gsYBte1q+fiU/KjcpmJnoX8JSCzTpS/h3LOraB3x2lIakczhsiTeqilAEIPLyEpB
	 MafnedVZTL91295iRAbzlqGThiPFDlCYswbDBO1M1ZQ2dNwWkg0Vgw9QRKnqvm/dSm
	 FxWoaWYLgaJeydGjbDC8oz3WkgO0aqneS/9yR2GU+Huc6m+fyfOiIzFOyn7KeqdO2d
	 sQwwttnrysI8/LpC9Sin0k5FH+7DKWc17tdkcQDcwqUAmG21+3kcNEqTeuxzju+x2E
	 wHvjPXFD43UHA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8508B17E02BE;
	Tue, 22 Apr 2025 15:29:47 +0200 (CEST)
Message-ID: <3264957c-5145-438f-b4e0-46b9244051b7@collabora.com>
Date: Tue, 22 Apr 2025 15:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062950_515935_6E1855F0 
X-CRM114-Status: UNSURE (   5.73  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new compatible for Bananapi R4 with 2.5G phy.
> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
> by RJ45 port and use mt7988 internal phy.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



