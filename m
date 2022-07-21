Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F07C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yveysfBU6WRJ8npOYg+eSCa+qIfGIKfaBj9juBu8aUQ=; b=ATrq8tp1r0AsxEeEBM7DYR/+w9
	hmqmjeKfAYnNe2vsVFwRKkFkv7WuPPxMaFK5Yp+zlukM52xa29v7QSTJxM/ws8dizSChKEPP55HH1
	4GpWvz7cwfaZjGlKmuCb7v/XeG8XlxByDwekOSSU61CmKDProq93qWY+lG5geOWPgclNB1GFCeyPo
	s7pceMWvJq/8pbd/2zVI6dHoyfanodwnnf3sPjwPpz2iqwkTikWlHyd4K8yHrHn1K/dNOpcukZCzv
	GbG60zqGjvM7f04lEnHIoVTY+yWkMwECL5nQfaPCM7GCLtHwF26OTLiTCzMNnkn1XUp/gdhHBJ/r8
	DHt0S3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERkj-002fPz-Sr; Thu, 21 Jul 2022 08:41:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERkO-002fE8-OP; Thu, 21 Jul 2022 08:41:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F009466019C1;
	Thu, 21 Jul 2022 09:41:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658392887;
	bh=DgHftiCEhCQJ15Wj0pfslx32ViPF5o7q5eIFrCJ9Eys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgPJfcrRWP5XcReCy6+E6h3yIgSJNMxdS7TenuM2bsD0EBVO2hxzKP3CZVyleS9QS
	 /QE4Tf1wXjQ+gweV+kBgRKPRxbmEHvdIVZ3nQ9SRp6fZ5OBCGaoEmBE+dcFF/DEefO
	 FNjvhELXOl2tiOiVrlLBo5nBUkTqR6+opAVfssV7WHl7TjyDHkee7VrFP1Z4imAiP5
	 +NwVhrY4LyXpE2Dzp99JhV7jvLY67pZpqFphoK83GbU9397MN1/3B7a2w8bhom92NH
	 YxLdk6YKeqx5UI3CAB4F+vChZHNz6tbm+MMXNB3CzN6nnOSUpUAa8kJ0tjVL2i1rJJ
	 8p/x5ma5cCMuQ==
Message-ID: <ff169a88-250c-1e21-b65d-bc92fad20f79@collabora.com>
Date: Thu, 21 Jul 2022 10:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-5-ef9fc29dbff4@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720-mt8183-keypad-v1-5-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_014128_998856_DB2160C4 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 20/07/22 16:48, Mattijs Korpershoek ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8183 has an on-SoC keyboard controller commonly used for volume
> up/down buttons.
> 
> List it in the SoC dts so that boards can enable/use it.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


