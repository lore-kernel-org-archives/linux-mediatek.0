Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C57C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4gXPYQ77iF2rK8hk26vxF27EOq4KCdZ8rTTQNU79ZM=; b=nL8YTZktSnozDn
	mvukSrPdBB6LnSlkISxLz1Wygm39/N1JV8IFYlvct05DY0SXdg7ydS2m8amEL+Uner81tAs9POndn
	WYCch3Vhher3ptkUL/LrCFxbjr59zfQhwXgdsyLox3DmaZ0RbaSHLy0yO973daSmMIiam/c3hqle2
	5Hixz3SCOBFNZq/NUPuXiCXER6RL9X2Fgr+gfAVPYqVaVBAAyATvQmkLGFUubWP+NTZGAz7J2iIzk
	7tvhcjgq9MAm1rGlnmC2TCAc8bW4P5nI3orb0fH2doCpggZzmCrCY1n25yspzxaCaQvZeINQyMgtB
	y7dnralkezbJDHdzx+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonj8-007KvR-2h; Wed, 11 May 2022 14:54:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonim-007KnS-Uc; Wed, 11 May 2022 14:53:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 046961F43060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652280827;
 bh=1WyfN22iHz/BG50S8N12f95v21eENJ0KQ7lsxiYAPa0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WPTJ5MQkqexfsUxUf3R12LwvqtA+Bt47cm59Z/c9iA+4imEBr2vCDN5SR8tE5ujrJ
 bH20okHTLDYIZacsaA+dNIDLoTY1G85XPiQsEbi9Zz53+/z0hOO0LjIIQyQ+6mbO1i
 Vb5J1/apCDDYhMG7Nf9O0Mr1K8b5bezIz1g6UMptqYJSv0eoeJ7+Kjc5CkouR9uof+
 g+6/iV/ufoffrK3O87DInk9RME8PNwGj+fFmZbvVLSuXhFIUi+Qhq7cWR8LrCnTUYZ
 e9uBmaADGjveEfEWKMIBZKvqEmMZUemXG8NWyUmSD1cplxR1p/6Fwt2gYEuVuz60US
 qwdkl+shGQ11w==
Message-ID: <810e4833-6052-97ca-75df-a1e86daf405a@collabora.com>
Date: Wed, 11 May 2022 16:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/4] iommu/mediatek: Use dev_err_probe to mute probe_defer
 err log
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220511064920.18455-1-yong.wu@mediatek.com>
 <20220511064920.18455-2-yong.wu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220511064920.18455-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_075349_164857_0E0A2C73 
X-CRM114-Status: UNSURE (   5.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/05/22 08:49, Yong Wu ha scritto:
> Mute the probe defer log:
> 
> [    2.654806] mtk-iommu 14018000.iommu: mm dts parse fail(-517).
> [    2.656168] mtk-iommu 1c01f000.iommu: mm dts parse fail(-517).
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
