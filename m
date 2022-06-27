Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C73C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn31GNEkojwOgkaxrO/TfhFUdC8uHNgwVBrABKbOriU=; b=KnUgHMdN5fyrNQdkkXB+smQXx2
	RH1K4ShTn/nlZmj5cplt0Bgy0b/LVbBkYUeYwNAY1SuiauII+/SP80Bsk8aDhXMBHJbEXZtWk84p7
	ygXxaL+ZOKAs5aGSvmwnv+OBv7YTtYUPqEGEDeHGdEHF1XB+zW7kq/Qt7+mSkaCr8nPK2mWnxXwfh
	WnXSmHWDMM7R6oAex7lrS/8ehHpzsPo01u71Z5V2OS1TS2IfRJKmeXB4wgAKTfWsASporE0m8G1Ug
	SBfr5F0Y7FjVD9zKoeDRtv3cOZwGmlxloGnEfGAtPqRUN+UtOlfk+mX7TUaY0mOTJjvSo3iSlR3zu
	2VeaO70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lqh-0003eP-7o; Mon, 27 Jun 2022 10:20:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lqT-0003Xv-IR; Mon, 27 Jun 2022 10:19:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FB026601822;
	Mon, 27 Jun 2022 11:19:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656325192;
	bh=B05eVpTPDvSH5kRE63nQuTVqlP0G5H8QGhr6i4PP/Gc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l4HYQVy3A/okvck/4kADeDAZ40G3lPo1V3YtIyhBRqCsHQ63SLEuTrXmPmbSnRx0C
	 rYfEKCpN20OqZYXFmT/lhfaf9yBqo1Nr0V7Lg6P1IcumzGQXvgvIHNSp8OS4uQ2kla
	 ZB3ztKRby9hpCfegz/jeWZCT4YsqK66gaZhbUVP+C8XYh+BR4qLh9E0ic660E52BD7
	 6k+KXgn2Z9RDvQsjpCoqGMC4TT8EG25uyRMcZjVFfe0+BZLR53m1ngblpQXLA2rPZB
	 8ZmUEJNwxCli92Yjqhbr9WTC/UfAouP3LiMKoL2naDSRDAmv4Z1LreJFby+/ZnA8U/
	 3rc/2tcs99gVg==
Message-ID: <39d87507-8cbd-27bd-258f-0dad84ff3b0b@collabora.com>
Date: Mon, 27 Jun 2022 12:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v12 08/10] drm/mediatek: set monitor to DP_SET_POWER_D3 to
 avoid garbage
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-9-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220627080341.5087-9-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_031953_789232_015D6FBB 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 27/06/22 10:03, Bo-Chen Chen ha scritto:
> Set the monitor power state to DP_SET_POWER_D3 to avoid garbage.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


