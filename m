Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F85EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rvepdVElv5boRdOZsx6wagPFe5F7inm94PjmrGdaeA=; b=0Wv3HoVfwciM316WP/EGdIHpoQ
	WiWngTGewAhlFua4n5M+3JiTNI2tI5P3fUzLjCD/I9iu2vC/udpdE7EYjVPHPoWlSxIHxKE4d282S
	+XSUtrfVHwYI9LRLEmEliJOnbpVamnhdJraMba4vpJtRpfNvsx9M+3MenpuzUaozxMlv1IBKCXMgn
	ogWPdSD+10lW0kmJUbTWsV3aAX+gknpFhgmP2okuJOBFqG9eZDQL58L5JpTFNZ5kQfeenb2soNuVA
	2aaiNTFDR/Lj7wqPtAzDYQ+m2YD+51GJ5St569rLXMcBy0XgOnvWvyyxOB1imsvCf0FX0YBaW+lVJ
	Sto1LhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm6E-006iMM-2F; Thu, 15 Sep 2022 10:28:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm61-006hw3-OC; Thu, 15 Sep 2022 10:27:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D14926600371;
	Thu, 15 Sep 2022 11:27:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663237668;
	bh=fAUuUgx4PgoGY4gQr2IMZ6T5dmjhyUOc5bLVNivN6Hw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F1u56N8hpZ6Wj9eJLKmb5gV7fbGagzJGPWqNq5+8fgV1a6ywMivyOUUL8W2NY9pyK
	 e3j5+7TiGTtSZGTJCEfDrqaVBGUXfTESjB2sgilXKHEy5LQfw7jQIfIvBA/09nJilk
	 zFMIfsL18TJhR92Gpklq8oQjvKuhPJE43GI2gV8fhoKSqSIZ9LAZrbxN/Jv/TuZDIx
	 hJfIR0m6a+Ip2noRgymPu5toXMFG45nAgqmKJgeYwXXuFL0G2vEQ3OmWNplvZNYmHk
	 Vy4svP4ulR0n1ydL10x6/RhoxjsObt0dd5QWPcpGthMq6OvjpDcDsKV231cjh6yABu
	 PHkyc5+zKjBIA==
Message-ID: <ad21638e-f233-2bf0-ca62-72228ff04ff7@collabora.com>
Date: Thu, 15 Sep 2022 12:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: cherry: Add edptx and dptx
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915094640.5571-1-rex-bc.chen@mediatek.com>
 <20220915094640.5571-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915094640.5571-5-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_032749_944403_5F188B88 
X-CRM114-Status: GOOD (  11.17  )
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

Il 15/09/22 11:46, Bo-Chen Chen ha scritto:
> In cherry projects, we use edptx as the internal display interface
> and use dptx as the external display interface. To support this, we
> need to add more properties.
> 
> - Add pinctrls for edptx and dptx.
> - Add ports for edptx and dptx.
> 
> The port connections for the internal and external display:
> dp-intf0 -> edptx -> panel
> dp-intf1 -> dptx
> 
> Because it lacks port of panel, so we keep empty remote-endpoint for
> port1@edptx.

Better wording:

The eDP TX endpoint is kept empty for now, as the panel addition will come
in a later commit.

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



