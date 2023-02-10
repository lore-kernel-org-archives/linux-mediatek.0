Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89154C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdyubJqWGcHLg/kCaccYRYIRvKgcK+CGuae1mYglF0U=; b=rYXFVZVbdNMHiIp88BlrhkoJ+Q
	dLCqCpntYQhqdn+5vykaOVkomUmcYCK8WDq90z6Vr0TLveKJrmrVY388gKIH8nLBH/6N0EyWQ+6wU
	xj9cUAwv7QeI7bykYj81HFkrAOTd901SEQ1Q6UTyyV3R/46p4toimTXA2eb6YobLeq4cAKDjM8vAJ
	WdNvWGKwNS/jzbV3MOVMjJCDVV0ckxrPlQCWjQankiu48vmqXaiAIoE95MkIHRLX95PiRNop8+AdI
	AooO2NPRtX8cDr/elvQhd2RY68EZVSLucJ0OfPB1ZPu83X7/YT5yONbsihuvxACwL9V5KgE8cQmVd
	LUfv2d3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU2i-005xch-20; Fri, 10 Feb 2023 14:06:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU2B-005xMc-3P; Fri, 10 Feb 2023 14:05:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1402266020EA;
	Fri, 10 Feb 2023 14:05:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676037949;
	bh=Mg5W77u46QtJnxyyYRaiHGd8a7BtM7ERXGTfWn6ygxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oLTedfdjpgMf83Yv75H+d+BhU+L0JIKbeYwUbWHsCQNMYwDK1KpA0QXIOL9bdrwSo
	 upVUugkn6xDlMCzvyKGVPKVF9wtpE1yoNWLyWX61KHOSQgFyk1WlnVjOPJ8bD/7QH8
	 XKYWy9zrkLB4RS2tZWZHvr66iXOrJtkbgJL4UzwV1Zoh9LRpeqI2tcA2hqGmMhh3tQ
	 g23dFVLKK1kr0Nd6nW8fm4G9LJ3+SS75MO6C5TG/IIpn4sZjA/Y2arJXWjlvQW2smY
	 9vEC/SYbatCK6KOoSS1TAxPQ5t5/oN2ryF6D6MRZdyDwkSSKvKWFudr9abjST4IeEc
	 MQstltXGJ23eA==
Message-ID: <d7a432a4-0f78-47b9-3737-90734e629878@collabora.com>
Date: Fri, 10 Feb 2023 15:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 02/12] arm64: dts: mediatek: mt8183-kukui: Update the
 node name of SCP rpmsg subnode
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
 <20230210085931.8941-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060551_314868_17C6B24E 
X-CRM114-Status: UNSURE (   7.22  )
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

Il 10/02/23 09:59, Tinghan Shen ha scritto:
> Align the node name with the definition in SCP bindings.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



