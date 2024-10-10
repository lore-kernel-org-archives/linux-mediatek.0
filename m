Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEFACF11DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccxN4RGs5ch1PLhioTLUz60pqi22yIKm3X9mDtdWh7Y=; b=3+/QYZgw7kmhVMMpG1OOqCwQ8j
	KHTIE1DGsdQTQeQnLXokMLw+00tseN4abSQcFKEc4PYv7nDf5tezhDr4Gfg+TZ/qFNlD97MT4nt4T
	1XPHf7pmdyGiJr5ikYeR7JTsuXYdY4mNL1tkISCX735tY94RoAf6DNq0PPgfIv89p/Zd4yszReV8q
	JgkOqrOHFtiNoVnhbU+thTa02gofaq+BzCKoUPDgufLqxYs568WVWxBSH9A6wVToJRkeKpti4N1EK
	dvjEErCoKpplOn7dZHog6fiBsv5/T+cjlCaTOEh0JreH4wfuQpxTud1vmSeOiHUm7MdULoTCG5WF7
	HVIdZyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysTO-0000000CkPM-2fme;
	Thu, 10 Oct 2024 12:40:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sys7k-0000000Cgia-0F7Y;
	Thu, 10 Oct 2024 12:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728562709;
	bh=dlS3N4sm++HwgM8cy2oVxD0eJfj9FmIbLmXxqAwARvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R91QULgPXsDhyiRfM1K/PAXASKH9sdmcb65nBDT9aISs/ga5uLJncc+1DekiMjGyu
	 nJUejQZ3cqCzIN34crh11UZ4E/MiNohj1AVlGeu6bt2l83x/tYRvs+rvYJhKYzNM6T
	 YTGhXTiuLmygfuBBLx/EFCV40A11dIbQTP1+qkHJpH0jrWMdfy12EGHU8j1KZOs7pW
	 2kNNwKwL5OjqNmrLzcQdKom1I2dd/BOHHFeVD4AP2+5nBwyx35QEDwTl6ktufcJeyC
	 hDUhCzabtoqCTp7L0Ox3Fo/uNkPz7jWn1ScnBaAHDkiu+c4Nb6d4eHuImewc/o0eqf
	 1UJJVmgosTDjw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B8BF17E35D3;
	Thu, 10 Oct 2024 14:18:29 +0200 (CEST)
Message-ID: <3c8eac47-2baa-490d-aaae-b36a873ea5ee@collabora.com>
Date: Thu, 10 Oct 2024 14:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mmc: mtk-sd: Add support for MT8196
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241009120203.14913-1-andy-ld.lu@mediatek.com>
 <20241009120203.14913-2-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009120203.14913-2-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_051832_303870_1604587A 
X-CRM114-Status: GOOD (  10.52  )
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

Il 09/10/24 14:01, Andy-ld Lu ha scritto:
> Mediatek SoC MT8196 features a new design for tx/rx path. The new tx
> path incorporates register settings that are closely associated with
> bus timing. And the difference between new rx path and older versions
> is the usage of distinct register bits when setting the data sampling
> edge as part of the tuning process.
> 
> For the changes mentioned in relation to the MT8196, the new compatible
> string 'mediatek,mt8196-mmc' is introduced. This is to accommodate
> different settings and workflows specific to the MT8196.
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

After reordering the commits with settings addition as [1/3], this one as [2/3],

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



