Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F63CCD19A
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Nov 2025 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=; b=v+SrpYxj+flb7ZCpD2Y+BIqk3v
	cgvJA6cMGbebAn4YLto6JBnUyzYzcgc4Ezx0eyzee8XPuhisHjcId+GFSj1EdWF2Iv2IwOWpx1PW1
	zMG0uyHuXLqDR9G1bZ5/8eZMRLVavOnJPCy8UFKft5cXX6ddSG+jp0a/TKshaEv94O0SOeLfYgsKw
	ftKCjSliac7xhAnKaMQ5oB7cqKsI3/tTqe37R2JnsX97tJ4bZfHcIifC1uRjTh9j8ZkKug+zfeDW2
	GoIWifv5q2n365xeyESUhgYNYJAcLSj66W8sNXRsSPEhHXtA/qdHgQIVA2qP5W1r81Qn8fsb6KfAS
	4e8a/H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKeje-0000000EnRw-2WF1;
	Sun, 16 Nov 2025 15:32:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKejZ-0000000EnQR-39oF
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Nov 2025 15:32:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG7STOb547066
	for <linux-mediatek@lists.infradead.org>; Sun, 16 Nov 2025 15:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=brXB1Y/LPVXbRpByEO14Lypc
	5NwpFVTcCsuQsNLy+W4=; b=STV1aCeqitSSB1V44tB0l1zmgK/7jDhruQaVos81
	EssOg08VRmId+HKWwnbjmu1A0oxPC5Ot0Oyvyo87OOJHticVG/YB653NVBPtYm9d
	UMItP9V/wSh+4E91LFlEQhJNuVhFvVTS+/bfsvX8obshzPQA/diigqQyXgEmYa+2
	zxXYJ2F40o0rqOYznjpqhDid9v6g18id9gJ19enQV+cFgUdkWcy+0mxpFb239eHs
	p3aVsMkvNCq6kwdAPk3OKLUDSbymiPKKYAioD2H3p7O3WWKAQeMEmM52tSJ1CZTR
	ylI817cj5MU9L4CVRhwrC+CcUAq4YwWU/UgKqZenuQxUbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1j974-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 16 Nov 2025 15:32:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89ee646359cso1178287785a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Nov 2025 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763307127; x=1763911927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=CQefzll6D6nwe0W+pmJvu9nTMaeXGMtZsPLQdGR2f5QUd+sf9g7Bj66c3OYHXV2yPb
         DIdD8x7OH8nNaa4Kf875WAu3Oc9v/RLqBemG1ljkSxAyCDzPGU+0j4Vl4v7IoM9LNSKz
         Im0+5fx8kNkbmEhw8/lX5sBippHJ/w6dMaKyZ69WXdLp7A3bFB6PrAS9V3ooNpQHLkh9
         jqiPkOJx7XnRr3f63bV0aA3xx/lEA7O+RpCVZtdUvIyguXt0MKtVrC1aA1BXZ4FIJA4H
         xgGiG+775hhHaaDNTfEAqKpsRhfYV7w5ou17r7BL/wfAXCKJGdwvDE7GUcfluQklKXUj
         bN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763307127; x=1763911927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=g9rBDUxZ4uHwyQVkbvHOX5atqG+CdCDPLA5QGEdtaRXtd1rdhfKfJ15N0ajGXh8ALj
         g88E+OZhMdZpuyyCMKxRDi005pg7EfnEjms/cjY0cVLh+UImYz7fUiYBsVqwkx2yqd7v
         Cd2YEssb7u8vwDV+RvLyl6XfcFcm9h1IOpTi3qWR8lLtywVX459YrkdPtMCbUMVEn2bX
         Pcwu+HwcIMIigBxFo3dyDJywudM0Q0n1LOmgJg8qhBdpZqhqBtGxgyfo6Qx8nccpKdzP
         IY+nGEVxG+KQSRzgL936r2+fg/VQO6koMwhLkOgydjCHClX8yFsZ/89f8rDrTBqR9FfZ
         4e8g==
X-Forwarded-Encrypted: i=1; AJvYcCUDSqY2XtReG0C4GIqc48ZlGA8QrgEaSPJtyxUHG7Ht2vx4ImHMZ0efBKbHip5p8BKvg3vhchpxKUqZx8u17A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxjp9Lr+qTfWlCeEDN67T2x1fLgGbmdVQuqqxzGalgnxjfRsbH
	yAr6K3AtHrBOpExJMjW+0VJzOZLq3xc0lHjCG+HvfSqanefkhns49fO5Y2B4xhMra5OTZiohb7B
	U8slsOap8WQIws4nnWCbft6GLI1jlb6HcdO33+U/SPpyhxDmTY6reXmpNA30RMsLG9abWpWpAbp
	c=
X-Gm-Gg: ASbGncvejA1tvV4mjOHey/8bysN/KFem+uh5klKZ9bCxyMkDZSF4AKsOtPbop431/6B
	zd2fqtnWmZr0nQCLvfIi0nbIYd+j0jO3I9W8qxurXSNfXEz+Z6mPcIVuAh++9vLPYZEC7C3v9Tg
	TXHrIJWOa4ABJsE5X3yX91SlPfPrkoJoi07t8VmooTbKHUxQcGpGJbGfFxtlXH0EUvO0fVrCeq9
	fUFYdMJ3MhMwsna79ojrNdSpe92R0W9NJr3JRJ1SiTeoY0zxMggBPsvl9vAA7f7ENTqM+yzV9ls
	99Refph/pGLy9Q0lRzKYLABJaskTYnwFYVB7QHOWGAsaoRLGzkAzWH5FXdaUTobwI5RV2RHvpe9
	tfa4vxxsnWOBape/6+FW00VxFVWqplnirs5m5OSuxBLkuYRjPzN1trhB8EGckMlZe4hUC3xLXt7
	z07RDbDlIjGuZn
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137561071cf.79.1763307126914;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLhJkaOMAE2symS5kOW15WypsaRmGyogTqDdNGkh+5TTdpKm+0QEXmKB8gHRw7DCEiCrhb5w==
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137560551cf.79.1763307126391;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm2483875e87.59.2025.11.16.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 07:32:05 -0800 (PST)
Date: Sun, 16 Nov 2025 17:32:03 +0200
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
Message-ID: <2obhppq6a4ercfnhvm42tbbgh3xut4lz66fc4j7mpev5oxxno7@dydu2wysmgvi>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
 <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
X-Proofpoint-GUID: iKHmtAH_HYdFeIGbIDvvysEQ0cf1sAP1
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=6919ee77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=zodt2Hv4yxvvtHnNIosA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEyOSBTYWx0ZWRfX/4yqhEeK6iQj
 gpA9pSipLzkBbxbf/fR0Qe/rSpDW+x05wAu3XzZvEXlQjWRWPdiNZMT6zSYLdPUN5xZgpcSOwsC
 9bqp/ZM7by4jLeX2v9P9Zo7+FevNZJIFsIaIiwRnUoKFMr7gNbeGWu4/iIpmTcVhk7C6hHIEhRd
 hEFBmux7SYbb77EXCaAqj+nRFoJdXPzMZSpXXoEO6ura4qtBrsO073lrWlhNGHrf9aoKQZMJs+9
 3eq9He3Ktu1IXvy51ioVNdgO64zh+afKONb/qpz+mnhk7zfzVJ6xS68LA0Cc6OnNNqE5zRfSRbB
 0pw8Zd7DdVo8+zpzmKFyETEedR3lHfrUpnLM8xdcadjP4GmOXNfRcX8zPWej49toNo1fo3MIGji
 NOdOAwO1X+CPRHhbIq7VQTIT6bHahQ==
X-Proofpoint-ORIG-GUID: iKHmtAH_HYdFeIGbIDvvysEQ0cf1sAP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_073209_919229_0C1D38F2 
X-CRM114-Status: GOOD (  29.34  )
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

On Sat, Nov 15, 2025 at 05:55:17AM +0200, Dmitry Baryshkov wrote:
> On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > > for firmware via LAVA overlays, removal of the python-artifacts job,
> > > split container and build rules, use lava-job-submitter container,
> > > and various misc fixes.
> > > 
> > > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> > >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> > >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> > >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> > >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> > >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> > >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> > >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> > >  8 files changed, 186 insertions(+), 105 deletions(-)
> > > 
> > 
> > Thanks a lot for taking care of it!
> > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hmm, this causes a lot of failures, see [1] (note, the run is not
> finished yet):
> - On some platforms (msm, rk3399, mt8173) the
>   core_setmaster@master-drop-set-root test fails. On other it seems to
>   work correctly
> - sm8350 seems to have some issues with this uprev, it cant' finish the
>   jobs at all
> - mt8173 and rockchip:rk3399 seem to have other test failures too

I have fixed most of the fallouts, see [2]. But ideally this should be
split into two parts: fix before mesa uprev (I think some of them are
already there), uprev mesa, applying necessary fixes and then enable apq
jobs.

At this point I have no idea what's wrong with MT8183. Most likely it
needs either a DT fix or a driver fix. The driver fails to probe because
it can't build a sensible component chain.

On i915 several tests kill the hardware, making it timeout all remaining
tests in a bad way.

BTW: I see that for some of the drivers we skip the absolute majority of
the tests. What are we actually testing on those?

> 
> Could you please update fails / flakes tor all the affected platforms?
> Also I'm really interested in the master-drop-set tests. Why do they
> fail on some of the platforms, but not on all? This seems to be some
> infrastructure-related issue, since exactly the same kernel with the
> same IGT passes those tests (at least on msm hardware).
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

[2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-db820c


-- 
With best wishes
Dmitry

