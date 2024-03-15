Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A969C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0Qgt3MAxhQhxJk6jyspy1TaPbIA8YTmiFTwX7XyWo4=; b=QWBfNpOa+XTUFPH59SyGA13Zp+
	zCKMvQt6TVG1DJ0jjDXLfDZoKmmGIDD1drAJEFvwCQ9cPDTWzLPNPdI+aKIfTFfCWBWTnM6F2/cAC
	X4b9P4m/YTuxCqSqSQqV83s21ci+GGe1P4oWZyXbrWpSrCeWnavYZ8JMGzJUZYXzzwSIj5+hnoKgB
	6GAzQEgvI8B6seyhYSGIVbzLZQsv6oneM3uUipWkrbW+oirgtPiLV22BZGtY3D722gC+fvhjl4dE9
	ITonCPsGkDOPmQ4Z5tIIQ6sMs1xPqTiJaR4GnXpqsLWNgXy6EhT3T5+ZxxuMvaIrFdZjlfH6JGjig
	X0vXcN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlCF0-00000001A6D-3Rsc;
	Fri, 15 Mar 2024 18:25:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlCEt-00000001A4t-2loT;
	Fri, 15 Mar 2024 18:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710527103;
	bh=2Au1D4Ot5E6gkicxx9t/mBxMS77Y4uefkAMGQCX6YtM=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=16rpIxEDl1lS7NryEFGRRGGYJquuVBhgV60Gq9KFdxp1YvlU4VL1pgZLuNLoIc92E
	 xdfq4tB+lgEpzKXdVJ1r7XqfC89M2oVoxQ4rlIL3Cg1sqFc4+GJragentwQrSyNrTI
	 705D/2FfIcD4d+1SYdd3igNGEgiVWiWb/JognT34KrksMtbAfQow4qpGHPVxWANNeh
	 6AtRGvJOb0EvowdNZrG5FwpGJwyYhD8vClsr5nt8mKVaM2I2pe/7KrT1RWRsN3vHsx
	 Yw/clNLSuIHhCmvTKPhUJe+P1idU8fXvQHdtkX7YMqhT+tZ/o7kzUpJJVB7AC1gQhZ
	 xTupvx5lsj3kg==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31D0637820D8;
	Fri, 15 Mar 2024 18:24:57 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2,0/4] media: mediatek: vcodec: fix ctrl request complete
 fail
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240314114452.17532-1-yunfei.dong@mediatek.com>
Date: Fri, 15 Mar 2024 15:24:44 -0300
Cc: =?utf-8?B?Ik7DrWNvbGFzIEYgLiBSIC4gQSAuIFByYWRvIg==?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DFF7ED9-CD67-415E-965D-D83337CBE8A7@collabora.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_112508_060780_186DAD3F 
X-CRM114-Status: GOOD (  15.04  )
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

Hi Yunfei!

I say this very respectfully, but I believe that you must improve the =
wording of some of your commit messages. It is hard to understand your =
changes otherwise. More importantly, it is hard to understand why they =
are needed or what exactly they fix.

This series has some checkpatch errors:=20

total: 53 errors, 0 warnings, 0 checks, 1047 lines checked

Did you test this with Fluster? We should really make sure that this =
does not regress any of the tests there.

See a few comments from me in the thread

=E2=80=94 Daniel

> On 14 Mar 2024, at 08:44, Yunfei Dong <yunfei.dong@mediatek.com> =
wrote:
>=20
> Moving v4l2_ctrl_request_complete to before of function
> v4l2_m2m_buf_done to make sure the status of request correctly.
>=20
> Replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove to
> make sure the src buffer won't be removed for some unknown
> reason leading to buffer done error.
>=20
> Patch 1 setting request complete before buffer done
> Patch 3 flush decoder before remove all source buffer
> Patch 2 change flush decode from capture to output when stream off
> Patch 4 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
> ---
> compared with v1:
> - add patch 2/3/4 to fix timing issue.
> ---
> Yunfei Dong (4):
>  media: mediatek: vcodec: setting request complete before buffer done
>  media: mediatek: vcodec: change flush decode from capture to output
>    when stream off
>  media: mediatek: vcodec: flush decoder before remove all source =
buffer
>  media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
>    v4l2_m2m_src_buf_remove
>=20
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 52 +++++++++----------
> .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  3 +-
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 28 +++++++---
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 28 +++++-----
> .../decoder/vdec/vdec_h264_req_multi_if.c     |  3 +-
> .../decoder/vdec/vdec_hevc_req_multi_if.c     |  3 +-
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 37 ++++++-------
> .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  2 +
> 8 files changed, 84 insertions(+), 72 deletions(-)
>=20
> --=20
> 2.18.0
>=20
>=20


