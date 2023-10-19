Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF27CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+ADdDxnBBi303vpYwqnS/KW/zZ3NBp1fepetmyfCL8=; b=PM+BPfMuKSAI+Z
	sv/JOV2GAks4Bg0A7sgrf02mSSNq+e/eE+7+bfkVobd1oabNLsRAu5YpQFsVuas17p0AdnYt3+bpu
	1vzDRSNlvDxlcfHWDKPhd1gRh5S4GDQZqd+v0zuBF1QhSNzh5G2yS9ls6hmah/hQN/jlJevMDBEXo
	TbwHTkyinyT55fkpflni57e8lAFPxzqYWNOiL4pbYZrkcqlAG9ErX1tSULrMgM+Euur1szqPnnblM
	E8AaXZW0THc6PSfA8WzizVclj66zJ/9G6Lg6ZfNOjo2K/G8yPISzwoBKW8t1wJDc95neS7jUz/vE7
	Nf2/9WIbwkZCNTIafNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP3X-00GohL-2K;
	Thu, 19 Oct 2023 09:11:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP3U-00Gogc-1A;
	Thu, 19 Oct 2023 09:11:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE0E96607322;
	Thu, 19 Oct 2023 10:10:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697706659;
	bh=ER3TUe4KejFI46uSujfiK3SyQjfv9tLTEI4WwEiaVZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LRckoRO2o1NvPjz3os8JbnkLZeOPKZEDzmkO+/Q5kPM6rPWmhl335XsNIEwV19S/X
	 KK/6c/2q/VcWFfOGT3QZ+aG3vnkl9ai4iXYou2yY+6rRYpY33N7TElxICoZmJHGePM
	 DVzrrhbh4HhcxNkAyXvK3k+rTvIxCWzmvYYf0SCyrcj513rGBdQSCETpamHB5kqGCA
	 QUc8Bo/s/MrM4bXE4drGjhojrnBTr0Bj1PgH01dYDo0HU/kuV+JyuMKUUcwrkv8GOe
	 ydkl7meZgHpQsIQ8zjh+vH7nHFQB//qmkce4Zolqd+lpgi1ZPZyEQSepK9VDDYKIy0
	 nlSmjleo+jslA==
Message-ID: <2114ce92-52c2-44ae-8aa6-9061a6646c40@collabora.com>
Date: Thu, 19 Oct 2023 11:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/24] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-14-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019055619.19358-14-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_021100_525137_A875EF0E 
X-CRM114-Status: UNSURE (   6.62  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
> By registering component related functions to the pointers,
> we can easily manage them within a for-loop and simplify the
> logic of clock control significantly.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


