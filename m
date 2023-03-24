Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F35C76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0iDpjE1Sj9VjFN8ZUnZ50606mtZYBiZIlowQsDkafc=; b=kLXpG9WWrCSEwltSo1Pr6dmU6R
	OtvCXdwHyADs/U36ZuIz3Lb8aC8D3HntTpHdlKP+P1Twhn+q8xyFqUOJSIN8DBsb+/z4kHcH7EI3V
	F/EJmloy3GUVCgD3ndywvnsdZeJVnEPxxNYo38cSgVAxpAgX4P7rCvasc/DV8bcn0tUF96pYCG0Dk
	M7rKoOWmhxbT2ys51wvcrTcZFtAPGCvoXkyPD1ofeKxGn0XiZzdwXPpYkVHA8bdTYR3AZZD15Z377
	S8JYYGd/R3/LzOCETrPbq5mYz1yBmc8LIbCiHbpoyXw5jT/Pcx2geWc5x5DmEPtsW1uH/7YQH6VA0
	mU5yLq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfcmU-003sFH-19;
	Fri, 24 Mar 2023 08:28:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfcmQ-003sEI-2f;
	Fri, 24 Mar 2023 08:28:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C07DB6603103;
	Fri, 24 Mar 2023 08:28:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679646488;
	bh=OSwLd13ABDNH1gGaWUK5KSnyz988zi7C1RttukscA54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ou2NdNkkb7pLdAkRWSCBxGmVGnfSDgJCLQm4JCEeXffSRjOSweFQHdCYcUlQdBsni
	 ufpIFuXAaTQ1EU1ccvxC/7RPqNcwFxS8+6iGpyPot/PH3LmeUSdpOT2zO/9+Nxm6TU
	 ipgBjTYph2G+1cA+KDTLieTuwU1bulKNnHrnS3CdP/PIs+/kvBF45e6P4EbMMcKMVR
	 bJYP7NQ/fcGRc+2XwW2ppKesuVz14Mp8ztTalJi4jOLH9UlicJaIgYvoigHnJDWIqx
	 nXh7KjJ24Ywt4l20BhvWxv0xyVvrqa3tX/rhLrFABqNk2a3a4uetV+Fz6Eqg5lzYdR
	 hoY1cRNr1YZfQ==
Message-ID: <4f9d243c-0029-fee6-5caa-a4463dfe2b77@collabora.com>
Date: Fri, 24 Mar 2023 09:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] soc: mediatek: mutex: Use dev_err_probe()
To: ye.xingchen@zte.com.cn, matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <202303241017290414354@zte.com.cn>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202303241017290414354@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_012811_012985_2B0B98A2 
X-CRM114-Status: UNSURE (   7.37  )
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

Il 24/03/23 03:17, ye.xingchen@zte.com.cn ha scritto:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



