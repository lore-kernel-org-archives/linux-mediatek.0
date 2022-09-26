Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462C7C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEkwFycTr/8uGKOSK5oNQQLfbY9CQ8AfF3r5Af8DfcU=; b=sibOZYEf/UGMA/rGGhdzZU78y6
	YmF9UlvZ+Zu7vfwBdmpTek1kvkP3CmfOyxzpBgvtliH7ooxEncUNfEnwH7WoZmknn1VEQ1/ziegUU
	3Of7cj+uKXf+sjb7N49xj9Xr/+3LZ6hYamBZQ2flylPndABSvZaQn5K1ibOmBxdFGr13MlUGrz3Th
	TBPzBCxiXSTcvv2tEt8scfAOiNIWhzQ+RX+uVIOjA96qy4IViQAm9DKK/CzXPDGUo1bNKwFJlKDrx
	ffpRl4wPBK4i8HaTC+gDzfOGnegBNrcl0XpjFu4hPOWS0fwJ8AUe1yvGA7lQruMRV4aKXtnEnyE/8
	kgg1TYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocomS-005HMp-LZ; Mon, 26 Sep 2022 14:08:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocolN-005GtC-RR; Mon, 26 Sep 2022 14:07:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EE7160DD6;
	Mon, 26 Sep 2022 14:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E362BC433C1;
	Mon, 26 Sep 2022 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664201232;
	bh=ySnah8bvB+A3n/zCRB87xWDZuvHSaOZd/TpqYUZjtnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aeS8lkLOd6ACEAGMd5VNRciESUfEdDm0v1dPZkJm5OJHNr6VcAvBUXdLDesLKdIH/
	 gRfMnSlfZAWqkz5W/yj68CkKsSxcBX+KsmS1Ay8qzAFxyRKjWZBpRtwKoYRa+dc/Bk
	 JIlpD2q8bO9TuXBGDeQ6txlPY8wwSWSloR/rmvNKJ7rCfuw3jDM78SIyvk8QkYs6IM
	 OHPyQMEN3RuAHr6owKFOrUGRRihacoI03GbtXM/fp8bkYt9FZ2MQM/K1t70khR0pqZ
	 UWfUy5SV95xpQITIihLrcE5Dwgv8K09zH/Zlf19IbudwsReXxTOjzxN/PwIshBRF5x
	 QDMtMvX5e0hhg==
Message-ID: <b9874b8f-b40f-f48d-856a-c5fc91384042@kernel.org>
Date: Mon, 26 Sep 2022 16:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [V15,01/15] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220926091433.18633-1-irui.wang@mediatek.com>
 <20220926091433.18633-2-irui.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220926091433.18633-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_070714_012380_6F81C9F3 
X-CRM114-Status: UNSURE (   9.90  )
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

On 26/09/2022 11:14, Irui Wang wrote:

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        jpgenc-master {
> +                compatible = "mediatek,mt8195-jpgenc";

Use 4 spaces for example indentation. You have it quite inconsistent.

Best regards,
Krzysztof


