Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCCFC25B67
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11FdEnPBa29WJCGYxHV3/2GCFt0bo9NK4U2xX6ycBLY=; b=M/57bXQR+J0JJ65xvjP+9hPf+C
	am56+Md2NRFP5qkRXjFS7gTcUQTD29NSGzqIl+XD+c72jgSRBzakPBJp8q+q5bXFqsJZjXoVr6O2v
	wHw8hvnYncUT6Tlr9GHS3r4NMmVu3ozkljCrWMj3P5TcmJ+KxIx3QxDRM21ADA/Ht3Irta/l8m7Ip
	/uQ4es67S2l3VL7bJoqCDtbkW/h2QrYurrO9REMSeE7sCHmKnQUj3OmpQqLKaamp15+DundS+zvIh
	mU0WLN1OJh+2FeCt5dOHmM+qCwp7b1FV+SDMFDZLY5LQ6/SJ+vvCsxEolI0Y8uhV8v6ERar2Ox67o
	fpOOIABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQw-00Fp1c-01;
	Fri, 27 Oct 2023 07:39:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQs-00Fp0q-22;
	Fri, 27 Oct 2023 07:39:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B43F566071F1;
	Fri, 27 Oct 2023 08:39:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392341;
	bh=+BcPgHf1G8FIBhqLU4HwJQyAJtnw/+2yV5G/DzMXp2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gth3Q9Y7J7kbGb/GzWpjsyV/6FPr4C5aTbBdwnWzCVUfdNZ+vY1ujUqHhUOT68lFY
	 nIRR8t/w0hoOHAior7+oaO8QXMfnDie4OrGv8USLIUi17Crum3oNJEiMrgk7+I4k4G
	 DkUFOe0Vc7XUTiNKvqUQaxdFghgMCwkUGLtVWyhlKwp6GuKAtV0SQ38TUAFgGzEfeT
	 WwtkSnuA4FihRmFWkRiqHm7q53xq+Pmwju0MgvZ3/StPzrJ3y6uQzh1J0FMBf31wac
	 RINKZjYAMjlJOejg/XUQqSsjUdcuxS2wyotwqYNB0mCCFKJl+JvsxDfopR1qUKrN8l
	 LxFWVKgmJmsqQ==
Message-ID: <f89f3e14-dbda-41bf-9797-2571be53029f@collabora.com>
Date: Fri, 27 Oct 2023 09:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: arm64: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-5-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231026191343.3345279-5-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003902_796242_9C52DEDD 
X-CRM114-Status: UNSURE (   5.82  )
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

Il 26/10/23 21:09, Hsin-Yi Wang ha scritto:
> Add makomo sku0 and sku1 which uses different audio codec.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


