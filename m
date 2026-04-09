Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21276F364C0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 21:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=; b=1C0nqHYKC3UhO+5/dFmUuSywxV
	0QK7cKOa/o46r35lvmp2WB8RFXYg86YO0iOnezw34Ime4YW26L9Uupms6YqtwAFI6R35FdSP9Z7h2
	bG52/rIU2ES7RLBihW105dKGnFgPy02tmj5F61+yGcPxMRmKtK9ncJK7GvABEiUQZEO5eiCgL9jvL
	BLAI3x6xjl/kNIzlp7/VAyPsBetrqInB/XldaLkeFLpZDmy3oQaBwWAnplt1XqXGQbHq68MNdgPkC
	dY8qLM85rCqmzPOwOFpf3elgK7akTm4mogu5A4XlBJmv1vV5GYuB5Ox9X9wTfczWP79BS9GigNvgK
	OqFUI3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAx2w-0000000BF19-3rZD;
	Thu, 09 Apr 2026 21:36:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAx2u-0000000BF0V-01HK
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Apr 2026 21:36:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdhQr2813070
	for <linux-mediatek@lists.infradead.org>; Thu, 9 Apr 2026 21:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=; b=kOA4YSqWunwDnBf7
	PZEsJ4gRm6TFadnMermJIbJp9qe4l0tJMan+tjJ7C5KdmtduGZQzJjQJHHjaxNeZ
	o8qFJAwB9GlGMdjgGzNoVI0Uz1OLAPUFl2pChxXveCHHZiwuvliq3Oivjx1iTD/y
	Lyw1/v8ADl3BsfOHtd+bV2SlJc0UznsdZP2ySJfeiRCgF/8csU0oAuFVDflZrvTB
	XkTi7O2EM6L1ifqceIEVmZTK2f7P2BzGWaK/JlJDF1+NkjxpzJ+6E055M/Br2KET
	i1Yy3fwJNRpt8GS2EwNDYxGYwLJS0dn6PfBgk2D/Bo6BETBfnqmvVVJCShGiG9B2
	7HR0IA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9k9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 09 Apr 2026 21:36:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so30026981cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Apr 2026 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770574; x=1776375374; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=;
        b=OzW2FSK615KBgN7pYBSZhocRvySXdic1s/efGtFwHA3AQhJOnN2Cn9E56zTxQSwc3u
         Is0JFpfXuE9+PbARn9nR5cJti59/JT0IxO+Dlf5VSJfQyG5TvUCve4o/DrD+z7xjuDL4
         UKWuojQzTpJPnhe1+0YKDYHIw/rwF01N4cAPRgpS9+UbboU4gp0t7fCzhcO1Af50DeWH
         Ci25CTG+Q/yOSkjzNFoW30BbyxWYKm2w3siBZv+q4AMd8ulSJtjChFsHQsnIr2do6FuI
         UMY36YlxXdlpianzoyHmZPRB5OrPDem0U/mnIzzPrAypL1iO+KtFIZrrRjyu7KsvNFv/
         ip2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770574; x=1776375374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkJRO6Oo2pp+w//8GQnSgMgSzv0FXnFgaEUwgsNX1S4=;
        b=pANALiAss+ObGnL5gZFD0AT3pnJ1RVxZN3raz8GTC2HdY4WSd3EZWoJB63vz/zdidy
         apwxLBuj0hpaH+e0MQ1aVegBn1fmLRzeHNWHEkoqulDHQRIcJfpXogZnpTjql00aOj8B
         Ui8n+9MdiEuFOz9GZsL9FvtGXCleHCtoGqV3EvpPVMXtUrt/IBJb1IQluBlBJT0Uvzqs
         OhtEmdztnSlrLCL9NkxIj+yTqgBrv1Ea2p8Gv8vKzvyF0drxg48buAxGOWlpycbbbPG+
         4E6M/9YywKWiD59pxkB2KegEwZARWiGdGzsrd0XdnowHSIqeQSKKt/jXvoDBSVodWuaM
         v77w==
X-Forwarded-Encrypted: i=1; AJvYcCWCB/pRBvECTkVkpjG1O1GTN3+X3vaUw1XUvoTGleOizmYJ55efYOyTclCAh0v9xLMfFpO6dLQkvZrvcnLzCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvTTM6f80zlxtQJvt+y2MF/OufznMTrVBUmMKXzXtDJig/MmPl
	HZnBqfcuVdSBHLV4e9g3lj3F1IUxAmBFJAV2BAho5oC0X6nsqju6pndKRAZVVuLng7Ev6rrBOXL
	bUY8Urq4889Q/rnDjmZD/V4+BmeaCfHYEtEjoQxce2TZZArJQuzAlFQxYQszSYJyOrxn0V+7/4P
	o=
X-Gm-Gg: AeBDietPwH5Z4Gw7iXyDQ5Pcyt4uQY/z+0U+vzM7lYGmq0p3pkRXo1DZp9li1eX8VCB
	qtse36l2LW99GvuO7PTpO0XcdYEMv1Xn2vQudaDUxurS4DiR3am4sHDqLtPEYOtIJnNgAlmo4ul
	I2l2vJf34+NR6gTVPqi1idae05e/nZbWExaBoPSF5IDwXUr1nAFvNlT2461M3YzOqgU7xnZqvdE
	qcKfaFu469a2OxLmnSq9xkibqGmCOOkW1dOeH5DgLA2pJbNptDBeBuXIekxr2xW8fklgpTlcTXP
	vZC5FfC8pl64I3Ql7y/HSS2GZoFz8M3WuVlzS8wozH3NAgjifj70xLXWD+MgDfAXAe3P32ppl0M
	ockQi795Y3Cu9xJr0fcfBB9VhVcYQfvFP29GwtFU2ja7tAmbHaMUxAhIvyh7D6vmFql+G9EcT5T
	etOgBFbc4Pq5WmruEaetU1dPAKZ4jDUNR2UuE=
X-Received: by 2002:a05:622a:8305:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50dc1acdc38mr55451151cf.25.1775770574007;
        Thu, 09 Apr 2026 14:36:14 -0700 (PDT)
X-Received: by 2002:a05:622a:8305:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50dc1acdc38mr55450611cf.25.1775770573510;
        Thu, 09 Apr 2026 14:36:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86784sm174147e87.8.2026.04.09.14.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:36:12 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:36:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: Re: [PATCH RFC 00/12] Add support for DisplayPort link training
 information report
Message-ID: <u4ononk4cpccx77gvlywtfen5rmyslvr72v7olkhdrjf65aqce@xo777vofhcan>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <adgNxaFhbQaxC5E_@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adgNxaFhbQaxC5E_@intel.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d81bcf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=F7xsp-YMIWaRqylmYmQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LDk6wjyNAogiFcWPDGKOx_RVp5nmV6_h
X-Proofpoint-ORIG-GUID: LDk6wjyNAogiFcWPDGKOx_RVp5nmV6_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OSBTYWx0ZWRfX2Yo7dgalQ3aQ
 BQ1/n0x79FRZd+uw47yFFOhjXH44t1qExcFhe0K2bp6EfSRpX+gb67RT+NQELMNdKapcmFFcpYK
 IfMgjRyjHvJBaoU+OEBcG21xk/PmNO+aS/McDZikfTdqJoqCb2NBGMn+jeZYHCIoYNRx9UWlB2n
 wvX57e5oVqagRJeWzHO3x67Q3XnWkc+n3giR7/+dYRb5Lt7lXlSIOx0bBN2nLTmSJ2n5fVEiXFz
 /13xyR1+IosiEcxNnkJiOa3LeZQ5H66aSXpYu6yLYBL9Dy28sFtLLTj5dVsYzZTQvpau+aM8m8l
 mSlCCTnG5SHv8N88EKitRKlmTxNKATs+JN9Hk7VoX+R0UthrgXWqLPoTBrbu0e+/lpv4Mn2t0BT
 eXwTfxoKB+u9636SRof+vw/XZKPqVzwnKMZbtxV68mL9bfzSy1iFGsKTJca+443pE80wpaq/aLB
 je1+A6AYaaJ2xz/XKSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_143616_055838_5282B487 
X-CRM114-Status: GOOD (  20.01  )
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

On Thu, Apr 09, 2026 at 11:36:21PM +0300, Ville Syrjälä wrote:
> On Thu, Apr 09, 2026 at 07:08:16PM +0200, Kory Maincent wrote:
> > DisplayPort link training negotiates the physical-layer parameters needed
> > for a reliable connection: lane count, link rate, voltage swing,
> > pre-emphasis, and optionally Display Stream Compression (DSC). Currently,
> > each driver exposes this state in its own way, often through
> > driver-specific debugfs entries, with no standard interface for userspace
> > diagnostic and monitoring tools.
> > 
> > This series introduces a generic, DRM-managed framework for exposing DP
> > link training state as standard connector properties, modeled after the
> > existing HDMI helper drmm_connector_hdmi_init().
> > 
> > The new drmm_connector_dp_init() helper initializes a DP connector and
> > registers the following connector properties to expose the negotiated link
> > state to userspace:
> > 
> > - num_lanes:      negotiated lane count (1, 2 or 4)
> > - link_rate:      negotiated link rate
> > - dsc_en:         whether Display Stream Compression is active
> > - voltage_swingN: per-lane voltage swing level (lanes 0-3)
> > - pre_emphasisN:  per-lane pre-emphasis level (lanes 0-3)
> 
> I don't see why any real userspace would be interested in those (apart
> from maybe DSC). If this is just for diagnostics and whatnot then I
> think sysfs/debugfs could be a better fit.

I'd agree here. Please consider implementing it as a debugfs interface,
possibly reusing the Intel's format.

-- 
With best wishes
Dmitry

