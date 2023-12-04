Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F20C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmDze8H4KgF86dQ5CEFciYJZKUu/6xlrAfL+ITwg1JI=; b=aPgdtaBnSIKtRQcJAwGa4pWezK
	fs58V2NZfNT94qDh9Bt66Lru5MoLoeDX7442BW1bwSimekhIV/SuRBFN+NQr94SRx6dAQS/7sgJSD
	Sb5IEP1FIbxZPoatYePH0XppbL8Pw8fdvSUnLrKVKMxoTCYyDLenxwuZKt5v9aD2z2fy27LQssvF4
	WmyK5WlryB/vNtq+fXBdSyvIN6P23kBZZBiXQEyok+C2SDU3uHda5WhzFDA5sKPSCMnzf7OKRuseX
	lUW1yvw4CTnfAX/x9f9nJQYpyp6nNMPBNl/bC6MXwhFlGKBwErkY+OhSjpSPfprXsp2RynG6hra5u
	+3SmpBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vY-004lb1-1h;
	Mon, 04 Dec 2023 14:28:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vQ-004lTk-2Y;
	Mon, 04 Dec 2023 14:27:58 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1073660711D;
	Mon,  4 Dec 2023 14:27:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700075;
	bh=9to/erUr86/0U8KBTbXriRV2fA+VN9gcEsoV5rt/ZGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WH7y/WFYqXrHBjzr9l9xgLJaoxz6QCDVNdpWirpn+Xmnz09D//y/YpwK+Q84W1dpc
	 dsH2qGS9B5gNMAhVBL5Ui4DwHlwcGTpyQuXhKtHsI1UKvt5ZM9D6O9QhoVhvLozJQG
	 m+mYXyQnoY5/Cyu4GmvYPGfLyPvi0kznOD/fX+R/IR3zl4sAWSG9wQH6Da1YlAAqZN
	 A0ltDN3NDvFi0FxCAcPkigzViWghkO1eCSMk8SCvEduIXUiMCVNrEj2b4x0U9u62IM
	 9jkcKvIY5GG2PDkVHhl4KK0mINPemJmFgnfGW611a2p3sQiOvspfQjOpxqPRVVnr0Y
	 aBaAqX0b7RDKA==
Message-ID: <ce1bd340-cfc5-47ba-849b-1ee429b75c1a@collabora.com>
Date: Mon, 4 Dec 2023 15:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty
 Chromebook
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062757_186677_6A58C3EC 
X-CRM114-Status: UNSURE (   6.00  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> Add an entry for the MT8186 based Rusty Chromebook, also known as the
> Lenovo 100e Chromebook Gen 4.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


