Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C38D1950F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jan 2026 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=; b=iM4sOrS79J2/QU5au/WSFq0/nc
	HABCMUGpDrLxzsykNBdn10RYpuryJVlaCFuu6iSy8tfi6v74UZrwki/SY3z2U6pHz2TlX0RdCcoq/
	xZ08glodrIahoB/0bDBDu3t6AvU6jUuZmZKWT+2ZB6sW4zq2dlUFGNIeT4RG/YKHvg1QJ6UpeVtsR
	hRHBL4s4BLR5fs73pFE013VKzOVA+Exsi6xz3sf0il7OEl3Ww7C1vLkGeAg6uVqAKghg8NawPulSr
	iFouU9RvEfQ48XVJQFkXwNrAIBk4LlSBH+FqsdNmvIudugw61eyZWPE1pu1MfAFjUQvl8Cb6C88UU
	SnPFzftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRpX-0000000D79w-2c10;
	Mon, 26 Jan 2026 19:00:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRpT-0000000D78X-3QJR
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Jan 2026 19:00:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QDglVR1361526
	for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqfsakIPHTwBzETcZdpTqje6
	xP/4nMqp2xVshRQ/NMc=; b=lpmTm/e6ix4LNQPm1ErA67hrm5bi0+CXYTgXGVEB
	5F0JLpjpAhOtHSCDG4vdrvqC2JGo3hCvrEr5e8iZ3F9xYh0FL8olLDjrVQF65e6G
	Jz6c8yof4G15xtOR3MjHdtgW678YRnjlvURa1upnTFISVavfQoASqCblKnTtGXk7
	CM+kgUBwOBUVdSilX3vK7TBANL+8OdtuZXecKObrWvfEeMHye2ytT0PANsdqFpf3
	G/BnHS+NdT/I+N3PgV+FfLkKiUCRrcH9g3LwvfMgqxShe8x4RRsXcgAuNqSE3d4c
	oTGRdGsnap2WRIrzi5qf71AfbPBKQ8X9VO3abyLsJLK1AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v329d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 19:00:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6cfd52556so1298374985a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Jan 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769454049; x=1770058849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=CedU7HQkOr28u6csHudmqEFr6rRU10XpH2Nw6fbp1kBL/ZBy5rQVGR+rxGP2oabA+2
         gr4t013ly1MyPaMIYiS3I48TVTdDnW4WnQ2OKkSw1LkMIzMcEFbAb6RPynJWndn/yt+C
         0wN+uwTiWf4z/e/NfxnKMdaHe1DIw4Q+Bg/raSKhV08l3I/J4qCB5iHaa8Lp4abr/QJC
         NlZKdDLyu30mIwuyyjnaGcbLhV3EotcMXbJ6NseLPfKxfQog/r0JuCU1m7g7S5h7z73k
         8YjZ1OIHUXSHAmbULKa6fNwADhSlIBCp2UlMD0o5zfqeK6tDbZX9gaTqbSxwsDY6tkox
         zi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454049; x=1770058849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=W+WujKyxSlN+skEP7o+cTWTvyQU2tBk1EQR485HgJ6tocoYVfpxBorixqv0Aw5A34J
         Hxy+Aqr24N8mEjrQgCCOq6reWwdvhNWvIjM8zHahi2kglGth8qlM8tqZjDdFMlhbYqRu
         bFvBJswsIHFJYP95WyoVl/cSvOcG5owbnVZih3gtuxB82BtVwqxhscj4Ywj0vvJ6DrCz
         kdEon8bFAfOlY5HLAaSGDglcVY7NXA6b49RtUT9fA8ZR+djFg7ofkopnHKPQQRm7Ptw6
         VLf54cOK7kX1pBQjKFf2uLPKA8WbUcTjHefTDYdP28SZM1i52jVYTiowLttspfsvvroj
         SFAA==
X-Forwarded-Encrypted: i=1; AJvYcCVfMSls23Wihd822Q9BHN9c1O1t2wZC5rEymx91ydJ/V8nkIi1zBYcjGZ5/qXliRP+jcfvgC1w8fAdI7IOpkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/L9bSDorpFfIHKymHFdp9HD3d6j2v6kusL+G6Kll5SWPcUI/
	2VH5/hpiJqksSyDznZp2nVXHmUSvVxqVhoo2aRXt4p0YKaYzCKzUuaMLWO/xjKwWyZ3ARB2zyvW
	+kX2Kb/H4Zz6Xtbb1obNrprV93Bk82cX29YnFT6o2qR3nOcqAF1m/WfSA6fwwUQauQ5sdLzkRTN
	c=
X-Gm-Gg: AZuq6aLNIdfXolFFqPagcZa/xRj/1rATOIxzgvRyDacVTrP961TJmUt0Vpeg+XrS1t2
	AYMTfUBy9SVWoNj062/agtfx0LN5z8q46OviUJqKMmm8RqaPlhIp1Jwyujo8lQWYmhKvXrcYipO
	gsWduP6qzaSItmyRArtBctzDvnKeH9fjESIugqx18BDAiLpDCiTkyvKdg1vZmHzHykR/qRUT6Yu
	BWZ6QcMJmuo2scA6uISWoWyFQIclRd+7anuGhdnt8GZ+EOGCqUgcBa7PN6a8hqMXntx33mfBh4a
	8+oZY2wi7/1mYSLYf3q/NG1DQ4VIY68+o/qvTvix7FUc9qnOcPc6FNIF7iZKlzYAzsr0uSWQ6QH
	U8B8k8ZxxOij1s9cJy1gr7EjVxL+UYhRnBMIvJa/GLUaeBrTGGq2DZRTSJ+orKYqLVEVIrtYqN2
	lpjBYr77Ig5qfLGq5OM1E9X2Y=
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619842185a.39.1769454049435;
        Mon, 26 Jan 2026 11:00:49 -0800 (PST)
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619828985a.39.1769454048666;
        Mon, 26 Jan 2026 11:00:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fae764sm30668421fa.8.2026.01.26.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:00:47 -0800 (PST)
Date: Mon, 26 Jan 2026 21:00:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Message-ID: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfX4U4bjpdFRUnM
 /1aFWcR8Drodys3LrreVReabuMFfQWusHuNjO4/DhQmjdH1X+8oBofyPXoNGuim8hNRVVNSjSHM
 cMTnwRtMrydfBJj/ta+iejenj8mlGvefuxaZCy541MGcvBG2afzgWXamgmK71BijGjwhrkVRB6D
 fSzujDAV3NfCBHoAnt5crUlPiac3mb34SmmU2XT6K/72P14V04A4Rlt4WgtTXdTnazpI5O8wlkt
 cBrYPrm85kWWzHNkAdfbRbKRNBPubBi3gJ0tL8hh8VfD3YENgf7ZQclXMdeDGlPSrgesq3Qt/Pn
 mVo2F6NOZ+9jVlE7brtIZxBYMJgtv89v7tlCez8x36dWZ8PyaVy6WpXnoDGQGT4nhuJND2PEkAd
 qkG62rdb5zY2g/Gw1yZUflPkEYDMEgSklyBMm9EDqu0v80AnP4Kdk5qm1HOfp0lA0oSDSfdKdXL
 GTUnRf0HrPaCvKZeftg==
X-Proofpoint-GUID: CEL3y5JsF-F-uaT2Rz7TZgo6Sj9_MuvX
X-Proofpoint-ORIG-GUID: CEL3y5JsF-F-uaT2Rz7TZgo6Sj9_MuvX
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=6977b9e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNNbUphbDgaJBy-ozdEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_110051_856988_51ED0FB0 
X-CRM114-Status: GOOD (  18.24  )
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

On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
> On 26.01.2026 18:42, Marek Szyprowski wrote:
> > On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> >> Implement the clear_infoframe callback, disabling corresponding
> >> InfoFrame type.
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > This patch landed recently in linux-next as commit 3a4ceb89a972 
> > ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> > it causes the following regression on Qualcomm RB5 board:
> >
> Please ignore my report, it looks that automated bisecting got a bit 
> confused.

See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t

I'm going to push it to drm-misc-next-fixes.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

