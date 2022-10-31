Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77126ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJ6+5aRB5n+Ach6WIME20K55zk7OxWRnbA4YL/bLylg=; b=cyb7K6YFIGt/K+nTEa7/2kOw/I
	IKJOCEZWDKwyQGII+jQsFVTnmRXQia8ZFs6kH9If2AgCIPx2hmnJP11faqCfujQMyOtpNG8ab4knC
	+gnMbg1bri+MZ1kUQ9yT/vOR0E2+0ulwrJxj5KixmdQaEp2imZhTTpD3V5OlWKBEEktPGvSk/lDhS
	eZI61stLR3lY7jk8qfvtx5j9vHmqeer2yrQIZ1LLlEOUPcbq2UchpcP1oxpnE2A1nPONNGBqStZYB
	/WjR1w6gLYrP3NTyCVvcT6q8To/Oqqy+HdnaZs5GXryH6KdTOtYsm8bli0Yd65JIygYqnb1n4wuwV
	c5B82n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUbs-00BvYu-EH; Mon, 31 Oct 2022 13:13:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUbh-00BvVn-JN; Mon, 31 Oct 2022 13:13:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DA3F6602827;
	Mon, 31 Oct 2022 13:13:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667222015;
	bh=CG2d+WzUhOf+xwwimNowiCEmXfcCjdwlQpdt1QFnrw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALpTCbRz5+TfhPJiEcFADghgwPSDUJqdl6lsQxpMINEUCgkwVwoWKisouofsZmI1r
	 jw7xyLP3mgy30YhKODpyCmsLq6w/S5B12leKOKA/kK8fxuqt1lkz6/9dsaUOX2RiHC
	 8jxcgiVwFkVql6sqCTFaXigx1aUuJXPIa/BlkIHZFwSK0Kp4RLIHCt7vgEp3zbXwOp
	 gwS4MkVkakrvhaAJjivJT3EOzpSRmTTS4+sPMDOQcwQc9O78ZxNMAfsc1eHAjDeKsm
	 XGgJ7jx+x6Wj4JaRA9VC/bAfPiNlZ8al544ADEC4kXd1wgai/9iXfVfkgcOlbrk8HZ
	 ClHqu8IV/fEiA==
Message-ID: <00629a19-d42d-3ca1-7b97-f56dd424501f@collabora.com>
Date: Mon, 31 Oct 2022 14:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 11/20] arm64: dts: Update cache properties for mediatek
Content-Language: en-US
To: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org
Cc: Rob.Herring@arm.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221031092025.533051-1-pierre.gondois@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221031092025.533051-1-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_061337_801111_2F921748 
X-CRM114-Status: UNSURE (   9.03  )
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

Il 31/10/22 10:20, Pierre Gondois ha scritto:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> 
> The recently added init_of_cache_level() function checks
> these properties. Add them if missing.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>

Hello Pierre,
mt8186.dtsi is also affected, can you please add that one to the mix?

Thanks!

Regards,
Angelo


