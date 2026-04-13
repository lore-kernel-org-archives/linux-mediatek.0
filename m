Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DDF34C4E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=; b=wlIWKrJoqJgy/2ySKN1FnQ9zR7
	DFHItUohWTUe3UkLUtHPD3XEpncOYpNpNreZ1k2tZkMyTYYrYzCzi4HKnc+5RRJ8GXbu5ujMSGTjS
	mteYmXt4qFLshy6tq9T+sWT5+MjmdE8qt/d68kmE9ZDWdW0zYswv4wx8viD1IYAtWCW6HAiX0Zb/1
	x4gKdjB4LBwtkEOtEABLTPEqmdXuA3uUhDB52/ZOnsiD4IBHh1yhbKh1Vv+tyG+EGK/WlfXp4cYv9
	+Uuj5gU99bD1x8iBoBmwExGD+jKZ3MVPwY2iqzg169Re2Q/+TIrho6snzrLQ2BbelT4t75Nkdkeib
	3sLu4w6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpR-0000000FoQf-0lbh;
	Mon, 13 Apr 2026 13:59:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpN-0000000FoMx-3nda
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7euHo1618668
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=; b=aPv4BJzO4sBCgjWE
	wJoI/xN0WZnbOmf2ndTeI87Y184qN16qzzpA4EhIuU5JFRVslR6LAJ/wAg3lgvfm
	6uZGnS7wZNnX55+RFw760eX1KYDYWsfZQ4uyEIwCh2CEW+bFfg9W0TYSqVo0bNPQ
	lqLuBg5IGbNjmnoDyhx43+u07bA65KIdNjWWB0Dd+3QdJaog93m48vXP9WHY9ndQ
	+8ZMTkAfEZ5MiDBMkLHGezEHRsHMOkZ9Nvnz2R3//N8z5RtDzn+eKs2eKGgxAXoE
	D0BoLIh3qts5Ni1uFVUWTXxElWTpsUZu/h+nu/Q1cveXkMKsYXVmpw6yO+J6OqCi
	4AW4tQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtnq0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 13:59:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8dac6233so79654651cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Apr 2026 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776088787; x=1776693587; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=;
        b=fZGe91RyNfjMb8AKcoPFn2s4vvghhSw1zMh4AVSJbYrEuJv6CbYfRGf4E5+ANkylWv
         K5VbCMhENkqmAWaL66Flkq9lw6HA9bhZ2r1lq06+nPBWb8xUJPDHrG1iqI/qPp/nLDtj
         aCF7eZ7zhANSDjypzY7f8Ce7FwCSzMQ5lZESAJWqly0KAJg8VeTKqetGufsufcr/qwJ/
         gO0D59R203bjTOHvoTIynVeMEOyAkamxtwCXBX/Rceg0aRbRnzgRF98gonBoSf34qDZZ
         bpx+n9Bp4t5MT9GhToG9qqmhtDjfA3nblyENH9Sik/ZjsiQnF6FFhN0XJ5QF6R2fk3l2
         0NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088787; x=1776693587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=;
        b=nniw6YFAvn2kubil32ifKs2oZcBO1bmVSm6zHF9kF/hjq2DDzO3KF9LFu4c4SfrJks
         G9eAq6oHdMKRf/F16g1/MK59Zi7/FGz598iGLNbYFOyFWjA2LSfDhastWlrDgji13RxO
         JCcl6dK5s/dngUHdXdjduE7Czk0sg3TQt4Z0C0ykmWZdNJ4t0FpvLBZUYbG6VnUcYVk4
         /XCwYossFKHhhoFEhlnO9ASD8gNquIL6K695Nwxv00sgTGQAWTaPci4Djp3HnRlX3bZ1
         mus/F0Ckt/uh9UQE6NJcCFVghcpgdJZKG0GguCZrO/l7op2XG3f2AERwNC4lChPTqRzC
         XIXw==
X-Forwarded-Encrypted: i=1; AFNElJ+dOyysj8lNOHipDDZvxxTuKc1YHHy9rbSe4i0x7ijUnJ2l6t4Lu9KYMGSUwC9KZqNXyfEcFz0YIBON/3AT9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YydeR8Q5YhaF2qISlzm3gvv27SPC3JIFao1I79sE1ommsl3GfFh
	ES3XPCZiilccOM9yq+cb4EWxsjybSA7amxeU57SdYTeB2hmfRWmN5BpYa/QiKV+Q3Ei7IdR16pV
	1SW2w7v3Eq4sTpj6PV4D86Wil9CKXxcz0AIkIA6YELYNmiP5jDKYakO2bf9VlcB6BrRN/dTWcZW
	U=
X-Gm-Gg: AeBDies6AB2s6Nkl98Enbetch7ZSEXj9c9c0gzGQ4iwStGFem5UwfsqL9cebR4epaHs
	YOZL9HwsQJVZ43LwQ+2d2Non8YuzgjCniRn75x5Ho53Xyf+4xeZ1UxfroP9XhYgvUHMDgZapPgL
	Do7DAK1PO3wpE9zCl41Ip6bUmeRQUfRxUraAfFop4sf02o4jess1IxcWfsnWWLPr3SPzNJx3+jy
	2deqlEONr7mgaH/n5FIi9rE5oAYycQj2N+xb1kaBtwRJODmK/RY21K1KS68Gq43DpkrDBE6yxDk
	H4VwUHSZmr5kunm4eg6i3+/p1NlRw14EvytbYIlZf9/nmL8/BmUv5vaa9MNdIzahtB4drW1J4Em
	lv23GGsfy00P25Xk+1nmhYTCB2DW8MjQAaqV5p+UmWMjBmIoznVdo3BO9PiWABW8nH1FtzRMy6R
	eVm0qIp2u0/PZMrIRVGal2oOYGf+YJYUL3Byo=
X-Received: by 2002:a05:622a:40c3:b0:50d:8050:a358 with SMTP id d75a77b69052e-50dd5bc32edmr180026191cf.47.1776088787108;
        Mon, 13 Apr 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a05:622a:40c3:b0:50d:8050:a358 with SMTP id d75a77b69052e-50dd5bc32edmr180025641cf.47.1776088786538;
        Mon, 13 Apr 2026 06:59:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e83bc1b49sm3349781fa.40.2026.04.13.06.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:59:45 -0700 (PDT)
Date: Mon, 13 Apr 2026 16:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <bwgzwwlmvlbtnl7qnmnjrkzjaifeyrhllnbjxh7txrd2o24aqi@2ykn2gwyatcx>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
 <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
 <20260413145930.140ba461@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413145930.140ba461@kmaincent-XPS-13-7390>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcf6d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Z4SpDY1sp9IGsGPUEqoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ESXGrc8Jg7pqAoXmxwtjwV4joz3tOV4-
X-Proofpoint-ORIG-GUID: ESXGrc8Jg7pqAoXmxwtjwV4joz3tOV4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzNyBTYWx0ZWRfX9+Mx3yinwI2T
 LTV6G92L6CHfHoT2czslzb0OxupRh5Y+CxsumWS9tPx5fr1t2Dv4MxjPhnWkJ8b+vXgXVMCDEWk
 aMfgAFeWU+6oOoQ9vIMiif2eoNeCIdVVfG3SH+Uz10AGZ4ATPRDKPUXN60fOwtfgF1IFs2o4MoD
 t9YRXvD3LUyEH30jIN3bIsw8q/sZg2JtrfeTTHKXBCIyl1seuBf6RgKrib+E9Sof1pOH53kBg8z
 fxddxjW9o5C9KHeLYCJT9QjayRl00Ae7ZQjVMG2UYBL3UtgkpKMDm8M0dtSPraZu+RjvBDxRYJs
 KtRN1oN5sJU86QYNh6PmJw4NkJTEDT8SuTGJz+MIDncLgeMYi6Puegyz7nVrjSfbWH+GlFJipML
 gyR9i3Vr329HNm6AgSJowNDwY3eBjU5wxSkIsZlAcHfFA3fq0FXzY9RlZ4gSVIxjB0OIyhxm2QL
 dmPoJs9921yC3ILl45w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065950_075628_F705CB03 
X-CRM114-Status: GOOD (  28.60  )
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

On Mon, Apr 13, 2026 at 02:59:30PM +0200, Kory Maincent wrote:
> On Fri, 10 Apr 2026 00:53:08 +0300
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> > > Add a managed DisplayPort connector initialization helper,
> > > drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> > > drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> > > DRM-managed action.
> > > 
> > > The helper creates the following immutable connector properties to expose
> > > DP link training capabilities and state to userspace:
> > > 
> > >   - num_lanes: bitmask of supported lane counts (1, 2, 4)
> > >   - link_rate: Array of supported link rates.
> > >   - dsc_en: Display Stream Compression supported
> > >   - voltage_swingN: per-lane voltage swing level bitmask
> > >   - pre-emphasisN: per-lane pre-emphasis level bitmask
> > > 
> > > Link rates are passed by the driver in deca-kbps, following the DRM
> > > convention, but exposed to userspace in kbps for clarity.
> > > 
> > > Two additional helpers are provided to update and reset those properties
> > > at runtime:
> > >   - drm_connector_dp_set_link_train_properties()
> > >   - drm_connector_dp_reset_link_train_properties()
> > > 
> 
> ...
> 
> > > +/**
> > > + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> > > + * information report
> > > + */
> > > +struct drm_connector_dp_link_train {  
> > 
> > THese define the current DP state. As such, they definitely make sense
> > to be a part of the drm_connector.
> > > +	/**
> > > +	 * @nlanes: The number of lanes used
> > > +	 */
> > > +	u8 nlanes;
> > > +
> > > +	/**
> > > +	 * @rates: Link rate value selected in deca-kbps
> > > +	 */
> > > +	u32 rate;
> > > +
> > > +	/**
> > > +	 * @dsc: Display Stream Compression enabled
> > > +	 */
> > > +	bool dsc_en;
> > > +
> > > +	/**
> > > +	 * @v_swings: Array listing the bitmask voltage swing level per
> > > lanes
> > > +	 */
> > > +	u8 v_swing[4];
> > > +
> > > +	/**
> > > +	 * @pre_emph: Array listing the bitmask pre-emphasis level per
> > > lanes
> > > +	 */
> > > +	u8 pre_emph[4];  
> > 
> > Please consider following struct phy_configure_opts_dp (or using it as
> > is). Overall, please refer the talk and (more important) the lightning
> > resumee at this XDC. I have some bits and pieces ready in spite of that
> > proposal, but I didn't have time to finish it.
> 
> I didn't know this phy_configure_opts_dp struct. This indeed could make sense
> to reuse and modify that structure for our needs.

Why would you want to modify it? It is an interface for the PHY drivers.
Is there anything that you miss there?

> About your XDC talk. What were the developments you were talking about? Could I
> have a look at them?

I've posted an RFC just before the XDC. Currently I'm looking at the
link training generification. Overall, you don't have to wait for that
job to be completed, just take some of the notes in account (like reuse
of the PHY config structures).

> 
> Regards,
> -- 
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

