Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C696C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDkD+uUqmi7yGsqfPO06ZyN3HpS8QWDgQH4vuDrIkp0=; b=CrNfm2v8Uu4p1H7hQYdUx4MrMG
	3heJO3RMw9jwRuJzLK9Abg5F37tJ23w7DHSYySUTDE0gl5vEW/VAIqz9GwrIv1q+H5KxJGjYLQaeR
	zmvqNuAIDVAvjkhNVNExHfdk/al4t1a2JOd6Abl33zwVWCGE9VYRSq7ENYI7tpD50u2gENKs2kbJM
	Ujy+5TpDadT9qukIegPKB5B2lGv7BCqs4+LONcok9TN683eOs7uvXyh+JIFBOp2OZJPWyA99o3Qfz
	52wFLn9racQxv+T9FrjFntIp4wqzwYv4si7iy0VGKN4j8Pjir0PysX1LUEJxaM3GvGmM+Q90GC7yr
	R6Vh53bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzZ4-0000000HFJh-1PiO;
	Fri, 01 Mar 2024 09:52:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzZ0-0000000HFIY-3bbD;
	Fri, 01 Mar 2024 09:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709286738;
	bh=0eEAsDUiGlym1jRBLErLtOHPYKonoraS/Q/lwYdLL6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlpjN5NcAeEwbGqu8RBj8FauZX1FwPsgaeROmXHEoWtABFUvUWIUbaBKxyeneagj+
	 1UMyEDl4P6erEOnJi3aTI2uM1hCwNRyrngSEcUGRVU0ADqgSHnhjKGJ2wkL0tIej5y
	 Leu0Qqm0fJ+NA7PsAPAlPG4hCRWAToti342lVzo/jtY3F07QE5naDvn17ZiHnKo0wv
	 tDob4iV+b+hgvM8LtksTiyL5m1Wt3SY6YUGeB/L3g0Q4UEHOa/KEUeKwliFIMsJ2vJ
	 ubUxB9KvFGIfD7PLvjj4SPMfjJN1ut8Doyf29CMphkVvKLctsGmaGV61XRH55wxG5k
	 093TghaWTwZKQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B50A037820C2;
	Fri,  1 Mar 2024 09:52:18 +0000 (UTC)
Date: Fri, 1 Mar 2024 10:52:17 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: support 36bit physical address
Message-ID: <20240301095217.bmsnizobpb736fgg@basti-XPS-13-9310>
References: <20240301020126.11539-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240301020126.11539-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_015223_102685_490026AE 
X-CRM114-Status: GOOD (  15.98  )
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

Hey Yunfei,

On 01.03.2024 10:01, Yunfei Dong wrote:
>The physical address is beyond 32bit for mt8188 platform, need
>to change the type from unsigned int to unsigned long in case of
>the high bit missing.

I would reword this a bit, the address is not beyond 32 bit, which would
could be interpret as if the address starts after 32nd bit, instead it
is larger than 32bits. Secondly, we don't change the type in case the
high bit is missing, we change the type unconditionally, we do change
the type so that the high bit isn't missing.

My suggestion:

The physical address on the MT8188 platform is larger than 32 bits,
change the type from unsigned int to unsigned long to be able to access
the high bits of the address.

One more question below...

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>index cf48d09b78d7..85df3e7c2983 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>@@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
> 	unsigned int mi_row;
> 	unsigned int mi_col;
> 	unsigned int offset;
>-	unsigned int pa;
>+	unsigned long pa;
> 	unsigned int size;
> 	struct vdec_vp9_slice_tiles *tiles;
> 	unsigned char *pos;
>@@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
> 	pos = va + offset;
> 	end = va + bs->size;
> 	/* truncated */
>-	pa = (unsigned int)bs->dma_addr + offset;
>+	pa = (unsigned long)bs->dma_addr + offset;

I can see in other parts of the driver that bs->dma_addr is converted to
u64 or uint64_t. Is unsigned long always 64-bit on the different
Mediatek platforms? If so, why do you prefer unsigned long over u64?
(Which describes the type more precisely)

(Same applies for:
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c:452)

Greetings,
Sebastian

> 	tb = instance->tile.va;
> 	for (i = 0; i < rows; i++) {
> 		for (j = 0; j < cols; j++) {
>-- 
>2.18.0
>
>

