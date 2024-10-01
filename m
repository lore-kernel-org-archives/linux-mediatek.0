Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A0CE7CE5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fh6gXrAnUX6X7pQv2HMyH5sLkGpT7yjXqsTgn31MHY=; b=RCwlJTdlV10uIoV0GFgrktXdro
	jyTtc2RGK4T41ZSjRhEulNAX9rzDHMe6c2Htk2h5CCgUN1iKsbiELSN1OqwT84A70hO4wwrtscdNE
	ahBQyM/+x6BUvYNwycyH30b1fYOqGstW7rh4jeWbLJ/yGy40+ETmB86It2TS55VW3p9ox4uiTr4ZC
	AISF8jQAPkj8nLDJi5nUAw+41lahDXjnqGeUW/VhAKyHvINBnA3NiDSBkLcDF0DFmtsr8kfCP+jEo
	AvTS4//Kcb9KVLlfml6CC7UwzemyL4J5U/ulRTX2GNy3DPg+k/PXXq+h7cMNSN2i+bhgTpHt8EPaz
	yvpXI9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXkO-00000001xcb-49Cg;
	Tue, 01 Oct 2024 07:56:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXfc-00000001wlZ-3ZjV;
	Tue, 01 Oct 2024 07:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727769102;
	bh=AXlG2BBzfIg6kHEFKJj+boiEiSTUmsHsiChUAuOGl7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OW9Z+qKH1khY5K7P3eSa7gsd8yqYjVokhYoG1eV9Gt80nASa8TAh7Epq7yqw1E7eu
	 0rLBtgh3zNoH7+SQ5feceU4Lflgi0BTE0MNECucNdCmiI2C/yzmSPvl35SJH2xqJBH
	 SQ/40bblj97Z0utK+Wor2vgMmo7tEzWzCqhhe3DRtZn8U4QicwVB0G7YAqaKCJ8WMl
	 Ta4bWaEWwp2cDvi+IWuA+EyQT2u+k1eUElfr3MmmZ77y1By3KmcXH4CN42mIUo8ohP
	 hiM2PNlk9bXHlT7+kQs1PKEvrYPm2Fg9Jpg3Tq3RX/jDAJpMnmwkdymRnJ9pnuT8H0
	 jBacA1ym3n9dQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2154817E0E39;
	Tue,  1 Oct 2024 09:51:42 +0200 (CEST)
Message-ID: <6356b43b-ab17-457c-9d3a-a64033777ecb@collabora.com>
Date: Tue, 1 Oct 2024 09:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] bluetooth: Fix typos in the comments
To: Yan Zhen <yanzhen@vivo.com>, marcel@holtmann.org, luiz.dentz@gmail.com,
 matthias.bgg@gmail.com, sean.wang@mediatek.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 opensource.kernel@vivo.com
References: <20240929085727.523732-1-yanzhen@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240929085727.523732-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_005145_082784_84BE49CE 
X-CRM114-Status: UNSURE (   6.04  )
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

Il 29/09/24 10:57, Yan Zhen ha scritto:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Fix typos:
> 'fragement' ==> 'fragment',
> 'genration' ==> 'generation',
> 'funciton' ==> 'function',
> 'Explitly' ==> 'Explicitly',
> 'explaination' ==> 'explanation',
> 'Tranlate' ==> 'Translate',
> 'immediatelly' ==> 'immediately',
> 'isntance' ==> 'instance',
> 'transmittion' ==> 'transmission',
> 'recevie' ==> 'receive',
> 'outselves' ==> 'ourselves',
> 'conrol' ==> 'control'.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



