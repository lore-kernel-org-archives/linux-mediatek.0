Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568FCC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pY8GUu7fQIwOppGX6xENS0JUVdPE9/Z443fNYr0Ke8=; b=dZYtYCt9k7f1B9yCMkBgW7tvOd
	+40IfLuFk+4E9TXT5O95lcIV9AWU7ushaamG1rJElkuXwGAAANXJ/uN+nZTbtKpeWjWnWAU/Fdzmz
	3zfdbWRrR53Im+3QwB3ew1QyL+jP3HJCNtnrQ+qNIIQs//Sgeh4TbozmBAx38IeNxrA9+9SvcqWqW
	RKNqyT21Kf/AmE7pJtJerVijprDrW/GWozIfjxju/IQedJ6N6yjyicdHC8425rsOdF5Ygf/beXqgg
	UldYJLjIFbgR/iH4rhYwYL7h1p3nq7FNsahUEepxM9MEPnQvZEIFlDAOsZjmm0A0BR7SmpZuQDJrJ
	R8KMZUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2A7M-0029fY-FE; Mon, 05 Dec 2022 11:58:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2A7B-0029dB-Cu; Mon, 05 Dec 2022 11:58:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C3CC660037C;
	Mon,  5 Dec 2022 11:58:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670241507;
	bh=iFlO31DNzJvNqG9JtnHjVtb1y6O92a+FI3D/2tE9y3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M47wkQX/t+5tOCDoiejCPLRXBIPFZ5c9kjtTBRJW6pDPDaimp/c9C8l54j4FmfgHl
	 Je5rh5jGD1i/q5/pNpe+M1nn9k17eX4ZkUWOUGTujcNthhqsbBdoylsTDzRr2C5q8A
	 ej9jmwe4UhM6nE3cW7GzyJre6wr7anF8WUCv1+xLHjOqce2RPh7sjbGANWQQT7OiJq
	 2yJe7aQN0eMNuaK3TAywORy+LoShkXbw3N2I74a//E14Bs6gyqlyI15jKyetttYNWI
	 c/sNJY4/1Z7qbo2FMv/ZoZvicLOTspxPuxFGkH4c/K29d65QYDh2labymMcqmI584U
	 5N/pCAUGLksjQ==
Message-ID: <5c5d7bce-b0bf-d1ae-1044-3c3ff20c82d6@collabora.com>
Date: Mon, 5 Dec 2022 12:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] media: platform: mtk-mdp3: Fix return value check in
 mdp_probe()
Content-Language: en-US
To: Qiheng Lin <linqiheng@huawei.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221202101836.19858-1-linqiheng@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221202101836.19858-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_035829_615090_632A961C 
X-CRM114-Status: UNSURE (   7.96  )
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

Il 02/12/22 11:18, Qiheng Lin ha scritto:
> In case of error, the function mtk_mutex_get()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> And also fix the err_free_mutex case.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


