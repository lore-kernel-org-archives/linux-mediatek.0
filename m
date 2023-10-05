Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB809E93709
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMV+VSPNVy0+1fD7ptAHaZfMsjer8LcbhO4C3fbNMJY=; b=RwT5H6SmpNkVsbBhS+9ZOt2NTE
	rEqdQNGCj4dYe39Ae6xsWgp8jW5qtQOhH0CIi7L3c3xr++Ve0CfmRBIPqgRI2ZxVPLmS6ciL6NbSW
	x9ti5dlmNR81Smnw05N27pwIaD64Lgrhs28lqNhWKfnmJKGsVg8hLtOFiSd/CyqsWUZFwjCXmddCE
	NqNhwVMoVpFE7Yzah1bfCBhGsJa0gZjklIvjq4wV+uJPdZjJC+kj8Mutiw62RBcwyryHWU0PkKU4W
	yF0WPwI7NubfoIbv24n+PHMiPh3fF9RdOHtHZPxekTDZUFHVoxXYoWDBX5k6eDhMfb2YVGm5/UP1n
	KKMtHEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoNfX-002vTA-15;
	Thu, 05 Oct 2023 12:41:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoNfT-002vQA-1S;
	Thu, 05 Oct 2023 12:41:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 958D36607327;
	Thu,  5 Oct 2023 13:41:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696509685;
	bh=NDq8WhFGsx/jhQOnfQkcqwGfnnhxjb66WolDxgBm/Cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXDNWhQQjc2aW+VD/brEY8/3/5zNdPZtYXEPmR0nAg2qLqrvv29J7eqCT0wxtBhun
	 Nk2KTwvn6kh6VGbb3AnP/hZjgd9U1pfdX5WeLzdhiaO9VbeXAUXwyYjPtdK5J4C7NR
	 NR3xON5fYD+iIsP6hhjuy6hV3MgsTXeIFCpC6nfhQauhvK7vZsV/JjQoh5UVhTJlz8
	 EWk6gORts3D/ERtCsICChtTfMxhQalWnLqPBbau5MuX4StPr2/sXRNp5L4dYhZe9+W
	 8q9RqrQN4gbY0d4fz6yzT5A+WGr0Ypk3b7SS6Td2b/vMwlBDtGRjvvWdqHybHA53+Y
	 ktyQvh6JfpN5A==
Message-ID: <3e197ec0-154f-78b6-3bf1-12cf765a3cc6@collabora.com>
Date: Thu, 5 Oct 2023 14:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: fix clock names for power
 domains
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, matthias.bgg@gmail.com
Cc: allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231005103041.352478-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231005103041.352478-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_054127_672372_2817771C 
X-CRM114-Status: GOOD (  16.98  )
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

Il 05/10/23 12:30, Eugen Hristev ha scritto:
> Clocks for each power domain are split into big categories: pd clocks
> and subsys clocks.
> According to the binding, all clocks which have a dash '-' in their name
> are treated as subsys clocks, and must be placed at the end of the list.
> The other clocks which are pd clocks must come first.
> Fixed the naming and the placing of all clocks in the power domains.
> For the avoidance of doubt, prefixed all subsys clocks with the 'subsys'
> prefix. The binding does not enforce strict clock names, the driver
> uses them in bulk, only making a difference for pd clocks vs subsys clocks.
> 
> The above problem appears to be trivial, however, it leads to incorrect
> power up and power down sequence of the power domains, because some
> clocks will be mistakenly taken for subsys clocks and viceversa.
> One consequence is the fact that if the DIS power domain goes power down
> and power back up during the boot process, when it comes back up, there
> are still transactions left on the bus which makes the display inoperable.
> 
> Some of the clocks for the DIS power domain were wrongly using '_' instead
> of '-', which again made these clocks being treated as pd clocks instead of
> subsys clocks.
> 
> Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


