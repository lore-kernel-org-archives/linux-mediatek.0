Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5DDC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfBqVva54woOzs9chin3GtUUoK5oXoADLEv7C5fHDME=; b=uMBPxC5APDsG1P3xQh+R3NhLKa
	flgzU2PwZ4hdBgg+2nVBsCiPnLVfk+vwkPoS/Xex5TSKM/cv4M0vP3dVeR9MagYPhk2tadwwR9jEb
	c1lm1KgojMUFv9C8iXxqMN14Ds8jU/27uSmcOwy9MynHY/n0n3rz5Nq4wOqTqwzvyu+3fs1vLi1hc
	Er5a1O8l/DN/Vo8vIPo/hjpwnmHjElyttOgzc0LPVWLvnlwNvzmYhUfafNYFEljxlkT/6qJi9pwaq
	Jc/EsXN6EyCDxb+CsRB1HkhhCGmQrNQzxylpPs7Dq7nmNRjipwYafDJPi+mtEbTN/tcKnLE7Ez22P
	z6U+dAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oE2-002Do6-Oj; Thu, 16 Jun 2022 12:03:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oDq-002DlL-Tx; Thu, 16 Jun 2022 12:03:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 279BB660163F;
	Thu, 16 Jun 2022 13:03:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655381017;
	bh=W6TnXzN7tlg8HsJN6dq/ufsPn63iDCWZZX6PZhUj48w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g6MVcgFlrnrif1J+IZnTY4MAvlm4tJWVrplsCk/XVWz0npsRRUxGRI449dqyXP1/Y
	 GuQRxmQ/YkX+Ze8/RocIoEMNOnlGwpSPRVgXdOcf7lx2vKIDm1pngOb7yylYKNEu+P
	 zA/5+v9NgCzNH0Xomjb3zqp5ufv213dVxr5htDNqJ8KCtyeAVz7O0/0ssa+7P+7J5L
	 hwFXD5SNaPzyD0TksPWENoeuEwaO1kpYq2ZE1EGSCZMyoxQ4AJg68f7sv5hvaQBqPw
	 N2H2NpmZb4OJSnDHALEaurOLRww3y5LBbb2fM7XdrES5qYAtPeWjH30WNgrVR420HQ
	 vNoVgEsbxacmg==
Message-ID: <37676cad-bbe8-0e4b-6632-ab57d29bdb20@collabora.com>
Date: Thu, 16 Jun 2022 14:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/5] iommu/mediatek: Remove a unused "mapping" which is
 only for v1
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
 <20220616054203.11365-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220616054203.11365-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_050339_149164_6E2AF7C7 
X-CRM114-Status: UNSURE (   8.27  )
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

Il 16/06/22 07:42, Yong Wu ha scritto:
> Just remove a unused variable that only is for mtk_iommu_v1.
> 
> Fixes: 9485a04a5bb9 ("iommu/mediatek: Separate mtk_iommu_data for v1 and v2")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

The title isn't immediately clear, looks like you're removing some mapping, not
a struct member...

Perhaps... iommu/mediatek: Remove unused "mapping" member from mtk_iommu_data ?

After clarifying the commit title:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

