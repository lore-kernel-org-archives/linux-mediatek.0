Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27CCCFC501
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMng6gSG2tp0fNxspBzUKqnXhsRPlp2kyOrGm+ev2TQ=; b=MtEKajID1W5PMWVd15nK2ANO7E
	/S5UXhvN+b8GSsGcSep9s44gcYfLeoJQDk2803+xu3KmIuA6aianHRcPXuP2wbH3WJTBJUJhBmUsr
	U62E5rboer1gEbzK+khZLn7t5FdERs2NmTmz1EsKmrx3WW/p9o5qMd9sJ7v/Q2ImnmqukAX+6ojCN
	GB4ag4VfPwW2c8VikqtSi9f4m5AH7oqL/ffSX83mGYGrapLx2isltGZ9ZEojzKDGmSFTJlKJlJloF
	c0K1Y9gG6vWnV3zTHvNRfrZqai9ZhrdavTk+wtBqpkEksuP/aa0N5tx8bn6mRoVm/rp2Ch3zW7Ybi
	dq+IFejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FoR-000000048HT-04Yu;
	Mon, 14 Oct 2024 07:48:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FfR-000000045cM-1hEl;
	Mon, 14 Oct 2024 07:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728891538;
	bh=qoOrVX2qlw+79bRxKaouwZTrx5lgcm9sOHSXhAzeJKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ejGa/cLbWqqWq/E+ZM31pk65ouQRFNTSnqIPWaJwU59j5v1u30Bph0gokY34TNmEM
	 UvBG+o0bzs8ZsQAqE5EMv0i+znaygkKwvclJTW+QktPNwOhhEMfceYVC9y2ANlA8/g
	 zidhz2H6OkWv7ub/SgJt2Zj2l9HXaZ2VK2gUOMgQD89bElPt4nVsa8ckN1rRbHH7fM
	 /GtPOSSZ3i6R1Ma+L9ExJsDnUfHwpKW4ZbxphBibCJc36uqYKTOsIToz73fRn0Mx3N
	 vClKUVYG6xAxH8y1y3Bs1fOGbmfQ75clwoF8Tw+O0LTqKqyguBLgf4haPLNgi56VRM
	 p7qGYANu2xWkw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 366C017E10AC;
	Mon, 14 Oct 2024 09:38:58 +0200 (CEST)
Message-ID: <1a29be6e-fb36-4ee2-9cc6-906f82159b9f@collabora.com>
Date: Mon, 14 Oct 2024 09:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] mmc: mtk-sd: Add stop_dly_sel and pop_en_cnt to
 platform data
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
 <20241011024906.8173-2-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011024906.8173-2-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_003901_721301_7B8B3836 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 11/10/24 04:48, Andy-ld Lu ha scritto:
> There are modified register settings for STOP_DLY_SEL and POP_EN_CNT
> from our next generation SoCs, due to the advanced chip manufacturing
> process and the resulting changes in the internal signal timing.
> 
> Add two new fields to the compatibility structure to reflect the
> modifications. For legacy SoCs, also add the original value of
> 'stop_dly_sel' to the platform data, for unified code setting.
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



