Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8705BC35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuyovJIVMpz5u48/Av45UHTPjF0RanaFo8uIYsvWi8s=; b=HvloCpCEuLRhNTCyyIDRsM9Bmi
	eAQyE9Q4xT1vhYVR9+MhiLsnEI+nWeLjALb4HczutJyNZpasM1wc00Fr+tCMDMlGoiLmQba6vpWX5
	U+UNiCwT06gZAdCTjfgPj1XXseWE78uCC31ttLfNBdQa9NdvYLZdIh+T2j0iDNV8sCe8hzLcFkUrZ
	p8YkA7o8Q1YtAX9mrEYrxD/9HDwWbjYQn/jc7jkY1BNkF1Lyrf/mHnl9GnKgu4WUYMEzPkX7IgQIx
	U4ivAfzjkMW9PZwwXOqfIKTEy5gIQ9E+fZy7fuMUXGNb9nG3Vmux/rqmgtlSyZa3vIUITFBXIBvkg
	Mnn+8dPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGHSL-002bCv-1f;
	Thu, 21 Dec 2023 11:43:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGHSJ-002bBb-01;
	Thu, 21 Dec 2023 11:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703158988;
	bh=Ooyo7cFIzcwmmqODzrdGSMJ0PnUsddzGotcXVunWRCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TFM05tf5xJkbcJ5fK+qrJ+/xhaHuaVmjqxZtkCf6cdSJQAqC4cLGxctKfwlPGPKNN
	 SD5/G6nie/n/3szGdDCTnMaTlop4alnGMC0YqrOpVil47QEw605kL7fknTx+mkFUZH
	 a5jAfz/3KKcym43ySHes4MqKmwz4l9i1831yMbDIIcLgKr+o4q587s1H9+vmhOYK82
	 bUVhYYObnb2fYERFLOwreaFSJyTyroAtCGB+33HFuuoWu/VSHzBrlvtFCGmwbEOItd
	 lX5I/KoatFr56yhZz3M9WZJ5T2j7OM4To9gsMW8v3201z3pUjhcF8/Unkd/BhOucNO
	 0RKX9tB/YS4rw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2866D3781FC9;
	Thu, 21 Dec 2023 11:43:07 +0000 (UTC)
Message-ID: <e822fa39-ba03-4816-a58e-a8328c39e051@collabora.com>
Date: Thu, 21 Dec 2023 12:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: mediatek: vcodec: Update
 mtk_vcodec_mem_free() error messages
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231221092226.1395427-1-fshao@chromium.org>
 <20231221092226.1395427-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231221092226.1395427-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_034311_248477_FCAE3AFB 
X-CRM114-Status: GOOD (  10.65  )
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

Il 21/12/23 10:17, Fei Shao ha scritto:
> In mtk_vcodec_mem_free(), there are two cases where a NULL VA is passed:
> - mem->size == 0: we are called to free no memory. This may happen when
>    we call mtk_vcodec_mem_free() twice or the memory has never been
>    allocated.
> - mem->size > 0: we are called to free memory but without VA. This means
>    that we failed to free the memory for real.
> 
> Both cases are not expected to happen, and we want to have clearer error
> messages to describe which one we just encountered.
> Update the error messages to include more information for that purpose.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



