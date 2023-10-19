Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31B2CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GWShfFRzngrzmiVwEMjBtLCYLRRe5tW3aPcwNm2UgY=; b=4BSdCyrLvekgYpqcGp7DQH1J5c
	EUMK29nmckoavNQd+Ba+kWb5yCtzhXYhCdI6dhGfrGey1RHqJmHtPugE0LJXDJpvbWAWWAU6S5KK0
	WzqhvvTdfAamXLTfz2OOj880oSBYwjgvWtW2/Gy9x7o8bqGSN6G3b/HI+WaF8czMIetXLRDlZoILP
	Cknvn91ThQiByVcaQJXSeAEsPHGxrhc5rv9wKTNLAnzYNQzUmzlfhaELHggOnUCvh5E033k54Z9nK
	DkYqUv8E19ogFYz3OJSBjORhqSd/j8EartHV9HPOcOzZ9eGsbff+cDoC2OV6Y1XwZhI3yOl5nJ3V3
	CtnJ5ZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOhi-00GlCB-1R;
	Thu, 19 Oct 2023 08:48:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOhf-00GlBJ-0l
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 08:48:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D02C6607322;
	Thu, 19 Oct 2023 09:48:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697705304;
	bh=/BFGk10tJjdGi8ZC+k20TXUYuEY9bU4gZOhY1NmRH4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=blxTpEVuBwBTp3VTVME8VhWvZxYN+1GFZOnX8n4Ckh3h4JAJHFOXIrnoGtsSwYQzD
	 +wP2btruyVVFmob5omYRTLDjOArySMB7uVoGiwWNlgPQbMN3rXo9HdJgsZtvRHTiim
	 UDhSewj75kIMePj/MDIKTR0zEVNIgU+Wq+4VI3/fK18sB+6ysUvwpcKlCRkvl6/727
	 22+4dt3Vq1wnNul1fbEgDqUjColnop/zNlccBfof0nLdsaIP/CrU4MOa7wyzMSSMFR
	 bD0pf5Vzs5lyWqnR71Uoa0aAoCzH/PPUM0nUgYKQq+wkxTsFC989IfawUPgu54Lqc4
	 lw4O/RJfB60Lw==
Message-ID: <8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com>
Date: Thu, 19 Oct 2023 10:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add
 RT5650 support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_014827_450777_F2FDFFEE 
X-CRM114-Status: UNSURE (   5.12  )
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

Il 19/10/23 04:11, xiazhengqiao ha scritto:
> Add new sound card "mt8186_rt5650". RT5650 comes with amp and
> earphone codec.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



