Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5675BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhFfvjpuiEN0zfpi+xr9FLIjvJNeDC7fbCoowYXNhVk=; b=l+ZiRsZLqaXvn19XoUV4XvJf19
	77mHYFcdE9eOzz7CoEAJqqRx+P0wTKhD0Ll9Pbsv5Xt324BPIho7cLaerIonE1vwl+ukIuAR6EuNf
	BoHq0LOjG/FJR95pHPp2fvssEr6+hseFUCYebNKp+EgcRifUT6H41y1KuiE40ArOk7jfxDAfArBNP
	Xa5GJ3WXvZu/qdmrUTF1K4jusAkxaqF5b2Ol3BgypHrRCvOr1q6Ilkwl9tEcnzwJCVJw3SsC7jODj
	jTxCt+Dx/lrK/XDLDyE8dgjAb+KoaUpXgfCG2xgSB2i4NJ8tCoWCYn7yFsw+UOw7deA4iE/G/Dpl+
	WfsOkOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi7M-0067Id-Ch; Tue, 19 Jul 2022 07:58:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi73-00675e-SC; Tue, 19 Jul 2022 07:57:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F22E366019EC;
	Tue, 19 Jul 2022 08:57:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658217466;
	bh=nji9qQO/Fe2O7nOAQY8VO3ZafgMoj4sz1HhYEJVZAdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ix8B24hH/TZI+YEepZqG05xijSJuRWOhrlSEX0WY4I3lJdsjFh1eEHKyftYjvPiPB
	 /6Yu9riUXYes7hcmonRoEMV7YX2CMSP4YLVsy8pqWs7EagsVHAKd7G+lrV3n1SX9tr
	 DRZFEuvuYYro2MpOuWRYPPfHCxo/fklVffK8hgTrgpQZtih7zTSgbkH28aEbWtSuEf
	 6Yz3pAXouf3ILg8LN1P331ibvFHYAJZpBljZnCfFlDritTt+mKhf9OGutCAu5nLxrz
	 YBoeRUTkSkS2K9QQa14SLvasvprvi/mhzBmMylNg6TP668V92PDkG88XCd4UcfCFEO
	 ovDLCLcCoa2vA==
Message-ID: <26dc9eac-752d-4357-a793-be16554dcff6@collabora.com>
Date: Tue, 19 Jul 2022 09:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: power: mediatek: Update example to use
 phandle to syscon
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
 <20220711122503.286743-3-angelogioacchino.delregno@collabora.com>
 <20220718180654.GA3260460-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220718180654.GA3260460-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_005750_072151_72F2F163 
X-CRM114-Status: GOOD (  11.18  )
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

Il 18/07/22 20:06, Rob Herring ha scritto:
> On Mon, Jul 11, 2022 at 02:25:02PM +0200, AngeloGioacchino Del Regno wrote:
>> The preferred way of declaring this node is by using a phandle to
>> syscon: update the example to reflect that.
> 
> Preferred by who? Not me.
>   
> What problem are you trying to solve? Better be a good reason for
> breaking compatibility.
> 
> 

Hello Rob,

I've produced this series after a misunderstanding with Krzysztof (entirely my
bad!), then the discussion [1] went on and I'm handing it to MediaTek to resolve.

Please ignore this series.


[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220704100028.19932-9-tinghan.shen@mediatek.com/

Regards,
Angelo


