Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52501D58CCE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5rwiOXF2FFDG/kdjyCGCZaPJLF8PoP6ImoKwsa95hs=; b=MEOPHt5ppgZRyOBQ7KUYNYDYf9
	YEZ3HajAoEioVSzQVdV8pHNGw9yjWqS52hhMOwZrWST2WBqI8dIlot3SGabs8SfEk1OW6LV3FMbHc
	Mkkw7bgIiK3RUPXV7o9Qqou5WRU2XCX+sPyfr0NqimUQPmP+Z7Cr/jPsXz1qyTmuzu1GbxpENlbcf
	8D3Me4GQQYXMz0s4gM0WPQwOHsRkTYh627LTEN4/CyzmfgIxeEEls8v55q1hsGHk4OH2qdfjg/jWD
	Rv93IzfYH4PI3TKZ8ccJHE4OgOdxRcfbJYqUnAnoxgFBn7BH0KoyFYcqTnhmsgAmkjSrmCDoisLmt
	MFDw5Q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZi-0000000Fysn-1AdP;
	Mon, 23 Mar 2026 04:07:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZg-0000000FyrF-0u19
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:07:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBo2n02173767
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W5rwiOXF2FFDG/kdjyCGCZaP
	JLF8PoP6ImoKwsa95hs=; b=Zw5SVhqkPq2/cw3ADnBJ5wgBRbhd6YTXpPGmORtK
	L+Tm1dVCL2518ekIBX8K7LtOeS4wZS9pEig/W4AJFNe3Imk0sxFuh6st7w+CKMK9
	AWI7rERcfwXLEQMjLCzdN9cNk5WWl8SvuE4pgOyb5YQ0AjsxQlWyZQaFFoEKfHSa
	YSt6n+fVlQsmvAisWict0zJSnVNwpn5puup+flKkn7Y0GoOKdLjxqwv1lb0o5TV9
	YNyCil28mxaA798c2WvD6qRBObe8+XRZgFlKBNFRS4Y1QDhxC4+0Ps9QhnrdihZU
	m1tnxlVkDv5GVI+IyRuavtp5B2C8JIubTyevpXEnYAIf/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hkhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso36587561cf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238851; x=1774843651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5rwiOXF2FFDG/kdjyCGCZaPJLF8PoP6ImoKwsa95hs=;
        b=OmhiChWm6sqYv4Iq6Xix8ygIIqqZGUakE62ky5Z5fVPkpMvssFrkW8XFI1L+YQgnEV
         1HBTE+2UJXQrcPY8irlncqaqCMonjb7q9//SrezTPlsXKv/+niznqnCVyE0vfVLfjZJo
         4vE+L8KbEl8mb6x4X5Xuz4EsI84kyyHfIGy78fZdaKuuu8Zkj3rQfBfogiV0bb5Mb61j
         6k5e8nG/nzOKq3HfOIZQ56sPlfuF9mVbil+Mz50tKBx2FPqCpta1JeWzm/ITj00pUVsQ
         AJywMFdmjMFOFsu5YL4dk2eslR4m9VBACnHS677Vw4kjvc+904/yh/9L8dVwQAwXKqP2
         1ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238851; x=1774843651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5rwiOXF2FFDG/kdjyCGCZaPJLF8PoP6ImoKwsa95hs=;
        b=EVz3yhTWcdX9eZlNfST06jsnp/BttNj61CiKKDWR/iw9g9Y7qdVDOh1Y0ILE6QNFEl
         TtOLm7xHErYv0+ovusXuxw7wbdRmnW3NSXqYVi7SECnW09NutkycZKsZNdv0XZk8vzBE
         5U83+QrHWrUU7mWnsK+RtukjcNGd4pU0JGR2ZgHFVLn2N0xMlY8NXGmFIvXPBv6Ls7Uc
         djbOX9W6I3AWmk5Gfxswllv84ufHicjzIL8sgoJhqPkXSp/n5UfF+0Bp29op+SWJ9B7l
         iGcGB7k39yiJk0H4V5dIbk0x2jMNLeRf/4SGT8TBadRnH+N/KIpToJmNEuBvjXvIDkda
         sZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE1Hgpgdi4CmWjfcjaQMJ8vnZl9KxR5h9+R39BiGdtbdxalrWdROx30MhtfxMHmQmg+sIz8YF64a/zCpz+Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEWR4PF4UWBLhcnrB+HhzSyx3gzqLM5mTIbIS4feedj2oZHotW
	FTBHYEWb2SFB99vry/+q3XiW1X5gMLhae3MctddOEpJT+mu6/AkkU+j43hqQADkCQm0kUOLmMi9
	65m69O+sm0V6SvlXyiL9m7BXEsfrwcDgsehJasOSW5SAT3hS0QXd+NrmaEuUufWa3iV4tpfVrmv
	o=
X-Gm-Gg: ATEYQzzrnnbUaYazPTQzgfvSGphBlgo5O/0E+fu8sELWcWprx7ffSqs1tALuPZu99+C
	VYE3K+dNT37TaQn81l6Y8TphD9zgQS++ckF0gDx12Ocd5foCPDcNKB0xxyjMpekk0OhEuHLYCkt
	fmAZdLNx5HqKXTxUEvS4F/WP58q+quI7eXuyD8d1Bhy3LqgNs8XyAyzJ/sb0JUUAqsgEkrle1x1
	kiTxe7oo6Z77nmXzaIcLSAFBEZc7grii/67y9LQXYJ4p/anZRwG6y0OYBPteEAYdgXVhBWGqP2k
	hTiM64Pfm9Tjsu9ujbQZc4jDXZJrw7naBNhzl4wTjialI3rmSA8cYvzcDTSlz3AvSYOTZuVVNcv
	9sxO3JlrB4PvtHIAyKuVmZp2UrrsT/Cux5QFBBc4KXmJQ8IxlC2QRb83KBjkQzQ+YkKgg5uAx7E
	PmLTVZkA3v8TId9IQvD/oT8eHNC0X1mS7wjAQ=
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr166637621cf.59.1774238850826;
        Sun, 22 Mar 2026 21:07:30 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr166637111cf.59.1774238850280;
        Sun, 22 Mar 2026 21:07:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9981ecasm24919121fa.24.2026.03.22.21.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:29 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 02/14] drm/edid: Convert to drm_output_color_format
 enum
Message-ID: <xip6aoymudbdakietc6qrt43irdajp46jrsdi27m36dfqfzqnz@y4stxqdxdjix>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-2-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-2-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfXxiarWSrWCaMl
 HtC3fgiNL83KjHdQi4xOTQEBOYlUBENHb4vc6P/xqOigi5V/2zxYNTRXMphL2gtWCcEHz1cTsQ3
 AvRjNI6PDxfFmL4KgVObP9EfbJJ2uG4z5QfvsmzgRC0O52WPnFDNiqASpM9OF2Yv6k1rSYfFLdc
 UoHHFMemmD4yWRJW9xsc8qAvxA/viGe4peraxOAJMjsrJMUuvoCoL1271g6joDia3iWJECXEAqt
 RD/N2T24P2twa7GLL4JqexH7cHvyL5rLEUkvaF5vMELf2SqBJW21rxb962sNum0amrDispmaVm5
 HspT5Gb9I1FYho/JoeAliCMk/aFpqEiHkMfl8Bb504Iv+V4PdWnxg59tVSdJT26rs+h25uUk8lX
 69ARG8xE1SuVNk6sr0D6J+9ocFNzHuB+H4biprTtPSCASO6JwIcGdgI0tKlxUaW5zCckWDstIoF
 uuoIQP/S4/kSXOGKDJg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0bc83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_wym5JX8MKgHMASIHSEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rtrSw44_aialH1pXGuoxUSrCVwCbROtp
X-Proofpoint-GUID: rtrSw44_aialH1pXGuoxUSrCVwCbROtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210732_259089_72FE9EB8 
X-CRM114-Status: GOOD (  19.73  )
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

On Thu, Mar 05, 2026 at 10:04:54AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

