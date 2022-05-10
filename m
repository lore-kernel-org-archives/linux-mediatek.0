Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoAw7Zm7SzGBEoOR9jEiGkxNS2mZoVX4WxINeGg5+kw=; b=dlNs/cVeSArVM4
	1/US7dwyZjiDIq3skozla1cLEoxaejsa1JtVvddCNK1SbmaH5ROJqTV6FGfoMD+Cf8FYaW/bK1KFs
	u5kGxO9ok+wClNKTXQJIHe2SkSkjc7grpcRUzuRwZrOQrIVWmRR2cxfFvbHmKt5DVTxMVbxlyo1l1
	dU21IiyvAUYe8/lEuD4B55yRdiNYN53ls9kFSFdOVPwh7NR56Y0ZI3ypDJWq51KnSi8P6eGJZXkLK
	OXgFLczTVxnCRVOeutz41vYNix7UieGV9DLnkwiUlc45LuR1uI2WVpcVmIdSEYkIzxWWB4HXUf61E
	1+SjBQUzuuc9GDoQFuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noN6M-001Boz-0M; Tue, 10 May 2022 10:28:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noN6J-001Blz-9J
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:28:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g23so19427524edy.13
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qB8tiSg9orpGv2oafVz+zb1jhV1wE750MfA0k2QQW9s=;
 b=rhth6SprFuXZRw9NUufEJzMkPofYa5+szGIs98AV0GVIbzsAA24w4QbdhAH0k6tNsm
 G9lbp93Qgq5wQy0+CFXT1fi5iMuYA4Cm9U/PxSd8amtshY1+WWPg3Zsj2ouQqfzpm3cT
 kgoHRoMvtjtr0hTCFuXrxFMAPcuVScNYCBHjhvwd+K12WtE868Zm28gTKB0PPjcHEMOT
 ul8LCqkXub36kGTu/xSmxsHDmFJH+vm3u7mGVS7NKOKyYshFVlM324rzPLNV2dHsG+Oh
 n0LVc+nwWpXvQhRwZyGWvq87SlHXW6mR5MmehPz78ndf2YvXFubXASGRbD0PBKSD9hJO
 nEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qB8tiSg9orpGv2oafVz+zb1jhV1wE750MfA0k2QQW9s=;
 b=Ia57pOrHK3ZDmTq3OeNo9oXmyFx1eX9uAUnyE3fBF6yTwM42yi3gDqcZy0W7XqZtlf
 7Aowl+2dwRSTSAGCUSpmRmxPPGMu6Jf4CSOrF/szfMpaae9kK85A5kbV6TL2Eec0nF1j
 v331I7R8pJhDTupFXorj57ufuJ1uFwV/raEp2eZfsy1oLHyWXN/ty+vMLnXEI/LircMF
 mmDe7u63TFk/vxTxe/hSQpE7PbmaGihybSlasAlPiPGH2Gzqoovs48QwwsPht3Gy9nhV
 JL06khS8V4taXZKN46uBmGJwM2vwNgdaEozmrCKicKMyWw8kTl9u9Q7i6VI4Tz5o+1V2
 90yg==
X-Gm-Message-State: AOAM531HhEqoDdUi3HbY7l8TCW/bksxF1YdbkE0Ydqo50HntuJHTEKzC
 wTpTSTvCCkw8hEgN5s2nRzPePg==
X-Google-Smtp-Source: ABdhPJw5CAaM7D9q3+CFzPibPNCbcA7gMgHTzab1tVA8q065CZ3vhqKEUGpu1+K0yDXGbet+UCoR+w==
X-Received: by 2002:a50:ed13:0:b0:426:4939:45a9 with SMTP id
 j19-20020a50ed13000000b00426493945a9mr22748001eds.303.1652178495995; 
 Tue, 10 May 2022 03:28:15 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 qr48-20020a1709068cb000b006f3ef214e13sm6051348ejc.121.2022.05.10.03.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 03:28:15 -0700 (PDT)
Message-ID: <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
Date: Tue, 10 May 2022 12:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_032819_382802_1E89B672 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/05/2022 10:45, Rex-BC Chen wrote:
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        vdo1_rdma0: mdp-rdma@1c104000 {
>>
>> Generic node name. dma-controller (if it does not conflict with
>> dma-common.yaml schema)?
> 
> We don't understand what dma-controller you are referring to? Can you
> help explain more? Thanks!

Use a generic node name, as Devicetree spec asks:
"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming

model. If appropriate, the name should be one of the following choices:"

I proposed dma-controller, but feel free to find better generic node name.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
