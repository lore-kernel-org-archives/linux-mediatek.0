Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E9CC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MW8vTrCzMPNKG5HsRMsRgJ0YqmvlsxnTBi8i3k3hbxM=; b=JW27nx1dLE6aAY9YHgHiO1DVzg
	vTxIQP9mz8ZtqtqoGZkkcgZXt2BZltFsGioVMzQ4rXHMcBx+giu140JFaAgFiTFuB3y+blP4rqw+n
	bIi/rFey/s04c2nBMWPSGFn5W2+kQwB8LflnxKDtMhJZwziFATzZ3ztVN1HIt9yyvwuMT7q3t8wAV
	4iE+nwhw/oVP5E8iV15/a+dIZ5n5f9Z/1cnI+sz73j/Mai9CHif//GlvlyhEtE/wUL1zcyp82IOLz
	k4At9SCzhUDX27TK5V2PgezusrEugtwMq/sl+oVtiDTrgAbf2sazkBH90nDVUbwh7QkL/H9uPqcnf
	gwYtYY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoro-001oMj-6l; Thu, 29 Sep 2022 08:26:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odord-001oJv-47; Thu, 29 Sep 2022 08:25:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C9616601EB5;
	Thu, 29 Sep 2022 09:25:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439945;
	bh=M1ejyyP+F3UGL2mKEn6fPWzn52mMqLU2pFQdANC8c9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RBQ2tdGaxwIAK9hUNmD+6qiTOiD3gQdIYWg53c6P1UmvLC2NVa8CPsY6p1TbEvcVJ
	 FoHH02MzyWxHIrnyAYeN9+k6IKAvByYr8kMVcfHgtdxEJgh1AYNTAgqi3GSdgpR+7y
	 rDAGrl675e7IxANVI6n1IwHaCtjPF9Mx8AvL4ZaZqBSziAB1QscDHM4GD65PZG0mAF
	 arSyqMDLJM4yiACesy86i4+FgCkM52TlMCHeWwgL0BJcImDbJUyekCgAj3a1P+VOZa
	 Q3uvGb0qopKHEbKusoZ5jppl1IuBjqEorVcwHkXY7Wh1txe4b1uU+sxvyrPwNZQIaY
	 PhbTwZoaVJpvw==
Message-ID: <c6a9a22e-87fe-6426-b028-3937de206037@collabora.com>
Date: Thu, 29 Sep 2022 10:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-svs: delete superfluous platform
 data entries
Content-Language: en-US
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-5-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-5-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012549_407843_37A9A9ED 
X-CRM114-Status: UNSURE (   7.44  )
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

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The platform name and efuse parsing function pointer are only used while
> probing the device. Use them from the svs_platform_data struct instead.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



