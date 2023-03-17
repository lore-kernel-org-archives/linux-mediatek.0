Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EDDC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBHyN5k50ARa0cYCmXTiykWHStQgBCEIqWhfcjVfemY=; b=2VTRxjEr0N0aDfNH2QAtWDKPDz
	78rlWkqxgGYbL+qnQQ4Y/D4lyhKKJWM19fWQFb7pCLrHA5P+Ol6Ldt0p3LACD7hHzP85IvYB4cqZ4
	ZBXfGI2VClLLduFnMmNTmtNp5z7F9/0LYGLYZ2bMvqK2FM3UArNgB++paL3irSuSFC40Z5ptOYXn6
	KAjX7wyfa+RTCniznTQ6EUvvTzZZpz5HRbVC4az8OQAfdZK4jsKlbY4xX7CqwTvv8GQK1+IKNAxmO
	sScp3sQvhv8BmbXZDHLrG6GQC6iij4mJ7m/i6V2sq6x5rEqQQyZ6qncQzEcMx6sPJPsvGxVDu263x
	PFelzLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBgW-002Ypd-0S;
	Fri, 17 Mar 2023 15:08:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBgJ-002Yhq-2n;
	Fri, 17 Mar 2023 15:07:56 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8162C66030B9;
	Fri, 17 Mar 2023 15:07:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679065665;
	bh=oDkOpASujwD4omvYh15ZgVx02nJzDslcJUvtWJE8YGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+3fXThjONEiG2GDz0f94e6hUKgev5us7WM1wv9muoN55JAJ1EkRRiy7/AdAYYnjz
	 xu+Cm92GqsrWm/eWOnBuouHfl0ZSju9jqP1SrRpqNYfRstB5dsC8+leTYDz6fPqs0u
	 o/tzh3xzeO7eEnI9g036SAR6q/5FHncyeCYHXKN3Jv+NlSp2zHAnkRwCBU6ubBeQaT
	 SfOrRKRZfYJ6gAl95bWAaqOQ+xW3lOGroCn8UpskrV1boNQ6YQbqp6jGjmXLIBwyar
	 +l7qlVpWRtnYa2XciTvIvz9cpxssH/HhYPAqZcAiwb4QyQPcnMiQ5QBLmHLk+bwWQw
	 N0NyKQIgAMceQ==
Date: Fri, 17 Mar 2023 11:07:39 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4,1/2] media: mediatek: vcodec: Force capture queue
 format to MM21
Message-ID: <20230317150739.wmrik43dols5ju3a@notapiano>
References: <20230317030833.16836-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317030833.16836-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_080748_138226_9BC1DD98 
X-CRM114-Status: GOOD (  12.98  )
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

On Fri, Mar 17, 2023 at 11:08:32AM +0800, Yunfei Dong wrote:
> While the decoder can produce frames in both MM21 and MT21C formats, only MM21
> is currently supported by userspace tools (like gstreamer and libyuv). In order
> to ensure userspace keeps working after the SCP firmware is updated to support
> both MM21 and MT21C formats, force the MM21 format for the capture queue.
> 
> This is meant as a stopgap solution while dynamic format switching between
> MM21 and MT21C isn't implemented in the driver.
> 
> Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


With this patch and the new firmware [1], I was able to run fluster using the
VP8, VP9 and H.264 codecs on both MT8192 and MT8195:

MT8192:
	        VP8: 59/61
	        VP9: 250/303
		     0/6 (HIGH)
	        H.264: 92/135
		       27/69 (JVT-FR-EXT)

MT8195:
	        VP8: 59/61
	        VP9: 276/303
		     0/6 (HIGH)
	        H.264: 95/135
		       27/69 (JVT-FR-EXT)

[1] https://lore.kernel.org/linux-firmware/a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com/T/#mb0591267d7921bbfada7c06ee2bda128db554648

Thanks,
Nícolas

