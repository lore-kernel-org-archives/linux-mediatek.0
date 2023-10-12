Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EBDC46CA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uzJdD9EnJYoFGXNEQeQiThsmnwqPchhQD9Xsg4JKR4=; b=lNHOh/NVphBjqw2PQowpzJfPBb
	oDM81RltedAf9hb356y4L+50TYQqnZs1CzLgARnx6HwAs/izuSHtfxIqfqEMrhjZZseNprsP7SiRl
	ozkw9AbHXCqbJ0nJAhcCF9zg//heO48hHL76ORR6nPwfhpTQ9WESRRkZVij/Rd2g4778KVNvdm8XU
	JqleaySJl7dhv4e8bR2Tr+qgA0Aoecg7FCb1aI+HN3qkF/iAu56MEWXaFYe1Ur9we3O50XCCbodyY
	9BTTLXlfIg+mgbDWnXxCU5in9xGJVFnZ+X7MBWQg/DW8nbt0WYF7HxIn5AYEt0Zk8yc1G4/TmLE3m
	QdKICIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsWT-000VQK-34;
	Thu, 12 Oct 2023 10:02:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsWP-000VOu-2z;
	Thu, 12 Oct 2023 10:02:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D887F66071A3;
	Thu, 12 Oct 2023 11:02:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104944;
	bh=m9OfIh4qBSX/4JsExhLjoNnCHZqhMXqV3D0UdQP9C4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oOYVxnL7i9TfhrFJngxiI0cjozeNstGQiGVRu9uqDccAPrpSgdmGL7AOUVUHDTJtV
	 fBrxu6JUjG/l8YAlW+RHOSc1beVGcErH73WyvklEfa3hOzYt0wVlic0gZvMW+U4VWA
	 SpJjYneXMzhr+ssMqvJuztqFCFcjz+am2WQPM0hmOhPnBcntINI29IR/6/Z12/5HqR
	 A3iInsIMJXBoFLm9Ff/RxngBfa3uMctrouaqNaPC9Fz7sVQ4dniIf+dXns2CDOQSeO
	 nH9T6hYn3gPeUx2QNRR1QSMcMucaV3LJ/TN67VPBlN9e6mNxMwx1/tEBKsDJd7uK3X
	 RhflYV8jpt3wA==
Message-ID: <dde9719d-e8a9-1bcc-3533-56667aa7ca87@collabora.com>
Date: Thu, 12 Oct 2023 12:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: using encoder device to
 alloc/free encoder memory
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231010122010.25937-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231010122010.25937-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_030226_096048_30B1E1DD 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 10/10/23 14:20, Yunfei Dong ha scritto:
> Need to use encoder device to allocate/free encoder memory when calling
> mtk_vcodec_mem_alloc/mtk_vcodec_mem_free, or leading to below crash log
> when test encoder with decoder device.
> 
> pc : dma_alloc_attrs+0x44/0xf4
> lr : mtk_vcodec_mem_alloc+0x50/0xa4 [mtk_vcodec_common]
> sp : ffffffc0209f3990
> x29: ffffffc0209f39a0 x28: ffffff8024102a18 x27: 0000000000000000
> x26: 0000000000000000 x25: ffffffc00c06e2d8 x24: 0000000000000001
> x23: 0000000000000cc0 x22: 0000000000000010 x21: 0000000000000800
> x20: ffffff8024102a18 x19: 0000000000000000 x18: 0000000000000000
> x17: 0000000000000009 x16: ffffffe389736a98 x15: 0000000000000078
> x14: ffffffe389704434 x13: 0000000000000007 x12: ffffffe38a2b2560
> x11: 0000000000000800 x10: 0000000000000004 x9 : ffffffe331f07484
> x8 : 5400e9aef2395000 x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000cc0
> x2 : ffffff8024102a18 x1 : 0000000000000800 x0 : 0000000000000010
> Call trace:
>   dma_alloc_attrs+0x44/0xf4
>   mtk_vcodec_mem_alloc+0x50/0xa4 [mtk_vcodec_common 2819d3d601f3cd06c1f2213ac1b9995134441421]
>   h264_enc_set_param+0x27c/0x378 [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   venc_if_set_param+0x4c/0x7c [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   vb2ops_venc_start_streaming+0x1bc/0x328 [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   vb2_start_streaming+0x64/0x12c
>   vb2_core_streamon+0x114/0x158
>   vb2_streamon+0x38/0x60
>   v4l2_m2m_streamon+0x48/0x88
>   v4l2_m2m_ioctl_streamon+0x20/0x2c
>   v4l_streamon+0x2c/0x38
>   __video_do_ioctl+0x2c4/0x3dc
>   video_usercopy+0x404/0x934
>   video_ioctl2+0x20/0x2c
>   v4l2_ioctl+0x54/0x64
>   v4l2_compat_ioctl32+0x90/0xa34
>   __arm64_compat_sys_ioctl+0x128/0x13c
>   invoke_syscall+0x4c/0x108
>   el0_svc_common+0x98/0x104
>   do_el0_svc_compat+0x28/0x34
>   el0_svc_compat+0x2c/0x74
>   el0t_32_sync_handler+0xa8/0xcc
>   el0t_32_sync+0x194/0x198
> Code: aa0003f6 aa0203f4 aa0103f5 f900
> 
> 'Fixes: 01abf5fbb081c ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")'
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino@collabora.com>



