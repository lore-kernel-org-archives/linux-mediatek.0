Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D6C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSK5P4XJRGsx+bQBTAY752e+xdD/PQD8kSWa0n8t5p8=; b=Q/Iq6nz1jaggCTNFnv5RDc950C
	PRHMdXkgMlB/fXHPRuC55sEKMLq2GSPWohrbKfcRs5suNpIq6kdmC6UidnSSdpYweEGFVRKpxCx/u
	pTjfK6nGodXeVge99yK1pg0AEDtO7wim5xcUcSZpwYn9g4gSlNKbIMchY34tZ9TKUnz+fjQZdBgrp
	5VULaQS/0+vLs/Q7ouR5hzNES3NpCfM8DodbvgrshcVFGKB66eYlvFYO/5uigPP3jCbGyyZkxTFc1
	BcPRGqE9zWq2fD00c/QwCLBBw5Fn1tC1cKqu+0uB8R5QTAgyIZOMQq/4yBfK+K37+Ry0+y7bu0O2H
	z5TALE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocomz-005Hfm-AO; Mon, 26 Sep 2022 14:08:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocold-005GzR-Nr; Mon, 26 Sep 2022 14:07:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B01D60DF0;
	Mon, 26 Sep 2022 14:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3383BC433C1;
	Mon, 26 Sep 2022 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664201249;
	bh=4yu64h7afppe4HawaBZDNUNqopaG8iMFWkzcqeDw+LI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cy5WZoa97DwR0yz45KeAou/18GyOuEQ0uevuHZ2lbksiItz1CO7OqDhTWTcDNktAd
	 kDZQJtVvf8Z27NflqcwAxbhbAfSZER45TheMyNy99T/UVnt7vvd93gNIs7Pw6pVr4T
	 SEuW2keil7opRw47lqyRO9MAMbRIEkql2ZoAW/7ezR+GaCI3j8asg6hi6zDkhKnLQv
	 5r3cf2EMP7Y+rAopktDoYiww5vMKE04CDYJDrY6CH3u3WLB18LUr7/1bPi/BwprQhK
	 SFGmPeVZqu1gr+Z6IspQ7BH/k0abnE35rC1FBJKl13VCSJs5dx3zSh+RoTydjuLzk8
	 RUEV+k6vAaB2A==
Message-ID: <05261a77-0412-d333-96fe-53c4238d4ea1@kernel.org>
Date: Mon, 26 Sep 2022 16:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [V15,08/15] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
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
 <20220926091433.18633-9-irui.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220926091433.18633-9-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_070729_831232_F1A8832E 
X-CRM114-Status: UNSURE (   9.62  )
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
> +        jpgdec-master {
> +                compatible = "mediatek,mt8195-jpgdec";

Same problem.

Best regards,
Krzysztof


