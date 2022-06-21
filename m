Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E90AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OageOLun6OAdzKJJ+2iXFqlNZGrwGGjNEEabO730SIU=; b=241M7WV5d2l0t3vDXDiQDcRN1+
	bWtLeB/CfiuHXpWRszWaI4uoMMCGJfZDmRX07arCohwF6inQw37unDJ7tJXWqWATZWcBVssjwitb2
	DPeTx0V1hatf1nT5e8YBQFxnoATU4QXB4B1OVFoUs8pHxYgwG6ZBYJlIkqzqoYgu/m4+R0wPUhyD7
	AKNiEh3GyuA2p3zQWOakv16byX67RjF4Pbh2pg+Gz1Fb37znXtvgaPV+kLFnPfVjORlG/W2KrWMlI
	Q4TbBc5Ikgf7TIvpTMGqr0IYuw0SRUZYmi+JbM3iY0IEiqbSOMP0K/SScg4I6l2Qt11JM+r/EOI+U
	XV/Zzo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YM1-00464K-1C; Tue, 21 Jun 2022 07:31:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3YLv-0045z6-6k
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 07:31:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F6AF66016BE;
	Tue, 21 Jun 2022 08:31:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655796668;
	bh=rAKs9yjRTDBoZUtYmdiGgoemJTNqX+cPNuk68ipXIpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A8H7ovwbdQLE7ZG3thuhfFb0GZbETc7bFYb0ZnshKAa5KCSr3aUSNnYKes0ROCecS
	 GXL7jpqSu8yzV9TzPICs0rxj8eKYYnUyahhmekkaFafxOa2Now/8P1JKdCLoKYYL7n
	 0sn+MSzoeEGXfi3VF+B4saFeU3tetg5w9crF0GSu93XqW6n59/6AaJYo05Ob6cX5Tb
	 SeoDFSUjNzl63uyNgT5zPaRFusZc3nVedSQQViYCZgDREOzob4q/6uCaDwk+qmCDoa
	 vy/Imr/oLcoIzV66CccGCdvmv3REHteFi7WAIA/mtdjLoMcY5K/X6PXWx+BEbztV1i
	 lv5wbyTzhXKYA==
Message-ID: <371d31a5-fad1-86ac-2c8b-0d1100b26a6d@collabora.com>
Date: Tue, 21 Jun 2022 09:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] PM / devfreq: mediatek: Fix unnecessary check of drvdata
Content-Language: en-US
To: matthias.bgg@kernel.org, dan.carpenter@oracle.com,
 johnson.wang@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220620154347.14756-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220620154347.14756-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_003111_616292_DD95AC16 
X-CRM114-Status: UNSURE (   7.70  )
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

Il 20/06/22 17:43, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Probe function will error out if drvdata 'mtk_ccifreq_drv' is null.
> So when mtk_ccifreq_target get's called, the drv pointer will never be
> NULL. This fixes a static checker warning.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


