Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE099C04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxm59JW+aF/qZ2HVjBsGE78rfN8DEB/3CEOAxjzzfCg=; b=GAua5RrgyAZSrZ+HRKYZUxDEiu
	cc9EQP1mqwu1L9cLPlZTfZjPzNzSbOdNU58QvgOIDP0fdk37LDTl4M6YWVnnBhPH1XV5oakQ4DJ20
	NPWBDt4c29HYqa8z46E8NU9EPOjdFN05xV5EJZOZ1QoYuiCB53JKeB3mLR3kMUbs7NxgqMhznuod+
	GXInQxx18RoNjn6l8D5tEXc2pd7XeAK75XpEY1RoND+P0+VDQQH9J2OOExKDYDsNHVYdW6iuydAm9
	dCvMOPSVHwil+Y/IN/YGVYVjxt5sl+F4pGtC1P1aooXGn3B9sYv6VcxO5T0AoL6JLNncSa9SjmgRy
	BwOt9lBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odosy-001ovy-5e; Thu, 29 Sep 2022 08:27:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odorw-001oOw-F5; Thu, 29 Sep 2022 08:26:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC8416601EB5;
	Thu, 29 Sep 2022 09:26:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439967;
	bh=HogPUZ/giLHXBSPe+MlBIcmRqc9tQiDI153axcWswEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SGsFpAY6lpiUsr5JRzHwAcF8aNyZsruYizjLN8cBrPnOrWRocpIWeiePjAwKJiOP0
	 tkDMhahsn4ibrQe6seKv4O4dRlLHNMpnu8C3mpgtPQCTliRRoDPvjEbndH5QRbRBgH
	 agRDQdQ+zqzEbHrHHUZ8b/QsB8/z0ZPKP2oOgwAMnBqoSoFj5ETl2CZiN+mtfSRZGB
	 kcUGkt0RIibBdRLBaagE8qWgYz4Z1G52qRnAN2eHMDmuWKw5gaG19lVckfPcTlm4sN
	 8Ju8DkqLARsR8ZK3ZpeSfFvQBpn8G80B7DLE5EUF37cn1ki/JYpMzRArYoh//NYfMw
	 MHmHLEEsBWkZg==
Message-ID: <ecfdbb09-b54e-9877-a2a5-76dec14d2f80@collabora.com>
Date: Thu, 29 Sep 2022 10:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 6/8] soc: mtk-svs: mt8183: Move thermal parsing in new
 function
Content-Language: en-US
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-7-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-7-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012608_687336_CFFFFAB4 
X-CRM114-Status: UNSURE (   9.47  )
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

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> We jumpt to lable remove_mt8183_svsb_mon_mode from different error path
> in the code. Move the thermal parsing in a new function will allow us to
> refactor the code in a subsequent patch. No behavioural changes from
> this commit.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


