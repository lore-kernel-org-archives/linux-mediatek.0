Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BD4C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYj+jdLU32eYLjrkrRb5WNpkpnge8xxXeoLUO8cJ4QQ=; b=bf4B5XD/6VifKjomplwlMhqP2E
	PQAdIv3p/v/cFExxwQGZb+vEvG3oHSLZfkX8yFxurOGy6DQw2D0+Z5R3BcexUm4y5ebwZs56Bns36
	T/XtqfquPoAx9NhVy5hGJkY7ozbs3Mqb4GQu9tUb+qEAiWYieSvZ0WeYIJIKlyzp7QA3p2lFYG4Wf
	grg/bbn8lYrn5B9IEdtjkE10ORYOucDGMDGRZXh8z6/eP12xNRgmjuyte9Ahc0WsrjcVmCWBwmcpb
	9m5Pi4YmgcN2st4AUnuGDC0vbtdKu+DW+pYpvXC/jj2/MmR6eCYoScn4vGYrB/p+KBB9AWBo63saJ
	p+LL8JPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTyG-005vS8-1n; Fri, 10 Feb 2023 14:01:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTy6-005vJD-Aa; Fri, 10 Feb 2023 14:01:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA70466020EA;
	Fri, 10 Feb 2023 14:01:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676037666;
	bh=1nACN3toSy0bL2coCaCf797kOjg0fbtFmGw0pIIjUec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XwIoN4XWr/LgYYvHELLcVicMRL6rH8ofiB8rPR7eIYxCvOrPnNzn0fc8GHQyEEwyP
	 75+9/rJn+tAKcrzp35XgjSrOFrpWZL1WYpT7uVPXrAxdoxdUdd4EDAP0GjqqRZZg08
	 wzfj2uRj9xTzG0WE5o7xLGXQaNFASLbbXDGYJTPFycTphEp19K66Lwx4ZBYzQoBVZk
	 oiCrpHILMLA1I0Ngn6B4BgHzHCEooJMXfrFAWbTRjWStUHF4PpjhTkEWYftN075E0T
	 ZTNLRyQMmeHOxvE/slcsIeQ/ZQhP1YqEZihnWC0IULBNyBHuPbdw67rPkC+bxHMYGd
	 iM7ym8W8sp3sw==
Message-ID: <2318282b-c61d-3f86-2053-ee20c7f13e7f@collabora.com>
Date: Fri, 10 Feb 2023 15:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 10/12] remoteproc: mediatek: Handle MT8195 SCP core 1
 watchdog timeout
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
 <20230210085931.8941-11-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-11-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060138_546830_8E7445BA 
X-CRM114-Status: UNSURE (   8.90  )
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
> The MT8195 SCP core 1 watchdog timeout needs to be handled in the
> SCP core 0 IRQ handler because the MT8195 SCP core 1 watchdog timeout
> IRQ is wired on the same IRQ entry for core 0 watchdog timeout.
> MT8195 SCP has a watchdog status register to identify the watchdog
> timeout source when IRQ triggered.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



