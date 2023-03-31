Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7307FC77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h2DxGVrbBYyy2uoVAHIAOaCj5JbDXswvjNoCG2wfeI=; b=Tuv8GySiGk8ySuC3ecDuCM5heo
	nOf2ftx91oGxKOTti54US92TJ0/cFle1BVEpNiz7mV4b4YWOqbL1azFRG+L/y5lXw5clVXDHISmHt
	+IVu0E9Sd20aXDiSdST5WVtFIsakGWdzsZpqHysnLvmky4yOh1nHGMD/2WogYiFXVIW5l8KYJ7dVC
	MHNQm7v6UySNPCWC30/aI6EYWgx+GOQSxXOmwBpZbOf77g8o/Z3uMEUUdUhxGksMbuUIWo5rNcXrv
	JoG09SIklrcLcgccaRMTNp3uMtzPP+Da7rENo63dERys3DywHuRTl8eBvuLptfmL8UgOElYfRI3nn
	Ms7eK64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBTH-006nn7-1G;
	Fri, 31 Mar 2023 09:54:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSG-006nKE-0p;
	Fri, 31 Mar 2023 09:53:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 654D56603192;
	Fri, 31 Mar 2023 10:53:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256435;
	bh=yhQGBDjpiXyLokl8kEYVcGcEJe5LqNnu7hroUolK+mU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eUIzykCbC3Q43OHz5RLWCTPLCx6is8ikutsTOpvwzSHg68izkq/sH4gmji1tSwUnr
	 B+n/x+gkSPslk5c5dNgJli6tfHC1Ish5eJmR3nPY+DH0aYl3X08i7pqFC8I4lktMXt
	 OH619Htn3jLr2XEULEyRKvLGE/SNhFVpZ4jAMZ8+WClQG+z1t+IJgt1dmfTui17Eo/
	 rBHakUZbzc6oA3HFCwFmisWOGu8TK2SO8USxUu276xwL576JoinXOy82k6jz1gxmLz
	 M4MjAsCsCgsco6MeKm4sLhNpC40WO6Rn4BS6S/nw7fSXLlB42WhbtgBodOk/KTxVqN
	 AZEFLq9ljB+xA==
Message-ID: <ea3f90c7-a9ba-cbf0-c742-c31db77f302b@collabora.com>
Date: Fri, 31 Mar 2023 11:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 02/19] clk: mediatek: Add MT8188 apmixedsys clock
 support
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
 <20230331082131.12517-3-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-3-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025356_440339_324F5ABC 
X-CRM114-Status: UNSURE (   6.90  )
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
> Add MT8188 apmixedsys clock controller which provides Plls
> generated from SoC 26m and ssusb clock gate control.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



