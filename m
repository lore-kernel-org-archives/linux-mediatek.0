Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD0CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjZj/08QvvsJ8Imgl9uWiUrtWHG3Yj6fTeZovpkIvPE=; b=tt5J/azgD8ApgVJ/0RTKWTtOQP
	g0ZPgTbQ8rkawCM/BGTIBZPgNqIjbXtD22rV/0jsJuS1Ne9+L269tFLXuEfJXQ/PTwv2XPgnpwDZb
	KQO5ko0neIQdOs2vj2ZWBZLwN70Dqwu6WmdDRfI8e5B0r5/aT8zObDh9GjUCbNcAvU5qrkgO3w0GY
	KwanoMFJS+d6bJiYJhdY2yPw1CPSIKOBpKC8FoSmcm2LTBAjaiAlAH/bU1WzKzV+a1HSS3tc1fk18
	UwFl9zXmhNr1ZNj5q18aHjOmiA+KhKVqaOvK6CaltRurq97ig5ao0aAEkwSKefk7li8Md91LwGWzw
	Jzz+2i1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfFo-0000000GoGP-3jqP;
	Mon, 23 Sep 2024 09:21:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfFl-0000000GoFd-2bdQ;
	Mon, 23 Sep 2024 09:21:11 +0000
X-UUID: 28c97c8a798d11efba0aef63c0775dbf-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gjZj/08QvvsJ8Imgl9uWiUrtWHG3Yj6fTeZovpkIvPE=;
	b=j092psrsPIOVqOfFiiHzAcaVFEJDZfhobjAR/DceUmZ++cq6FBKYvtsn4zYnPQxG2eDQO0P1qwYUPq8+qReH/wuUnrMKAuz0ztDAcrYmeRBzVpbp5L6oKc4PkGkHe+nGwONWYcyPgrnDdl4ukNGOiKj7xYIKI/dYmop+MTGC8gI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:11783fdc-3aa2-454d-ad1f-385ecf83bdea,IP:0,U
	RL:0,TC:0,Content:1,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:6e611b18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28c97c8a798d11efba0aef63c0775dbf-20240923
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1352978589; Mon, 23 Sep 2024 02:21:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 17:20:59 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 23 Sep 2024 17:20:52 +0800
Message-ID: <2914fee8-c94a-fecb-a69c-0d58a40caded@mediatek.com>
Date: Mon, 23 Sep 2024 17:20:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] nvmem: mtk-efuse: Enable postprocess for mt8188 GPU
 speed binning
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-4-pablo.sun@mediatek.com>
 <866d7cd8-856b-431a-9408-527cdc021922@collabora.com>
From: Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <866d7cd8-856b-431a-9408-527cdc021922@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.754000-8.000000
X-TMASE-MatchedRID: u1zqiMeMcroNtKv7cnNXnSa1MaKuob8Pt3aeg7g/usAM74Nf6tTB9rsI
	asnPqvyQfVSuQp/lqthxq+Aq7jUw2GN6tywQmwQMngIgpj8eDcC063Wh9WVqgjuUMbK1NdLP+gt
	Hj7OwNO2OhzOa6g8KrQg299MEvOql1vSXLi9e57Sdpgh/0Y9xmmUJIWO8gdo5djIFhP3krtZiou
	j39kMFs02viMYyOMeglkEG27gbXTQ3u31m+KVydpeZT8XNJIzV
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.754000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8FFCC96B34A170870F29F0F6648320318BC4090AB294D4AB700CD9D0A14064CA2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_022109_708378_6084FD61 
X-CRM114-Status: UNSURE (   7.00  )
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

Hi Angelo,

On 9/23/24 16:37, AngeloGioacchino Del Regno wrote:
[snipped]
> 
> Please reuse mtk_mt8186_efuse_pdata. There's no need to add a duplicate.
> 
> { .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },

Thanks, will fix in v2.

Best regards,
Pablo




