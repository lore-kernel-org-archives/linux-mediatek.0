Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E00CEACEF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 00:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=; b=ZBNzU9tem7rQIa4b+l9Z9WkTKr
	s7ZBV5H32+SHx/TtB1YC3YDaim93/XsdWmZlDfzMy+sm1ZiG4uLT9J09xvunkvFJgRQXJAT3NBz8E
	/moJ/EcRanrvCAEQ0Lbmm/+W0tKaHAiuMlcMuII7/AZK5umbw6EVDciO+BlRxGqwVUAnewnZh3MqF
	44hc0/Qn5au04Zf0JkMsG3p0yu50D0B2GqTJXkTJXTRUkchb3jo0lUHruIWBQvrm/vcv4iC0bb+yl
	xhxr8Yv3eBneqaUmS164zNt52hNyBYlg5/uChoxdgtkx/gw1vBQ0WDdd8ULs1GdMLi9LJINzX2ZaM
	P8Nx++vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4PZ-0000000DILk-2Bj1;
	Sat, 15 Nov 2025 00:45:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4PW-0000000DIKW-0MhK
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 00:45:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEKrMWY295376
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 00:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHSr3Uxb5gfTp8PMcc+9CNwl
	Vz3omOLQcZ4QTy5X+lE=; b=ODckJlfsAxbyXTtcs5Zm543nzNcWtRpWXJwR+uMn
	0BqB/hWSyd4H8OuVqMp+yys58KTOTAThFhwxlyoThmB8gRaCIJKPfVhkcmZd5Kxw
	lfcbla9wgB++EGDkSmbCH3068Oov13I5BCMuM6f94boSl5AY/bvN+c9GpsOuxyr7
	MycHmceYdsDFwWcDa2NG0gHfD8rcfCSOQmWn8NIYI/9uFIivvkXUR12lN1VBKjT5
	Y3HSvqZFPm2DH+IcfCemhPBe1GISzlubXCJjqLHl0l7FtUB6DIxhlggAx+QrR280
	zmVmdjj2viq6ssQ/HDura3pZoLrKjHWEt8PvJRHceOdXOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aebuyrgf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 00:45:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so5155061cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 16:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167500; x=1763772300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=QEOyB/3LiP8Trq2pYjR0LmTRAb7qR2XUE4NSm71dAI7KBoL0iFo9E0TnTVnTIh1q6Z
         nWLarVQBKxmBkhNFlo8Km2/t5SkBUKhdPqyYhaU1QK6zCMHgilv3DWtKUEiL4g95KYYF
         sLgT6Oro3lJbPOKjzwkwDmPLKkbHGa84mtbkCZ/RjEOWYeWZ+dfw4eJtUP0dfZYSZADG
         UvgEptogMf7jdEOn0TStiULFRaaF6EpR4vJVUXrL8ZBnCCbxbDzAJFFdl8zF3FL3XirA
         1BWuoYr5Mh2rULBKO7zzu6yd302a2/r+4dE/wrdCMmutVAvdX2wUd+oOuKADzpCF8tv1
         xBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167500; x=1763772300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=M9XUiQdUUUTjNaGkJQLuhtMDKNRP2LWXBS5nscuB9bbaQW9WGrV8uMfjUk6aJaV0y8
         jA+MfwjXtOH0923af2VWqXxPpd1So8XqQme9FvQC+TG1Ffn6vt7X9zdrvkkcbxqqJ7ED
         Cdchv+o9etnyUyUSg8ocbS2auDsQEpw+EeKbe1PfxA2eUPyQNGBsWBUhFPRklqkKaDnS
         uVZ1QdpoEuC37A1Q53veG4rAQzl3ChId5SW1BYw+NICYMr2GgKbkCLpev048AD9dDSFj
         FvSaVZ4MI+hA+yldu+8Yk0d+cNtzgfuhSeZ1XVlvxE0krn27B2MFGxyfN7MNYTxtRgm0
         JIQg==
X-Forwarded-Encrypted: i=1; AJvYcCXuJovGPk3PMOZoBkzrrv+QufNffBmSSOynxnh5qB9CSx0nrPoJVuLTHozYuidNsuqQkit0V0fu6TU17Rb3Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU1cizPL34qf+P0LIl8ql37rW8LIdT2nWl8ghYOz33GZWBo+/2
	pk5GPEudfHoLGZaWTMEEbDzGEsSTSInMQeC/TwgeI2c+B5/VvMV9qdlk03u4kBXuU7zlWS2c/WE
	qhLyCuZx6LXlUFVDSF8oEC/HZoItPG1a8glLlReVjs7lXypgS+tSHGuJUSr83E0UhQOfYtINI5d
	w=
X-Gm-Gg: ASbGncvGFbXBzT4mx9oq8FAK665ZYsuRwVCw38M7sugBdQ+QWpIrk2JXHv/LKw371+R
	QGce7WAZaplnhep3XA2QL7ktxMJBOB2vk7wQONM12HQ/kc1Z6GvC6Df0PyyjN9Tr5ezLRoh6yZV
	I1lNdH7sJU+HmBgvtKq7ckXsCbH67Mz0g2VvZFgpjFgOa04nNEA/sNiXU5nHULuRf702NQPIaMQ
	pHBLfW4OToHjSnsrYs/VIOakpe2zynpejWPGKMqoY8ogxie+CqYE2ShqajHdyakq/tV3Vtn7qvu
	VrKrMlYPhW6L17I4a6/bSd9Xs6C31G6DObphmV6tVzJbnaTto3FPe6/KlrqmVc5ALgpvSYqNvTg
	IwK/9WJK6fc15+ld04TPsOxIXHT7bZnB3XTXR2HQQUCnIF4WskO5f+zrMehjOAkNxrIbWhiU0lt
	FcigMfyshtn6ww
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106378031cf.26.1763167500259;
        Fri, 14 Nov 2025 16:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsDRVIqLn1VpOlz5z6xTpaoGY3LMTcHDBpzhVsFe6h8FITQwTVx2wdmRWmkQbySXE0rNnig==
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106377841cf.26.1763167499760;
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1577fsm12961501fa.17.2025.11.14.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Date: Sat, 15 Nov 2025 02:44:56 +0200
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
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-2-vignesh.raman@collabora.com>
X-Authority-Analysis: v=2.4 cv=MKltWcZl c=1 sm=1 tr=0 ts=6917cd0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=H-B6EOQw763qFByNOf0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX1Q2cUAjG9qGG
 Y/OsfVB13D8GSfDvtzZOv0P/9R33+hKwc25yC1eFNbfevZ+2jgV5NLAVAJrxtk2Xq+0wjPuaz9V
 SwxQ8hw6vIg+57vgjfgXMZqlGfk8ga2e7rMWVBIIEmCQJT0MNARfs+R0DhSxu336/9Ayzg6SwsJ
 2SdTkv5tpY48Ko8LBGK/NioEO6S/wjNnsFEKah6ok5WvpR5Bedkl8UQciB2WXLHaKvTNSHFNK7Y
 RqafH3+0K6hanQwgBvguPHfzsdLNbZtjeWeeW01zK5ZoL70UTR6FxlI6/KjFREZLqrPscXegtZl
 D1P/hVyuF/zRsaeeSNJseh0WZwMB7XtU7gqTZ1jWSoU46IfM8NOp8tdm2mw/C43+cm+Mm5VnGH3
 r7A2CABdDfMYxod/3wvu8pzIvee5BQ==
X-Proofpoint-ORIG-GUID: YTc_XWXvL9wmyLOuPdmGiCrfLww75vLq
X-Proofpoint-GUID: YTc_XWXvL9wmyLOuPdmGiCrfLww75vLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_164502_134281_7778D91C 
X-CRM114-Status: GOOD (  13.66  )
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

On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, including support
> for firmware via LAVA overlays, removal of the python-artifacts job,
> split container and build rules, use lava-job-submitter container,
> and various misc fixes.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.yml         |  22 +++---
>  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
>  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
>  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
>  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
>  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
>  drivers/gpu/drm/ci/static-checks.yml |   1 +
>  drivers/gpu/drm/ci/test.yml          |  18 +++--
>  8 files changed, 186 insertions(+), 105 deletions(-)
> 

Thanks a lot for taking care of it!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

