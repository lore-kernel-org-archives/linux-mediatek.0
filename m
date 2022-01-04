Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9273C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8x0EReSEJXqshN+VWO3LJXKtCGECGhdmoOacB5sibn4=; b=kDjCmSK+eJLXyFRI/LsooxOWJD
	o+ZhosdfkAPJUvoAmbrxNc/CeN4OVc/lH0divn7kdbU/tupydyeo36B2twlVZ0eO8jPvx3M3xYzBY
	e1PZ9w1KsqY4P1n2hAHMj9Kfzans5yPIoxWVrOprL+88G572BYKqvS4zeQ/4hAnj2A8XyhpC0N7P9
	jOeHn6enXA1DgDfbuLxTkTl+og3NwCx38wMsM07q33PGFMJXRJpkp0cXXPKXH8JRr1zOvHxB9aGqX
	v9dtN7Mr5PxXdwu9gqxDReXgR9NadYvdDgmcq9CXmJVfwYn5SSBhtXLHvgkeukmBmco4tVM/SGyCC
	klcodiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mNi-00CBoE-T0; Tue, 04 Jan 2022 16:09:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9x-00C56f-Oj; Tue, 04 Jan 2022 15:55:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B35BF1F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311736;
 bh=hboQ0UccWWyk5yTva3vHB8Cda2X22RbuvWrIz+nuRK0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jLTzurliT0qIfOEFzR+9yaEiggyTlVDteq69iaFHhXMe8uFqk2zHh2aulUfvN+eIg
 k7s26VHxvNBid6ge3PydVg4I1l7MhtyaSm8eZ1uzjkbtBEqnOCezKT4mutXdYzJF3p
 yFNOimKCbDeoVsquuTZnUGfe9lyGqArZZWEnYZCnJ91KNTcb0UdMYqG5HLMAiDlu+/
 FtCOevYZYrTp4XiEN2UZ1PVHRu05pijNG5pnJnJpaMu3evgJVo69bhxpCq9HN9yMUk
 duT1HwvMYclEr7TQ5ysvYIyKT9/jPSMeYFIw6xkpCNiITpRXV/WIMzVvC1q2d7OvqC
 psbjEotdH+jlw==
Subject: Re: [PATCH v3 14/33] iommu/mediatek: Always enable output PA over
 32bits in isr
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
 <20210923115840.17813-15-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ea6a6cf3-9215-f7f9-d049-afaa3f58a7cd@collabora.com>
Date: Tue, 4 Jan 2022 16:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-15-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075537_993340_7599A044 
X-CRM114-Status: GOOD (  13.33  )
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
> Currently the output PA[32:33] is contained by the flag IOVA_34.
> This is not right. the iova_34 has no relation with pa[32:33], the 32bits
> iova still could map to pa[32:33]. Move it out from the flag.
> 
> No need fix tag since currently only mt8192 use the calulation and it
> always has this IOVA_34 flag.
> 
> Prepare for the IOMMU that still use IOVA 32bits but its dram size may be
> over 4GB.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
