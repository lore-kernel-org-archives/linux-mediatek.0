Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC4E784A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H61TTlLnRLvbJVmdtxHoL38piKqaVD31VADHskFNRV0=; b=V0JPgdS+ojS0x58BLAfZpyXe+t
	q8kmrp7oRD9ENgUvnbuzXxx1ikfiVWa/E2fgcq8RTQ/uFltxmy8gt6BPaQTWm13awSc1BUo331SUU
	pgIPBaij54RKLpa9bU32ZbI6Z9k034Y0dPaYrpFlwNKODr7m1sNyIGmihi3q7xzNYSAeDJMVgEjBk
	cNvtsVzdk9vPACT+RsUPDuI11/K3aZ14Z60fdx9ivn6Zb9JvWaPGv2hhzCAFrl0i5qf1bEhaiyI7W
	NpWDNpCdH4r1ERwVW96OTp3QIC5WepbpVnWF/57OniJo5MTmLPDuSJm1F4FohbsR+GHe7CGEisKni
	4W2noxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHBj-00CYeu-2E;
	Mon, 02 Oct 2023 11:34:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHBg-00CYdR-2g;
	Mon, 02 Oct 2023 11:34:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 68B1F66071CC;
	Mon,  2 Oct 2023 12:34:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696246445;
	bh=9t/jOl0Thy1T1dExt2YlwpxckJSmjnulYz343ekqiOU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=c2UwnXYA6v1PGmWdlFewrB37q0sywfNvyFg/94NAuO8wbPvLH88UGuTUTvoP0V834
	 7iRcR/wpx1DwUXyaST2eBbGrr/9mZOs8nHeLqt37i8mI3aMQL4ILhnukzUtVXaWAVe
	 pI8FCG73fK29CrveqlNc8AVBT04GLz0gjHEj9SU/7txpy1rHU0Ljq41bsB+PInh3+8
	 OUBuVwUlm8ZZu+VoxRgChPQuPeOPtcvv+FRd93B/3uKyFFNzs/zVIbGFgnFyLYWSqS
	 oIjGAVYoHCCAyh/NWulz/WO8fNRytQRf9jBAmt8YhM+VU7mBzbB1/g0CMVgkJK5KUu
	 No3ozYeZGszNg==
Message-ID: <7e6fb959-9e0e-ad08-c33a-92cc86eec2d0@collabora.com>
Date: Mon, 2 Oct 2023 13:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] media: mediatek: vcodec: Handle encoder vsi NULL
 pointer case
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20230926101909.15030-1-irui.wang@mediatek.com>
 <20230926101909.15030-2-irui.wang@mediatek.com>
 <633d4544-e215-2742-a4c0-81698607e830@collabora.com>
In-Reply-To: <633d4544-e215-2742-a4c0-81698607e830@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_043409_042056_60C530EA 
X-CRM114-Status: GOOD (  10.13  )
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

Il 02/10/23 12:48, AngeloGioacchino Del Regno ha scritto:
> Il 26/09/23 12:19, Irui Wang ha scritto:
>> There will be a kernel null pointer exception if 'vsi' is NULL, check
>> 'vsi' is not NULL before assign it to encoder instance.
>>
>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Sorry I just noticed that there's no Fixes tag.

This commit needs a Fixes tag, please add one and send a v2.

