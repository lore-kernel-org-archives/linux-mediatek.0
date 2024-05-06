Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05BAC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIXTVl8kM/Ev/X0RFJHVrWc7b3X0LrMCQP132ExmKbQ=; b=P1S0mybuIfSllIOYQzrcCWrvGh
	0cNP3kTo20sy/zfgTKKAUYae+b4CR+ont+t2E0Um5Qngs6x5eF8jNcxSRCgpc9eqeIsll8tbYglud
	vAz9TXYd013tnml2nbvdkMno/Vo0WYBWnX3Elt/SdE6eFPVzw/DJWh9v94xl7LdKQbPNesoGyl3Hc
	997p4bEYRMMho596zTnjMWxsL4COrH/QXKIOArEsFvCgGwsVs9evu5jcRgSZG7oaT/CeeOH5J/jFu
	A7OmeOmWw8gMN5k+P8yOfiKxApb9eIyKpxocXn7Xmv6yGpF7lj5eAh4wop3G0cfpBCvxhwAnpQiGz
	9GP+8LAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yE5-00000007QHg-1iMf;
	Mon, 06 May 2024 13:17:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yE2-00000007QEw-0QpO;
	Mon, 06 May 2024 13:17:51 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 267831A7;
	Mon,  6 May 2024 15:17:37 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 May 2024 15:17:36 +0200
Message-Id: <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>, <chunkuang.hu@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com> <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com> <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com> <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org> <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com> <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
In-Reply-To: <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_061750_348531_4B9DA103 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Angelo,

On Mon May 6, 2024 at 1:22 PM CEST, AngeloGioacchino Del Regno wrote:
> > The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR...=
 which is
> > a software thing and not HW, so that can't be described in devicetree.
> >=20
> > The only thing this series won't deal with is exactly that.
>
> Sorry, no, I got confused.
>
> The series *does* already deal with that, as the pipeline is built before=
 the check
> for OVL_ADAPTOR components, so that will get probed.

Are you sure? Because who is actually adding the OVL_ADAPTOR to the
path? It looks like your patch will walk the graph and add all the
components according to their compatible string. And since the
OVL_ADAPTOR is virtual and doesn't have a node..

-michael

