Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3587DC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqNH2YUWSkJRgdVGPCUzJ5c0vvuMRJVGt9fwd5XJbJ0=; b=0rTBxhr1YMkypi/X9HETykp7Zc
	nFKOHr40wLb3q2sGItFa+llHFi5/HGVYt0NMOkxeK0pofUQK+jCJF1c7OeBgm5GuBkRhlWvaQtjIe
	WVM19fcv/WLMy4tJRc6uJQdhtUZZ6yBmxBIWg0N3ROL7fa27dxsPyDZHD04eveUvULLcmMLo2B6JU
	QgDodqNKfK5TkNbjbnA4sYtGyBoNy+CWzsJYOWCptNFBa7vAac6qsdG/QFHBSsUnWIoVjkGRd4Gnc
	lbe5xuLcRK0oiL2NxDN9wqwN8jwk9FHQ9n26m47+yIekZymL83ATkEwSFicJcyLY3qMkWUoX42ZtH
	4x26nuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXFF-00AViD-7K; Wed, 11 Jan 2023 09:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXFE-00AVi0-5B
	for linux-mediatek@bombadil.infradead.org; Wed, 11 Jan 2023 09:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iqNH2YUWSkJRgdVGPCUzJ5c0vvuMRJVGt9fwd5XJbJ0=; b=K9OE91ZfUwcLC9M8HgpPwKIvQX
	8XFQ3osGC7gpLMTA/z932cMMQUOSrEvLeqEnPKbUKovuZox77OBgXX0tjRrfF+loPsU66p76YNew9
	RfI3GDQFihzEadfVbWM9ICS+M+M1st4EqSH1IbsyJiUgridcvU9RF5mCyCK4C7zGUNZ/4ayyeEmox
	1PG9L7kIhVUz9UmfnNoMq8JQhIOKANdn9W6T3hT8BixoQJNr6KjaOpBp6uJLzGMPn6Cn+gYlwHdk+
	nEQVBSjhKAYCgw+YXKv0Pw8Ya0FdK3Fn7gf7du8MaFw61nkNE53A5n+s5vCra5MFOEZDYTEwHtkgZ
	ceUhhdVA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFXF1-003aLh-0T
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jan 2023 09:17:54 +0000
X-UUID: c148f90e919011eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iqNH2YUWSkJRgdVGPCUzJ5c0vvuMRJVGt9fwd5XJbJ0=;
	b=aRMsTWQEMn5usojbHq7ihj/Yd5aVNbjDe6QHkJz+qn5bd7XDwTjVG3ESYRc/7Aua+f6VbU+c5Uuoa1TlmQlMvu1vEE7CaRRsrOyE69+aiAFdOcptBIUDlyym2kNFU8MpfJ3eSYhQawH5GEiHk9qio0vxf9q4E+eaoi9vI0xndZ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:5711d950-1fef-419e-975d-05988ca1d52d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:fd8380f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: c148f90e919011eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1198602375; Wed, 11 Jan 2023 02:17:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 16:56:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 16:56:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <devicetree@vger.kernel.org>,
	<fparent@baylibre.com>, <ikjn@chromium.org>, <johnson.wang@mediatek.com>,
	<jose.exposito89@gmail.com>, <kernel@collabora.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <msp@baylibre.com>, <mturquette@baylibre.com>,
	<nfraprado@collabora.com>, <pablo.sun@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
	<sam.shih@mediatek.com>, <sboyd@kernel.org>, <weiyi.lu@mediatek.com>,
	<y.oudjana@protonmail.com>, <yangyingliang@huawei.com>,
	<mingming.su@mediatek.com>
Subject: Re: [PATCH v2 11/23] clk: mediatek: Switch to mtk_clk_simple_probe()
Date: Wed, 11 Jan 2023 16:56:45 +0800
Message-ID: <20230111085645.30683-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Y74jNZbjpopT2rNY@google.com>
References: <Y74jNZbjpopT2rNY@google.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_091752_075748_20C528B5 
X-CRM114-Status: GOOD (  10.87  )
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

cc Mingming

>> > Would this get cleaned up even more? I.e. have just one driver left and
>> > we could have the nice *_platform_driver() macros.
>> > 
>> 
>> In the future, yes - granted that I find someone that can help with the testing,
>> as I don't have any MT2712 hardware here.
>> 
>> Not in this series though (please!).
>
>Got it.
>
>Maybe Miles has access to some EVBs, or knows someone who does.
>
>ChenYu

I do not have any MT2712 board.
Thanks for Mingming's help, Mingming will test v2 series on the MT2712 platform.

thanks,
Miles

