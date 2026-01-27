Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F0CD2FEDE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=; b=D7JFfCQykdT1PfATj/c96JbKcy
	JBuKBsByc9qPI6Vc9fC+T+swN9Hukt9FEGFmL1+rFYea+djv+OmFg4xww3zsDq9nuYaPUziKoyH8P
	i5n00GVpRKStRZAJ4AdlEVlvpW9YCP7FwC3hqtTnYPXHbaWdojofJicHpitSWiLGDaqJOGbla2RNJ
	2eDcvfQcLPzOY6gnXrsC4rH6VNK8IBOf//z7VPMBRWY/Nbbi8pwtmgtfUZJozR7o15eV8oOCY12fC
	0AJ51MTN98I6t1pxsUPf6Ve0//lpZQRudfvHxhjlai4YMmKEjssfPIMbZwNVsz/wp7CEpyvd1hLlO
	SrY7sC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpeZ-0000000F08c-3mOb;
	Tue, 27 Jan 2026 20:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpeX-0000000F07g-13G4
	for linux-mediatek@bombadil.infradead.org;
	Tue, 27 Jan 2026 20:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=; b=rBTZO5xTRZ3wNA3yTskagyiv3n
	nRR29gR4Y2BNyjbyaiKqpDhDvNNdIhNU/ui2/m7gsYThLFtPLIladnks68SnhFN2F7hDU6O+3IpKr
	kN7zsEbb8ogFluy3A3beQzDhpss+ATG1tPxtmZWzmvpN2kGKc39sYh1F9ZrsNQIyST2P362o3R8dw
	/XKMei5dxd96q1Mnoe+Mxig/4HZVjmuQcxAoqXPtWsm9v3SPG64yf191futo9GCuN08jvGMcwsltW
	JgXKBNPF7/WsKIK85UEQ5cITDT+HKCA3hf9eGq8OixKi4hFhsNVV3r5FH/pDfJ0m5dIR4mY7uI88r
	QraeUu2A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkpeT-00000007aIq-33f6
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 20:27:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RJ0gUP2436403
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R7u/+GzEYAjioDYmkQxOY6xs
	Cw+YDBbFVfBMYmE+PTU=; b=OlEJLz9Jts4JCKDA2sUywDbOlEwV13u5StSD37uO
	3jZ2LqLmnkOlj3tENXxxrto0rqSvazhIxACvFa3vg9Lr0LTfmIGoBSKKWVw7oxiA
	Ygi6pAvHAHWzb6RO4xH6d0S62SdvBx5ZYlidlKngSSWsM9rethdRC2pSYUcDiBTF
	T5FQSQLRcDQhV7oEF8GYAH9Gbn9OVoQhUGC0n7DrBSDA+jXZdZ2uyp0KnpDgA8Sm
	dROwvv75q9PROWNOhczfWpFsK3gmh3eR87eCfuCL8Yc6qCOcag0QIWk8bnEMl7E3
	7ZVSIDQJjUzuMcn7KtzSEzu5NNF2rO7f5YkXeibASpI4Sw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355r90g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f52b01cdc7so6458907137.0
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769545620; x=1770150420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=COyVm6HKJIkaRjXee/0oh/tc4FEoAaCSOVMYqqeR/Yd5EWj5E/VrYdRQlFKGUuuugq
         2ruty2XK4NWTHSz34LqeWDfN253JDx0N8GNwGEsJUHH8qU2BZePX17l0F8evr5j00qYy
         KZOCrovn6B7Zj3ZYQgdWoeE1NJAmERqlt1BrQaJrq/xyvHrQhqaUaF5/ToVoUs9eFuOG
         jCtvTVpedO1qDkWHyZYy/VUAqPKMBYDrxAQ+ievRAMidTK7UTaq1T1bLS3ekPxjByUTf
         ep2/c3D38LRbh8wvxMs5P/jn5cFrlQ+jV+Pj+VxRMK2H2FjxDH7hI3CQskB9KavkP5qH
         0Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769545620; x=1770150420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7u/+GzEYAjioDYmkQxOY6xsCw+YDBbFVfBMYmE+PTU=;
        b=KHMRSJvU+egZfgk6BC3G0isz55H0WCwSEFZlnxH7hGDYamFdh6Ye5689jWxZEupRok
         jUczBlALJy3zdrhu2J9XuZvgeN04W4RPSYA5EfRDizb6o7jlfJtMroVu6CIgNeOnNw1o
         WQceYLqLhBOJ9+EBrxeBHV+WRrQYDvjdeMHQt7+TLMMA3rU8qe8ylNiPKIGHaW09i9LZ
         fDev3drlJb66mRPf/D2owlWLhOPDPAEOjltu454M8WHDXfbPtWkDM+5RKIIJ/DBgK+xV
         VCU/z0GECRTmg1m+XHsz6VaIZMOE9kHOWO5HwyZfvQcttaEn4zeIoM/OWbto+p464WAW
         lrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJDi6gjwmMbsMhc+8IkY8SmRVtVaQBApATAgq/OgY7Upr5wNpcV4CBIL8K+y4ZHBsERdoK8Bcmz60d3VlhpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVl6XZkKqa7vWmHST15zwfCMGKFVWL5KxMqIu8TcY3jFO1XADf
	UAGpPn6Gh9SoCzlzdSUA/r3s1gh0jbKzDfwg565zQTKkxEgv5e7AfX9uEsS3LgZh2u+DzSRI1RP
	76BzzESsWyPS9XQw1/LCMqlIso3gTHaJE+MDK3un83um7MXRV7VWLHHqRVldSN5arD8QM9vOeYG
	o=
X-Gm-Gg: AZuq6aLQSCtFj7kkCb8FoO2lArt9lJdTDOm/1Qun2zyMdxbG9U3L/A5RtxEoI5c0R2n
	3ZRAXf5Thm+5PiaoAKvn0uFj/+RQOTBLH+vmtZFnrXx457QK6xJNbsfdRn20GqVfYyx/8yKFYwo
	SiQsNF2rvWM41loIY90D7x2+1zw7T2gXYdAaQYo4vTl24/6flWblfeaXmoCvV7ujTvytCUK4XBV
	PWhZ4UzxQN7fMGHhPuearT9xNA3JEONL4zmAPlbAWbfC0bucU9SYNlc/KOGuFw33Lu28rKa7aZU
	TSc++G8OFmXvuUphkiHnvBroy+qNR63LTY8TJ/+GB8hZtT0rpdkz58roA6yvWsg2b/ouP/+64rH
	vDHDi7rjfQlatSY0FpRrbpgR/n8gS4efWrNM7uC0A/ZDvd2iGrWSzn8nt8E5w2qn2J4vd1EQf4d
	U59GGg/9x7WYNj/e4e9z/yyAQ=
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962054137.39.1769545619911;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
X-Received: by 2002:a05:6102:290e:b0:5ef:5387:ca85 with SMTP id ada2fe7eead31-5f7237d2386mr962042137.39.1769545619368;
        Tue, 27 Jan 2026 12:26:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm147447e87.11.2026.01.27.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:26:58 -0800 (PST)
Date: Tue, 27 Jan 2026 22:26:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
Message-ID: <6p52srrxddazxiwqfqmjpef7k4bbpzojxqiy57zmhqcpqa2bum@gv555pvqrige>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-5-213d0d3bd490@oss.qualcomm.com>
 <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47619a02-c667-4fd0-afa9-f6cf7aba8dd4@sirena.org.uk>
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=69791f95 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QCwxOkPKupwELJ-03vgA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 0Tc1XKNPBlPNv72930kYAluuwEqiBAtg
X-Proofpoint-GUID: 0Tc1XKNPBlPNv72930kYAluuwEqiBAtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE2NiBTYWx0ZWRfXxR3RfQ6/Ppgw
 iSgZP01HtLtu3hpaXo50KRoqv405Tx5cqzypYvkbSED1T1Aoj2wPppQQPgN6j2+m+9EJR9dR+gm
 dUVgo5QJ+lc23KCz+IY1mA1e5BvSjJMihjk4SgwmW3luEbxgH61cPdY3VbuGfDe8HeLQZKoOiDb
 xavsYiBcATUrvldF7z2PbZ0aXQWTnjAPF9Bgxp8xlmH8XrTYwVm5mGk+laTyelSpeSdHy7d0InA
 2jQfA2/WG+rW35dItRSWYAyQioH9ubpy55yJwAmi0oDnr6XVU6YzSBuWqN8P7NlVAvkCQ77kdgj
 fHRYMeZN4jKHWjpN4yWxCvqvm00sJhR1os7ybauuALP1YmBKYIJHwbKcPEloVxZEmLIfLGvp+qQ
 2VKGDv7En+/CIsIvYr7dRR+P3lU23Bc66vph34v9wF4cpIVhOtUIxwza5MWRIcO7EIIieLpDhU2
 wYsMOmYP6e/aZQfv4Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_202706_211688_DCD5EFD7 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Jan 27, 2026 at 07:50:25PM +0000, Mark Brown wrote:
> On Wed, Jan 07, 2026 at 08:15:02PM +0200, Dmitry Baryshkov wrote:
> > Having only a single set of callbacks, hdmi_clear_infoframe and
> > hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> > the DRM framework, which InfoFrames are actually supported by the
> > hardware and by the driver and which are not. Also, it makes it
> 
> We're seeing oopses on Qualcomm RB5 platforms in -next which bisect to
> this patch.  Looking at the patch I'm not immediately seeing what it
> might be getting wrong, though I do note that the board uses a LT9611

LT9611UXC, yes. Fixed with [1], fix committed to drm-misc-next-fixes.

[1] https://lore.kernel.org/dri-devel/176945413960.1492466.3261759749688865592.b4-ty@oss.qualcomm.com/T/#t

> which is updated by the patch.
> 

-- 
With best wishes
Dmitry

