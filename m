Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAB1C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkAuVLc8+00YmHyXgUrycJdbrblwoJlPKtNdcbETcXk=; b=gtNWCMlf121/R88QXz9ayPbJaT
	Z9jAuQDlzIW8dcjZFDQpuCSPZVpQdf/x5Su1LK0BnE5QZHVDSpxicoAIChK9InWhmbYK1Np1G0rKN
	TBmhSvr4IC7glFJckQiWccgDjEBpgu1yABpodaflC1iGtOBvVAcHpNktkDVwm8iMqtS02/JQ3Y9tz
	LqyNuqbj+8tWntnbWfJaRbnhcZ071PPUO3dV+LC3qPlgqe780h9M3FlskJtexWPRuuy1jIIcnf7zB
	oibTK75uKF9vnblFclj3VXZ+JmYpq5FpbygJIoRtcL49GoZTdLrhAwn2Mey8qkOa6yKPPwm9NVxE7
	M7CfNJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoyS-001rZH-6t; Thu, 29 Sep 2022 08:32:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoy1-001rQ3-54; Thu, 29 Sep 2022 08:32:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B126F6601EE2;
	Thu, 29 Sep 2022 09:32:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664440343;
	bh=BzCgkh7agrO1RG0lHCTr2sYO+CUf+iLH1yxL/52k1as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XWIep3oXSRWI4RxMPsjJSd8aCJm4n+9S0XnuRWgQ4VL9Q/gPc9AjE9UJk78EdSgiH
	 7qw0xQdEARP2NFFD1JjVhM/slx4NciRWQD5ESsf8ujUHaVa2GhhFihYkUk+Gm7qYiS
	 gt/baMDrdvdFZqN7YAZPYpBE9TJgk+DtuTcNDJwk3/pSCzEaLUA4wyHqnnZHFU9/vd
	 i2ab0AIHSf6gExrGaD+loxMwF3DGXLoYOJi9iympXKTrASGRwBQpayhBeoiL9w9xC/
	 0bTYN6sChD49W8fR0yExNCngW8HcVlq0lfSlh9UdlxpT5aowXBc9t3wNmz1swxn7D1
	 dr+/2mL/0d9XQ==
Message-ID: <c448e20e-a3d3-d895-6902-49cf1e174eba@collabora.com>
Date: Thu, 29 Sep 2022 10:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] media: mediatek: vcodec: Skip unsupported h264 encoder
 profile
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, nicolas.dufresne@collabora.com
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220926093501.26466-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926093501.26466-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_013225_363567_062AC4AF 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 26/09/22 11:35, Irui Wang ha scritto:
> The encoder driver support h264 baseline, main, high encoder
> profile, set mask for V4L2_CID_MPEG_VIDEO_H264_PROFILE to skip
> the unsupported profile.
> 
> get supported h264_profile by command: v4l2-ctl -d /dev/videoX -L
> h264_profile 0x00990a6b (menu) : min=0 max=4 default=4 value=4
>          0: Baseline
>          2: Main
>          4: High
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



