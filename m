Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7418C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6QqnbdaU2jjTlr82Rtn1UtW+ZrY5uOLsREXgWq3rVw=; b=jY4Z5fUelxcSLNfAEqOKh8o/xQ
	goUSOAF7EWpEXa5DZfpx6xCjn1qRVSX04agGLkQiXVTXRFrlV08WCC4pyOpPXxsjbNCCe5j6ZbKDI
	qmOm3wJiw3H5tvAe5M4aLNVtCg/us6iFujAyrm0OeB0FsFjDJdQlXNnZPtY2GO96JipepqNjn12Nm
	mbnV1eS8p7FWTRBU99y2Px9ER5kRLzYFAbDL5iO82/ufYDXYunI4NQP+jzufBa7KDyzlD16P0HK3I
	WVAYO7LOm00PN07JcuKGj39MHPMeKSuCXzN+OStUY25CaOtMXo2an8RIr9FV3MaSS2OCFw69MI9gX
	24W9CqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4m95-00C4KH-9V; Tue, 04 Jan 2022 15:54:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m84-00C3jB-Sr; Tue, 04 Jan 2022 15:53:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E2BED1F43357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311619;
 bh=s0q2aXCgVOP1TMeaYn3L28dPxxpJ9P6lgrqbXsCq3gQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RCXJrAw3yxSFeCMUvtUGFPsbe+sXWzGQLCxu1pfl+rJXmeoLgDW3MXd9JfV++I1fZ
 eewyegId5i42KbDdiEFfBp26+Ukr0Aq0FcMMFD1lXXIIlWdx+EWiyYZaa45XVzJQSL
 ybptmCdwAIgcc5kJ9IVzie8EmsKK1C23JdhW6eXLDzGWZHQX8MJuq4f7895vpmfQ+t
 M1l9rbOE6o9YqSbM/nbihp/8wHeD9w3WNv2dasqzO8hQVLItfXkFmXjyxW2YXCWb2H
 uSaiV6Vp+JvPzFmc1JdTTtsDwVRwvaQowiHWIVm/M0oENI85bSlZ5wV4iEjiBTg5pI
 Pss4FCpBk5Npw==
Subject: Re: [PATCH v3 25/33] iommu/mediatek: Just move code position in
 hw_init
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-26-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4186725d-07ab-07c1-6c58-7b496fa02225@collabora.com>
Date: Tue, 4 Jan 2022 16:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-26-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075341_125712_354CA772 
X-CRM114-Status: GOOD (  10.71  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> No functional change too, prepare for mt8195 IOMMU support bank functions.
> Some global control settings are in bank0 while the other banks have
> their bank independent setting. Here only move the global control
> settings and the independent registers together.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
