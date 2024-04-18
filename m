Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B2BC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6JnKzawadTQfaaiivXdgSYYyanCvFFOHetdXBBM8Pc=; b=H711xIrRyMtqcvuObttqFbLOho
	LVBqhSJogmEbWE/YJq+brLAx+Xd7o2ADICvDd4ESJvcrs1kSnzIG/VRAfHr2YY+Hwa/Vt8nCiZmbs
	72B623MAH1v+bFF06oSZDsJxjBL3rcofil4BR4F58JOsyShPxUIVadtdI9nOEQNqsbVY47RkuHZ4K
	9Dlw9dhkFPgCuOhlvE1LG7Oong3icET+xsKLNoYYiZmhYnjZ3byQ1Rjm/sGf+gibNTcbGRk9gxZXu
	WYKxxikatiJhkLStTcN5cVac+UQAezpvw2PM5EJcdxawIXlsAAp+iXHsh0Yh02ELdnbABxXgxmMfG
	LS1r1pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzN0-0000000Eo3d-0fz0;
	Mon, 22 Apr 2024 19:30:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyQ9-0000000EbCk-3XFR;
	Mon, 22 Apr 2024 18:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/6JnKzawadTQfaaiivXdgSYYyanCvFFOHetdXBBM8Pc=; b=OJQldevCPSdwV4grV5WOwVnXnT
	hnjZN0EmCgV83cO7BM5D9veG9gTaX0vi38GxWymg+eLG4rfcY2bxAplYRm60H1ZvEHuNCN8O2JtM8
	hfdTZt/FJ8r2CxeS+4JBCeouAqYXXuHY6yy8DbR9BGL/hrs18PG11WVdif583ocHmzLxCYJY+y7r3
	8McfkWohYjVZrbZgADgWZob8UmM9qiXQNwiO+y7OY6d5T4c5mAeo4kgEW5L5yara2tnOOlfasz1ck
	XkhfYBrHvttBf1teYSh5gIpGvlfzLNRMXUqOBu1fMEtGql5nbUt7XC/DT+2FaWpMX0QiwOV0wgfWp
	rAtQloag==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyQ6-0000000DkjL-2JCV;
	Mon, 22 Apr 2024 18:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713810577;
	bh=iCcqBX7y44Xnzjt368+apKXyWLXQ8/7+lL4SAqqNZbE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Kv5qtAlWI5coUdHrvkWHuSobLN0hL7vr+voS8szFuZgMEQLtHz5Pvh7PmHMbaxyvt
	 Xt6MDvLYv7vcbuJaKd7reOxk0WT6X+oK1y8CRK3G/Gg7NTxIU+AhgiSg4BFzCb5D2I
	 XPb2nmsOhbKVX7n0tfRIjC1YyLQpybiFzbyAC7E6+ckEktv86BtJenTEVXdC+/HyUs
	 yYK328Ekk8B6KBG3ag1YC7eb75fFTea6e/3SCsJQXgBpR7wVJM35/GbA4LwlaF9rV5
	 0tf+uu04JCMC2GiOPg/VU8vekfBD1moq2RP3Zg0pkraf9a/MSQR7SjG9mJw6n54D6H
	 78U3xJnKMDeuQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 882803782134;
	Mon, 22 Apr 2024 18:29:35 +0000 (UTC)
Message-ID: <afd123ecc8b009895d39a44c248fdd684730c2cc.camel@collabora.com>
Subject: Re: [PATCH v2,0/5] media: change the calculation method of
 sizeimage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20240409064431.16909-1-yunfei.dong@mediatek.com>
References: <20240409064431.16909-1-yunfei.dong@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2024 16:17:49 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_192938_737962_165E4747 
X-CRM114-Status: GOOD (  11.57  )
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

Hi,

sorry for the long delay.

Le mardi 09 avril 2024 =C3=A0 14:44 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> The bytesperline and sizeimage of each plan are different for 8bit
> and 10bit bitstreams. Using v4l2 common interface to calculate them
> independently.
>=20
> ---
> compare with v1:
> - add patch 1/2/3/4
> - change the calculation method for sizeimage for patch 5
> ---
> Yunfei Dong (5):
>   media: mediatek: vcodec: fix incorrect MT2T format information
>   media: mediatek: vcodec: fix incorrect MT2R format information

As per recommandation of the "Submitting Patches":
> On the other hand, if you make a single change to numerous files, group t=
hose
> changes into a single patch. Thus a single logical change is contained wi=
thin
> a single patch.

In general, when two patches have an identical description its a sign they
should be one patch. Would be nice to squash these two.

>   media: mediatek: vcodec: add MM21 format definition
>   media: mediatek: vcodec: add MT21 format definition

Same.

>   media: mediatek: vcodec: fix incorrect sizeimage for 10bit bitstream
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 28 ++++++-------------
>  drivers/media/v4l2-core/v4l2-common.c         | 12 +++++---
>  2 files changed, 16 insertions(+), 24 deletions(-)
>=20


