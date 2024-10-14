Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7D8CFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fak4JMXsYzPF8VFEtcGv7HVn+XX0G9R5/b5B+O4E2Dk=; b=sEGIey3aSf3Kxs
	7EgGrUznRU08ljr8tkUG1Fer1yZdE4RqMV0o/umo8aHBWOBFJ7xO0jp8ObHGpjVm0vNUkLFQmJ/09
	O+F9dXcbJtAg0MXzcashT7HoxLnSCzMOOCo6nSDDgmPANsCmBShwuaw/WMX7LrUAQ9Uesrx642rtM
	Hlmcj8JmOS1OQsOLeRxAZUIDrDNrEl4Ph/z8EgFMLtTbKLblsui2rSSH4I1w4VV6RtVm8jmxao+P1
	y+WlYK6FAkMrWqiILDa/kwTtH5mkwOFI1DWicRkpRmpxp/ysjgU0S1hLtCG02FzU3MibNFkTw5qxI
	v/rkvpM923aUM4aZA8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GPs-00000004HJQ-2UMJ;
	Mon, 14 Oct 2024 08:27:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GGb-00000004EYj-365v;
	Mon, 14 Oct 2024 08:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728893844;
	bh=sNFeqUVKvAjl1nESjRTycC/DuOWjM4Q2qbImXt7rNCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOjr0eITABWUjH4C6qb6iXh8oG6INzI09Y6lJ+qV6b26YfZ7cqx41r/nA+IVIozK9
	 Sk0Ho0XJ7O3gbCCDp6q0s5uuHGW1+g0i11jL369gzd3WZSKUmdKfjTQUq40b6OV72g
	 t3H+Z/qrWlI1KhDTCoGISW3V43/1nFSNl2d/XPko9jB2LJVLAaN+8NG0t0cYgNyxhF
	 vdtGWqfXYPCuONs9k/CNm0j1dJsCPkH7VR1HTkK/eqGoUKuDf/sC20V8v55wmaw/AK
	 g2ubMXfEJg4lfBvRa+PloOH4A+nzybIdZlbJMY8tf5MlpMlWp9CQJEQqjzFGPju1eR
	 Qu2mRNvCM/oow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79FFD17E0805;
	Mon, 14 Oct 2024 10:17:23 +0200 (CEST)
Message-ID: <67f22131-d1fd-4da8-82a0-d756392cfcb9@collabora.com>
Date: Mon, 14 Oct 2024 10:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mmc: mtk-sd: add support for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
References: <20241012143826.7690-1-linux@fw-web.de>
 <20241012143826.7690-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241012143826.7690-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_011725_971092_C4C8B8C0 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/10/24 16:38, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for mmc on MT7988 SoC.
> 
> We can use mt7986 platform data in driver, but mt7988 needs different
> clocks so for binding we need own compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



