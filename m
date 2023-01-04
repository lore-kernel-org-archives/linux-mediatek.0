Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0AFC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvdXFeSqP8Cp9xHxchVJOG2Iypjd6Db8MB18k4L6tIo=; b=brVrHeAX9DwfpA3YhME98OoNDB
	MIQVGDIDvtMLUoYw8nL1qfpjsqwBEq4Nw2U62AelqwZbjJNT12Mqdi2a+c2Z2pNoo+jcbL3N0JvQb
	JJYXUvZyQngf8vKFvTCFLh1j/EG2f22pPLyLvVz0NbPgy0R+jMwj3hUz5Aa6Mu+CPJB8ELgUv3JbP
	NHksJuuLKC96HCTRKtO1SR1LCVYadQjgPDIV4vluPGhoiGBTp0qvDJHrameY0m2leftSnIVi2W8Eg
	M3HQHFU7tseCjnoyAzHBMmrJS+et0bODEhtYNPo/pqL0sPPkDi23h0mUi3CrC+oFSLEq93FzXYX6y
	3nB2kp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD48Y-009T3n-LF; Wed, 04 Jan 2023 13:48:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzzw-0080tk-2R; Wed, 04 Jan 2023 09:23:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99F646602D08;
	Wed,  4 Jan 2023 09:23:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672824223;
	bh=KhOX2w723U9MDxXjgpSqxzBYpJpo6f2ZaBSs3BkVG0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k2QGO6wH6NDcH0KYP2ItX+v1+vvNEfC7ywZlnWkRFHC9nKNt6io3pHA+pcBkrrg1d
	 J6siWl7SqVO5m7gCO5iWCTZDfyJi52OP0R0GKYNp4Kc8aFqddl7cizD6EAyeyaP7vq
	 jWFsnABHt7ejCo3DE+55FHcIgqV7Q1mTFGy9owS6Wwffd1K/d/l80JGK2vwmkpjZVz
	 YR1W/zxqwLR0xQJW8Xs08DILsvT9wUW5p845el0HvwSc7Dxn5JpaklT2TKaz+YLhc7
	 HYEt398f8a7z1shQzg4r9/NOgX2EVsFqRq3N8h2hGjEkILBE+dj7+SeYel+/7vj+N8
	 oaCPoHYXooDvA==
Message-ID: <fd660017-b502-f72d-c1d7-f94170057fc6@collabora.com>
Date: Wed, 4 Jan 2023 10:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
To: Chen-Yu Tsai <wenst@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
References: <20230104083110.736377-1-wenst@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230104083110.736377-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_012348_441102_90D3C99E 
X-CRM114-Status: GOOD (  11.85  )
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

Il 04/01/23 09:31, Chen-Yu Tsai ha scritto:
> Clocks are properly reference counted and do not need to be inside the
> lock range.
> 
> Right now this triggers a false-positive lockdep warning on MT8192 based
> Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> (not on cros-ec) probe doing i2c transfers and enabling clocks.
> 
> This is a false positive because the cros-ec-rpmsg under mtk-scp does
> not have an I2C adapter, and also each I2C adapter and cros-ec instance
> have their own mutex.
> 
> Move the clk operations outside of the send_lock range.
> 
> Fixes: ("63c13d61eafe remoteproc/mediatek: add SCP support for mt8183")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Nice catch.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



