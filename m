Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8BCCAC5AE
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 01:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbUhjN5CIGWSt9WkjZTIH5uwxuwIn+CRrMV8Oz+n67A=; b=FdnfsKRSKVi+M5xMdZNBalnmw7
	khPFVex7pF8nNZLdmxyzBBO8ZydR/kHm83njK45kgq6Vvt9Mwt76kB019bzzDfyg543jhb0c8W4bP
	mf0JXkqYrDPwratmlRjHDoMy3B/nkywCZvev+9/ZcCORF3ayveulQc8oiInHos6C0+T724wWzcHBS
	IwG3xzjdsrfgAL30ECXF5xuhW9spq6AEnX91O7d6KNfvsWiujIVBdZieE1WpI3kF3aVwaHtDsnr/V
	OB6Fhy2nEfdtxyscaTyO/qyBd80/mAtGHuoE9KYf6tU6tErsBtJk3Q4b+/weEx5qLvVm0HRMuz2Rn
	7o0lWSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aUe-000000059k7-0Zd9;
	Thu, 25 Sep 2025 01:09:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aUb-000000059jS-2haI
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 01:09:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0JonE017470
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 01:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DbUhjN5CIGWSt9WkjZTIH5uw
	xuwIn+CRrMV8Oz+n67A=; b=DZDayiedObjYn5sPShaRMCrXuWpgoG8g83mwdC4o
	zsMM3TiN5iB2yOV0oFbCpRNLPXroSzKuTXbgcMmWMJqqLPYoccmqPXh5S3sdhveO
	90i6UqZUOoLUIzAQIprL4LvlqoKvnY/qyvMPXk15pTbRxpFxu1l703rrZCGLPQW8
	n0SDz0Ysu7umuMbQpcUQIAe6X2HV/rsTvLqCNHocMMTmM907uRrrSY57evXZYmdl
	F7kftmcyzY1f1+wiVKlAHPxZnooiow4/hDHVgvxRNOJzOhausCigu1YJmwAo+F7A
	9rgXQuZXjCdk7eM4Uqm1vmfru1RExeCpeZPjiFmaKBff/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjykaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 01:09:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ca4eeb9b06so9973441cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Sep 2025 18:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758762591; x=1759367391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbUhjN5CIGWSt9WkjZTIH5uwxuwIn+CRrMV8Oz+n67A=;
        b=ToT95Yz6uV3wPPYs8f6F6hs3jQJv/rnVw9AqD6UElYs9oKu8sPp0eOEo2q4P1SG4/z
         DVxAKTDytGoUViqLqrrGqSgi5ZVpwnHsVSmC8R6+elBV4gBBRxns8hTtjHQziZC8Cg7z
         FSRdvabqL/iTpqb6ymtaLpDd4Ecd3Uc4osve3r4rHYAcrPHOAGA5AS3WUJamd3rR1oRs
         7SzYZTog3yQ9Tq7sz/Rayuc3Dtfqfz75EjcXtl8ih0cnA5HLZVHffpPI7u1VgjrrdI7U
         2+/o3yuHv0BBM/suGReVbNxW2wjaCq7QyuD77IPpqadN4EMHSfQQN1R0VxBLfmEYdnpW
         MijQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoxx5Hjyva9NYC9yWB6DOrlo1AIX+92Qfe6E+Tw4ZSjD7suV5LUW15Ack84gQVcDJCsDxlfGq4JntIF9nHyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyavvzBOwhICvwGLxq0ZYhewJ7lgnC29dgXmcydmdxGeuewyr0N
	TEPr89Hcq4ajQU3Pq+aubOhGgEfwloHldqdc9FxAtTS0Vb3XQP8qjX4vuK5ByaeF/NLoDkUJBoI
	UqYbUzcaQnKGh+BHhlDoQ6j4hl4F8Z/ezUROUXQdHTJIC19h5p383rHg9xXLnCvhx6ydMkFMbiR
	c=
X-Gm-Gg: ASbGncsexOCvbYWpMdhmcHjA9C3o1aPWyKnt00HB5Uc2+SY94Brcy4ZXXPvinZ3WAHF
	p0/hNzXFsx7zYanR+QrxTn28SbG13ugtZXgEWCdF73otLC6hfXlnaA2ZRVZTRG8hxJVdnFbAe0c
	DMNdvxqdeX8cTp5YKSUJsn4ZHplJ1iX7nA0vP8jb9r6PGNZQKhgDQzVP4FblHWET+7yrovpIB6r
	bDAEdD/BUPlmuTbIs6PKSastJJCMeqdp+8CQr5YPPWDm7HnvUn2vu29LyC+9DR7g1mmeD3tg0rf
	ugYUI1YUduHhN4vhUIModuLBs+i8HmF5Dr/Mk89cvmq+xZpB/1Xqpp1XjqVmXjy8Pht5gOGJ1ry
	xsyLzj4I3YGOu2dicKVEZzLYcgRv4SSC/yH0KyjbyldDDNyj0CfPb
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4da4c39b63dmr22908881cf.61.1758762590701;
        Wed, 24 Sep 2025 18:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHy06/44VJG9y/4ON5huaolTpEddWVJd1dr3xZtLHQ8wyGirA7dIu3ZPD6BlpqavkK+a5x3g==
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4da4c39b63dmr22908561cf.61.1758762590203;
        Wed, 24 Sep 2025 18:09:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3252csm183105e87.119.2025.09.24.18.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:09:49 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
        simona@ffwll.ch, matthias.bgg@gmail.com, dmitry.osipenko@collabora.com,
        granquet@baylibre.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
        amergnat@baylibre.com, djkurtz@chromium.org, littlecvr@chromium.org,
        bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
Message-ID: <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
X-Proofpoint-ORIG-GUID: 5Np2z8x1CB8DJK6CcnlP3WCamF_9pjjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX44ksvjQ4wwHW
 RBWQQSCoxcSR0U3C7pXIPfdplr1T+P23G3E4rbBJHJ2ADxAbjfgvszrOKRiP4T51j6myDythzru
 atCtBwm3KeGIsBXvp4RawK8uK1MIlqJFmO0nKECrJgpMedqULnCxDo+ZBNJODhDgzqKkgRm4xxD
 CJuHo+9SDT9A9iwRc3BjqeY0ltgxCcS1408ujPHFXW8R5DrLOCKQvUmrROqCrzbcHDxALJp7uS9
 fzXlHAx9kfX6LwZ3VhOQ7lqfu82UMjJQnJ52NYaOLcZhIpwVczZsCrsBjg1qSAm9KKhBspmLAqo
 7LQNvRpHog7xsDMrOVLYpi2/svsW7xl6KwivGhiCdAkc8gb6gjwlwSqAphCuVIS5OCD3oBYhNbQ
 49D6ox2T
X-Proofpoint-GUID: 5Np2z8x1CB8DJK6CcnlP3WCamF_9pjjd
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d49660 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=O6Y6ztsS-7Sf4rctI10A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_180953_685520_0F11C694 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Sep 24, 2025 at 12:37:06PM +0200, AngeloGioacchino Del Regno wrote:
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
> 
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
> 
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
> 
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 

You can save yourself from all these troubles if you store the
registered device at  connector->hdmi_audio.codec_pdev (see
drm_connector_cleanup()).

And of course, you might use DRM_BRIDGE_OP_DP_AUDIO in order to reduce
code duplication.

-- 
With best wishes
Dmitry

