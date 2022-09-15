Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32D7ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 05:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/eK0cfbxCIDrkJpxpNUKq8DfD7I1QFLOHC7/nfS/3o=; b=pvA9cVvEXri/N5ClYmmITqHznL
	zkGcp2trWa3jl0uZmGaZq0iWIIXZS59l9dRKCnr9+dMUrwuf6HVJfHUwZSJHuXJP3Hn/1lFfreyav
	H069j5BJenFkc7r3QxdZ6mkWSOGW/JKC95iz+ISkicp2fFW7Vc3exN9myh93wstx2G4BoJME2zD8f
	Lmy0aNKsTkQEHm5jlJdKb5jrSZVq8tGLaJfcYFpLC0ry1VOUvCVR4oYdLoGBls8CGOAq3JvXP3QdO
	uEzryoB9zwMqLSjiIQgL77Tr6fKkrPJ1ct5KHDjAFqyWMJ61i5d8s3mYPHX9VBg0HGxGOxCjZP/Qx
	i3gIcKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYhHu-000IFN-Ij; Thu, 15 Sep 2022 05:19:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYhHr-000IC6-QE; Thu, 15 Sep 2022 05:19:45 +0000
X-UUID: 211504373de048398ce0234c662d16b5-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:Message-ID; bh=I/eK0cfbxCIDrkJpxpNUKq8DfD7I1QFLOHC7/nfS/3o=;
	b=dmn+CBxXltA8CLcFtZ+rGyEmzcSV/fz6VPlKGKEU4uGf0I95H5KjWcHIsiK64cmMthWvfM6s6q9T5yKGzV84EVyZMOgTaQfxIBeMSMebcmHdeGXR7iakLsVY0YLnfS/aMGTXOmwnVTcg4v2iMDim1wcYC/8UFKyT/3bLt6Fo0+o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6c638082-a101-47ff-8374-49015b2d0dc7,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:39a5ff1,CLOUDID:f67078f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 211504373de048398ce0234c662d16b5-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439499084; Wed, 14 Sep 2022 22:19:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 13:19:03 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 13:19:03 +0800
Message-ID: <03cb748c-4531-9669-faac-7e975855149d@mediatek.com>
Date: Thu, 15 Sep 2022 13:19:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] drm: mediatek: Fix display vblank timeout when disable
 dsi
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
	=?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
	<Allen-KH.Cheng@mediatek.com>
References: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
 <0723c329-475c-42a1-f6d5-f478d649aef1@collabora.com>
 <64bf6d7b-5a28-9b7d-fc3e-4c3c8eaa7d25@mediatek.com>
 <3dd03eea-84cf-73bc-0bd4-3450c44ac8ba@collabora.com>
Content-Language: en-US
In-Reply-To: <3dd03eea-84cf-73bc-0bd4-3450c44ac8ba@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_221943_871114_48188315 
X-CRM114-Status: UNSURE (   7.14  )
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

Hi maintainer,

Patch v2 has been sent to [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20220914140031.18578-1-allen-kh.cheng@mediatek.com/

I'm sorry I didn't reply to all the email lists in the initial reply.

Below is the most recent information.

Thanks,
Allen

On 9/14/22 21:34, AngeloGioacchino Del Regno wrote:
> Il 14/09/22 15:30, Allen-KH Cheng ha scritto:
>> Hi Angelo,
>>
>> It's mt8186 corsola board. When this problem arises in system
>> susepend/resume, we have your fix[1] in our dsi driver.
>>
>> Because there is a conflict in mediatek-drm-fixes,
>> kernel/git/chunkuang.hu/linux.git.
>>
>> I'll assist Xinlei with another resend.
>>
>
> Ok, thanks for confirming!
>
> Cheers,
> Angelo
>

