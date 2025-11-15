Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B07CEB2C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 03:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=; b=pFDCkpbYVVCFd1cc9uKtV0keGl
	/FhZEAk1HqcsPyJ14wI9Ov32jtzaJXiRmCfSru9bKFqs2/UsIbh9lMRACxHqDBWmPUBrg6WXtgAF6
	HOkEB/+wvFoOX66t6nNZL0dwgWOFfnEBEEZCYimANblX7hXLYojCEQ5eilqSkkN5J7BEFCX/qhz5q
	ZC8zAlrl07Bb5KoGmDUl7mwaQ3q2ZQ6KyuOOUfd2X33Wztpj7Foxj7x5j7p0/CmxAePUpHAv6RSgo
	lp8xJOW7+5e7PobRaDlRlvUmKriIjzVVTymmmu4IvX49Wcdxd/4iQYFRr12eH2kn5QXNpTzhrOklb
	VAxiRLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7No-0000000DRH0-0b62;
	Sat, 15 Nov 2025 03:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7Nl-0000000DRFp-12tm
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 03:55:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJLeJi4150249
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 03:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpUJE4SYKU9ynxkJ/T5JJhpa
	CqT/i8ZykNmysQrjF+s=; b=V9xyueey6blpzm/jfavsSbhlfoxZqh6ziY9GLiVo
	pRLERZ2MEX31+yuGsAhlfVnpx49LUnkivh7VOeVkX+iEZCpUszfAr6RWAvx/GoxG
	ZijhYK8E3mzyIqhG1hK2L5/w9DdedzrozrD9Lv3PvXEGCefrjA2nK2F6EPnJkN5Q
	59YLYTARTJ+Imk6JfdjaS45qa6wSMYck595UYohLzKOGwUnrjp4w0vmLrwRUpeB6
	SYq4g3sGHee1nq0e3QSLce0NkDu8LM1+cCMEAkTcfdWp6FkDpecyTGsY74vra0rZ
	jqFpR49ENgMSjHk8p1Xtfaa+aw5Hd9R3LM0WfZoyiVfmLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeagyryk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 03:55:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824b00ee8bso41889846d6.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 19:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763178923; x=1763783723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=XeKPjhoHnUkU6kE49OaBA3vKXwMMbXzhzwjANN/WcgdkG/Z+3NEim+xTKTefTL7f2c
         hpEGuNFw9RzceZY7IhtHd03Mjs10NKPwmk4ZV/eMp0piuq2PZl5uZSfiPDTGTeqZh9hC
         M074ENAIfwKqGvKlLHTzoHWOlugql9p+iJY/fzKe/PHN9FsaP8vs8gHe/KP01+mhQBIT
         szMPrQJkij9AqpVuK5WjyF/yViaKbTJKmP6PYsj1yGZjoDd4Dxb0zTsYriD7DUMjWTZ/
         kYZaz698YT/WjJ16XGdSrA/QPUVyjiGr+9usisbrfuPcHjD4Icf8/DCZw5w4L9ZHIU4O
         k9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763178923; x=1763783723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=HeqaD928VQ4YMFxtFxFxtzh+lXBbcRjkqCuukNAtLUmmRa3TslTrI/gjG/RHcAMl0T
         3zVNydWqi42GuFlfqnFPC3fN9YfX5NyF2qH/N54xe+4UyZ7tS35lnBhak+mAwclsIMs+
         seWePrK8yCTd/Gj2Vk0YtfGF0lWnwv2C88WOnGPZ+HUuCzl9enJy7o38iWCR3n2hoPr1
         dusUmKya7fkd19cOjPhJrc3kCWSNDVd7AJr7VJUZbA/NK4avSs0Uq7mdNL0vrRfNWHsp
         WixdVxKN4fRO0uWlZqz1IaP3FNgkHUTgXRisnJyYlKjYbIVN4YKEdcuO8Gq3HoTCHM0L
         /cSg==
X-Forwarded-Encrypted: i=1; AJvYcCXr0q/1FxQ6NTSx75QwP5VhZbvwFOHwW8D5fnRiryO/9z+JW06gE4ECp4uFG00piK5RUjksN/x5eDV23ageQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7b+74Ff2eYS9Z5GZc+Ra/d093Td/CnXSsK66RCohVa7pZBqo1
	wTbUC03blyCW6QVVu7URfoPjiWVsaEUmgR91ROsx4nC2rW2ZMl29mucXxuIiIaEtYoA2LnA+n+Z
	8+RtMQ3c2lNNF4dNq6rQ9iLDq93KyPwcEmk5hSYgBfMJ94CVjrte4JXCt7If0iegLch8pc/zi1P
	hjcJNJO/E=
X-Gm-Gg: ASbGncslMPZttjgH8l8ppBqOcYs4vCFH0mmTDNmULEhI6NJUX0f9jl3cwLMqEX3E2zC
	yCGV3BEBy5N3l9kwPGnx/aZHFDWXHKfIFAHGGlbs+AGdCx0X4wqhMuaxo6QdSyNWbkFuMT9lsao
	jD4ktje2L58jKcbl3hwX+vq6fEF6++TrBm6OGWiCm7NCem9nah0AlVB+ed077zBdnxv8RNEY0jB
	gmJ5SiFMlZf9x7w7PIXxJboBka5wOE58x1EUrL4odlrSEebSSaauejTUGkQ3Dw5TwK7UMeiDtDS
	ml9po2j/x5MsBA2Sy652o30cVSLisd47cd54kVhwyQp9ZdoBVk396+Duw4CPyhPlCXPiXIx8Kel
	mcTFICeNIlMI0ppDlK1p3pNexa4/4X2mBMubI6Cs7l3HNIXn4QV8TV1B/CfAMP4ZawZM6HULH0E
	ssE5FhsXpqhF6Z
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893266d6.26.1763178923083;
        Fri, 14 Nov 2025 19:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH21xNZD/1SaQbAJXQ9lzSs2ET/wK99qDySnRnPvmoMPz0h942r+lDos6cmgLn70aSgdH9ifQ==
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893116d6.26.1763178922595;
        Fri, 14 Nov 2025 19:55:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040c7ccsm1449901e87.100.2025.11.14.19.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 19:55:20 -0800 (PST)
Date: Sat, 15 Nov 2025 05:55:17 +0200
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
Message-ID: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
X-Proofpoint-ORIG-GUID: YUxpGh2436M34AeHRAbWyBoIJzmtNKA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOCBTYWx0ZWRfX+qtgvSZGi1d/
 sXgqjUTI/aavUU3BjSwPrXvnDMkuRqsua5VIUEqwQN4Sdm2isEaDgtQ057Uk/eHna+DUqMmEK6i
 h9eeDVLCY/vfYcIST4eEouSqFW1D0UchzvJI3V2jxWmNYQtD15Ixw8DyenEcINOxZfjw4VIVRjg
 Qgz9p580khtZnq0EACoAsJzMIUYLBnqz5dyfkiEKUpiCIyqwpZJpGz63a0nW7JtyMwW2SXbtiW+
 yXehrLE8UEdczHTFjhREL4NGle1YIAs27UwuuaeWUj+NOGD0nPeNhh+ftSkr4wz7ZJfgjRxuMGq
 YCbjMXT7AQPk5BvVazXpakEZ9h9yCeaOiJgth/3z4RI4u8EtpGZPdg9OXsKWXqdCyEduqD88YaD
 LuaMcPSANKHtnzUI5/Fg8/CL1IISkQ==
X-Proofpoint-GUID: YUxpGh2436M34AeHRAbWyBoIJzmtNKA-
X-Authority-Analysis: v=2.4 cv=Go1PO01C c=1 sm=1 tr=0 ts=6917f9ac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E-Vn-V3zxCEcjh91BPMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_195525_292961_39CA4CCD 
X-CRM114-Status: GOOD (  20.61  )
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

On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > for firmware via LAVA overlays, removal of the python-artifacts job,
> > split container and build rules, use lava-job-submitter container,
> > and various misc fixes.
> > 
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> >  8 files changed, 186 insertions(+), 105 deletions(-)
> > 
> 
> Thanks a lot for taking care of it!
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hmm, this causes a lot of failures, see [1] (note, the run is not
finished yet):
- On some platforms (msm, rk3399, mt8173) the
  core_setmaster@master-drop-set-root test fails. On other it seems to
  work correctly
- sm8350 seems to have some issues with this uprev, it cant' finish the
  jobs at all
- mt8173 and rockchip:rk3399 seem to have other test failures too

Could you please update fails / flakes tor all the affected platforms?
Also I'm really interested in the master-drop-set tests. Why do they
fail on some of the platforms, but not on all? This seems to be some
infrastructure-related issue, since exactly the same kernel with the
same IGT passes those tests (at least on msm hardware).

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

-- 
With best wishes
Dmitry

