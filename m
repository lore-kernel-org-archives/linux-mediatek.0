Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB225C87FD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRPSOb7voaRVvqdFLx28DMfZvOIIAuMgfx/EJWubbzs=; b=jnMl9HHcGHGrlnPQstBcekFh3D
	Z9V8zMvvD+w5zQgOJubPrBWlcVRiWwlsD9Hj4mMbhnRCpvrPA+JeDHPsgiwZTF4vtXGD/DJWLd3J4
	NIf6Iqj3y9Y68bScGgy9YFJRrda8M5NwXre9F17UMmvHzUUo8BE0L63QuYHWMr7vANK1VpaOEa+Lg
	0wB5A0gjKFh3BZY3JutT7FiKRs3RvOI0ZvOSKJBRf4lev3sWRPBmbw9d+KN2tIqiRm5zZFPrNwYy6
	KfMuxHg9gk4MtGuNr5tK3abVuhaV+naz1vdtG+VbwL8HNIZj6YwLp2DbOPxk2rS54fvVdfVixWejs
	GUNbyMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq2b-00000009rwH-20iN;
	Mon, 04 Aug 2025 07:55:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipxd-00000009rQr-3u2T;
	Mon, 04 Aug 2025 07:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754293819;
	bh=BnROzuyXaP1UwzsNHCzraWROM8wBopZw3oc70QdaeLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X7yZLNHLr5r4UBsZrUZv1Fye/q81mMRCYpkb5sYPybsalpnFBh7oVBKEL22Uj+Fsv
	 OAdjfNL3sn+doU+cV8IywTM0GTsdUtBTkaFYv6v8TzdkykYmFqt4QwkiHvuIt+B2Qs
	 fToBWzRC9+/zfxonJUmzfUr2S6v08U0E4y9UlVdzacKGXHYF4vBYkXvfshKcJLfduy
	 mJtSitKhRYiO71CMnuMvOXGLtXyc8oGbPhtsvLHVUjsJCgr7aW+kWoDbtmctSC24K6
	 cYviCWyOellTh9LYIQTy7hFs3Cm8IXtlwqTkuqu+eoLw0+9ZgM0Z2qKexnnn+EYQ4Z
	 F9TjvuSZUm4Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12EE217E04DA;
	Mon,  4 Aug 2025 09:50:18 +0200 (CEST)
Message-ID: <d030ed4a-bb43-4f24-82c9-6106209013b9@collabora.com>
Date: Mon, 4 Aug 2025 09:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/23] Add support for MT8195/88 HDMIv2 and DDCv2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2eq5je6xk4ly5lxijit3ufor7pmm7mgivbuigzr35lrbe2ryvr@3axnsyabigm7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005022_125728_C79565AE 
X-CRM114-Status: GOOD (  12.46  )
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

Il 03/08/25 00:23, Dmitry Baryshkov ha scritto:
> On Tue, Apr 15, 2025 at 12:42:58PM +0200, AngeloGioacchino Del Regno wrote:
>>
>> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
>> the direct connection DPI as found in MT8195, MT8188 and their variants.
> 
> Angelo, just wanted to check, what is the fate of this series? I think
> it wasn't updated since April. It was a really good example of utilizing
> the HDMI framework(s). Wink.
> 

Even though it was fully reviewed, everything but the actual driver was picked
for whatever reason.

I am about to go on holidays for the entire month, but I asked Louis (added to the
loop) to resend the driver while I am away... :-)

Thanks for the reminder and especially for the appreciation, btw.

Cheers!
Angelo

>>
> 


