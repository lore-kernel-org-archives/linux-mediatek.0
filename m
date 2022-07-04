Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBABDC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iMwz3t7WFuxhjrpWep5GuFkR3qaQSLnI1l8GfnAiZk=; b=J3GOrxOTdUbIs8nSvx3kftgCGr
	9/wKmtmb7c7ypNQlWRwbMl7oHlWWfD1cMpPLe3RrFQ4qp8FglCEKu9hS5R0gCdhG+FNcYL6O5IlwI
	fYE8eQyc/59f5CSMS36Y+WUe/74MXpz5yg1pUDBCk9mTs/396P+FZm+WBz9bzSWlhPOx9Ip0OygqH
	hAqUq2gDDuq4uPWbPYQb6DJ1Y1b47BOECPeVBWxdrep0CK2A6iAZ/N+jSW6aidmdSOjBYlZRKo/dj
	qIMpFzCog10LCeIEb9MGrBeGAyizFBlChjWNHt1lR4aWKm4crDQ2uG4wcU3tb/07xowujVxwLRAgX
	qIOBjjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K8V-007dxs-29; Mon, 04 Jul 2022 11:21:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JWL-0077uS-7P; Mon, 04 Jul 2022 10:41:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 068E3660198D;
	Mon,  4 Jul 2022 11:41:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931295;
	bh=5laHkDSxPW/KpIWrOizzobylKDCA7N6H/oe3hm0kdWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K6lT+GWS3d1PNaTNpUIAMzBQtWHQpc44W/PounU8Reg7yJdcjN5KdB1dSTEpa1BDg
	 ZZTcRPlphHggc4HIxNwtz2Fgb8xWzuumgm5u5mUxFVre2g24ZIvwrmsKzrELfnrTF0
	 TvP0sBTTL/A1CM65L2NM6UmPcidZ5vzWQoKRQFlxSpb95XYbPAb+N9NmuLiGHqGQd/
	 ydQ0grNRK4s1mhWASHsL9P5uqS44OkZfXsSwJSySdQ7nnn45sG9CtQKMIoxx7/Re8B
	 Lyqp+gWG8hOAUrMpzheOdP/QqJc2PhPeieGj8zanKGRm4osEERZBtxO5XmR3s1rhyM
	 4vsCp1YhdHRAQ==
Message-ID: <ecc5528c-0a11-68c8-2e3a-30a4ad7e6d4c@collabora.com>
Date: Mon, 4 Jul 2022 12:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 07/16] arm64: dts: mt8195: Add vdosys and vppsys clock
 nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-8-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-8-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034137_464526_388844AE 
X-CRM114-Status: UNSURE (   7.28  )
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

Il 04/07/22 12:00, Tinghan Shen ha scritto:
> Add display clock nodes.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



