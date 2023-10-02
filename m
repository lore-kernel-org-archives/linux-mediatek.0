Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24308E784B2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJ0a0wNMOXJ/wn0GPhC54YTgs4tNe5cP6aYLiYXKba8=; b=k//dQ1LuYKEcoFWGLeBopAOYmc
	D9pKUcfYnAryWwZ+u+dAgd+KyQbj8aAtaUitjfk9QIxTNcX3iHXO7N09O/Uxvqs9Kpzl+3tW0WxxH
	5hZgoOsRWqMsXSPCFDwJ881zGnlXWAunDDWBFQdM5Pop4CjHVc6sKZJPJXf/RlMHJDT3o/ss07U/q
	7/m0K8C8pe9l2yr0YomEh3/sJgfViwy0kgNLRzg6C7cQVlX45/LLOeRQbAaP2bbn7D6VViKP0EQiH
	iRLCwwG9fIVk6Tm7JzVU9yItQ+2lwXncvuAVoLtKq0WzqzO1k2Hs8sToZS1ZE++98znVhmOMeJoy1
	FvmxYfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGU4-00CUSN-0E;
	Mon, 02 Oct 2023 10:49:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGU0-00CUQk-0z;
	Mon, 02 Oct 2023 10:49:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D6AC6607243;
	Mon,  2 Oct 2023 11:48:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696243738;
	bh=7FCl16Mw64i/EfJ6OQlYS83PjShxYQyaVY0iisClkvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iaaC3T9MOdFWNSdt8GwXYT3PmeNwtdCQBBoj5cz7A3PFEyv6F1VIK6culpzUe0MkY
	 gzLD0lPwDmSotUujazj0MwoM9+rTJYbEXKYW3KKB1V6PRQm4xElNUCsalQGLOpG2Qa
	 wR3fhOvQikkkXUNHMf/ug8Zz2v/yNb9QcWiLW4bWT1auKzZXJamWTIHEqUKOKKZB1/
	 r8fRqvlTLdh5ydNeDwr0naOpXO7rF1MMVIHTUNhsyvXZEcCo45cTCeAr7adLKesTl5
	 U6a3TbF1v90MyBnmuKQvNgmYE4mONST5hJyu3brRkEWCKAQiJHzYSaE2gEymlXhZ5Z
	 /3B+BDyVA2rug==
Message-ID: <633d4544-e215-2742-a4c0-81698607e830@collabora.com>
Date: Mon, 2 Oct 2023 12:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] media: mediatek: vcodec: Handle encoder vsi NULL
 pointer case
Content-Language: en-US
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230926101909.15030-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_034900_477135_0DED1DD6 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 26/09/23 12:19, Irui Wang ha scritto:
> There will be a kernel null pointer exception if 'vsi' is NULL, check
> 'vsi' is not NULL before assign it to encoder instance.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


