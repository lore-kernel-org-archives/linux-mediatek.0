Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840A5C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX9A3gZvFNdk2JAqR4Ial8X9goWPWpAqjBmh4FNbkC4=; b=4uadbxcNMQrufWEzK0wHRI1Zr4
	4oABAaGlUhuB7dtct9kLSCXdvtF8TapFJ3ZArw0jzfq9bSWaWiO9+E6749LT5jfznyD0g1NxYgztW
	9F1MPSI/Ecz1UndiWtK58uEHPUdLnTWqxJh3vp1SUw2I7vqhJZiRO0Ht58HAi5k4j4olNWsYc4xKP
	QDGw4ZOJHAa0oxaFljLphLC8KAFU4Xs/Qy/zKIxeKCaSs5izbpx1yUrA7heTxmBn32bS4F41sshYI
	jeE2bUoYWwyYUkC/JwmACUaOBdITmP4/LqUcEMcCo4pLEFMIm1QNH0/hryG7AdiHo1nwegiKQw6zV
	L421cXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdIe-003AEJ-O7; Thu, 18 Aug 2022 11:02:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOdIH-0039MJ-Bc; Thu, 18 Aug 2022 11:02:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 70B84CE2033;
	Thu, 18 Aug 2022 11:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FFFC433D6;
	Thu, 18 Aug 2022 11:02:24 +0000 (UTC)
Message-ID: <b0b4ff87-355e-1910-c6d2-a9690f3d7543@xs4all.nl>
Date: Thu, 18 Aug 2022 13:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v25 4/4] media: platform: mtk-mdp3: add MediaTek MDP3
 driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Courbot
 <acourbot@chromium.org>, tfiga@chromium.org, drinkcat@chromium.org,
 pihsun@chromium.org, hsinyi@google.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, cellopoint.kai@gmail.com,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>
References: <20220817095629.29911-1-moudy.ho@mediatek.com>
 <20220817095629.29911-5-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220817095629.29911-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_040233_817738_450FEFE4 
X-CRM114-Status: GOOD (  18.32  )
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

Hi Moudy,

I noticed one more thing (and it is probably better to post a v26 after all):

On 17/08/2022 11:56, Moudy Ho wrote:
> This patch adds driver for MediaTek's Media Data Path ver.3 (MDP3).
> It provides the following functions:
>   color transform, format conversion, resize, crop, rotate, flip
>   and additional image quality enhancement.
> 
> The MDP3 driver is mainly used for Google Chromebook products to
> import the new architecture to set the HW settings as shown below:
>   User -> V4L2 framework
>     -> MDP3 driver -> SCP (setting calculations)
>       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> 
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
> 
> v4l2-compliance 1.22.1, 32 bits, 32-bit time_t

First of all, the v4l2-compliance output belongs to the cover letter, not
to a commit log for a patch.

More importantly, I can tell that v4l2-compliance was a prepackaged version,
but you need to compile it from the git repo yourself:

git clone git://linuxtv.org/v4l-utils.git
cd v4l-utils
./bootstrap.sh
./configure
make
sudo make install

Running v4l2-compliance should start with this (or something close):

v4l2-compliance 1.23.0-4941, 64 bits, 64-bit time_t
v4l2-compliance SHA: 71112d214762 2022-07-28 15:31:13

I need to see the SHA to confirm that you tested with a sufficiently new
v4l2-compliance version. Prepackaged v4l2-compliance binaries tend to
be too old, at least for the purpose of compliance checking a new driver.

Regards,

	Hans

> Compliance test for mtk-mdp3 device /dev/video0:
> Driver Info:
> 	Driver name      : mtk-mdp3
> 	Card type        : MediaTek MDP3
> 	Bus info         : platform:14001000.mdp3-rdma0
> 	Driver version   : 6.0.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format


