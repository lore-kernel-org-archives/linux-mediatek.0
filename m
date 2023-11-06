Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78F9C0018A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkmWxoxP0zlt3XaJzl+vCDtpeQl2zSz683qSXgHm2cU=; b=awx+ffZ2DJdAsYazShuPVZnfhL
	ZEZH0+aGdlJ8w1FMqUGD2XAnSiTsJCECrTkfMrReTFks5wAIw74sexcZOKomhzyNdj0Al/dWtgM2Z
	OsTswUCwSyT5SDR6iIKN2l2QefG2DIogsN4UhARue0qZEd7PK1nsjsLoG2mJXdMF8HNTC/wsd+DQ5
	AA7qYonPnJN39SLvx1bBKwnS3FyMSB8zwZzuoz8Pcv0ZrHFLBpfeH8GDstBKgvLl5DQnCUR6zAiKj
	PL6CDsNWcIfBvhRs8TL9CjhqPc0SffjLwqt0LAnM97jH2kIokJpjT4iQ3e9ZGvMGWk5cHerCB5m4N
	6lyVu1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzutw-00G4KT-2V;
	Mon, 06 Nov 2023 08:24:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzutt-00G4Jp-2V;
	Mon, 06 Nov 2023 08:24:03 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C0EAC660746C;
	Mon,  6 Nov 2023 08:23:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699259039;
	bh=xO8B0RTmTlne22NX2ar9sHfGqtBP8hpPG2QaQgD8NXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/QFoBxdbIiGmwc50U0NKIBIQc3PG7WMxvICc5qFMMRoQmeA4501FUrmVpanBsjKs
	 hfAQsfXraDHMCI5uiWB7ai/tIta/dauK9oG4R9SgAyeRFWkUgsmu0hvRP64MHwPD6V
	 ajc1ddAL0AfvKAKEILTQrl5zjz+kQT2wN97ylQZ2+yb9bCsqECPk3fPrCWulXCGouo
	 vr8h+mocO4sf0sPPozh3fG9PXYcKeK39iXxEnvzo5uirI5zN2VX96i21V9SIIJOMIv
	 IuAn/+Rfn/DY9t0mW2Qx9VWOWRwhrAqAGVTbKHAZnXuhrflNXZEzTo6P9dkTtiP0dJ
	 CDqlzAImtPI+A==
Message-ID: <f22e773c-4ec4-4b46-93c5-2f0818123c21@collabora.com>
Date: Mon, 6 Nov 2023 09:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] PCI: mediatek-gen3: Add power and reset control
 feature for downstream component
Content-Language: en-US
To: Jian Yang <jian.yang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chuanjia.Liu@mediatek.com, Jieyy.Yang@mediatek.com,
 Qizhong.Cheng@mediatek.com, Jianguo.Zhang@mediatek.com
References: <20231106061220.21485-1-jian.yang@mediatek.com>
 <20231106061220.21485-3-jian.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231106061220.21485-3-jian.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_002401_944287_72853298 
X-CRM114-Status: UNSURE (   8.51  )
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

Il 06/11/23 07:12, Jian Yang ha scritto:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Make MediaTek's controller driver capable of controlling power
> supplies and reset pin of a downstream component in power-on and
> power-off process.
> 
> Some downstream components (e.g., a WIFI chip) may need an extra
> reset other than PERST# and their power supplies, depending on
> the requirements of platform, may need to controlled by their
> parent's driver. To meet the requirements described above, I add this
> feature to MediaTek's PCIe controller driver as an optional feature.
> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



