Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C12BC83F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jul 2025 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iC/l4XxmutWrc77f9BjRpEKfr6YM/SjaJO/m9nX15o=; b=hHcS8d02QJT62f
	smETLDC8VIBBra7vgmENrWxZe/q5tRWRASRDo14W5t7GCemHFszopWwVbAlPzTiBlE4gC1ywWveCR
	dLmhnCEVKbkuGx2n1QaWATALQWH6KHqQkKqDCxHJoYQsQiAruw2YoSCAFl6G1VNDzGaoD6gj5pc5D
	/wtZ8VPQtDIK4VDz1bN0/5msTk8eFW/L1tZBoCHZQbySRNnY4zZe8FkMM6Tl/QhFd8+CdyL+AqINz
	quQqpNLtw2L5aABiiel7LlIZ9RRrEfu9RAR+ueetj7j/Pe7l8cM0SNe81L9LQ2zkzlmI/a88AZqmB
	nmu3W8HEvEf62gPWJKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugha2-0000000GWoa-1xI9;
	Tue, 29 Jul 2025 10:29:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughXY-0000000GWRj-16ts;
	Tue, 29 Jul 2025 10:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753784794;
	bh=eOtAjkutcfTgfbsTp9YZ6t3LmyaglOAeVM+Ud2WX8gE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d19DDHnJYY4lXlvk7kWjbkvAlwGGfW/DR+TRQrOgBAKEbu8d59K9iyog18odLNH/d
	 MWYHoP3lE8vm8KzH/oJj7ZwoY2/33e5+mwrdrMVMbQ4OuxAIkcPyhZo+YXGuQJdfAG
	 JQJ7+t5beFEpbT7Q9zkzJ6x9SGjONFgoBASVhsCPAEf8jPo43OAv4/G94B1vgwLgvg
	 qOlHU8taa5oXeZcC0J5TdyQHq7Tz7e2swZYi0sGHZUM1ux0NUvSVRpxcYg18rvFW7f
	 qmEH9vrLwewjMmSaOq8eVQS6g5ZeD7BYSSwGmgVRJzY0AsV4T6GBOHe0ZsaivSAGT9
	 gFxMdntqqBn5A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C92717E1315;
	Tue, 29 Jul 2025 12:26:33 +0200 (CEST)
Message-ID: <bba7ff19-8ce0-406d-b2a1-4489858fdb33@collabora.com>
Date: Tue, 29 Jul 2025 12:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] drm/mediatek: Add error handling for old state
 CRTC in atomic_disable
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>
References: <20250728025036.24953-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250728025036.24953-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_032636_482633_C1D0D2F0 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: Xiandong Wang <xiandong.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Singo Chang <singo.chang@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, linux-kernel@vger.kernel.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jarried Lin <jarried.lin@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/07/25 04:48, Jason-JH Lin ha scritto:
> Introduce error handling to address an issue where, after a hotplug
> event, the cursor continues to update. This situation can lead to a
> kernel panic due to accessing the NULL `old_state->crtc`.
> 
> E,g.
> Unable to handle kernel NULL pointer dereference at virtual address
> Call trace:
>   mtk_crtc_plane_disable+0x24/0x140
>   mtk_plane_atomic_update+0x8c/0xa8
>   drm_atomic_helper_commit_planes+0x114/0x2c8
>   drm_atomic_helper_commit_tail_rpm+0x4c/0x158
>   commit_tail+0xa0/0x168
>   drm_atomic_helper_commit+0x110/0x120
>   drm_atomic_commit+0x8c/0xe0
>   drm_atomic_helper_update_plane+0xd4/0x128
>   __setplane_atomic+0xcc/0x110
>   drm_mode_cursor_common+0x250/0x440
>   drm_mode_cursor_ioctl+0x44/0x70
>   drm_ioctl+0x264/0x5d8
>   __arm64_sys_ioctl+0xd8/0x510
>   invoke_syscall+0x6c/0xe0
>   do_el0_svc+0x68/0xe8
>   el0_svc+0x34/0x60
>   el0t_64_sync_handler+0x1c/0xf8
>   el0t_64_sync+0x180/0x188
> 
> Adding NULL pointer checks to ensure stability by preventing operations
> on an invalid CRTC state.
> 
> Fixes: d208261e9f7c ("drm/mediatek: Add wait_event_timeout when disabling plane")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



