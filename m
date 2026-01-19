Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631C6CCF2E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=; b=vl3CArhND7LxX4jpqL1lEoJQZ8
	CUFj8LztPhLVLDdvwzk2sfpMkfQQRAdSvj9NSwd7HZsbHXBZUKMHmGHJeA2Liu7MScwbExJOyCOLR
	M3EZ3CN/CBqG6jk2efFp0CyS0iT/Gm5rU9SAtozKHR3Yd8izp2B6grd9z5v4Hn+78dupXQwA848c6
	rWSZrBGkhcqbmeQfALqZlvlJD9MvVh7dxzVhsbpFQhDPEkiFzKmAbIUxxRnFW9lKWE1XTQPwWOiNZ
	LkR2nKCFWqzrMdbGB+tbc8wOVzdaFbCF1FmF6P0WGwTSZXGn5sN0OXcCBfvlN4mrBjxj1FqvkJrG8
	EvLfZdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnMQ-00000001swC-07c2;
	Mon, 19 Jan 2026 11:23:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnMM-00000001sv3-2IXW
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 11:23:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7Vbv597681
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
	3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
	A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
	PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
	lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
	iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
	hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g7q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 11:23:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a291e7faso480037285a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 03:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821829; x=1769426629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=iOJU8obiydeANC+Zg/gZQa2ZmBwexe7lIJabn2TvLGWfG9aB72VADTvIOETh+oGrTF
         H/5SYRttfA3fnlWjXVQvDGDqHpmzXXy+eimA2uKWUJkkbRisNq7pH1OXDYhGiucS8pKN
         zLcMPwibdy6kCCyEPi+aJ85sOckilP7A1JhtaK5YqG+bsyHBbJZ4o4feNNfgtDnf5tnG
         aqgbspoLwKqfmCOCiSIVYATslBCsTSFDVrSCqX6w4uGvQhjezkjPz0MQrQKIvMqNt9xg
         lWO0j28l9vVnfWPDX2ZQacKr6pc8l6OASemcAac5z0a4bB+0U+CC0D6RpQN28/Ltf++S
         vHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821829; x=1769426629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=lOafR0ISK0bovygvH1vD/rfeIE2N+tH1pXv174laQ41W3YM3X8kkMVm+arfAqaiSGe
         1SIZ/xlr1IDOmHJw0GbBFbyIHacitsPO8cg6rqtiqX6BKmZvj0V34fJ+cjLeh3tFfPLY
         mKEdvqvzTdBfp3MIO7snQFCjUp3g5nmMcFqTEgM7txOdo+/n48la3GYpbABJK9utc57A
         HDm/RsOga44CFq9kxvtugq1SqYVyxOURnrJ7jrlGqZbJeAMsDBy+gkYh+EU3EDRmB7n4
         Is6JGZegBgO10txNOBlbSexXgkR+Z40YpGOLidhvZLH+Yl3OEAiIdK7zfsXuhViy/SMm
         NmQw==
X-Forwarded-Encrypted: i=1; AJvYcCUR4P0ETb+8ko9gSSI1GUjslh+UAOprcuSY5k3sklC808YATyObN/sKE1+8Yv21msSRs+E+2i8RBUONveW2Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpvjoHw1Q2OXpyI9sIAXehDkPu/xSrdyr0hTGTNXeqs1NcyRT
	Qm5bU7MzLnVEPqnuPxdk77YE0aeJMh9qYyqr8w0pnJD6decefTa8l2JC/IlnkzRADDJrl/mmAgx
	UWDWqxChkAJBZK/UkfstvO+zuiOQ9iqPuymB1LdnLJ8ippHLM18ucnxdAUa95qkUtoZPuu1WvBz
	A=
X-Gm-Gg: AY/fxX6SdfZQ8L447o+OTpGYVapchQt6/vit+zTHlDdY3dEEUrB5fFHyc2FUxATyRAr
	Z5jpPjs/KaaurcnNMMbiM+8uPxcnUTW4LER3V/DOZjKroA/vJ72PNtWRXIL3jI8SmfRqamtXU1r
	hevmYa0JW3HpOvG3TYiW/4Kp8Z+oeiwrYON9TfDsktOCGOADtwbbX0E1pxrhXNiI7QWizNrR9c0
	hOWZXATlo/K/uvTQHQAd+IrjWl50gXU9LIYAJxNmWPYxXMnRpeIPuiYgR4cq+4Gf+89vMK/0+Ys
	R7CV3f0spUG0ICTOS1pevnGVh5gflyGYOzgbR6hJ7X/yeVg0CL+gve1QVVmR7bCurwfmIwiW/cp
	RGy/FGXcatQe2OGUVM7oFwd7ErcpB7amjpCUefgxRTjxsZfQBJLpZ1Z40P4S2ASa1/+UXTCkj8r
	vqbreAoBaLuUwG/VBEiYnpbtA=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169567785a.18.1768821828925;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX/wkirwqBMede
 CxXImqcFWKrcx5tjazJuqT3YyHuucADfkRwtUSV9ZCQNNEsMyeQ6twDggbQTAV6u0A7SRMfI6Zp
 4y1WMuJRI7dwph7VEE3W3VT0w31Ci06RVvYdkGSSRZbpVhk05TXU7F5OswX5O/pFl9j53QdwK7j
 GbLaxn/ye58H5gfAb+UGBHW1edha0xcNsyeETB9OE1afhmgV6ZfgJDQO2f5G3fvNtCN985bDae/
 A7dFO1xtpGe16c6JO0ElbwPonTmO1v/g0i36hfKVBVnW/xYBytXzOP96qOgjzQKl6JEt2cnOutE
 FKYfwx/fuWv51/lHiSCPJR+8DGJX0H5zaPJGe5XnCV1Eagt6X/oxs2V8tDMQRFSVQwFThl2o79g
 k/pgbvVqFMl94c7PF6MGkSYB8FWPalJc49sXG5q/lV8PPphdKXQjxsjCAMhXU24fDWX2LzDgSG5
 ejYDpd9Tow/P8EVi+4w==
X-Proofpoint-ORIG-GUID: nxpgHLpcBG7xilOyX7piUwiG-K5zsMeD
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e1445 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nxpgHLpcBG7xilOyX7piUwiG-K5zsMeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032350_697896_06376353 
X-CRM114-Status: GOOD (  16.17  )
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

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry

