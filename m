Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB48C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNfjVwypAXwS2yVhCuPIA2jnNNy1Cj8ZcaIHhJyPGOE=; b=w0UmOYvwOYLsAL/tYv0eFShqz9
	D7/TqdEg3RyHEH4UR3EOE+pHgOz9AM2VDvptBBceXUZb3sFCGtjNpvhvX0e2vuM5+0x95IJMfpxvx
	y23D1IEbKYbbdHhXB4rTrRALVJ8/qXazSbLvQ4rVdEup9V5HQqOkwTz6J7UJRqKvwL8t03/NkCBPI
	KbVY/PucibLVGE8WPFp2XOaan4UDp1zgDHNL2PiB1SBBvFiiy0l/3oAPdZy52/CnIcAoQO3mPFecy
	qx9s436kJhlkalqBFwChUdKJTXPw4vdTCog15B0eu/3n035Lt8Eow7o88wfDNtS/XmYlUtMoQ0kKT
	XZ6sRJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMW3-00C1YN-DH; Tue, 07 Feb 2023 11:52:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMVs-00C1Vq-Pu; Tue, 07 Feb 2023 11:51:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66DF86602065;
	Tue,  7 Feb 2023 11:51:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675770708;
	bh=MWr1vOqArgCsUOmneGrQYdT5d7VoYOD70EsSHjzp9K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TsgF/WNw7qo5dn46OkfZHT1D/q98kQkrCN5//xeC/347i9WPKGpRsO66puk+834UZ
	 IOb2B2a5Na7D8UZdCBJ4GNW8w0qxRGwtef0wygCM5NPNBF6daxUT3jr9YjXOkZo7Xd
	 ricB4Aym84ZyzlOjQCSRZKG8CD1OlSa9mGV/XY5ZsYlDVwa4s1KkYqTQ+Pbc4oGABo
	 wEnptoVnb2DAfQEVhY1lC5Pwrr6GIp2rZ4vadHkZB0dR38wk4EBhPPR4aBAk145Ulb
	 agCj9zoeViupOp+lyYRfARikgOjDBKQpJm7CTl1pqp9e4Qei6G83bMUJeWygYjhli/
	 LxU8P4ykTe3kQ==
Message-ID: <0713672c-37fe-663b-11a4-0baf02c11e6b@collabora.com>
Date: Tue, 7 Feb 2023 12:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 16/45] clk: mediatek: mt8167: Convert to
 mtk_clk_simple_{probe,remove}()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-17-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gb5S0k1c5EqPKoiBBHFyf7QBqyeWZkdAjQDCcTLYU_bw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gb5S0k1c5EqPKoiBBHFyf7QBqyeWZkdAjQDCcTLYU_bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_035153_080604_973E1E28 
X-CRM114-Status: GOOD (  10.25  )
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

Il 07/02/23 09:07, Chen-Yu Tsai ha scritto:
> On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Convert topckgen and infracfg clock drivers to use the common
>> mtk_clk_simple_probe() mechanism and change this from the old
>> "static" CLK_OF_DECLARE to be a platform driver, allowing it
>> to eventually be built as a module.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Code looks OK, but vdecsys converted to builtin_platform_driver() while
> the others to module_platform_driver(). This deserves an explanation.
> 

There's nothing to be explained, other than this being a big overlook... :-P

Fixed that for v2, vdec deserves the module_platform_driver() treatment too!

Cheers,
Angelo



