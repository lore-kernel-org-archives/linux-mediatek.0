Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE3BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uconu/P0XZ9MlZVxSW8wgzKaWLUZQMuv1WUH/3ll5+4=; b=sB6y41CHivHuyT
	v337OCeq5WyPT6++Okeq1OKbFd1OYGFSwz9jJ8HR77uSeep/t5HjQVY32OahX3T1s3AfVqEKPfvyF
	+ab6FJFDqMJGyoYJ04d5r2pPw02dWKL4EsF4v1uB/aSrk+XM2OgYQXhQLdCa6jWSoORDVmFU5D0Hk
	EIdssI3FO3i/lcu4PUueTunkEqammQ6dlajkAF4KaMN8IE/6sXfzzKgafDQFQxeqdzHGJR18C2lvZ
	1ABdMYXMirkXdSjtGszrdFFhmPzLadZ5rbO0wgKsOy+FN3DU4Bd34VRsERHVaM3WtDDjeLyb5hd5+
	X+Qky0BtByV1ptlt9GJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRG2y-000noz-LA; Mon, 07 Mar 2022 16:17:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRG2n-000nlt-Bo; Mon, 07 Mar 2022 16:17:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF8D2B81606;
 Mon,  7 Mar 2022 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199FBC340EB;
 Mon,  7 Mar 2022 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646669826;
 bh=g7AkI7UmXjqtWe/0nY3r8R1FTcT6BYIuEgvHT7ed2UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jS6bdkyhDdnlOXciwJ71UjeRz7uCXsBTwcyBL4m2+vLZ4ALa4/pak7K4FPM7Wq219
 lKJ1PnYnJxd53MhCWcP+teEm8/DLCWSx7H1oI0yMOWDo62iVT81CcVJ1EaU8c6aPI2
 VPUBC8hpzXR4POlmZbTWFnkFWCGWBcJIAsDqhphs=
Date: Mon, 7 Mar 2022 17:17:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
 slade@sladewatkins.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Hou Tao <houtao1@huawei.com>,
 Christoph Hellwig <hch@lst.de>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
Message-ID: <YiYv/4EIrx4AV6wi@kroah.com>
References: <20220307091702.378509770@linuxfoundation.org>
 <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_081709_561991_10A55CCC 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 07, 2022 at 06:30:18PM +0530, Naresh Kamboju wrote:
> drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_host_attach':
> drivers/gpu/drm/mediatek/mtk_dsi.c:858:28: error: implicit declaration
> of function 'devm_drm_of_get_bridge'; did you mean
> 'devm_drm_panel_bridge_add'? [-Werror=implicit-function-declaration]
>   858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
> dev->of_node, 0, 0);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
>       |                            devm_drm_panel_bridge_add
> drivers/gpu/drm/mediatek/mtk_dsi.c:858:26: warning: assignment to
> 'struct drm_bridge *' from 'int' makes pointer from integer without a
> cast [-Wint-conversion]
>   858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
> dev->of_node, 0, 0);
>       |                          ^
> cc1: some warnings being treated as errors

Offending commit now dropped, thanks.


greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
