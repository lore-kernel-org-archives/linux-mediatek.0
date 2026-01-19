Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967F1CCF2EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=; b=RA873Hlhk6eXFkptT5k9Qsx1m9
	iY027gGYAIQpOtCawKTDUGb4TnmeB3nFvUPrrnNQ/BBRSK0enYG2V2x4faLq0vQUTPWqSFmWtB6nU
	1CRyuh+T9+aW40Yu1Drbt5eRx6TNoKn49bXUy/HK/eMUBfAnG/+xu3POsjQA7oLnWGXZQ6PvwqD+G
	luNpjK0qNBe3jtEUN7UcMa9P/iaDBtcAGVf8qKvAJi0ln5KJhNMoZFljXUTHeVotkUVDyvB6kp/B9
	lj2pdmEFB3ZFeszZdE51pdjIfTEKtTx4SwkMtKxvA8QSKFazEWy2sykRcUaFXb+UKoBBrKEAQY0X0
	cWTxAj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvZ4-00000002oZj-2Qrd;
	Mon, 19 Jan 2026 20:09:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvZ0-00000002oYe-0asM
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 20:09:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoVoe2305870
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 20:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EhI3ALlg7ECBWd34gMawxDK
	MfILVf5/HCKOnC9/hgY=; b=HixMDnQMF+xXzNTOSJNpJXDSLJiYmaS5XEPdXgLO
	dK/AjiEreIPJaL1Ezcuvgsv7hKbCabzhXQlrgWBsEHBjc9Fm21mGAFRC0fmT2JwI
	YAxz7yPmS5RT0f9UyMVeQ5wDP28MR4Qz/HnWw7hPJc8xQPrXAo4OIl6jXNbuiPyD
	Q9hD5k4PezuXChJGxSYd1utiBLTjRFc3DPdmsJXERgF8JkWJcloqRoRR7YwXEBh7
	aaBomgaz3NiUYwXN1ZOdtNX3kfbII79vPd9n7/H3/dYJxP626ITyVpG9u/pK3qLN
	i9rp4oGmKHlwtoEG/qxPJIFV4ujJhG1VW84izBgg/3YpNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8tvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 20:09:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a7fb4421so752485785a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 12:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768853364; x=1769458164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
        b=f1mOFmi/8ZR9FIhD+o9DNSR7hfrPSK95rYN3SsDhAuCp4N2zVeCccfqMdcv3xuhVLm
         KTnrLtcVAKxJeCIWa59EQ7FB2mqEdykKcX/0TvMsATERvH/ZfslqsRFi7wIstqklD5yE
         G8MCCFxKFdMABV4qVXHYNYJAG1+URJospvB6ANzI9Y5Om7TORv3b6NF5Nq6MfIo3wCWS
         m/MVrQgdZQqWCWtTtyEOOD3uglueWHXA0/ocACscQFcSYy7UOislH+Mi8upSGX0brpv3
         FBCKpeLIGi1kscur5eEnobpo29faUbfiDLkpmuEN1vQieUQek7RLiAYGYSr5nDwsQTUO
         OCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768853364; x=1769458164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
        b=HB8XoOuY12hWKRcpmLzLoTOk5tApmp74tpbIx9wkYHnpinpKMhpILDjOBOp51WEEIk
         LN2cpRy+wcYFEsaN6acprrPbX2igHyZT+baJvwFmOm2MgrAE+VY9JFnxIv8XqR00lmr6
         E9t+XVGnnV0Alv1e9jKAsuRjlr+ElI9fNGXfFzGJC/1M6dz4QkMBpWe7LfYUCxOh6T1T
         Mywl4LLqLY+lpAnTHkH+eHWGWFL9QgyU6CN0snxx2YJk/DQMuABUpxx7aMZ9pEYwoM2x
         xLw9K9oyEsn9DVdwwcizc2dwE5mvdw6aLrE0m75KNDTE8GjqlmwVctcUkyTwMs0suAz1
         kOzg==
X-Forwarded-Encrypted: i=1; AJvYcCUOD3bMx9GeIgt7fg+z8Vt7Ka9ebrvZ+hDLx9eFpHxQVJdTKp2PWgU5rtyBDY6ROQ9DP8Kgq6gNBUQFgC/Tbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6iCxAM0sW9WRwG4HKkriXXUTXzxkEKvNWevT9K1H64b1Kwx93
	dS/kxVnKeJ4lK3sTzWDIqqGrnfDfD930DpilPhAS9W6SYnSMERRz2fKz+YFOMBVfF9gU93Nss1+
	YOVwxolG9dblSYztEEHYssaQZ2hAnwWgz3lSk1yjzPwh25HpNiRCzzlCp6VGwP6cT9TjYLIg+Sr
	8=
X-Gm-Gg: AY/fxX7ZQlrIlWJeLJ2CesgJws8iYnAtVHxf/CnjlPQAp9DL9NkoXJSKvO9i92RhDjU
	cRt0k1jN/w/PjbEwNWNdmbN0bSYhRgEZT/zJV6MTsbv9Tj5ZUTJvjyS3Wok8b0Xx4rEu5PAByHm
	5jpj7NuYzpHCHDg8SzEzCM4vaeDcudUUBh2cORjMfdhwdTnrtysdL7xlejhkkMF61iDQFCJO1Fd
	opMIi5t1+VH2dPZ5n2C5bmYL27LjOpRYygW0D0KkNsCQdLJPPodeZHPWlenxPdKAnGR1CqEJEPl
	/40Ul0aoyI2jKZ3MuT/fa67kJ+T1N2KWvLTWdmbY5l7DjWAARzF814tHxAZLCBdq6fEs7AHqIa8
	dX7k2O/O7luIPOhD9MuffCAdtlQ9m7N8qwXlcHeOdZi82ueMi4akTCEFGQgGCNGX77hjSoUJt34
	Bc815e0Jfi5lMcRCUalnihV9A=
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id af79cd13be357-8c6a66c8527mr1666861985a.11.1768853364426;
        Mon, 19 Jan 2026 12:09:24 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id af79cd13be357-8c6a66c8527mr1666855285a.11.1768853363895;
        Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm36641481fa.23.2026.01.19.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Date: Mon, 19 Jan 2026 22:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <couy5kfkofizy7m7c25otstyitq7ods5tk6kgk6vadqaku5vud@oy6bhofo5arf>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
 <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
 <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e8f75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zvl3gqy6_dqJr4sjycUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KN6CjYnWtux1S8moymS29RfFB3ZDylBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2OCBTYWx0ZWRfX5Z7uij3iRQKT
 JEBuB4+oGqUWrY6HBaMjZgIfEtVXiSY4QRrjWSffVJrZNhjA1tusqRvdWQplAbSrAgD3VAjsqTV
 +GPzQTpTzbJ4lqU5CHB0gR6SpczULDkTYGfgstEj4VVvzlYOgOEw2aRxmdd5v7z1Yk0mE7t1ipw
 Pj6ayyZEbWPSAWntR+FeQy1VSucQYEPI4nz/q4Q2FvoE54r/T17K7XAXKzZKvoBqP8sFtxRtSAP
 6RdoN8sUbJX2y/9e2htKoN6GJJ2x8TmnMudPQH1CoNCInMS0P78chBsbCA46u2MiCzCG+NV39K4
 x6nPXLslVdNCEvbJ04+cRofdEKTpAvrHykzNsifz5heJoKo5vZEzcaT6aoBM7emDlQvJwkW5vKB
 i+curkiabGmLsBt9SufZasbgNiC7hBIj2wKLjZ6ZqAFN3/Y506KZFWTs2hgPOMEjPdDQTU5LzE0
 zK/OL6DqXjeTAiS8tqg==
X-Proofpoint-GUID: KN6CjYnWtux1S8moymS29RfFB3ZDylBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_120928_043997_CFF5D105 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, Jan 19, 2026 at 03:10:21PM +0200, Jani Nikula wrote:
> On Mon, 19 Jan 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> >> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> >> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> >> > unsupported doesn't result in a commit error. Also check that HDR and
> >> > Audio InfoFrames are not triggered if corresponding features are not
> >> > enabled.
> >> > 
> >> > 
> >> > [ ... ]
> >> 
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >
> > Thanks for all the discussions and the reviews!
> 
> Your commit ca59e33f5a1f ("drm/atomic: add max_size check to
> drm_property_replace_blob_from_id()") added a new parameter and this
> commit 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
> still uses the old number of parameters, breaking the build.
> 
> When applying patches, please make sure to build the code before
> pushing.

I build-tested, but I didn't build kunits (which obviously is my fault).
Which brings us back to the question having pre-merge CI for the
branches...

Anyway, the fix is posted at [1]. I'm sorry for the troubles.

[1] https://lore.kernel.org/r/20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com

> 
> 
> Thanks,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

