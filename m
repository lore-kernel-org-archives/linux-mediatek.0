Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA68C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q5acDJT85etwhRpCc/IMjCIgW4Hv23fqaXLZ7zsbZ0=; b=QrftmZG73awDofafhmAlFXT/KJ
	BgfU5XUx9sRIdfvWJ3QgawYe4yBFuRulg/Txd1k45EWQ5EmvyHfLVMKYRL8UZqxSnl3m0YGR5TfqU
	axr95yWFX/SDyPVFOxeccCfufdnJ7atTKCUwBb82+5S0k4afGlz8RruUS6c9NLi1ElI8uQUkQHcEL
	UpB4P3SmAxMWk2GYaEsFAiPUHssFbhdmYQaKmizy/G4p/I2jxx7FIC94Z2cQpkk2ocbVTpj7YHbDT
	ykos/0m+KmORmWdW/t+96BRFGgTfB8isXVr81d7k5oClAtPkRCJLdOBf5q5g+fJoXkszPq8GydSRE
	i5g+JbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBV6-006pAL-2I;
	Fri, 31 Mar 2023 09:56:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSq-006ncH-1X;
	Fri, 31 Mar 2023 09:54:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 949386603192;
	Fri, 31 Mar 2023 10:54:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256471;
	bh=EKo8lmMORAFDv19yQTTjgobq46D/Fo4c8X7gdyEavKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwxWI6cR6mqxEs+F42ywrhgNIgTkkjLLtHbE8D8xOVXMavthi3A5cfmnmQHJ471L0
	 z1liRGomVgDKl3mEZaTALxf0Xglv1zF/etZiVfyTXWA0N7Fjs9xhadkO4TM4JaIM8v
	 dduy5WugvVdos8SmygbaED+Rq8oaUFYUrBSYXFnVvMFmdCOazvq6qLSJ4WxSQZ783p
	 AN2VaFkZ75b15Ken74WsJaJv8beDrJz4lCOPd1guqjbN/8H/9AHBc/pAqfET5UVUDI
	 4DjuDY0n5OOR/OKBbMWL5nRsqH82z/hMT+263YctdEJPNiVqiOp5/787XfavHKeyEH
	 jXszDK2yGQscg==
Message-ID: <2abf653e-b8be-ec16-e906-10411f84e957@collabora.com>
Date: Fri, 31 Mar 2023 11:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
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
 <20230331082131.12517-11-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-11-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025432_743806_309C896C 
X-CRM114-Status: UNSURE (   7.51  )
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
> Add MT8188 mfg clock controller which provides clock gate
> control for GPU.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



