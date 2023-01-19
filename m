Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA61C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM4UMg/o8RDoPbGH+inkw3t4KMxyPF1Ds0ghlASfl38=; b=cO1k8BMXDoMlKjIAxlZ829ie9h
	UdmUrVAHj2mTXKrn+9sH+m14m8Mhso84OJx8lKIDlI2m6/gask9AAY4bW6iZYG8N4luPaairqkSkh
	5g599GEJv3hJsRh6653s4ai57WKq/3NW5Qo1lP87NeVgNHMKnKGlBFslv/LpUOLURWzEWPSLMjcTI
	eJuAIacJCQRzCWkVh5D29BfAiOVPcEo6QgQi9pP+8Xw/RIZkpcqA/cSEFFHyi6rh8yOjI7CK9NG+L
	0VXy2riLTiYu5vAym3ZnGLoQ2UdEhM76D9zJqPBle2/o0bQ+fkDzJLeki4I0tDdq8cD2OkL/DcVX+
	F/6g4OjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIT3U-004aOx-Vi; Thu, 19 Jan 2023 11:26:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIT3H-004aLu-Ks; Thu, 19 Jan 2023 11:25:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 090286600871;
	Thu, 19 Jan 2023 11:25:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674127547;
	bh=P24BRF7G7AAJcBdQBiIy1w/i3HakP9ngzoNRVWMdu7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpvG3szd4tWA0VjCEYmAoCWKdkBPJuPlFQdL8rOhTvoY+HEBYkHuT/G9OsOI3cJaO
	 +zKIogHTO850/DhNIz7klyy5Pday+8CmJewQ+9rc4HLPG8XlBoduL8AJe3TUoiugT5
	 XZAGtA1cH6r8dIigXdGymIMRKoIaviOdDZtZHCK2j/zedqwT7M+ToAP37IlTytv34z
	 NH5pbOOZ5eWRYLPtrPP2SWA/oXGyM+A4vx/6K8VWS//Gkr2rP7vwtabci2BY7DkIx1
	 RVt43lAzL/4y9kSLSv7FOLHq8gS+fYPUWQDyxEO9R+7nVkxHHnzqlHILJLh12j1THg
	 eTy7x4/zZMO4A==
Message-ID: <eaf43efd-e750-a09a-00b2-513c1a11a4aa@collabora.com>
Date: Thu, 19 Jan 2023 12:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] soc: mediatek: pm-domains: Add support for mt8188
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
 <20221223080553.9397-3-Garmin.Chang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223080553.9397-3-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_032551_918721_9A41F985 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 23/12/22 09:05, Garmin.Chang ha scritto:
> Add domain control data including bus protection data size
> change due to more protection steps in mt8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



