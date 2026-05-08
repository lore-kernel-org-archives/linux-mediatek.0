Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F98CD3436
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=; b=jIlzXrLpPn/Mr3i/9XrMyRF3/I
	pMTsMoSeShXW1pgggjBB74fc+92cJ8VWrr0x0NrTVlMAbE3qgabRrTPyHBCeiERX64y0q/yotdl7a
	c5szhw3pXgR++VQvithMmCn5Sb1Kl2Tu4WDEHh4moEsbarr2Hvg+lYfjly7rLmPI5TJsPfTsiw1cL
	3puYQUjgkyeg0TUWh5QTTJRDtLXyixpxtpJAmHrsGOE26Bnz4HW5fsY13sTFx2EebBZkn2oLm2PjR
	zUJp7GKrye4qYySihvFbkLXiaX7IyvM+7BsEDW1p/EdQt6/UHvcGV+buNKV3hBQUavKf5TPIBlytX
	U/PpjMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJpy-00000006Pn2-1OQx;
	Fri, 08 May 2026 11:57:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJpx-00000006PmP-0hLz
	for linux-mediatek@bombadil.infradead.org;
	Fri, 08 May 2026 11:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=; b=MP0g2H4w57zoapPxAuuwztNN2T
	T5lhhlGr09W86g6nxrd39+c1RUBzeQxeriKZ015AF1NiooBDe7UFzUQFsOc4IY5/gTybYw2JAAJEn
	Y6xkfxYZc538+Uw186/mA8AgIlHjhfLzOh3IeZMhYrWDS9KZ8DHdpBw/THZvkVJFB/DZduHCJiUED
	f6umwoAtKZYR+sp+1S0cVf8U4n4WRpJhSBMcJkbIj8CmQnHLE2wlO4XYG0g/Ipm5/Z9lW1zgo2tC5
	gaqHlmso1+MR6bmHbwf9UwY0REVm88zDPS22xTiwMV7B5TqKuBrsN0qz6EMwsojgPbf8EdjoDbk1D
	g+jEFiRg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJOj-000000064Ar-325R
	for linux-mediatek@lists.infradead.org;
	Fri, 08 May 2026 11:29:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KejH318043
	for <linux-mediatek@lists.infradead.org>; Fri, 8 May 2026 11:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4n0gQBv7g7lIgSwaGYb3+mof
	ndGuALBc8vtoBzZ53cQ=; b=Eik6HdXMKFPgC6JzNCcdlb5WF5VPsb6EHsZmktl0
	1UpMdQ7b3Jn/28Z5mB88ZMwA6xIGcISEQpqzPESIP3Por1y0/m+6nnlS0ZC+mTh8
	OkpNovdzZxRUo8eznjAKx5r0Gc/qQfrRJCAzxMS53tJSiMxu8u4Rgecuyqwp3+Du
	TFFQch1xeGTE2dz8oBh7kpGNI8DX3hg/LGLYIm4cOkZnhz6vnLcGn1kYBYGZlx8c
	xOQ9SFtBRBKrn/lbwtlvzmWBwAZlgSfoZjaIu4GHjLNMhK8b/crsLx6QTTnPw+qX
	piHIes65Sxpar0A6XF7lcN1jB2ZAaYQvkarq94/FILDJ/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc00yeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 08 May 2026 11:29:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so32635681cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 08 May 2026 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239773; x=1778844573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=;
        b=Tv/pHWI0xMfIsrF/ekvBqbISRv/0zh7THkk3HW5ZyoYLn9wuvTWm3VCUbcjMM7qC9I
         xFR3KrMKVafzI+m6sa7KbjV0Ah9WKcXIxgLKvKRukrrpsdbG9MdxY1aLZUgT4XoaWonv
         oWxFki5DOwfjQ8dDNujRSdcAHy7TNUJDzy51B8A7dioYl9igJtFEuDb3FsbEZaBmMChS
         /zF6eGccJSbPq1QSdAZsvUowwl2oOKlzYBv85UeywWL4FaYK3PHHzINr5AvU1WGHbw0X
         7nu06GogTzkPW0gDuIdpLbSWYOLLvvZs0o9JxxA3E1E1FPpA3gizDIEG1glukJHUxIg7
         ET0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239773; x=1778844573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n0gQBv7g7lIgSwaGYb3+mofndGuALBc8vtoBzZ53cQ=;
        b=OrTwfwtr5Qs+vHrBVEwj9vr1beQn9uNOebnq3xkv7yPxXVSXYfmqLb/Rke+1B9/pQx
         WhPNlXoyeyPeAEYDVJ84+yJzdHJU22sPnOaSmRSINfEwOc9CAQ/wVZXOEOuiVetAcbIn
         AY0UPmZ7c+vWZDnePrwMKp+nI1kuOT4iGyshIxyTEK0GvnMFI5+10pWEG9ZE+Epv5SVb
         U/C1gxzI5lKbZsfcF6x9sPdLMZAm1peKzPtvJGUtL51o7OtwrLfxe8k0CU8MVjTvMH8B
         lcRDEdKAr75WF0df79f/RoRAXH7mQ/h2xmobsrrbfe+xiCrUswmAV0GPtnRcVCo4Ojmo
         DYwA==
X-Forwarded-Encrypted: i=1; AFNElJ+3NYj80M4RGgP+T5YSAyGcdeQuXtkTgATth23Sg5tntTmIrftkoKYReZBxVWKCSEi8gcHcT5Pi0UDw6RxVHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJcWdP5/FcW0qdC8KSxPDsiS92OWV+UEWMDnGKyx3MSGaXshY
	jfcvyGgihkHuogYLXyyEY7ypsbpv0ZFFr6MdZhhE2F9c8WDRNXWL5y25Klzu8E3f2Iitr51DNCh
	CwqwqHoGXGPWO7wCV+A3AxxO+GD0DMxHyYnMqWddpiD7R4Raw9/ZM/kdF/WMKLRWQHX1ftujycm
	k=
X-Gm-Gg: AeBDiev+oH/8x+GM8CPMeSjB/zPMBesngHwTS7fn4+8jpemeOOIrlcZfBm+kDC0G0qs
	FDfelGFI4bip3MsSGLeBNzvRzcTMKxIvJ9olaCRBWJEeQATfz/4jzjtWujZZ3OZGN81JIuyhNF7
	BXMzwWgau/3zow+Bm9R1ATnk+xEFEyZ8Igz/IIipDR7F9tv0nqMzUkv/edS3Aq+41gFztzoeoXg
	5CR4hLWMKomA8pg9HfW0RYkPljUZ16RL6Fe8DO42ObYAFrdXsrTZoJP5lGNdPa4La23P8DZ72QD
	yK99FTCP4SpmR0upKevHUjV+ct/c+hpS8V0R18ZWAGwrX4yrG/gz2D7tAWvnHzp6lmlE7HfXTZs
	iTKFRYP27W99HkkEobrhEPeNrBdidgTLP5SFPa3FP5F9afqRnqD2jRIWnqRNLVnOA69KJ/jDKoO
	lg+Kuxm21T3dyd8DIwwLFW0/FKBAuCt3g8Qtc=
X-Received: by 2002:ac8:5845:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-51461e3e804mr161618121cf.27.1778239773160;
        Fri, 08 May 2026 04:29:33 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-51461e3e804mr161617811cf.27.1778239772633;
        Fri, 08 May 2026 04:29:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9527087sm436597e87.33.2026.05.08.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:29:31 -0700 (PDT)
Date: Fri, 8 May 2026 14:29:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <v343uqdgy65yg3lm7rcv57mlpkudqxrnori6lnunaiiewakhyd@wnxkqhhwwvgg>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
 <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
 <afyUfcr8HuFs6EKF@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyUfcr8HuFs6EKF@makrotopia.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOCBTYWx0ZWRfX6EcKk7Y0iM/d
 Am3up/kz1zviX9knCPBmbBJRySFnUwEn+V0XLnnr2vTsKYJZO7035ld/DQLVohaqSHYWHZXg68G
 gZrzHYZybKL/g/o3Bgh+Qi+ObEn8LVaTcuF2N0NOA+28CA82UVXWkGgN7CT6ZDx3hqfc3VJXXH2
 eQzpO5sIR3UR7nWhVU97+JcjJyKQ9RrDKtH97VD0vtK5KOlW+Smyr/uPPhD3oqjgRZQLBH3pVjV
 oXFusNBmieBtIyVnI+gGybLCWg90c8FEJ+PE3jV5ymiWfvlszbC4VX8jIXM+WEPphfn8YF1Ovz4
 JV6/gUW29yoVuicLy1MbMqihgItcB6uxkUDpnPu/ECCfzg3teWFlVijIFWkYlYeFweUz7i5ZVf4
 sNFPIxFf5oAz5idAlsmfrz20Slu7DCBIQ6FVC3KLH1+nWRnWnELc6gmrYM9JhmbiLt8Iuo4kkP5
 1rheTLbk6P4THq+ezBQ==
X-Proofpoint-GUID: CWkmhQ7YWhJRv9Uol26_44kOa7C3wBdD
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdc91e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=eCKN-1Wp6XfqvTAENJ4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CWkmhQ7YWhJRv9Uol26_44kOa7C3wBdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_122938_545390_87B89418 
X-CRM114-Status: GOOD (  25.81  )
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

On Thu, May 07, 2026 at 02:32:45PM +0100, Daniel Golle wrote:
> On Thu, May 07, 2026 at 12:51:56PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> > > Notify hdmi-codec of the current sink plugged state from
> > > mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> > > via mtk_hdmi_update_plugged_status(). This matches the pattern used
> > > by dw-hdmi, which invokes handle_plugged_change() from the bridge
> > > enable and disable paths so that ASoC jack state stays in sync with
> > > the actual sink presence across atomic commit cycles, and not only
> > > on CEC HPD transitions.
> > > 
> > > Userspace audio daemons (e.g. pipewire) rely on the jack state to
> > > route streams, restore per-sink volume levels, and recover the last
> > > used device after a reconnect. Without this, those transitions are
> > > missed whenever the sink change is driven by a mode set rather than
> > > by a bare HPD event.
> > 
> > I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
> > DRM_BRIDGE_OP_HDMI_AUDIO...
> > 
> > I think the correct timing was discussed several times and the overall
> > conclusion was that the correct time is when the actual HDMI cable is
> > being plugged / unplugged. See the discussion around [1] and the
> > captured response of Mark Brown.
> 
> Thank you for bringing this to my attention. I'll follow up on it.
> Meanwhile, can (independent) patch 1/2 already be merged, or at least
> get reviewed?


The discussion that I pointed to suggests that the patch is incorrect.

-- 
With best wishes
Dmitry

