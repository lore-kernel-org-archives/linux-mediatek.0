Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B68D75BD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2024 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh2oR25OKfV052f5r33BCNQCzsbjYLkcc7FoBGq8/7g=; b=DnlieN/mCdy9WcBctJa6XwadeF
	5qUyZqCsk+xzKcUtNEag6x3SHOzaOw/eHqEx8HHa+e9/W7m/nf9V+uVMSk9YH8mjbMF1eTn6IbDhf
	y37quaaCt4pGBELmfPRoU52ZDYFyba8wJS58vdwGmrIJVvYbv+9ckEmNNDc8FveBxd+dUuCK5FAK/
	+HeFHoh0HH+wuPY9z6UOTKk76zHENNp9Nlb6e3C8IqBXoj9/oiOTLwruGkR4dpPDp43/uq2zpJerV
	5fMH/xv4y6BQhQ0otjdYoClyb3T2pKTkuutcTDtdniq1+EKYkmrWcsIZPgyyE/WWiSRQ1ROvX7PDq
	hnz30LXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE32e-0000000HAMh-1WCs;
	Thu, 21 Nov 2024 09:00:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2y2-0000000H9NC-0g5U;
	Thu, 21 Nov 2024 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732179311;
	bh=esX6pNIA4mdgAouLBmxFqcD5UvWUX2OcANV49HJchSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MAU3vaThPKsD/1L/Zm+bwQdn1YX5Us5vGulfNUH3TnJIcJ8/hqH9BIhEw7XxzfyoU
	 Q1XUAf78dZwv9qYtCoNjJ7Xe+bgjm4OOcoqXtdgTs8ZlNlHQ/IMtZcfTKptZbt3+V0
	 r6U7/e0oDlT0Ulim2IXuDb3bxcWCF2iRNfowHVzrTfDjq1TZS8F7myWw3Bajp4DxXZ
	 5dXKJAf53L+C97Qo3P1MwZbkg+Inw7SQhewVYvMKs6lGtvIFldKjoaqII01ahDIrfM
	 rWWScEjKE3oG8DzOsLy35mai5+Ac2hmErQ+KcijVRs+HmxAMVPNJ2lRiBCjgjNnTWv
	 k1QG2KiWg3cag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A81F17E132F;
	Thu, 21 Nov 2024 09:55:10 +0100 (CET)
Message-ID: <72c1e62b-0bbf-4213-adbb-972caa1ebfee@collabora.com>
Date: Thu, 21 Nov 2024 09:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Add GCE support for MT8196
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Moudy Ho <moudy.ho@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_005514_400064_7D18B59C 
X-CRM114-Status: GOOD (  17.44  )
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

Il 21/11/24 05:25, Jason-JH.Lin ha scritto:
> This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
> driver and related subsystems. The changes include adding compatible
> names and properties, updating driver data to accommodate hardware
> changes, and modifying the CMDQ API to support non-subsys ID hardware.
> 
> Jason-JH.Lin (8):
>    dt-bindings: mailbox: mediatek: Add GCE header file for MT8196
>    dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
>    mailbox: mtk-cmdq: Add driver data to support for MT8196
>    soc: mediatek: mtk-cmdq: Add unsupported subsys ID programing flow
>    soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
>      address
>    soc: mediatek: Add pa_base due to CMDQ API change
>    drm/mediatek: Add pa_base due to CMDQ API change
>    media: mediatek: mdp3: Add pa_base due to CMDQ API change
> 
>   .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |    6 +-
>   drivers/mailbox/mtk-cmdq-mailbox.c            |  107 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |    4 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |    4 +-
>   drivers/soc/mediatek/mtk-cmdq-helper.c        |  133 +-
>   drivers/soc/mediatek/mtk-mmsys.c              |    1 +
>   drivers/soc/mediatek/mtk-mutex.c              |    2 +-
>   .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1449 +++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h      |    3 +
>   include/linux/soc/mediatek/mtk-cmdq.h         |   22 +-
>   11 files changed, 1698 insertions(+), 37 deletions(-)
>   create mode 100755 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> 


Hello Jason,
I had a fast look at the changes that you're proposing with this series.

The reasons behind this are more or less understood on my side, but the
actual changes look a bit odd in the sense that passing a physical address
like this, on a first glance, not only looks like it may be dangerous, but
also looks like there's a lot of room for improvement.

Can you please point me at some driver/code (or a reference downsream kernel
for this SoC, which would be even better) so that I can take a look at how
is that being used?

Thanks,
Angelo

