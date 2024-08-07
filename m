Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E62C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b31lzuqk+NEUR5lPB03lOlP/KpJzHFymO7PF1OSOIos=; b=DRyOOGsy5Y8wWVhI85uJKaz1BH
	iiUREm+afCcYzGMVNj4lsNFE6HwoFkcvMczFdBihnECeqsVrczwLWaviIj7tidn4iHxg3Vnx/KNKB
	61KdZVhyRtVPwONH/B9cujKazoHU+u40Pki0X0LReHQ4Vhw8xtS8s8UQPEf7yuIGo51+jZk7L5chV
	zl61hPESkCH2vniQHjYGqKEzVtW5Bv9hid5aOuRUnvVdM5e1pmt28SEJfhARncyXOL6sA+rhzwRe5
	dUul6ROup8PjetP9yAC1ZzaCWig+Wf1LLq6LajG3Ac3R0hpF3uPbDoi+FXx+pQ+4gwfy74xVqnYyz
	9EE9HCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgPj-000000055qd-16Yf;
	Wed, 07 Aug 2024 13:09:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgPb-000000055nB-2pfr;
	Wed, 07 Aug 2024 13:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723036142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cCEvUedM8DBzYhd7+dWhV1X1QXTtfWA5kOy9TZptiz069HnKin63ZlhP2wL/igLLFVHbJMa1gVBe3WxrkeZ6hkj1JSFM2A4xU5rboazKmxP25OlqqUqr1dJEStIA9IEK3e9jSdxh3iMIGO61+Ac90NkM4rSbZoUY7KcJAjXAe8M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723036142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b31lzuqk+NEUR5lPB03lOlP/KpJzHFymO7PF1OSOIos=; 
	b=cs1fOf70MwoOlFjm8WiY0ZZLEUmWnlEcAes3EVjYYEgKSQglrSAyeavabN69mvIVyWnTmdxr8eS4p8rYYXfz11gTdZYafIvOPIUuJNE1DSAF4eyMwY2uoZY7FInmpExUdNPfSB4RmZun9tEtzxce3OJCaneBe6zWo9rWDNXXyXw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723036142;
	s=zohomail; d=collabora.com; i=nicolas.dufresne@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=b31lzuqk+NEUR5lPB03lOlP/KpJzHFymO7PF1OSOIos=;
	b=UqwX/xlshjRtYJ3PwgfnQ1waRWhsqIlo9HmyDEaJqQfky2TW1VZ9AHcDtJQ9YkYD
	ec17ijB7hYJ64eoaUNCiLFBC+B7mrCoLZPR9eillRP70eoQP+uHDDDhSD5WeJhlJEaD
	JBzVXzK4NQsqRh+tEL9h9zgpuskfawBDGsmoXc3g=
Received: by mx.zohomail.com with SMTPS id 1723036140967275.53857334940585;
	Wed, 7 Aug 2024 06:09:00 -0700 (PDT)
Message-ID: <be4baa6313d16ed52245347d866dd878049a12a0.camel@collabora.com>
Subject: Re: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 07 Aug 2024 09:08:58 -0400
In-Reply-To: <20240807082444.21280-1-yunfei.dong@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_060907_792309_2B813893 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Yunfei,

Le mercredi 07 ao=C3=BBt 2024 =C3=A0 16:24 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> v4l2_m2m_buf_done is called in lat work queue, v4l2_ctrl_request_complete
> is called in core queue. The request status of output queue will be set t=
o
> MEDIA_REQUEST_STATE_COMPLETE when v4l2_m2m_buf_done is called, leading to
> output queue request complete fail. Must move v4l2_ctrl_request_complete
> in front of v4l2_m2m_buf_done.

Sebastian and I have analyzed further the issue and the description here do=
es
not seem to match. What happens is that in Stateless decoding, you have to =
set
header controls out-of-request to negotiate the format at first.

With VP9 notably, the header control is the only control there is. Chromium=
 will
optimize out this and only attach a bitstream buffer to the request. So whe=
n the
buffer is mark to done, it is the last object in the request, which implici=
tly
mark the request as complete.

When v4l2_ctrl_request_complete() is later called, the control code detect =
that
there is no controls in the request. It then creates an empty control, but
attaching an object to a completed request is not allowed.

>=20
> Patch 1 setting request complete before buffer done
> Patch 2 change flush decode order when stream off
> Patch 3 flush decoder before stream off
> Patch 4 using input information to get vb2 buffer
> Patch 5 store source vb2 buffer
> Patch 6 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
> Patch 7 remove media request checking

I will give a some testing soon. Can you clarify on if the LAT and the CORE
still runs in parallel after this change ?

Nicolas

>=20
> ---
> compared with v3:
> - fix flush decoder issue when userspace stream off capture queue firstly
> - fluster test result same with v3
>=20
> compared with v2:
> - add patch 5/6/7 to fix decode again issue
> - add fluster test result with mt8195 platform(same with no changed):
>   1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
>      VP8-TEST-VECTORS 59/61
>   2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
>      VP9-TEST-VECTORS 276/305
>   3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
>      AV1-TEST-VECTORS 237/239
>   4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
>      JVT-AVC_V1       95/135
>   5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
>      JCT-VC-HEVC_V1   142/147
>=20
> compared with v1:
> - add patch 2/3/4 to fix timing issue.
> ---
> Yunfei Dong (7):
>   media: mediatek: vcodec: setting request complete before buffer done
>   media: mediatek: vcodec: change flush decode order when stream off
>   media: mediatek: vcodec: flush decoder before stream off
>   media: mediatek: vcodec: using input information to get vb2 buffer
>   media: mediatek: vcodec: store source vb2 buffer
>   media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
>     v4l2_m2m_src_buf_remove
>   media: mediatek: vcodec: remove media request checking
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 ++++++++---------
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 48 ++++++++++++++-----
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 +++----
>  .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
>  .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 19 ++++----
>  .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
>  8 files changed, 85 insertions(+), 60 deletions(-)
>=20


