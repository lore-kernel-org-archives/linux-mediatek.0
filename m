Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A83C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cKkovPwhRMpRzyfESa0Nn+hlo0AHN0pmurSQImGzGg=; b=yw4H2kc4+NSCYqctgl4gwUZk0c
	8QtJrodXKWqlXi9ikRQSvbA+C3GHPpew4UXF7jC38s9HBlGdDTcOUpF9g/zCC5BIwnACzlO1ZHveJ
	ifrxtQNiVQL9NrP+al1ceQ9vJlRBtwdhlhaJjAUEAMEvPr1Tj7EeKlC1x3IgQ/YXuvuSlnBwTmIJo
	wh6NqRy/saXFhEfh2UqliVbAWmmk2NrurMr7OQgiluvqSMTjp6iZAzO3M4LHiSHfdZCsvekzTz4AP
	sKDCkJ7pEjSF16qkPHPUHAsUdw512NxL5q/xajRTQb30Q7nqA6OzCMIBxcbCfOOeKUMFOMi0GuW5g
	THyLEc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhbY-007nsY-0z; Wed, 25 Jan 2023 15:22:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhbM-007noO-Uk; Wed, 25 Jan 2023 15:22:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id l8so14026007wms.3;
        Wed, 25 Jan 2023 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cKkovPwhRMpRzyfESa0Nn+hlo0AHN0pmurSQImGzGg=;
        b=c56bBLOwNUcAjFdOKoGKTZgg8PImKyx+ee/GIya27ZazszZv/4X8DalRcCiTxuVUbf
         0ay7SIKVdx2CfL8p9KMsDDu5uOTzkxFFqd0RuN6Y92X/nWdeGw8i6C/I6bt8VSY2633G
         Mph8tDz988vKVnezUAHA392AngkNnwyAhIKf5il884nlCMRr9R3fE3v6/h5ow4qdgj+M
         Fq22FUCrXId6aRexAUOKNAidm7ygLajXRo0MQQvqCwCvcafsYv13aFntghvqRWq0lduO
         BshGHnVksmh+ctYu3DLo531bxv0+iU5Sbwo6+yl52W160RZ6BEO+K3ik/SxmuwBctvgF
         c8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cKkovPwhRMpRzyfESa0Nn+hlo0AHN0pmurSQImGzGg=;
        b=VIjKs7Ds2d+e3ZoJncSipaV/BjxDL/W5t89OJ3tl6jRxpnpPv5HMVugfDLNQB7qAw8
         40osdb5qeqPMaxudSKM3Btw7+DUH1B7k6EZTlALHyobBwc+x5USwJVSzhwxTfzBOVAQ3
         s2uprRxfa7OlI+kR7fIGwWAfwb89MG4u+eXUdidxClzPH82UPygD2it41BkxL52Do1i0
         iJvRUTYIJqVN/DQjHAMSzfGXCeQG8vcCoeIETJGowsYB0jTm0A5HJvKsnBpI68lYqWsl
         /vbaNIXUnIjfZyTCCPxoaz4TL+bI971Upqn9d+8PjSqr5XRPzd1vb0SCj7XTMX1bAUhQ
         YeUw==
X-Gm-Message-State: AFqh2kqG6fmSCqt38HIcVdaKzIEnYQlgZZb09/wsiR8dpMFC523zsFRF
	q154erm3UFDTMktVuLQMyddJZid2AAY=
X-Google-Smtp-Source: AMrXdXte+pCfs4LGfK4VbuM26cJk1PIH0LuEe4MZdQEOXF06DWuRk4ApCwbryG5b3dH0tXKAc/PKCQ==
X-Received: by 2002:a05:600c:2d0b:b0:3da:fcf0:a31d with SMTP id x11-20020a05600c2d0b00b003dafcf0a31dmr32278071wmf.22.1674660133088;
        Wed, 25 Jan 2023 07:22:13 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c130f00b003db0659c454sm2432709wmf.32.2023.01.25.07.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:22:12 -0800 (PST)
Message-ID: <892229a2-01b9-f4cc-95fb-980107166715@gmail.com>
Date: Wed, 25 Jan 2023 16:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [V1,0/2] Add jpeg enc & dec device node for MT8195
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com
References: <20230112084503.4277-1-irui.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230112084503.4277-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_072217_018605_555E85B3 
X-CRM114-Status: GOOD (  11.81  )
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

Applied, thanks!

On 12/01/2023 09:45, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series add jpeg enc and dec device node to dts file
> for the purpose of supporting multi hardwares jpeg
> enc & dec of MT8195.
> 
> This series has been tested with MT8195 Gstreamer.
> Encoding and decoding worked for this chip.
> 
> Patches 1 Adds jpeg encoder device node for mt8195.
> 
> Patches 2 Adds jpeg decoder device node for mt8195.
> 
> kyrie wu (2):
>    arm64: dts: mt8195: add jpeg encode device node
>    arm64: dts: mt8195: add jpeg decode device node
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 100 +++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 

