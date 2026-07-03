Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE152C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 23:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=; b=lsP53Abrpg3/jRzh5wrXX8nceg
	6OzfVGpN0OoKhGTWm1iVGuYwVH4M1SoQCfetp16/flJlhV5O1Dll402g45YjXRiq2d4gEmdrV/N69
	1p2onuExxlHWjzAONd3iZbQpsz0IuLa5K2ocPKlChbKR55/pKS50N1NVU3fCqPgeJ7Urw8F3S77mV
	Md4ifEZvFD2zVXrjX9eqyLkszei8GCVbbDKRjyERZys5FL8kadHHc4viMrs9nmweidr6KEZf3EiOz
	+OdRYl7z7P1ycX4glaRAREZzeUF+2pUIPC+DzOpl/N9qua18trTi+kwi/D2e1fxM/vRHsS85byK5S
	+kBli0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfn3v-00000007zu4-21tO;
	Fri, 03 Jul 2026 23:12:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfn3s-00000007ztG-3X1L
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 23:12:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPt6K1021761
	for <linux-mediatek@lists.infradead.org>; Fri, 3 Jul 2026 23:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ptvjiVFY55mHuzyR7IOPZN3q
	jRdO4GwgfZdidGQ+xdk=; b=MwuefZpSFTvuNgJyrkHy6OEbxdQIh4zwoxkeV0v1
	SeNT+DdlpzYtM/NzLKO5cRhFyyJnebuIF5IKibnQH9YpiTNtspV6uDvHww+LUUZw
	Z26z8Ghqy1Bdy97MgjMlCybQAcNvxhH7AanAObFO0nN5IPodyrTpWh3DwjILH5JS
	lGZlFabkn+OlzqLPqxZPmZYtMum9AdRVSTRs/wP4GOzKS3Aj0HWCmra/f6MkDSMw
	qYaBJCD0DDY6/4P6Rd9xzPP5E3hUq7S5beve23YXYe29Mo8LO5BMBx2bJeVN/Pjr
	eFrVkDRH+FB3sjLbh5P/z/JAV4UUnzJ+/KZJdzBA5COZEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u330y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 23:12:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso16198096d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120363; x=1783725163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=fr4x6ROm9fTL93RWX9+QB6w0/o3WA2f7kOaSD4oD9+CtA6/N6qllArDry2ayoP+erW
         pD5YQyNjjV1w+MpBc75oIyMfOEKe4sUD1jN/svG2GdFPBqrfWGraVbCpsdMClahRx+tE
         /VPmVhj2Ho7lxhbuUYXjlSG/h69yicbf5tP3DngiZXNuigUrAC8mMCfUwfG4zVvoV/R8
         ZGDDzxkSF+/d0280goPBazrR1yhBBAipggvmG55/0tcrtcsH32ho/HX2V8N0Wy9x4jwy
         HTJro/tp1vBYbD8hV53kl3THR0VVjU3O5WFT/m7du/9UBy2NOWG+GJwDtmiWZr6i8MDg
         cSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120363; x=1783725163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=ZcHg8x4Lv4z2YyuKsjBMnl192/zswcmtdKoXyEvj/XP5mrUYAPMWkfcJRGyrWTwnZn
         4wokcv4TwZmUQEx2HlWKB4LAx1P6itzW1KFHIVqpFTjxaalQ4oz5cfR8/36VDH9HAUkY
         7yLsBIR+BG7HiivjB2HLQjHcgkSu7VLOYmsX9xEE674Em1rIlwBvyKvVdcSWbKah1PcH
         aAJy/E51dtPEMaWrZGSJTzqkdmqGYqZJfynAujtQEQUGhbsCZOqepj2faoO6bhIC01Lz
         jBmNqK4tCLAmmkBy2vP1cRJOETsYisfO03OsgvZrZd9QdgXqm5SVxKQy+GG988QCtzaw
         UsxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEsgiO1tMIUJagaxodD9brOXrdDsgC9pCF+V/6bj8fceAP0EOfGYOVfY8xJybjKwW2LvXSjDIJcot0uG7UwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzasOeBYS7QTMCe2rvV4O5fo5Y4qdgLGfQW1X6YIDZs9APJ9j0P
	R2zgQvGAtPNwJ0rO7yZHFfGlr+9wsQ1NqRe/MHe2raMCOV4YyRmzYl4L+1v/5gyTyXEBeDGcql+
	bjvcmrXy//C0MgHFosifqXh+28mp4Zl4yndtlRMMld9+FIamxmrVqZPUYNFPlgeHViS1+s1ilI+
	U=
X-Gm-Gg: AfdE7clZg+Hkw5KZTaD2j58KM7Pe5hTL4V5rfxg8hxsyA98M5pZn7ZP6E6ODXRwb7vn
	vnm8W0XxJAhH8oiJQSKW1vfxWscbJjDL1uw2e92P2TTm/SIh1OO8eq9GEPzMZXLdFethEDiDXTd
	PwsJTg7jb9sG41Md6Yl/9e4e6UkaPbacqYXRtLaWcPyqJYJ4MPUseBQpy/K+4jgPVqwTgWMKYwx
	ORRTQ9lgCsYeG/GpzXCBEdLdiak4Zpd+mxbrW1xt/L7USW+eKxH8YAot+JUPDgULmdgR0OQq/60
	87WqoY3DC8PNk52p9CGPql4nW1G6JkuwcXorbNs8N3TlIeuWtQBL/yQl4MyQ2PMbJntrikzFy3h
	KVeSmS7o/vIu8r/0+iiL0wq9dtdpZ9bzEfZ+nTyx5rSf3kGdjGJZDR1oQTLyQO7PKhZfaPD0jv2
	LGtMS8AFxW8qhe6Yl33ULiwWoM
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20755676d6.38.1783120363155;
        Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20754586d6.38.1783120362600;
        Fri, 03 Jul 2026 16:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm815528e87.71.2026.07.03.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:12:40 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
Message-ID: <6ejxrh43bkhryudrxk3lkzf2knlgv3mxtfgzhrzujw7km4n5bq@4bd2ahopzs4j>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 0yiEdq0Ql4qB_xctTt4nszOJKjMvIBiT
X-Proofpoint-ORIG-GUID: 0yiEdq0Ql4qB_xctTt4nszOJKjMvIBiT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfXxZameV5hmwxg
 UyGhGxUoUKYaJl4xNz4YVS3003XgpZidhjIiovj6NfAes9Gc5S2HDTzBZwoRz0d+k9i2gk7oGVd
 6drg7fkRsOy5BmDbesW4FOF33ImeALk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfX/vY7XjSbK4XR
 GFCIrzgqr1JNZ5jOl1EfRAxYdvQIzN0EHlckPxlvRuQxrf4RyfzliSES8ryKl0bmXZR3efxhejZ
 XX4YcLX8scUZLPX8368gSS8Vrf4AEYu73ZjcOC1fnYf5znxYqEuC38qXZhpoFehoqhz1CY/KBMG
 aOt2JEVO+B9zNWR4Bs3uWxy+hPlCKLOHCE2tCQ/FsjNHZxUhW0Y6tR6h/WVuJ4NIVjIrY5bWk0o
 W39lxMsf3u8izwcBWaVlsz4A6wX5LGVvLO/LW7V8BnvLjg8E3RmIbJmR1ZYaCB0/A6nrHUGAK3x
 ri8fAcKCeBuUvB22FfaogE53hd03nLKm2ZGV/CGd0+EKWSvSEKCgcH17NDNfv7J0X+G0oVBVEEv
 SmZPMocchhdk4soi7AZWIF+qgJyqBIJRqtFGOTpuWXN0WP6tamJMhr7TPbAyNgBX0aA2AqMdYWo
 qbamTgG1xTZv21TbIdA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4841ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Dn8qeLIeI0d_esIdenwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_161244_894794_FA96BC82 
X-CRM114-Status: GOOD (  15.00  )
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

On Sat, Jul 04, 2026 at 01:08:16AM +0530, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

