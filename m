Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMwnnfGDLDaVrKq3v7GHAURwGcWq8fmRhu5I6GBiEKE=; b=IGYuSQ5J6hZUuZ
	rTzz1DQ0AsCVjtZhlQM82VEXBlUmjcVpHDyVfGE8M3mSJ7exriVeTLYKsvuwDXLLa/BvSMF19ziAN
	k9nP+RUBplBMymZLlzKuRaYWTndidXSHV03yfEWoG2mZSGEUb/zeoxeEDKbP9wHrvEmXWfETM2H6X
	/kDLFP+1e+8lhCPBQfqKmSV8iok/P5MkCvEIZUGwqj6phceIOrNwQWE/pqLCwP9rgnk3FTyFo4fU3
	Xtcnl3PvnAvP9qwoLV30pDjzVurYq7vS+G1R02jvb9AcGJrD9YmrucrGz9FjN3+N74jzvFB6CwS5u
	/dS4QxBrb/Obm1bq9RmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npEf2-00DIlv-Og; Thu, 12 May 2022 19:39:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npEen-00DIa0-D3; Thu, 12 May 2022 19:39:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9771C1F45802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652384366;
 bh=l7sEGPwFChsQe883K+Tm9Z1Antz2QzvNm5fjecKjZro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MiRat4ZX8kCJFkC9cOzTnSv5u0RYAj5LmdftjvZ1b1Pv9LYRgjAST3ZsIo14/Lq4U
 8xjLPDuf16rEYbWZ25pXgAcaLIyyeGdtuKjf8bdi0+QLHfeZ2ohyGerWTSeHNHdDvn
 Ib43klOczH6uRZgywp9LsyfFRvRH5pfDlwqHlIFO9rPjL1/d8B+vK5eaeAYN3qQWRG
 KmTKJRc/r1PjnE4gZJAQXS4FtikcBXIcjODVsKltLiZMdBActDruHRZc1VVFXM/ONE
 +prPluUCKcrIuhvfPHz0j9YwwJRP7A5AFJQEal2Gv8u66T2XYwLMr9+TzLghEU447M
 nNJXeXWcALSOA==
Date: Thu, 12 May 2022 15:39:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12, 00/17] media: mtk-vcodec: support for M8192 decoder
Message-ID: <20220512193917.tu6waopwagm3oyaz@notapiano>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512021950.29087-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_123929_593430_83EE498F 
X-CRM114-Status: GOOD (  14.51  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 10:19:33AM +0800, Yunfei Dong wrote:
> This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly=
, refactor
> power/clock/interrupt interfaces for mt8192 is lat and core architecture.
> =

> Secondly, add new functions to get frame buffer size and resolution accor=
ding
> to decoder capability from scp side. Then add callback function to get/put
> capture buffer in order to enable lat and core decoder in parallel, need =
to
> adjust GStreamer at the same time. =

> =

> Then add to support MT21C compressed mode and fix v4l2-compliance fail.
> =

> Next, extract H264 request api driver to let mt8183 and mt8192 use the sa=
me
> code, and adds mt8192 frame based h264 driver for stateless decoder.
> =

> Lastly, add vp8 and vp9 stateless decoder drivers.
> =

> Patches 1 refactor power/clock/interrupt interface.
> Patches 2~4 get frame buffer size and resolution according to decoder cap=
ability.
> Patches 5 set capture queue bytesused.
> Patches 6 adjust GStreamer.
> Patch 7~11 add to support MT21C compressed mode and fix v4l2-compliance f=
ail.
> patch 12 record capture queue format type.
> Patch 13~14 extract h264 driver and add mt8192 frame based driver for h26=
4 decoder.
> Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko

Hi Yunfei,

With this series, and the new scp.img for mt8192 [1] (still waiting to get
merged), I was able to get the following fluster scores on
mt8192-asurada-spherion:

VP8: 59/61
VP9: 249/303
H.264: 92/135

So for the whole series:

Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.ca=
mel@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
