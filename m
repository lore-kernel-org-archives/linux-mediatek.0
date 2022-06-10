Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEgJoz+XrQvjK8hMpY+qaKoq7D3VvSiNVVj+W4mSR1A=; b=Y9N2woPFGKtIhN
	ge7XwBVHKY8JWo7wHVmU5zDbT9DgNrgl/u3cfRf/hjC5ARcYjGo8jEfEqi3sm2X1lVzNuiyeCo4n9
	OAJGJNfab3LVyW7ci5CK3Vah2woOukwwn6cDCBLDKfNZH3trP6QYWj3K80WuheIaEIOlT9q49fi/I
	jO6hpCUWIWeqEouVlEd6UeqL8srDMAGpvnu7ls7EMqof750PKqmw6fCJ/tICPKzf7qlW4zwWbUNCA
	csEewdemxcyFsrbx59C0xHVmmIY3rLP6gC33uluE7ogdV2Gd7xLgguWhMCLjdKgBBBGAFhzQsUvIm
	FCsNLPOr5exQIOg4yE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcB4-007g1c-Ct; Fri, 10 Jun 2022 10:47:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc85-007eeo-0M; Fri, 10 Jun 2022 10:44:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DB78F6601739;
	Fri, 10 Jun 2022 11:44:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654857875;
	bh=JjAfIIOQCBYkqTG8Pf2TVNBGQ8bLPqOyF3AGvVlt+fk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c7Mq5T6GTSydvrlrpGdrU7TsUNIvcZbrFaMkYyXYIC2xdSlOsB7LE7d1s5RD6wxkt
	 WduGOS9H9KdBZUpnmI2YX1+oMQXipakIMU0UOlKESYWqJuzFyk17MEHmq8NBvZvk1b
	 Nmim32NNJ+Eie5m12piUVYPMvpVTccezewiMKV9jhRH5bvPEebEFTkFLSLratiE9en
	 14uf4HCLRFlkN4XyFV3TEGzY1MikK+nlMUhtVYdmFu1w6LXGA4an1kITU6GlDE9cEX
	 w+g+67Dh/Ufw3169I+hrwJnMZ5kYSHuUgMtxKTP5D6CxXTRSeVcXpkwjZJSBoAGNkz
	 qS6fCYnomcNCg==
Message-ID: <66b8de8e-b617-9058-1bb2-64686b61a829@collabora.com>
Date: Fri, 10 Jun 2022 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, djakov@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220607140556.6278-1-johnson.wang@mediatek.com>
 <20220607140556.6278-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220607140556.6278-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_034437_252146_B720CE87 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/06/22 16:05, Johnson Wang ha scritto:
> We introduce a devfreq driver for the MediaTek Cache Coherent Interconnect
> (CCI) used by some MediaTek SoCs.
> 
> In this driver, we use the passive devfreq driver to get target frequencies
> and adjust voltages accordingly. In MT8183 and MT8186, the MediaTek CCI
> is supplied by the same regulators with the little core CPUs.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
