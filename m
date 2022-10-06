Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCF7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXf2Z5dzDKK9QJnP4hnOxS4YNw3lj42WJvIfr9B1dWE=; b=OPGQEfpFd+dfHc3Ev/eYTfM+xB
	Z8FjN2Yyg+sdvXkHnwLxVpX8RrgYAriRk3hh8//fS7YlHnLu4QZCcJKwPPlgw3MY100GCWskZvCA/
	qbA+mEXcqmAIgiuc+wwRRVI/+tnLGGzYJV7YMDonLNg//fIpMefMPmherwWwWk1vyNCEMYrjlK9l/
	QPjbs6pYIA3nHPRdT4fROps2xODjmD4wmNTQdbzhngs13rff/3F2y/szHYvGpBIJ4Qd6UaoK33gg1
	sHWRMX32iUxDsVW0KVL2wtQYoJaNnNqq3deCKr/GdUlbtd4GobtLGfJvHmayN/Ovbq2acJVCsDm0C
	wEA3LRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMVU-000o3G-UM; Thu, 06 Oct 2022 08:45:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMVJ-000nxB-BT; Thu, 06 Oct 2022 08:45:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 23E9A66022F7;
	Thu,  6 Oct 2022 09:45:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665045912;
	bh=X4/9IulhjHFVhHll60QNhPFZXwjRhXzzVppJJbuC0Mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H+2hXAwApRg3zxPc75Ezq4zsjll4PaFp0DmD8qPRFbmEiG/gALZkX9iJMVWra1f0E
	 09XQ4GvzzO9gjTiVswhhN/tmNVmwdGaPGKDeDl8IcLgrdzABiRRdT2EvK0FxTrqLzH
	 cNozNpttxZfM2s3kerR5TrZq9JTb7cADv0Nx/ywRiLpMI7Er6u9y7ilYu99u8HLTaB
	 0GkfwWTWc/HA/68mUq6hlUljbBMLIpbDYKkr79/2ziM5fGiJ4F4hh6TVg+YYNdpNM8
	 Z2xcskijPZrI9XQeunAP1m88gszPYaeXPfWPFKvkwY50Pe+fBYWenZ45Ciug19ULG1
	 ef7nDyi7ImgRw==
Message-ID: <d9977d0a-95dc-fa66-f48d-cff2968d34d3@collabora.com>
Date: Thu, 6 Oct 2022 10:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Content-Language: en-US
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-4-angelogioacchino.delregno@collabora.com>
 <1f3ebf6f-117f-62a7-8e02-3e8a3bcf7e9f@linaro.org>
 <56aadffa-82be-f8ff-03d3-2a880b50ef49@collabora.com>
 <6b19843bf0fc6084552f8c71c9a16da21017f99d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6b19843bf0fc6084552f8c71c9a16da21017f99d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_014517_544438_A65704BA 
X-CRM114-Status: UNSURE (   9.19  )
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

Il 06/10/22 10:43, Allen-KH Cheng (程冠勳) ha scritto:
> Hi Angelo,
> 
> I can send a new version with this series.
> 
> Thanks for help convert schema.
> 

That's perfect! I will wait for your new version then.

Thank you!
Angelo


