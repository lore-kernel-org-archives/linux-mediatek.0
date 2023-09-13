Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F130ECA5528
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO7D19ziG5pxCDIkQM47vkjo9xv/uhQLcN0VHYHrG/k=; b=OcJKFIPhFCrV8WZC22P8uHc1iY
	xcup4av7ZYXdlLB0zffAQq6KK8ogvUtCnKsAbZ5qOd89EIHVGv+OL6HyxcI33GB+TbJKC9sZdvH3c
	YJ09YDoRNEY3rYTDuTug6ghzJ57YA+OXKHEfMgf5V1NxIyiv7giWxUR9TgJIOgvec/yUg1FaI9ZNt
	o+lYvCufiimxtyY8QykRC9TdnsO/XCfrlcxZAmtlHRqQbYcbxGrJ8jT/PNu5KFX1eUqvjCAiKHAWv
	xsh9fLpXAlJxBerv3l7u5jnTWkU47NEOGQB/fZTUKuTbNFIa5YPiUP4H1vKlO7hii44JwMX911RFY
	jBJSN3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLud-005Fsd-1Z;
	Wed, 13 Sep 2023 09:11:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuM-005Fet-0x
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 09:11:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CFEB660732C;
	Wed, 13 Sep 2023 10:11:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694596296;
	bh=B6Y8DaRQqeLKIKOViOvNom5o3bLaF//t/+GNjx7AWCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BmODv/ta18Dnr09CMswJHScEKyNaDjaM9LefshuvznBQK+MFEAPTt8ORlv111/SFh
	 wpyOYtJofxhLG8zQLm1kCGWACu2RKIMTV+S6CL3QFTjJJN3H3QR3mSOWa9hxjseeHT
	 v+TSmZZp9UZgruZBinI9HohOPOVJ+Bp3hDEayuW5jNSS28NmGbybqWhm6IUSD+Qyn8
	 FRcpynPxfwSD7e+xokJPFFbUxhYLadvOGTMtzRkBn5lI+lpNeQzYa/Rh7fqtDXfeoj
	 vqH8X7XOUYSr4G5bqeEfug7GUqYMzKZhluD0cryeHPHxFio1fe7m/x+dhk5k1YBNJx
	 PxvBsAxYmUusA==
Message-ID: <8b5c1d8d-7575-17b4-5935-993ac7a60626@collabora.com>
Date: Wed, 13 Sep 2023 11:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/5] spmi: Introduce device-managed functions
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230824104101.4083400-1-fshao@chromium.org>
 <20230824104101.4083400-2-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230824104101.4083400-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021138_474279_EC1D9262 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 24/08/23 12:40, Fei Shao ha scritto:
> Utilize the managed resource (devres) framework and add the following
> devm_* helpers for the SPMI driver:
> 
> - devm_spmi_controller_alloc()
> - devm_spmi_controller_add()
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



