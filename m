Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69511CA5500
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnF9lqTwCU6l+dTQN1+0dRwDfngNYcq1FPZsi5JpM+M=; b=zQe2NwSISuKW4t
	2TKMqkkkmSMf+7QU+ODACkgV8f6Kb/srl/Y0lq+ieK/5W/eXFmTdRztANk6RIeOdn4E49WDLsnD2B
	3vxhb1TRyowsC4QUsjsuYZ+OSthkGPTKEHVxCk1ozmj2dITNq/QuBAKmDHGo5m+DhBarcaTjyZqN+
	71cTP3IRClBFccJI+vhB2IfaCh+4MIueMkp4qu/Lk6KDki1bPqW3HdHht4FhJ0gXm+vC+iRyb2Lgz
	t3cpXh1BoPRxBXfi15zNSm/sm2WYJjiTEzq6hRrzL38pyW0yNArqUCCaHC+6J/yoSHTWIKhHxhnC2
	cdToHGEG9xlTVgtiOL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKce-004zA6-1X;
	Wed, 13 Sep 2023 07:49:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKcb-004z8q-0p;
	Wed, 13 Sep 2023 07:49:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31DC26607319;
	Wed, 13 Sep 2023 08:49:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694591350;
	bh=O9CO6wpscQ25gSXId4JSpQF3dW+cZrAGglKuHmq0w8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DUxO7fNLz9nzGjZFSrbleJZ3aZ1M9wGDs5FruQWelZUIqm9QzVtGjOrsS3aKb1Kys
	 OU+mz5kS52QwTZ7H4ykQRNqn5WZFhPS1xuNHgMnYKaO+as4K6eKUjWr3PZVdk2pRsi
	 6XKF35tyWHerWlJcW27H0QgbbP8CBd9rQG+JNcBL27zqwOpWiiUC0YWn3pZ9jtQd/p
	 hbCSfrTj9EfX7HvFaKcbvvpSj0+eJQod+cWjXEv3uZvyjf2jk+I0oWu++4QSuWVjjK
	 ZTGipyXoQjHxWG/zV8HBI+5q45rRdI+a4TlwWFrpWVJOAvsSCbPRO+vJzaZGqqaDp8
	 PQD9+1o/iWk1w==
Message-ID: <e93aa8a6-e088-2864-6ffa-050b211be21f@collabora.com>
Date: Wed, 13 Sep 2023 09:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC v1 1/3] dt-bindings: thermal: mediatek: add mt7988
 compatible
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230911183354.11487-1-linux@fw-web.de>
 <20230911183354.11487-2-linux@fw-web.de>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911183354.11487-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_004913_439109_20110D50 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/09/23 20:33, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index fe9ae4c425c0..49effe561963 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -18,6 +18,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - mediatek,mt7988-lvts

Are you sure that MT7988 has only one LVTS controller, and that it is global?

>         - mediatek,mt8192-lvts-ap
>         - mediatek,mt8192-lvts-mcu
>         - mediatek,mt8195-lvts-ap


