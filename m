Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5996AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad3L/Xvq4UEcNtvmNn1hBXy7fvGnsBDBSrhEB7NZvV4=; b=kJxzoPBlBXwmNxLbDOYtNarN41
	/BTlVAC/8dpplvr5ejiNWq8fDmpb6EbCgJhTVs2hbs5gBY07o7K1BL9TMdH1x6oHPRBmNwSXIWWVK
	yAf0mfkE6x7MuhI9qaz3Zom6wm3ZYnpHq9cj1Hms+EvZ7FbJ3MA7ax5s5bzyGR9S4q9xUJVilsom1
	h9Rtg5hGTKgefcw6fum4Msmc5pQKRm3XGZlNGQY6i4Q/HgjPq0OSWSQJufIZ/JltsOe+g2mN+I6RA
	XIsUl5OA0YkX2jDevKlcexp0u8G2VS/8768ccuWPoqGS6yGXlW2L8y6BpzdZR1dz4V3/a+twLatJ4
	YPxuGV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K4D-007ae1-RT; Mon, 04 Jul 2022 11:16:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JW9-0077lM-4P; Mon, 04 Jul 2022 10:41:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A8846601986;
	Mon,  4 Jul 2022 11:41:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931283;
	bh=f3c4kkDwwiCmWpxmDdEeUx88rl6RKNgV+YiQ40P1JBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ECy7sRKPE1OcYGmjNj9m8CrmuPM8ZkxfyhlN4vC7dPuYOLPZBgKRMB0tiwb4csKVq
	 PtxvEYyEafgi3mwrlrnPM2TKxbLXrMGFSO4TEWQvy6F4JX/LIMUhWgpcICd2/F2FXC
	 vZDZYOKq1qEFOl8U6R8bEhpUUbsXPwSLZl0TrwJ9yDWg4JE7rXuMWvIPReZwfR6VN2
	 u7cfYhde8nlEtgTs/r47EDj0YJA6hE4qkRAn9Q674ySpapS4+fU7z9B5Dgg3m1hPsc
	 geIGo1CxbB58FmNsgyrwmUeF+SyUGAcGelhJCuJWOcdWysDFhI5S9InSVj0xme/x1h
	 e0WapU90ajgVg==
Message-ID: <b416abd3-32b1-5465-dc9a-44c7e753e8b0@collabora.com>
Date: Mon, 4 Jul 2022 12:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 15/16] arm64: dts: mt8195: Add gce node
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-16-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-16-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034125_370696_9D61CACB 
X-CRM114-Status: UNSURE (   8.46  )
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
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> Add gce node and gce alias to mt8195 device tree.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


