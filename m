Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C10CFB428
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CG45aAOFfe8PHxOzrqT1C7cq33Z790UzjgBn6h+hl6A=; b=AF2+r3kS8OtuEmOinXrFR7mJpn
	MYRUvt/N6FUXjilHYKNS8FjBduYdZMC9IKelojAY2dC+DiGLMX/oXNW+7zJjb9QLsdzYVB8i5djHC
	zMH4wXoMHpzSDsioGFKLKql+XMhF+5wvoXzKn3aHlXqOwNaTqfRzTlcjlWisOEXCgHFqaUg1jyaCm
	YeD142eY36Q4TJv55nJ0EhRRGwRqYwgCJwcE2u/0aflHiBmvgCsS8kuKmxxkuWq6bwTHzL0ufJn29
	JvzyOc4YjHWyXq6pMeYR4G6x8e3UtV6HMYNWibL7hCePNYDvenK+vncgca+giGBqP8sYtl1TdREBx
	neBnXpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx8fB-0000000FeTO-3WLt;
	Sat, 05 Oct 2024 17:33:53 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx8du-0000000FeNG-0pfa;
	Sat, 05 Oct 2024 17:32:35 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XLXY45PjSz9tNS;
	Sat,  5 Oct 2024 19:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1728149544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CG45aAOFfe8PHxOzrqT1C7cq33Z790UzjgBn6h+hl6A=;
	b=BsL/E+C4lTSm8/p7F14XCn+dmX+UF/UI3FySuS9/YwaSQHkEuLljfa5S/29Br2cuq9BmO5
	TDJ6ZpZU/ChKgnXFcvsNs+HGSjS/ml35AcSjd6YxTnQ0Mz7k7i5HSzrDM3jtd8z6i7MfBI
	qQ9dA9PKZYlMF5Ep1rxKExLrZo7c6vI1BenSVITe268arVsXym7aP29CB78tipTsF4XoEH
	1qPDrYZ9dM8LjTVdn4ev/zOXU4wJZN8vAQz6wa2iQiSTXtGvyc85/5M5wXeTxgVD7BnAFT
	8vimVUazPlR94Qj+QbhBi9va3ZmwOECVGSFgUCrC5aB0LUzbut9B984cCfSADw==
Message-ID: <fd6fc10e-d0f6-4c53-8561-bdfd047e45f2@adamthiede.com>
Date: Sat, 5 Oct 2024 12:32:15 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v3 13/14] drm/mediatek: Support DRM plane alpha in OVL
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-13-a9d62d2e2c7e@mediatek.com>
 <1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com>
 <49df03e8b982cc5ee97e09ef9545c1d138c32178.camel@mediatek.com>
 <00ebe9ca262b6a95fd726e5be06334b1e923db02.camel@mediatek.com>
 <5975b361-c1b4-4c57-89d4-0d247ae99d8c@adamthiede.com>
 <272b47f0c9e27268d29b58c341e0b48bce7e8e25.camel@mediatek.com>
 <06ed4527-3749-4fac-bd38-d837f1593311@adamthiede.com>
 <f7b4c6601d648e0eba2dc66f0fe1f34ca3d29cfb.camel@mediatek.com>
 <d820e8be-c525-4435-99a3-b0eb076b3282@gmail.com>
 <b8fb4f241b2d248ca4c2c57b98588e1be0642b76.camel@mediatek.com>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <b8fb4f241b2d248ca4c2c57b98588e1be0642b76.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_103234_413195_B0C238FD 
X-CRM114-Status: GOOD (  13.75  )
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

On 10/5/24 05:02, Jason-JH Lin (林睿祥) wrote:
>> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> > @@ -102,12 +102,9 @@ static inline bool is_10bit_rgb(u32 fmt)
>> >   }
>> > 
>> >   static const u32 mt8173_formats[] = {
>> > -       DRM_FORMAT_XRGB8888,
>> >          DRM_FORMAT_ARGB8888,
>> > -       DRM_FORMAT_BGRX8888,
>> >          DRM_FORMAT_BGRA8888,
>> >          DRM_FORMAT_ABGR8888,
>> > -       DRM_FORMAT_XBGR8888,
>> >          DRM_FORMAT_RGB888,
>> >          DRM_FORMAT_BGR888,
>> >          DRM_FORMAT_RGB565,
>> 
>> This is what I get on MT6735:
>> 
>> [    1.729467] mediatek-drm mediatek-drm.1.auto: [drm] bpp/depth
>> value 
>> of 32/24 not supported
>> [    1.737777] mediatek-drm mediatek-drm.1.auto: [drm] No compatible 
>> format found
>> [    1.745943] mediatek-drm mediatek-drm.1.auto: [drm] *ERROR* 
>> fbdev-dma: Failed to setup generic emulation (ret=-22)
>> 
> 
> Hi Adam, Yassine,
> 
> Please try the patches below and check if they can fix the downgrade
> issue:
> [1] Fix degradation problem of alpha blending series
> -
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=893634
> [2] drm/mediatek: Fix XRGB format breakage for blend_modes unsupported
> SoCs
> -
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241005095234.12925-1-jason-jh.lin@mediatek.com/
> 
> Regards,
> Jason-JH.Lin

Jason,
I've built 6.12-rc1 with those patch series applied. (I am also not 
reverting the other commit.) This fixes the issue - I'm able to see the 
console now. Thank you! Hopefully these can go into 6.12?
- Adam Thiede

