Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46204C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB5TzxfSGoBwm6wBNAG5n0olFZfYaD1KYb7OOUNiuU4=; b=b6HGsFVtT02LGGvM0e0LA5Ly2C
	XOWcEDOkSbpZo6ax9dFT7IK8QAov8gC1PnOqdPyhehM7iLkBD/nIYM8ixkOPaejeK5C4W05LXOUBP
	GXi1r2uDfkeCdVsSfpwj1ILs5zVgilofk3unf4xGOzA8+Jxo3nPjhAYu+jEBD6IFYTUtCRYDlJ3uU
	bBlPFwYw5+ld3LfMbiE+vLC73l5VP7DEcxnzxrgcCePR+KnPqdbobDIalhmXeTsQy19hz2MvxELUn
	YuzUbrM2Uj+JclwY+teK7ORRhseWoR66C4Wsa82+GhknVTsynDSYBxMw2S/9tHqpmdDwn1pL/Kkje
	RxBFP6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuvS-00G4Tg-0l;
	Mon, 06 Nov 2023 08:25:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuvP-00G4SZ-1Z;
	Mon, 06 Nov 2023 08:25:36 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38CA46605769;
	Mon,  6 Nov 2023 08:25:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699259134;
	bh=Ut/U5kOAxO6gxFFmg+MrU8i15HKJJa8WFBDlN6E2YQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jqOcc47zUCAnvPPGcHa3h+8Zy0KttpeazmkhFA1tK9/zMneD54wNl36JBclLgaqqh
	 uUJkZsBAacSI0TjhgSIT2hLExGFJVkNvhQOnRNhXZVsk2p9fW4KbvXCZMj86C7g4eP
	 jzeV9aDfOMmnvPKf95y/16+NNV4rVs21wuYXeIjM7ERYCr0GIt6a6Gk96I9Itudnbg
	 GPiQT0tAcI6i46R6Sw5bVZ2iFUYMNMeu571W1LC91mdZoU4dx7Vz5rtAWOsMfY9Dhk
	 smOy6JgIz+SlMhLe590OFdSkhCXIHVTccuJartFaQ320dAynVSxc7uA7hOvDZ5PRGI
	 ftdftbTeLzl+g==
Message-ID: <a504e6f6-8bd0-4f23-9dd7-98b6a4722e95@collabora.com>
Date: Mon, 6 Nov 2023 09:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
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
 <20231106061220.21485-2-jian.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231106061220.21485-2-jian.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_002535_650363_F7DD997B 
X-CRM114-Status: UNSURE (   6.70  )
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
> Add new properties to support control power supplies and reset pin of
> a downstream component.
> 
> Signed-off-by: jian.yang <jian.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



