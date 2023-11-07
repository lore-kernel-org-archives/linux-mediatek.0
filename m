Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8A7C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aiigtJ5jGtX/62TO6ou9gRvo+vmI9ed3VsEtdh4dtY=; b=lM/dboFRK+j/yf1UYfMBtTNiJm
	gi92G5mNoQkqxg29PzjlCQt//m/ntjSXpukwzXX+B1DYPPFkU7gBMzaeta3gi60TPdc1B0dH9MRym
	D6daWP54GS3wzw+s6xyECn1+SZdZ3wrmto/qgJ38fE28TDYiI+l/m+gKwItIPuLk1fMy6e5QjBHmm
	QbDiHGaUEh2hBvM7OKUXjXrCByO3Cj4mmI31MloGzC2taHrzIrySuymqIyBWZmJnNhCMFjJblhShL
	8YjKJVfnz3PuFwxn888KwQnS16gkXSXL/XHaSguD8tuQNCMfcSo8o1BbOp7WTXUnXqq0yFOu+ZO3T
	jj+lnZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUE-000p3U-3A;
	Tue, 07 Nov 2023 08:31:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0HUC-000p2F-1M
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 08:31:01 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F74D66074BA;
	Tue,  7 Nov 2023 08:30:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699345856;
	bh=ZMrrFLvLdqin6a1tq6YFP6vBhnFIzClUM0C0/GpzRCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgrbOsq9foxIZ+xviHYv/2qRAcRyjEel94au6B9XpJenVvERZbFVeEU3czhV3QSJa
	 AGzHDWBS5T3DBsK7fT73N5oTgssoQP12SORYOtxNKWGYh41AioBVxiTqMT2WROPQG0
	 dNw7Yser3cGFrb10UEflVyTEMVT3qrDW6cygsoB5OOzcvC1xVx2X1/RYzcNoeS2SBu
	 6y2L1MSIxsjR5PA1wA6rzFYqsmtuzcrLQ17q6+DoffhdNhpzvWM5tTzWsfJyiXlvJ/
	 NrEpqDWsTd28NSix6vgvUeuhV+y1akXoomDLoAHdDI3tXvZZbUbrflBaz+0R4yrFTm
	 Ygf22Z1g0bUww==
Message-ID: <c64bced1-36da-4b31-b06b-c4313e893cd7@collabora.com>
Date: Tue, 7 Nov 2023 09:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_003100_624110_BDF7F32B 
X-CRM114-Status: UNSURE (   4.76  )
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

Il 07/11/23 04:14, Rui Zhou ha scritto:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


