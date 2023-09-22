Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5DCD4F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 08:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFGfkyLYGLyOFQ1XSX+9mvPFKRA39XfPY6M1d6ZsdAs=; b=YNIjGS2BBTjhhcIdwmAZfR1YDE
	BldMlDT5T3rngqMBTUtk6VQNKnLfiKgInXWSuHe6C1P4Ql50pL+HhrlaIfWR+5sXWN6zizE7gBMjE
	i40jou5NhNC1Wl6fqNbf+SmmYpWzfku6fKKWVFv1ZanAkwsdDJ5ScjwSQhAsq2UhysHseT0ceLm0d
	OMdUGf6v2rhKRqc5oMRewz9wsex54naIWoL09qb85UeLdEzZk4WgrmxpkoH9B915MRhlAeqPYG1TZ
	+agS30KKinxVsWW3FjmAN8yosAalvBvDJjplZCU7VxstO1l8/JJ/yhfHnmg0z6eRo537QJGjemobJ
	x30p/5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbXl-008Q9c-0H;
	Fri, 22 Sep 2023 08:29:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbXh-008Q7k-1X;
	Fri, 22 Sep 2023 08:29:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E5C066071F1;
	Fri, 22 Sep 2023 09:29:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695371380;
	bh=vTUoTNsUa8plce4ZbB7dv+A/sBuZjeEuE9SHlr92eUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XRIegUlz87ygvplzkHPyr2QBNrDZ7bxFA3fdLff1RuEmu9zv7pbyKyrtzsGo5jeco
	 NFDJL3h2bUajx2ogb1URIm90kzcWDoOdwrXcSqFE/z2xF5ApRZFDyOflFfmqzWLzHV
	 RncnRPGMU89bUCfCprQugeieiwvJDMFkVdKa1bQ0wfkIRfk9ia3+pXB/+cA6EKrfSx
	 CPRVDwpeU8ZjR6IneQMiAZZ/+y+ufEG7O9TV94vya7ipXMUplVcNUBc+kX2vw5Hrul
	 ZXpIZY+So9oHq9cx+dhYIHeAyDJq1wOVxtxUuD3zugKyQ+Ktusc/+2QeakoQVpLs35
	 HMWz9FVSO1psw==
Message-ID: <5b743459-1866-3f51-f3eb-8af335035800@collabora.com>
Date: Fri, 22 Sep 2023 10:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/2] arm64: dts: mediatek: mt8183: correct MDP3
 DMA-related nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230922065017.10357-1-moudy.ho@mediatek.com>
 <20230922065017.10357-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230922065017.10357-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_012941_692591_CF927FA4 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 22/09/23 08:50, Moudy Ho ha scritto:
> In order to generalize the node names, the DMA-related nodes
> corresponding to MT8183 MDP3 need to be corrected.
> 
> Fixes: 60a2fb8d202a ("arm64: dts: mt8183: add MediaTek MDP3 nodes")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



