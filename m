Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB67C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+fZNRhAhugWRpwZDm9hu5xVlbKhnZb2Euy367chw0E=; b=fBr9rXMF+g9ZEc
	4i0hHlRUOJgDbStMRG8OBKLHhRtp2ro5ogA8/do7S6tj1RGOfGaNjWdPVqVp0ruoMMGhLtZ/V6hbE
	V8nKK4eVr9O1qVsqAy0MGpOUq0qW+Louggr/2xNR/pxAliD4das0Et+MXr3+IYQiIKLGxIWZ2i39L
	geDgfeT+FizNO+Gz+5+8i1qurgeU9p2HBTG5JDVF9N9WI2cHp44GSAoJkLHmCf0PpoUY3Dmv6vMZI
	d1asFZRTCYdjJfu1DHwBYFe1Kc0MPDrximk+9xSLNvldkEihtUMNfy84h5Xb6y8hn4wMOrk7iZMPO
	AYPAjOgHY1+KouVUwZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntnwY-00Ah70-N6; Wed, 25 May 2022 10:08:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntnwN-00Ah3n-5H; Wed, 25 May 2022 10:08:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 968391F44BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653473309;
	bh=f7K6y+dJjMBoG72vq/rLJZEBSpBO8+vaOYzhtZ/0Lls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KMyTR4v/JWGVhJKk8F7Kdw/mFlyVJgFd4MfDTQIIS7bjrD53k8B3IpL0ilhdwuPS8
	 hdm4xxgCAWA8PaU5bE9mLyfPPO1XBZWqYpHt1ZZuDYqvBynJfAVQhTJOFP04DvutTt
	 6eE528/1CT/39gQnZP+PsH3AYSohwz6tk+QEzFrMqkXTzDKrjVFaLmuf73Xvn4q6eg
	 YwXptzgTCh2d3GMQQh5soNMjNe9tSOqQxAhchyITrk+m9GRLVdSECYZ3R/U3o9xrO/
	 PMapcVFMXP3AZ0/2/cqdonoKvv/DkHkul+lKDM27wDMcsGXBeQwF1e3Y3JBJmBsRBU
	 h6NY3FQroIg0w==
Message-ID: <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
Date: Wed, 25 May 2022 12:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v21 00/25] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy.Lin"
 <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
 <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_030831_388099_A532FA51 
X-CRM114-Status: GOOD (  16.08  )
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

Il 18/05/22 04:47, Rex-BC Chen ha scritto:
> On Thu, 2022-05-12 at 13:31 +0800, Nancy.Lin wrote:
>> The hardware path of vdosys1 with DPTx output need to go through by
>> several modules, such as, OVL_ADAPTOR and MERGE.
>>
>> Add DRM and these modules support by the patches below:
>>
>> Changes in v21:
>> - fix reviewer comment
>>    - fix rdma and ethdr binding doc and dts
>>

..snip..

> 
> Hello Matthias,
> 
> Could you also spare some time to give us some suggestion for the mmsys
> and mutex patches of this series?
> If we can improve anything, we can do it before 5.19.
> Thanks for your big support!
> 
> BRs,
> Rex
> 

Even though there may be something to further improve, keep in mind that we're
already at v21... that's... a lot of versions, and vdosys0/1 are practically
tied together even though they're coming from two different engineers.

I can confirm that this entire stack works on the new HW as intended and that
there's no regression on older ones, so on all patches you can add my:

[Tested on MT6795, MT8173, MT8192, MT8195]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


.... BUT! ....


This series won't apply cleanly anymore on next-20220525 (same for vdosys0,
already pinged Jason about it) because of the commits adding support for MT8186,
so *please rebase this series once again*.


Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
