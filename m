Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BFDC54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8cyqYo40oVmVrkI6UZXCWF+VVXG+4qyo86R44MmhfI=; b=IE+zcrRgtTPXbqJBfd+mJ6YCuT
	fJNPNIFg7pJdiPk2WaRsMa3Erp1iRiAPQwD5oI3/9ZBIXafAlRy3vzc2eoo9bAVeKfqq6wa94nQJB
	dZk+U0FkferW3QGWwS7+oLW6OCnzsTRJy0qpM05tgp1OgTBYG7p5jchPnFQUf4e/TtYjKA+PuU3qK
	a7rEgrygdv81RnH4sic7Rvd46ji/kjjIXUurnBVA63jtrzrDEEaJA1ZZKe5EFbm6UB55MTxCMCY8i
	mZ7fuWV+OpD3+bqGESq37JrHJ49u9gWxp+lUr7D34AGOP37733AFwkAfovr9dvUqnTxjvufaYF2Ao
	fMq63tKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5fR-000000001Au-3r8W;
	Fri, 15 Mar 2024 11:24:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5fO-0000000019e-0kyj;
	Fri, 15 Mar 2024 11:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710501840;
	bh=uABvPXOqq/Tla+Cl257JwPcyrRf1VhVmEZ2NakP1f7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MsfFOs2ZYu+BQgQDviu0tZEHVVU8he4yCSLf2PFK5ZcEkAh9y/w+V0kUvefrTlE+i
	 BVQO+/8MmT/ZloAKZNC9kOl74Ju83Uk9kybn/K8qLVeA2yu8NI7/3IVTB1E14OMBGt
	 FefOx23cfRZ1N095xm64zGX3ddp6IBx6j1MSebmoYWc1SKYt1T6izxYd2QuVNrk3JV
	 Kblz3U7J4V9jPqFD9czrxC8wJkOP9ltogw5DLsG64OPzF/HEyM/qEWGUQyqB1Pgok/
	 N9iXEeK15XZ7mmQibOUFVX66F18q1/X6yQMV5orY/j9oz7xsdZM53cW2Rj3qXnfbLS
	 FWtHAJlrROiXg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1575378105A;
	Fri, 15 Mar 2024 11:23:56 +0000 (UTC)
Message-ID: <1cbe364d-465a-ccba-a446-5f98b9e0efc4@collabora.com>
Date: Fri, 15 Mar 2024 16:53:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/11] drm/ci: Add support for GPU and display testing
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <5559672d-4f62-4ad1-95b7-94f69b8bb9ac@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <5559672d-4f62-4ad1-95b7-94f69b8bb9ac@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_042402_417242_5F02E534 
X-CRM114-Status: GOOD (  19.26  )
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

Hi Helen,

On 07/03/24 19:32, Helen Koike wrote:
> 
> 
> On 06/03/2024 00:06, Vignesh Raman wrote:
>> Some ARM SOCs have a separate display controller and GPU, each with
>> different drivers. For mediatek mt8173, the GPU driver is powervr,
>> and the display driver is mediatek. In the case of mediatek mt8183,
>> the GPU driver is panfrost, and the display driver is mediatek.
>> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
>> display driver is rockchip. For amlogic meson, the GPU driver is
>> panfrost, and the display driver is meson.
>>
>> IGT tests run various tests with different xfails and can test both
>> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
>> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
>> This leads to incomplete coverage since the display is never tested on
>> these platforms. This commit series adds support in drm-ci to run tests
>> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
>> Meson platforms.
>>
>> Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
>> tests to testlist. Have testlist.txt per driver and include a base
>> testlist so that the driver specific tests will run only on those 
>> hardware
>> and add testlists to the MAINTAINERS file.
>>
>> This series also includes patch to add vkms testing to drm-ci.
>>
>> Working pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1119859
> 
> Hi Vignesh, thanks for this patchset.
> 
> Just to confirm, the new convention is:
> 
> stages are named per DRIVER_NAME

Yes correct.

> jobs are named DRIVER_NAME:GPU_VERSION

Yes

> xfails files and testlist files are named DRIVER_NAME-<xfails-suffix>.txt

Base testlist is named as testlist.txt
driver specific testlist is named as testlist-$DRIVER_NAME.txt

xfails files are named as $DRIVER_NAME-$GPU_VERSION-<xfails-suffix>.txt 
(mediatek-mt8183-fails.txt)

> 
> Looks good.
> 
> I just have some minor comments/questions in the series, please check.

Will address those and send v5.

Regards,
Vignesh


