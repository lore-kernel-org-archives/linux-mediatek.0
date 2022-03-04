Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A07FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3g+nSGWZsChU59kIVNDopJGKmAsJgrP8eQr+YAKhJY=; b=xwEn4dwtsOSr2A
	1dUPiUZMEyvKxjBmoJwKDvzeacxfKwqT5pM7v8MpIpJPF6y6D9jpMxX7Fnbp2AVXY/0OvS24BaoHk
	dS5aGL1bYEE9dij1bPpmFM0n3lZCzAhDXZUeQmrZ06HNoawIGpirDKIrehF3cv3bWBYZwgmUrhaHD
	6lWDe1PJ7ORHxe0xbY0aI2BkR7D5dfZKx7EVy/Ykv+5w0oGRzv0E6XWnztlvhj53BH3hx7djW16F1
	MtkIpt6OYvK6LO0OQt4/HDC4RJt4YSJzjwDLRyXrmZklZm4f69sFnl4GTpQdEGQ2IoB3/F+NMHdiv
	rFuPFU336a/TMK0zob+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4rB-009VSy-JX; Fri, 04 Mar 2022 10:08:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4ql-009VI2-5Y; Fri, 04 Mar 2022 10:07:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3D2CF1F464FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646388469;
 bh=FZsV9ba/xuMDKrYCeoG5kKb+WB3TEznV+q7TAKpo3JE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z/+HfKH6m2gMYR33+DYiAue+iFGOvhah5GOHFpNlKFJqMG4MOd1VbxxrERk9rfAtu
 8/Qd1FnQpl8UrU1lpchE1zxVjdxc8M46oXrPWgg9e07c8pGsGSItv44kp+mT8vkxiC
 GqKMLEbT6u0aMosmlCZK3J02q13Vcqt7xl1S3bzZ9gL6QZxwDFnYoCzJHth9SqmKt/
 zdAo07VBT2F1Sy2xWlemRsHGnyl3/3GjNVh2dW1sF+CDd8leaItHUb94UDOyyT6Uvd
 3vidqdgIrB5sogWh7aqmnt7IJTQxNQiO/aLZ9ww7dxnQLDl/Z50tobHcx3MmMwzheE
 MK7tpc8yctI2Q==
Message-ID: <6b1bd27c-d371-51eb-d166-575312d8506f@collabora.com>
Date: Fri, 4 Mar 2022 11:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
 <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
 <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
 <YiHZ4lq2QClkdyxS@8bytes.org>
 <123cb154ca0e87504c2b663ebdca2ccad967776f.camel@mediatek.com>
 <YiHkhERbAY8oYRYw@8bytes.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YiHkhERbAY8oYRYw@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020751_431615_86735E2D 
X-CRM114-Status: GOOD (  10.26  )
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

Il 04/03/22 11:05, Joerg Roedel ha scritto:
> On Fri, Mar 04, 2022 at 05:57:19PM +0800, Yong Wu wrote:
>> Thanks for this info. I will re-send this patchset after the next -rc1.
>>
>> Could you help apply Dafna's patchset at this time? This patchset
>> depends on it and it won't conflict with the others.
> 
> Alright, picked up Dafna's patch-set.
> 
> Regards,
> 
> 	Joerg

Thanks for picking Dafna's series right now, this was very appreciated.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
