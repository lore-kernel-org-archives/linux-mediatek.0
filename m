Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D01CA5525
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niKRMNpTc3xuqDn6cWFEoP0usLmRBsDzIRZvNOC9bMU=; b=ssQVQONpu/xeJiKzDq/WH/YLmN
	vRJ6m6oWyRos90nWYxB6toZbzbLJkGLcKHYpDuzL3oI/juWXtBMgBbBSuVq28+nY99KMwbQ2zOfAo
	QmVl57bqXQ2bQSzHjXPPQnxt4UBpnzQO/ByP8JYrn3OS9cS3iOC183L0zHiVb/zoyijRb8uICyr2o
	oaD/wtZ9qVXOMuPSF3liSlNPHYw70FexNRjqFAFp+DgmFCraEe2ywN9WQpmmLX1sad30iVumwtXhk
	p7+9WKPeo/RjjOGKfaYbLStm67mIDT/oF8mz8h8RwVfr9GMbc4UhXjT7jO5s8HvPeBGo2mSHN7xAr
	qth8tHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLue-005Ftr-25;
	Wed, 13 Sep 2023 09:11:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuT-005FiS-2L;
	Wed, 13 Sep 2023 09:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=niKRMNpTc3xuqDn6cWFEoP0usLmRBsDzIRZvNOC9bMU=; b=iwec2XoeCeoS1legYuZI3BR5Gr
	iTjZXxr2Ed0/LPG7pJkb0PyPZ4XSUw+3NLl9aLklFI/5zl6OPGSZCq7mv44yPOLKjB7CDvn/VUdGW
	of8O/H0PJl2aznzwJXW3S3ZPmJp9u7gFHkr0UYYnIRqHmF1dpKOc0kS+cJUAJYVr8TwEuD+bNGHb1
	FNt1GjKkk025g7kiQ02Zs5XORfWR7F2pDVxo4ON19WU1IyLwcaHKbEFkz+/LkV27XvaD0bms2hF+f
	BfYEnmA55wrA6I7Vfdp9EwVTci/SgWNuJbOI0GGgiPkZ2M+aJHsdiOn/7lbnBAHUN1BSRUJZ91INk
	80vaHxKg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuN-006wSd-2t;
	Wed, 13 Sep 2023 09:11:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF53E660732D;
	Wed, 13 Sep 2023 10:11:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694596293;
	bh=FtOpkAdzQ58onbp7Njaf6MPGcxX3jvqgfRoBdwKnAdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PO6qr5kD4IQ0uzj/oKlPpQeZTfUTgetY0C5HXTV6uFBzcAd9lWCSFc/KKunqJ0hyY
	 j0IXVNavi2s0efwex9sO/SXFcBgNjFvHkTKDGE0qCiI05Orp/CV0CFxmaCozLBsB/2
	 Wqxs1q6SRT5ppm7xYvmeQKi+3KQolYp1+Ak8H68mZorlAwFLcKUE1/ZPX4j++hU5G1
	 xOiTFaGGlrHZYcHzlAOPr4WQUPaPPkJBHCH4MPXexwM1YAU/egekpBzA6XOuscmzgA
	 7AAQhQmQsFdfz0EsnVJR23zZYeOJjSMydeLi17PatwI6scKi3NLWBDEJ+e3dNjxMQQ
	 MgklUKLCkyCYQ==
Message-ID: <2d78548a-6b4b-cd6f-6466-5d8ff4de5a1f@collabora.com>
Date: Wed, 13 Sep 2023 11:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/5] spmi: Use devm_spmi_controller_alloc()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230824104101.4083400-1-fshao@chromium.org>
 <20230824104101.4083400-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230824104101.4083400-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_101141_630418_AFAEF3E9 
X-CRM114-Status: UNSURE (   7.91  )
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
> Convert to the device-managed version of spmi_controller_alloc() and
> simplify the excess error handling code.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



