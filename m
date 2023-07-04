Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFCEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzuvHWdJOoxExzpvzh1Q+k5EPJLv3w5iLZRTM3MnSl0=; b=sP1GwxB/sZPtiaWKfznPhO1pmf
	KFDrDmHGjVE8HGk9tp9uyiUwPiJgHt6vWZW4m0qyT6jHRC7NK+kgMJi36+6OwAdZQGn532qu9gO3x
	7vMIWmq/mf+Liks5DH0NywUzD7DQiXDzVr/5MCl/xcKQaIhYtnErLM/sfIDdiOIe26T14M1Xa/+bV
	j2WVm9jwJfXmKaNy3w/AjvhRpw9QPYIBiaoCZZr7AxmqOnq2gNNUAvfd93DwoIsG/QEdEu7AgT0I8
	0SAE1ye5M8/QfEBKFj8n6S1PN/jgzcsbqzEMMV0t/SyuwuftJ4dd/n2oC2MBgLUbzd++gHJZrOD/c
	o1XQPpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetl-00DDA1-1f;
	Tue, 04 Jul 2023 12:12:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGeti-00DD6X-1z;
	Tue, 04 Jul 2023 12:12:47 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 957726606FA5;
	Tue,  4 Jul 2023 13:12:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688472765;
	bh=qmm4z+AweZzjaCuUW7i+I3t7cRwOPbqjo2hSFwzpZS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dWxhYhKWCprr9x/xEGVJV4brsI52itgfDs5YFNUDx7tUPqa1piBlj0iXIOtt//KbB
	 2NtQt8UoCGhHNJsUyURDJ4gHJghuBzQ/9E08OnqfJ9sTWhNMiw+BSInaIJ7MsbawVF
	 BfGUC/ujGGOJjPgqkkFLzQdshiC+6shNkFKTrcTCjZQVe0GHZA88riWBC2uM/fwLtl
	 m1UhK8WTNtGY4jilmhsSwEz6+Y55yN/SAS+0F43RpqkwjhK7M6/u91r9AeMxuv9/JF
	 GLKP19hvWi/NeNGy7eG5RLsQO9O4SzTvLiTEyosQG0xwby/280GdwPItrNe8pWOgE2
	 6pXlysC8oeqtg==
Message-ID: <986bb48a-03d5-c59b-b1ec-8cfac1f9bf71@collabora.com>
Date: Tue, 4 Jul 2023 14:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5,09/11] media: mediatek: vcodec: fix unreasonable
 parameter definition and style
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704111327.7140-1-yunfei.dong@mediatek.com>
 <20230704111327.7140-10-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230704111327.7140-10-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051246_789148_56E159CE 
X-CRM114-Status: UNSURE (   6.56  )
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

Il 04/07/23 13:13, Yunfei Dong ha scritto:
> Fix unreasonable coding style.
> Fix unreasonable parameter definition.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



