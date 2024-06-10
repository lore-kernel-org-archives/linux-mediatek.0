Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3916C27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gly6aufjGGb85mCnwPitwHn/L2mNc6y6dE7rBHRGzjQ=; b=yO0VFoS5nuP3v6
	MYnQrUrHRGYoBcqm0uimmJc2W3vR6t/xtGU/jmLc5PCgYczKT/3aO7anSn8+F6IWOAQeOp6cfBExP
	392B4ZklfyXOx5ClG5JPsNYjKmz5eTHSalrIOSbStba6xdWSD2/bUS+/lqdBudKVk95G7CEObz0JY
	7RIO0oJZIkrcjwyuB9X0X7EokotpR3Lddf45PPlJXXpXhsDTsIy3trdal3cbrQgi3eFGtp0X914Gt
	5rBGgB/Sa5fdSeNUDZAqRTFCH9UjVChB2IBED5wveIhYOJAOfkR2grmhSrVvYyG2K840UjloOhhpx
	ehbjgJR0TRbMwyNd+2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaAr-00000004CsX-2VeI;
	Mon, 10 Jun 2024 08:14:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaAm-00000004CqQ-28QF;
	Mon, 10 Jun 2024 08:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718007275;
	bh=+iTjLS/qEuBXTSOPVFJFbWlAw9kHxOfyLrRcyOVzexM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zcAW5ht/EX2VhMVYZ37MiuPYen7/FSgG3ULfK5eQtYSUOE9l84TMjXaf7lCdj+8fU
	 ZW43FCuZKKTH0jXn2MfyJGISHr4BALL6OuP/JHhBl6f6yNQBSfLL8VfESa/yzv6vJ3
	 65H9OVItuOMNXD6kVgM3NSdRRU+IkZaB3n0LT4BdCLBEfcAcbMlpMn2b4DQzWENNOn
	 0Rzs7B0vzJ4zn2baI4/WVpDxkDnY42kf+SEgGbt2O995TEhqidD38WuoDFn5YyoxM7
	 38NoZa6gCdaCyF3QWSxpqHhnjhG1HaAXVfuFRqreE5BUQXlHxomfNoOZ/mtVeFefoX
	 jz5q8j+SVMMWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 377F93780575;
	Mon, 10 Jun 2024 08:14:34 +0000 (UTC)
Message-ID: <e2dc83e5-041b-4c1b-bb0d-c8b0ee9d9c27@collabora.com>
Date: Mon, 10 Jun 2024 10:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/16] drm/mediatek: Support RGBA8888 and RGBX8888 in
 OVL on MT8195
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-9-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-9-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_011436_708407_3EC9570D 
X-CRM114-Status: UNSURE (   5.00  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/06/24 11:26, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support RGBA8888 and RGBX8888 formats in OVL on MT8195.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



