Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctzvJZvTlU3rEX7WE6OiiN36D8wjbt2Danx/dXPB0qE=; b=O/Rpf2MAQozoFry/bQK210l+7b
	6ofnldxGnh+xOMijMDm9L+hUR2GVNwZxTT2o9OF/fg6KfGgEeWv6mNKpHyc1QgxF/kNVgu2TE6aEl
	4EUHQgLBcl+db+zrYDg3Sq8zgilngcDhDuNiqNRPeiua0jqxVZ03WAomYKbtR8/U6oNxQB1Z8eotB
	/xy+W28V+I512wx1//pFaFt/a+G/NBL1Da/i1Pl0N1ru2GJ93+4/3bhGSvEV/390RId1S/tBnruyk
	roT1vmAp4USbVyzfn6zBQTfhZSk+NJ/nnyjMOIzFx0n/YJNQJwiii/TJScE3t3q083QZDjyZWZSmL
	OW0Jw97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0y-003SDh-Bn; Thu, 15 Sep 2022 08:14:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0M-003RQ1-JQ; Thu, 15 Sep 2022 08:13:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7170D6601FC3;
	Thu, 15 Sep 2022 09:13:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663229627;
	bh=VPuQR9Du4i9yIimRE+t5swTTL2W5uqbp9UKeIKGtM1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I07YgfMNasLM3gjhtd54h1NIvUyoCDEvELWZaGhEK0/DPNQ0/hOS1QDd5rOLRSxCR
	 z7fMWvGFjq2eqL5C9mvZ0VyZa/GSx6khdm61wFCC1p98sApkFPXcgf0MWHEi7mnQiA
	 LylI970hRBodDUObasBfx4l0cHgoMENb/1YufqMWT/z+w4vWsInrLMFgF0EEr9wwCv
	 EoHPUC1l9voinbdL16gSwY0Yt9pPpWVjA2AjIJlcq8DUXXXcL0fJmm+BEVB+Qlowq4
	 ylb0Ni+YV1VXVHq3pPfI76DvSYS4lEJ6+x4w0LDG1kIYAG6+9JTBChjE6v55H8IXon
	 jCNHkXmIr/Oxw==
Message-ID: <9e0bc249-73cf-90d8-02d4-e9bdf8f34056@collabora.com>
Date: Thu, 15 Sep 2022 10:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: cherry: Add edptx and dptx
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
 <20220915075849.1920-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075849.1920-5-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_011350_923960_BECECC18 
X-CRM114-Status: UNSURE (   7.55  )
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

Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> - Add pinctrl for edptx and dptx.
> - Add port for edptx and dptx.
> 

The commit description is not great: explain why this board needs eDP/DP
(so, explain that eDP is connected to internal panel, DP for external display)

Thanks,
Angelo

> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>


