Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9667DC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2v8Lfj6QZQ5xepqGD7LvvRmVwZhNHBC5vt1TQCu6gY=; b=MrJBkE0pfxgmRYaTZjWuSKRhaw
	8PtrUwwIX+zZAIBHbm9fEXgyyFS5UfvptZ9Dv7uub3JHdlPp58+L+jvrt8ouvpACD/LKVR650MgSS
	3NyyPWH1nHCQzEGzKAeYw3pQybu5LCiyd0eKDVcg4SEhG/TACBAuliJsuKpKegRneYTkgFNqoTH3z
	MLPgFtlLKjYuKPwpa+7yPJ/41NG1BJhHEJIrFhbsrO6wQyoQnHamJ0JXyv1ebKGtHrYK8DUdQtgBj
	tAb2/8fwb+EiUUmZHQQxVRzHjQmi0VjZkHiDUGFTjakCnQ+Ws+uhzBRblv7KoU7P2a98QPx/+pqT5
	dvXPN0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7lf-000uJr-LK; Wed, 18 Jan 2023 12:42:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kI-000tmY-VS; Wed, 18 Jan 2023 12:40:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3DBB6602E0A;
	Wed, 18 Jan 2023 12:40:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045649;
	bh=DdW39PMldNTPsCzW2/0FebBdK3B8Jn7HQbde+4dRYFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ETqjFVT4f9+a9cQj/eKMU2GSNLcKkmH9fzbnMjAVbzBq+MhzJOPjkAsbIfLk4H/8y
	 77mXmB7K1Du7tHqVTr6fPL/oJkzYhweOkPgj0qWOxv6uTA8j+oQCiw6oePWY3Ndz9F
	 rxyoWUlACqttmUCwr56Q1CBJEY21Pc0Z6DCdLQVFLAlzm5Ye2ouen0mLgmqjQ2rWSR
	 2YYcecmLjP7O9LCKL1kZgD4qy0JuZZ654LN/IvbDMBVipNKTEhEcy4Z5T92mnsehXD
	 a2K+JpXTnqny5wLxgko8GELYByaO99oAjP0VjQSglwJaz/h9nTcN2bJEgahjMdHN00
	 fSYnCNUnXsD/Q==
Message-ID: <7b700fa9-148a-b4fa-5eef-4c2ed7f53a14@collabora.com>
Date: Wed, 18 Jan 2023 13:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/9] arm64: dts: mediatek: mt8186: Add audio controller
 node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-7-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-7-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044051_182695_0DD15246 
X-CRM114-Status: UNSURE (   8.07  )
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add audio controller node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



