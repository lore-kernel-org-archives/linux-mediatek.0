Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE8BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWShmpqwYW12d0MlgJb1V3XH/oe1CeQcWSK76RGq+us=; b=zhI6/h9RgYRVOD
	nU1y7K7PbyLd/vI5XbTY4zXHgfsQUnJza9obcp5c37rzakreoxwRAocML0essdmr6k1lDiGoU/Bx/
	HxAF8Taz7tadzl8icjicj2HmmdttgcT1wXaILh9RFOQxchOvPi4i718FH8fK9E3WzfECrBQa8db3w
	koETKQb2Kvnz5x6gkaCI2Np1PiBjSNvsaftn4pxTdqDtQPlruHSq6Bi4tHwGnzI2+/T31LinFIWH6
	LRoPDNDB0ZUvVCZCpqZ3eMVVhmIg5VZvT3D9PFsme/itYsjetxf6tvoXMWciW/KmFEvbT9dJR5hHP
	cg8lMZ9GKl4vZpj4K/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWrY-0049V6-Ul; Fri, 25 Feb 2022 09:26:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWps-0048gD-7U; Fri, 25 Feb 2022 09:24:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EF4A81F45AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645781062;
 bh=u9idag57rvmc8+kE2xwXHO4QSmwf2cUfuVZYpVWwzno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HHWrpRKDWWODvpKgHH2FJgoYRczWBTVoDmcsJ+U2u8Xqo6LJt2XZnraOXJYYETihN
 hg3T7TC/JSIXJjq1Z314B3P/rZ/SkucOhzZtf3qRY4kVe6BOebMcswRYwEsD5oKJGb
 SUlO7LNPCnyG/O1XvC9dESgyC1ZcYSXHF1vM0piUlEGYLVFjWub+tOFcqqilkm1CWL
 yqsipCrQwrnh3Icd1weux1eKwl5VO7wKVc1uIhcdfU00QzeoFbT6S3bMGUyCRiOSoD
 QOr0dW+2w6ppmynj2Qhb4dkptB4Sj6YEGP2Lxf2VC6/uj6wVnhObM1FwrS/FG2ziV7
 R2W5gl8OWHw6g==
Message-ID: <5d87e367-4ca8-9f61-bc17-e1998be0ed6c@collabora.com>
Date: Fri, 25 Feb 2022 10:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: record capture queue format
 type
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-12-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220223034008.15781-12-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_012424_458322_482D7F12 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/02/22 04:40, Yunfei Dong ha scritto:
> Capture queue format type is difference for different platform,
> need to calculate capture buffer size according to capture queue
> format type in scp.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>


This change is ok, but the commit message should be changed to advertise
that this is preparation for the new stateless H264 decoding driver.
Besides, I suggest to reorder the commits sequence, so that this commit
goes in between "Extract H264 common code" and
"support stateless H.264 decoding for mt8192", as this last one is
the actual real user of this change.


Anyway, this is my commit message proposal:

The capture queue format type may be differ depending on platform:
for stateless decoder drivers, we need to calculate the capture buffer
size according to the capture queue format type in SCP.

As a preparation for introducing drivers for stateless decoding, save
the current capture queue type on a per vcodec context basis.

After fixing,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
