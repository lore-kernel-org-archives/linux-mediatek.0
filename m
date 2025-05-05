Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C568C3ABB6
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=; b=tWW1ZRV74H2UxCKlvfpUIdQ9nT
	hTvVq4QvH673CCMCWGlunBXgjHNPslJxhAhQgwJy3TNNY1EphXHxZSXwAdsm49oSFYlre4KA6TRaj
	/MxTWw+RuRarE6gbBQAO0v2uLYsK6VZS2/wB29Dn4z55+XbFjUjfKfsVrLNxd4fjhpWB8+vu/viGK
	BRPqZwInkLN6g3QFqtnu4nZ35wlkCA+tetya8vBSswh+GpYM6FcuzmAzF+8MX085aWDTig2RbTYID
	cHQ+xubcI77octsBFRxAafZWsbUdh4gT8Gp7V1+iL8Qa0x29fYVN40JFE/bJqUr1am6w5qeiyLHQq
	aC98u5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBubt-00000007FjH-24HC;
	Mon, 05 May 2025 12:07:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuTT-00000007Eqe-17Wu
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 11:59:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Mpk4w022901
	for <linux-mediatek@lists.infradead.org>; Mon, 5 May 2025 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=; b=IzwHVUWjTSN2aTmN
	0IPLo//J+Zxdxh8FtBA8UKJ7kvNC6g+mk1Nyx6JgENgjB7iSAWdxaJe0sbw/06Yx
	rI0moqbfIK7VFeEzrfag5tOCxAtPLGtRISnnrU3EugHQbuhuTQ1mLn3Qo9ujWUvy
	fLWLGqdXGl1rq9M9oukIM0trKrsS9nx9J8rSek+aOFY11cmZ7bwh/xlxKMwI8ME0
	XZwDaJgrzDkUw3ksftk4vxB6U2C162O2dy0nV66qHrYinprt9IRxBdaiAyl1MUWx
	BJ6yPf5iJzQmpNkxalDBL/TejWUfJFCxnAFOX2Jvul5ILCohX2ayaf4tIxsw5iUu
	QL/3Aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakku9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 05 May 2025 11:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e6f5so1155820485a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 May 2025 04:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446345; x=1747051145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=;
        b=DuaNndCpg7GqhHQwNG+tlJnBpAeXZmJ5/1OATycelEE8E2UKlQu2XYUJ2LzsIDfk81
         3SmlBHvVzUCVaUGDPxFxYCTpx0CQQaeM4jObpYLvCotib5uB+HT5zqDvlHstvuy/P3Qd
         RvqUmwc2apizZ6J5Ycel5+03idJO7GTujAVlaxQ69oBCADVbW5pddXT4c80VRJxHY/5r
         2d6TkYVT2g13XRB6PqYyDXXZXU331HH36hypuwIQ3lQdkkSfc+v/5nbZwFiEptOccjq7
         Xim+terX11mIEb9+d6UIK+xS0BBfhoMUom28Qs9U8EgnrAbtE7FHPJDiNCPkU1gMr1NT
         Hjkw==
X-Forwarded-Encrypted: i=1; AJvYcCWE9085m+U1oFGR/Ru+I0Ln2RZBs10OqmrVy8Vgb+UtyH5hBnIIjtMq8Dvr1uISbVr7t4BiS2xDuqcDUukLGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBsPXtn3eLR9W66iP7K9psIUSx6SqN/BAa7E5PrK1nu4zOWHYt
	v6VoZmwB2+RyU/7aQ491ePW5/Vwxg1wDlR91J9JH8AljBKGUpxaH+KSSfATems0jFmoJ6ma/2Uw
	8GjfsfWYveudFmReYQbiAsI+QmM+VdcHOfcS0YKr7i0rLXzpRWHK3JA3bBzJww9qcw/RA0+k=
X-Gm-Gg: ASbGnctHBN2lT8WeMku9Ku8MMsqOMgJMMHAgZoVih5AH7FWW+4Qw+fwxGthlALDoDr3
	xBWNGhkJZWJdK7NuGhpA+8nBKy76rFCBwIiWJ+8dDCYKeVBmb2i5ufMPP4YCrFTaLm1wYJqDsTd
	3vQOY6K5OU+FDQiAD2yyCr6FEjJX+E9Q4ygWkELm9DZDvjKys6GC5QFmJ0AYys4XGchtdQqSoU+
	0aEKZ/7ExMUcWOS5Bwa47tvdJrHqAa4waPZvb9SWFhcpj6JWOtbG/Ffy14w8XHz5sXFG3Io6EZc
	f2nfYn22kAI9miEACcjiW6+8x2kff7NEHCD9Q3e6SVwZnwR/SlO7g8q2ZMXsUgrTP7B8jFDlTYn
	mSxyguBzUp1WkCPi9hZx7mCtZ/oayVxuG80lJS9a5ZevLI2JafkEZdn9xaEx47fo5KXEJ
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7cae3b1604amr1093377085a.51.1746446345043;
        Mon, 05 May 2025 04:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxsMcGBcuXzdzsMZLmfG4jCCth/aIBhqNnJlAxtHNCdoHctJUXgi2+jH+zw6iGwmYPEzBLZg==
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7cae3b1604amr1093364085a.51.1746446344392;
        Mon, 05 May 2025 04:59:04 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:aca9:2ffd:84bc:ddc5? (2001-14bb-671-42db-aca9-2ffd-84bc-ddc5.rev.dnainternet.fi. [2001:14bb:671:42db:aca9:2ffd:84bc:ddc5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8d40sm1695574e87.98.2025.05.05.04.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:59:03 -0700 (PDT)
Message-ID: <9afd098c-edd3-44fa-8efe-99f2e9c9a525@oss.qualcomm.com>
Date: Mon, 5 May 2025 14:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Inki Dae
 <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin <peter.senna@gmail.com>, Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
 <20250430-arrogant-marmoset-of-justice-92ced3@houat>
 <20250505130648.22ec8716@booty>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250505130648.22ec8716@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNCBTYWx0ZWRfX1ZtpNZ9a/OUo
 1MSUG5oj+vRfnZPakpb9/2tpzn0UUU2ahlL14kn9wEv+pBhvtjyKoRZDJ4kDh5I9dLB4iaTii6B
 N28FAH2EvLOo2N8HzEoRC35qBaisSDGFadMicJCpy43Ff5ma7ntibYXbaelk0OgduXo8Q4Nm83n
 Gply5g4H/VbOL3QH3yWi9Ek+EvXZf3x0HJCW+OddX8InrghZBiVJJghAg4eXAcFDWdnmTM9RaVu
 MEU4JdryiUcZS8e5qMNBQimCBdNKu6O43UkMMrtUgpBGQeM8dBPMZDdWTN2xUeKF3tYhlfJEzxm
 fOWP5VZ2PFS+1c0w93H7uGs7m7ePEuAxQK0ISC+YEUSRTWrnempqPqzPN11xxhyMRsFWmjLDUpb
 RhIevfnx+eKcPNbZGJGZQYQDvjvKmE3phXhDdTDsZwu2yv9Z77ncESMUl5cijN0E1i6rXd4h
X-Proofpoint-ORIG-GUID: NwjrfraVuKGlO2s8wmVSJUlf3aAJse2F
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818a80a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=H8qqLt0gxxJlsNWwv3EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: NwjrfraVuKGlO2s8wmVSJUlf3aAJse2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_045907_360538_AEA7645E 
X-CRM114-Status: GOOD (  21.77  )
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

On 05/05/2025 14:06, Luca Ceresoli wrote:
> Inki, Kyungmin, Seung-Woo, Alim,
> 
> On Wed, 30 Apr 2025 10:08:14 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
>> Inki, Kyungmin, Seung-Woo, sorry for the mishap. Do you agree with the
>> following patch, and it going through drm-misc?
>>
>> https://lore.kernel.org/dri-devel/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
>>
>> If not, we'll revert.
> 
> Did you have a chance to have a look at the patch mentioned by Maxime?
> 
> It was applied to drm-misc-next by mistake. Not your mistake of course,
> but now it's there so if you don't reply anything it will have to be
> reverted, and then sent again to go through all the review process to
> be hopefully re-applied in the future.
> 
> If you agree with keeping it in drm-misc-next, that would be less noise
> for everybody.
> 
> I'm going to send v3 very soon, so it would be good to decide what to
> do before that.

For the record: even though I'm not happy with msm-related patches going 
through drm-misc without additional ack from our side, I think reverting 
those and reapplying them later will create a bigger mess. So, I'm fine 
with keeping drm/msm/* bridged patches in.

-- 
With best wishes
Dmitry

