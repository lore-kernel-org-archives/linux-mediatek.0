Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B9C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hfBVLUEBf+2nchCBdFz64v1697NBzVmb/ZyvZ9WVqQ=; b=kpvwb9S7NoFQDwkSg1SZAxq6oL
	uu30Q3HFKPNeO46cFtrjqU9VoZGmm7EeOU9Zk7OaAAOuzk1alLuaGPQc96xKmwEt5D8nrDHEQsmnl
	kqbr1hGO+4mudhfb8fbryMJ1JfWJLxYfcSZEgz/Di1v6iAkQtSOJ5p/EJXj+MymGSz7TpoId5dsMf
	m16tfEJE9eeUkp+ZJ9UuUG1pXGnLtdwq/m/5Hd4moj5SIlVZxYObDldcrC1TdRgXwcpkjx48I+R3t
	bkiaYWSHJpJcZ9Peql2Xvsemu/IGGzb2s+rOJ6OA6cQkqtdd/qKEWB7JN6gX5r/X6bjkLd5Wl94wk
	0bc4Gv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8K2P-007Z48-JS; Mon, 04 Jul 2022 11:14:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JVw-0077c1-62; Mon, 04 Jul 2022 10:41:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39F4F660198B;
	Mon,  4 Jul 2022 11:41:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656931270;
	bh=C6c2w5JA78BqxqsrlA9xeyI/TCUk44ulntSaY4ncndQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M9jJ0nuyxH6OtoGZ/s2HxrdqoScFg9MP1PYMjmORlJukWCATf39/Epc/iqyyccERm
	 6cJdXQehk1yfUrxVthSfpsDgbDfN7XurIEPmdkt7qPO0Ys4le7tm62DxqM7Ta/v9rG
	 +9eUlEDWAUYb49O4urlPS5aT31/y7uAuK3eQvqWXCU8alYLcRQNS/CDWgDwLmQCZiq
	 jzR6NPBRLYwAG2aAsumxHqwYS7lC4hywW/p0s3/XPi4w4AXfZClN7183Uvj+g/Wtq2
	 t9XMC4pRnZiznZ8Ac5hPsTPc/4UD2U8z8fHcR9sNgU3DLufuzkhTbhR3R70Artu4/Q
	 MJNNn54T2gyvw==
Message-ID: <fdae2110-a53f-37a1-b496-cc1bfc9aa5f0@collabora.com>
Date: Mon, 4 Jul 2022 12:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 11/16] arm64: dts: mt8195: Add audio related nodes
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
 Trevor Wu <trevor.wu@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-12-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220704100028.19932-12-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_034112_571149_597A0EDC 
X-CRM114-Status: UNSURE (   8.06  )
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
> Add audio related nodes for mt8195.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



