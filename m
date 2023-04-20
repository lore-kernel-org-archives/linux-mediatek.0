Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A557C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksapSUQUSUrOxuFEasdFlmXhyERx2YxIir4Vej0yRaw=; b=EWV60uCCeNdDI2Em4tFbRKoeT4
	upPyKYYhwNk42eP+qFzImnMHhdV39fWVwshS43uyfIniMAj9VhdhPR+tA3J6IOOf9XqSGeYLlCdiq
	C3yYAdSXCqX8gRSfZq1VcyxHNtoXMUg/EpQwBHcJT7lw9ROgUQqkAdVpIY5bdt/q1V/1Pw6v+KbXw
	baNHx9CWELV6XwMi60mnp+KzDI4Kf+4vBat/GATn7ipIqcjumByxitzThs2ejIrQxd53f/DUdRPrE
	jgQZt7LGmUTfgy6jpR3ToSpm2JzJkCSO1tkZKIswYXkV2w4S2jO6R699U3MO5hyvdwNqUJPmdQD5r
	RyxuRhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSzL-00802l-0W;
	Thu, 20 Apr 2023 12:02:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSzG-00800L-0k;
	Thu, 20 Apr 2023 12:02:08 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3537E66030CC;
	Thu, 20 Apr 2023 13:01:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681992120;
	bh=LcRVmUKZzFzapPfbEEWSGRzomqHZShG7TMdpFQ+vpIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GORNTUxT1VHh3euff+j8a13k52+aTqkVMsuz1x1LzNAFAahj0yoL8uOpiQSeqRNXj
	 1szidLMLsTiCUsmzl4bSFzO9shZA0zd7dxfHrrtfyj7yQrTZNrIBQZI/CEiDkYCLf+
	 6m1W1fgMroNvvcqMYs77NxhI78iIsBKWP6gK3XeO2qNIlcMr2YKIBDS4GDzTzkDUXk
	 Y5qf5kpZ/sauS6jc+9L3j6wkyU2CX0Vqd+E+OxgNKlrTeCUfW2vLD8avtzPp917EJ0
	 jZTGmIKLgdnMo4xy4+8GUKuVIBl/1q3XQGN0vGS+ECeZqrwxqNlDkpmOAiC97jElhS
	 y6yxn4DufQnOg==
Message-ID: <e1619d7a-2ac3-55bf-bcf1-cad3f07d20fe@collabora.com>
Date: Thu, 20 Apr 2023 14:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/mediatek: fix uninitialized symbol
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 clang-built-linux@googlegroups.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20230420105115.26838-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420105115.26838-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_050206_473805_2AF19C80 
X-CRM114-Status: UNSURE (   6.44  )
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

Il 20/04/23 12:51, Nancy.Lin ha scritto:
> fix Smatch static checker warning
>    - uninitialized symbol comp_pdev in mtk_ddp_comp_init.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

I agree with this commit, but please add a Fixes tag.

Thanks,
Angelo

