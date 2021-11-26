Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80348C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IXJtwCp8V/03NxiFMplRfa1vFdzM8WV9opNDG65tSQ=; b=bBVjJoh+F04VpzgTmauYahKYGS
	OzssyV86dgG9ycG6MfZXJnKP6iuOJyl62BFLbiHZZkgV1OH2PC/lIM6LGUBoY5g8RT1tzJtqH+cM0
	/Lvf5a4U6GjI2f3+Z1W18sJe5OdBibUK6xpF7cWCuNtcihcWssVJUC3XyOmmECJksa+K8K1DXqozj
	w5XfC9bGv/1oT7cpI2RNgo3I3i6Vorvk6RSS8Puawq7/jlSft0tjeNSkZ2BUSmNl2UAR+vwx/ESPg
	VTsXzjHfZTwsR1Qx1o3qNZKxwagq7L/x0fdBnTzCokbRj52jkIuTvQwC6VL8T5NMxqdrxX8nFu5Wl
	maWzj9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXvr-009ocJ-BL; Fri, 26 Nov 2021 09:54:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXuU-009nwJ-O5; Fri, 26 Nov 2021 09:52:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 197401F467A2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637920369; bh=zslmW9/PFiYDQ+DRo3zkfuW6OCwzVJ/ZFwDUVo+hOCM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VRoNhI8cdNgWvKGTf//ErjUq8JQw2dZultSRKAjLrzTbFCfIsM0Mdc+owr4Genbhe
 xmEcxKK2pFswEOuOepmhTfRtDd5xQMt91xCF1meAFcNHqj3OA7NXm7rhMEdv2b23Vz
 pDdymjSGAO/QlE3W6Nzhu+/UEECfEYySoO1795IJo/RGVpb3aMjnnpJUbhr+BPbJuY
 FB+qCBiOzOmVupGVzOtPIbEsAR0TXhhAYITLpfagsQhXIXgbS+SGS3KZzP6VnXMHtb
 MbZ5gLdU/+mA4GRIZbMqKLkb5CmysYTYf12GOmb2fCnMQkXazuMcOQ9HtQxldv9VY3
 /C7bCaXRMHsyQ==
Subject: Re: [v6 2/5] soc: mediatek: pm-domains: Add wakeup capacity support
 in power domain
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
 <20211116025045.5401-3-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a01440d6-39e1-a346-3d48-53a9ba0fec64@collabora.com>
Date: Fri, 26 Nov 2021 10:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116025045.5401-3-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015250_982619_6470DEEE 
X-CRM114-Status: GOOD (  10.67  )
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

Il 16/11/21 03:50, Chun-Jie Chen ha scritto:
> Due to some power domain needs to keep on for wakeup in system suspend,
> so add GENPD_FLAG_ACTIVE_WAKEUP support in Mediatek power domain driver.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
