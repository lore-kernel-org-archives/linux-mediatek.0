Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B4DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJf6IXGc0SD+Qvk1K/GQvrCLqr1WQfqGl8yTQNFP998=; b=UHatJr2DCqN0hffGRq+fDogDqn
	igJxOha8vkrMOxgyZXmhMgD3QqLtCJJzLHVmBvK5LDlwCqgyP/27IIsXaLat4SqjYmhf+pd8Jiwe6
	XmOCT2Lj+JxGE7whp7gcYPX4UQsxSCVoMfSbXE0DQhP1BtVDQg8ldhLBnIVHk+RfGb9Rly+Mt7TNm
	jy7iBwtcY6nJ8Q+DREPThwcEvzYqjoOFosD6p1nTOSqEf9JRVCFoX8Er8cVJ/24aUv/rWJX+Qrnqh
	TRszTNGuvrFFWnJMu1hZJc9XhniBraHydinCa5/RTn4TJ2qEDELQG6b/qAKdNGSiGBVnq2iMSXkgO
	8fjY//iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNFH-0019qo-0S; Thu, 06 Oct 2022 09:32:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNDv-00198s-C8; Thu, 06 Oct 2022 09:31:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 788ED6601595;
	Thu,  6 Oct 2022 10:31:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665048682;
	bh=Xngz+DX9nQSm2osEDMhxbzEfyfWhmzAaDK4n91qLoMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQHG99mmo5EepGe9L8B0xIz3gEN6yWZ2o5lxhbMGbYANtzFA2SLU1l9H8pzYP3q8a
	 404havFKDKHFKWi8n+TrYQOsrzXCou6/4xabAdCw4mNr/5k88VuFWEYLOR6SrJgeg1
	 WQOjk/Em2YXdn8jBk3s7toj2DW/8ibwAC3o7FB9gvz4jLFRk5BqU1t9z9vdPGZ4i+T
	 QDPkvKuHqxmDr9JCqYTpa6jjnjDiETXPVfd1BRQtOwMms8xOuGuuDm4ccfFLpSXMl1
	 pxT2zUZNekfKffcUBevCOgM9dfEegZFOjWlEMPN8/KIx/iI7nz+AbFtGRuGhFqoWt7
	 ZRGrPK4l1TX4Q==
Message-ID: <97f78c42-d699-8b01-4db8-8887d519c8f8@collabora.com>
Date: Thu, 6 Oct 2022 11:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9, 4/4] mailbox: mtk-cmdq: add MT8186 support
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
 <20221006043456.8754-5-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006043456.8754-5-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_023123_600100_8B9FA7FB 
X-CRM114-Status: UNSURE (   6.13  )
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

Il 06/10/22 06:34, Yongqiang Niu ha scritto:
> add MT8186 cmdq support
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



