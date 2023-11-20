Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058F4C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/RlK/pK72YslUo8vW7DTAWIWavQv5RYUj1xibDXyeI=; b=nx6pDN+eOFZJ35
	Q8jiWe6x9vlmAw5rPsSHga83Jv0vNQUVriDGARtpBdegUgDamO3BrhrdrPEkRli/llqUSP0usJ3AZ
	WZd55kGGSweSYz+44lVP+wFklBlpCqUzYqKE6ykfQ/35cokxDoe1dlOhcMFcF1DIQGSFApO2aOJ9+
	JDb1hBaqTuFrGYzqIVhizVAx3y78MupV0HKYjLr4Oig+QlW03DmGJt5z5aLBmYFw4bdR+Hv6YbkzU
	j2Y+iQOtUd4SCsEZ6rfDB/RQxRXn2qmj0iOpjh91ybCDJseDXPFvytVPLvEiYFbFuwu3LtVDEYo0C
	F103h6waw3SjjCBMGC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54X2-00CAnh-2x;
	Mon, 20 Nov 2023 13:41:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54Wf-00CAka-0l;
	Mon, 20 Nov 2023 13:41:38 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64D9F6602F1D;
	Mon, 20 Nov 2023 13:41:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700487676;
	bh=PfevUn2vEpVwdELNCNuBvMAFJ97ByO4+qoe/NlZlijg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L3bxV3SEJrsJ68N83Y21UhALaDEq+rP54Yg+fETvbxwtxSTlRFBOlRy8515AsSxKT
	 t2fC8iFEJ+oal37ScMpl7DLMaoKvvP01QGtxNRstfE/JzQYBiBr0toRm71Nb+fu443
	 Nscfkin9tK/eXCl3wj8sgdPxtXmfILRIUtd4lVS18RB27iDaqQ3tA/lo2vH0xMNX90
	 WeahCdnQAx93mhAJvWsFHb+HvoLQoFu21ss0y0g/p7dsoYH1Hr3zsL9Hc42flXnh6f
	 bijtP/lKaUOPd6DbcYY/D2alMKQeHrccShG9MwSriut38cdj5CGWFVzY9KC0LEbWdV
	 WjIP2zZjpBHlg==
Message-ID: <a7243a4b-766f-4e77-b0b5-0450f02d32e9@collabora.com>
Date: Mon, 20 Nov 2023 14:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: mt7986: change cooling trips
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20231025170832.78727-1-linux@fw-web.de>
 <20231025170832.78727-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231025170832.78727-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_054121_405433_1CF9FBB4 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/10/23 19:08, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Critical and hot trips for emergency system shutdown and limiting
> system load.
> 
> Change passive trip to active to make sure fan is activated on the
> lowest trip.
> 
> Fixes: 1f5be05132f3 ("arm64: dts: mt7986: add thermal-zones")
> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
> Suggested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



