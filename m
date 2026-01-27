Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9EFD2F037
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=; b=rOrAGejySTH2qKbM/RpHttvQwY
	M2Cuf3BtGNi0kwxpy6E+PPE6nC0wzd05njXx6OZn4mmi3XZB2nAq6giCZ87rNhaBQlqkFgXs63mtM
	3WHjsRtcZeMS09s8o9SiW1U8IW41JPcP/PJMwzpx+mk/lajU/Fueqd/s6+LabajJg4kqUTmiOmDOn
	a9x16WbJbjC5KlRJ3bNYrYuEvHJXGCwp8TUaWwybH6WdJvBzZUQEmWHcXrznFAxwJIU5S0CsRyCzJ
	3O7xX3+tRRM4aFC2zySqlXYwZ462D/u1y5QAj9ci6w1An80v/p/8+Yqs38Fz0aNj33ReIC9y7ZMlO
	s8YGdJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk18-0000000EO5j-3Oz5;
	Tue, 27 Jan 2026 14:26:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk15-0000000EO46-0EjI
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 14:26:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDg3in658896
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 14:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LeBGXuVPBeSkZrySiP9d01PK
	e2NSJk5/OBYu735H4lg=; b=D7eUaL8F/NQC5dIugNwP0PYoJJ8XMLVA/hWsVtxI
	TzAG0cBfSO/OEVWj3LXovywqEr0h5KcKGsN1gbRNggn55uj5TJDlj0P5rz3fxiR5
	uQTSTvRKsWKqq+4Cy0kPTyOMgUonpOpduLhMhALGfpBU071fhmEWYSFjNYvI+wJF
	Qw+GJ64tAdNnxMco95gcqFEP8Cr1Tr4YCjwDaX9mFimeBof8Mz2WvS/HCLCk+o5V
	NNWFIh0XXSbz7xwg/dg13RYXOfzzxDzHQr+sGFOaI8oTYjsA8wPvpEwmb+ChduZp
	Y0HvDtg61ADlLO1qUzsxlcZnVGspsBhvv/VrlZEvFhPK1w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9bn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 14:26:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f535184cc5so5225433137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 06:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769523961; x=1770128761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=YBTjPNgxP3MxVR7UdNWd6EFdcejC5cnR9D0aHktHU2Vl31xOXAcLTOZdGFGNQZuPzh
         wlBW9F1nrKd+rSqzo0c1ODTA+rPKPjWCGGEc5T2zQ2uQ9P2Wr81IPLa0id/IHXCv5oW4
         +vT+NLE3Ua7Mbk7WGWw3vzI5p+24pxS9NrI4DFv3Dv9fVk6oL7fX4lQQNpUfCgryoj8n
         bIUR1gWpmbPglEZDD+H1j+E7AR6G1K1J8ZkkUGkeIGOwHw4nxRqbG/BC2Z68JbEY0ULM
         6yI/Me2uyk0S/DazhVonPOzCLWwXP9EAq8hGOpa3XqIK5jOwmGl0ZR6+c/H8HY9hMHNR
         eRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523961; x=1770128761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=ArQTAjTz7eEXcc7E72I2As9nB6UqSCrsmtzJj00KbZVj91QGZDgVVCGQ6HY1io2d47
         bOHYf62NqIjH6UUK+Xr+yS58jOmE0t+vjZHt101XXlUMZmoghetCZ8blFEVNnC/XqCbT
         XSJcu5UNayh/XG7Q9RpsMgzVY2dljFC9r5OpLNXXbm6Y3nK7j5o8OBlOvXrZh0FEWtK8
         zzFODxf7eE1r9ycDifCrVeitTUpPTZ35o13Mqfn/ElQ1rqqTEzg7eG6a/SnXqfEpz6xR
         HmIe02ofeEym5/f6wed0B8LFjDnEqAlRz3P7xvBNGaL9rlIhhPozbQqIrE0TczqpbToR
         VATQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8U6t0STn6vEvQwfQbyHS1bna5jrYBOhJIZajcEk5uDHI5r1EC/9Y6lUPHa9q83DRqyav5qCtz3tKvpsT5bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNppGT51e7POGC7qoSBKbYQCpCbWrUhLbSwoAZmiW8AwIehjBt
	dycKeE8V+Ezw55lsO2f340TQc4MfMbEEUkVWnh7asDUOBm9uNV21orUN13sfgCTQ6lZq2AjVRs0
	aZBU+po4/EebqUG7iP+UH71n1zMSN+es0eqGc4lFnWV5ej5YMaCGGq3AO+tKu9FRAZYqaHnlFcM
	E=
X-Gm-Gg: AZuq6aLR83VPnACc2PpHvwezvJxVKlEkdDRdDSwilfxD2zN/AQKS6FIusHiJbdEJpRx
	lz+AyO0IQUukEv5RytXtYKQ8VsQ9JzxY3eZjNpB+fcTicCIgNKUcGRAWA92n1K/GpV/heW0ZGao
	eeibpP7x8ynhtbPW3oHKetDg6i8AGqxx+8aj2Z4t9PEfEvwYTFRFmEuyye+DH+yZlSrrSuRJwrx
	JReGLVIp6FGpYRuuWw/L+hUeAmbnjls8h5wIC9ntJyedQ6JFP8kDCxB7ErsolJ4R1ltYEIQxoxH
	fXXr+IbZzoYuo0oKcdb/dyCrQ0gc2WW3ct40bqk6H1y1RrnYg8PMaoe4Uzgc/S4Vc2nQWMcDSiR
	qzvrQTgMsLeXYQNbGSHVCuDThDcy7qx7fUqdA7m8o0ODIv3WEpHLTPqvuukv6sOA7mkVZA07d9g
	8AyhV7cq6vbUdQc5e6JJAd/iw=
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478877137.25.1769523961058;
        Tue, 27 Jan 2026 06:26:01 -0800 (PST)
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478854137.25.1769523960506;
        Tue, 27 Jan 2026 06:26:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918965sm3637789e87.55.2026.01.27.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:25:59 -0800 (PST)
Date: Tue, 27 Jan 2026 16:25:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] drm/ci: uprev IGT
Message-ID: <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-7-vignesh.raman@collabora.com>
 <zi7frtnecrzyei4fl4nmwmth3icnsyycxxobbrcwovbqfsfq4z@eh25dyfrjkqz>
 <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
X-Proofpoint-ORIG-GUID: LOsG49cSmARJf0XAP_CPV-1hxmR9LrM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExOCBTYWx0ZWRfX+WDQXkV2f+Hf
 3hOXiKY1PrZ2a03KpDiBzAXhLfDvTptwra8KQO8bnlb7Dwj6Y0EOAzomEs2fNvsYr89fCQ4588s
 FPVnigvr+EAHinZIz++RqqO8n/6Tst2f1Ptln99Yd9s8NwqU+Iy7RDBrY7DDOcdLxzLhTo1ni0B
 j/tUZWLnFbc3vD6uLh0beo1B+VlcFge0QlAqgIXLACrsEM4ZjE9oljoGFXEbM+PtM7M7tlTEQ/i
 YMUVpqyuuMv0DsS2fAq5ugvsw/BDHKTiSVSjMyGqJpdxApZwDQGMVuKIRs1PC+T/PpHFtVFSs4j
 jq45fJiFcsWSgknj6o97cztU1Js6T1ibSzcvN/GBqNmCtw4nY5iU3xlreN/ZmT+JtommiOspkZp
 0ahAppqaEOrQP8/n7JYRZgK8QWYVa7QVndvmqSjo7DJwgjH2ID3fwr3H7BtEpxbxlTmXVf8mawR
 zUcJZvfeY4+S7yfJyUA==
X-Proofpoint-GUID: LOsG49cSmARJf0XAP_CPV-1hxmR9LrM3
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978cafa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ocmXNzLk5YWpj9Dh6n0A:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062603_098794_8306597A 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue, Jan 27, 2026 at 06:26:11PM +0530, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 27/01/26 18:01, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 04:14:01PM +0530, Vignesh Raman wrote:
> > > Recent IGT [1] seems to be broken on MSM hardware, with many tests
> > > failing due to the old_primary->index != 0 assertion. Uprev IGT to
> > > the last known good revision where the tests pass, and update the
> > > expectation files accordingly.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05
> > > 
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > It is not clear, which parts here are due to Mesa uprev (yes, there are
> > some of those) and which are due to the IGT uprev. Please split into two
> > commits and make sure that Mesa-uprev passes more or less clearly.
> 
> The mesa uprev and the IGT uprev are already split into two separate
> commits. The IGT uprev only updates the IGT version in gitlab-ci.yml and
> xfails.

I think I was not clear enough: Mesa uprev also causes some of the
xfails. Those needs to be a part of the Mesa uprev commit.


-- 
With best wishes
Dmitry

