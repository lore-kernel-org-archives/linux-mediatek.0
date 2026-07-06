Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389AC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=; b=q8jfEWnsPSqbJRV3tROMk30ZxP
	vIcXP5cBdQP06XIFQpFFlg8Dbykh0j/JM+gz91jK2bBbKpsIJfol9ch2xbS88VYS8h9A9Kb43lVIl
	jM1OyZdMBAp40jKnF2HD9mZP7WTQ2lraxB7vDpQfDcIuaWFMyOlb0MyIhBuzUjuOlVcxx+lVocQ6T
	6JK1rs4wIER29zhZv9/mm+mJBKEScyhLV7clyLkqPgzPXUEOWTC/akiiZ1nDeomFrCLPVLhBWL7se
	xbvc2Cu48Qq+8YzcdSVOOrXLyGIKqocLu9kPThVbEhfEvCtGYH/jTvFTAw5ua/MJ4sjBJsC7lV0Wg
	8gypnR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjBy-0000000CYBN-0Ktv;
	Mon, 06 Jul 2026 13:16:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjBv-0000000CYAR-301H
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 13:16:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxAt2245625
	for <linux-mediatek@lists.infradead.org>; Mon, 6 Jul 2026 13:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz86zd3go04za6BKCrEOJJ5A
	QbsnL3kIqNm4xRq1ahk=; b=gxURCHyC5Uby2DEF/Sz+/5yNg3sVS5RYamD/XHiq
	Oeg+y1LJwkhEFbOaeUT/NQGKPdVK2zZ8VlG3hv6H4S/me/nezIWTxoEm9In3Bs8g
	ZvdBIq0+/gprmciBEXPztT6Da/pNCqKAPXP77qtywx46VRNq9dIbfHagzvAaAEIl
	E6hG0pwACBSPp2ODRqZ5jgVnHaYTwWXW8Uuan0qZj5WO8InmLPD6We8EBKixryDx
	iPil71OMzHER33szNYpl62CNRKnWkJ2P7UpjNxjXjQ3Ou5rCnNsvVYC1bhpBPa1w
	4pcAqdWpoDmeLyJqbgihNBYMa0DBssjFzMUnNnE2Yj0Udg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gq36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 13:16:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38108fb9d83so1962012a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343814; x=1783948614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=ci9A+gQHOd6qQTWs5Hc4iBaSdTZM6WzrhCB7r8njNvgkEPh2c2OZyK+qKGIBWF/xTp
         AKYJUVWYy6GL/xaxTRReRBT/VkDnKnvEIs9PKsCbFNJxdlSSOGWee+gkM19fMya5kdsK
         MAQ7OEua8igcLGRql4P6lZZKOLEzeMhoBPYoWOe+HnnKKYI6AD4ktOZYsCjT8EApHtv8
         v5MJ8YOWojlpBRJpJCVxPJwFZy4QkUPgytS0eao5f6DU7gSDArIsp4EjDktmSaJdu//4
         z8zxz5CCrwgkFolwIOUP8YEzo+Iqw/hgAnCJqKrTRFjnRmoEQwKdOqzjVKANM4CEaBVi
         8W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343814; x=1783948614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=btohiGXy/V88AYUiOCF+BE+357P29r76x0vTp1KNPBevUD8vw9vpIYDXEOe5YLkoRL
         kKpt9Ihivw19fWitZrWR3KrOHKtjIuxP3+GhjJya0EhQwMQj5ly0UM8Iwke5Qw6kQ4JJ
         OjiCMDjxqTB1G5f2bhCJtIfO4BoKYhTy5BkbkSU9xf4SiUiA3MOD/1prdPZlo6yYrGZD
         5zWpk2Nb/ZlIFYgcfkRjhJ3Bf1SCyxn168u+vj44QkYl4nvQ2blohgd5cwjJm1mJF40V
         y6xMQxk5YxdC1Ug+RLEJmfvAHN5Cpo1jRzaeNCtzjoTq5BbTF7WxAuw/i5ICllAkMoND
         4CFw==
X-Forwarded-Encrypted: i=1; AHgh+RpaJzossDX0jCQorSBh4GfwMGLG8Tk1iGsRA+iunK0MHSLXu6EuxoT9can0JcGlXQziwmbPlXcRbBlKJMI/kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq6AkJ5Fcs0r6hv5OfpXuu4f3/JRVDqfSSCJfy/jdj93n+Mkhr
	DYtKcIyD/UiEuxQ/btudHzynZZmbj7FiGVOd2H4df12XbDMqqUucuzYpin++XfePR1QKdDA9zYw
	t6uNVlAeko3YuXJFu/j5gb6ltnqXqHc7qbgFDOY6S7kumLszh6mpbIAJIv9QJAFMl9LnGplOA9c
	A=
X-Gm-Gg: AfdE7clsYAb0fXSwE0NPvTOn5pFUssT0zwWJ/p+YWIXAATZQyQG8N1eGTK5lw9Joe0C
	7YqMoTzwSQvbKEo/sYStL8CNEG24V50q7NUzB+Pf5yNOM5thrr/gi16G6BtAqBvTQVdI/8SBOTl
	h0adErI2tu1YMIGSyt06bpFMWufPaQM1MrPB6fNAn2S/FNKGiwEm9WiIBlCIUHzTYPkzafP6+je
	MbLgtV+9P00hcy26rGsogvNMhdbz401aPJtyL6RjdG/21CwLhmsdXlgz6Bz1W4/9ZUX6cJHxOst
	Syn0HpSpkMSaxnaBjLBHFdJa0Zqs2GlTtnDkg6hTktXsY5KMheSXhdNz9na8KXM5nW/Vun5osRw
	6L9yYnRDodHovK0VXdyHVvS4xJQOxUGbHoWDKww==
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376346a91.11.1783343814410;
        Mon, 06 Jul 2026 06:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376272a91.11.1783343813871;
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm16176449eec.22.2026.07.06.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:46:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <20260706131625.nygqmu2usgifmias@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4baac7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1XWaLZrsAAAA:8 a=sOACTKiIrrgCOb8DNPwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfXxJ5rl0w1ijWr
 NFXoJMD0LaqPqK+nfvbPzkvGGI9JwvhsoYfVletJIxI0lhg7UuJvYZ/HkAm62lPIhg8pj09JBPZ
 pWgektzffm1EJtBM0BND59cZiEFxinm6iKr6/AVesvNJhrjzM+whhQXohQXGD0iQ4i1xrwtV4pF
 YXCMIIOzO97cU3KS+1igAzrSp7dlshSBsrL5fFijEjRAiNwOuG8ePXpmfhU0JQlA9tLcXVXrc4Y
 KxJ9APGDs8S1WeDT+aytXwtyi76mSDE4Mis1LyNMPjNRm1ke7NCUiRvqTIgHk3jAjS9adZ2mt1v
 bmrZB2RjdsfybMbU6FMa470hBL6pL5eXu+LoLDxSG6PP13N36bJo8DsGS4uaHv5nvWISRHASqHe
 Q81F+AxyX18NjQEkZ+hK+pYvqXjXoKPDO4OxzuMyNRveWwYvVLNwplBOj0bsWJ8ZZAXLt+xPuIg
 OG9O4rJQYe11/EO7GMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX0SSLhvI7oZGx
 FCilDc8ZOj1Bidlb9BxLelW+QBGWQlztQRh1UF8RP1obE38CbqMwqt/utRIYsaB2AEJdtI/20lH
 h4FepoOzGRJEvUa86HSk/DWRZhAvl8Q=
X-Proofpoint-GUID: 606IBPQhyYuoDYXUYSg_Q1Z7apU7q5X3
X-Proofpoint-ORIG-GUID: 606IBPQhyYuoDYXUYSg_Q1Z7apU7q5X3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_061655_754592_5EFC20F8 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon, Jul 06, 2026 at 01:14:13PM +0100, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> > Drivers using of_reserved_mem_device_init() and its variants must
> > manually call of_reserved_mem_device_release() in their remove and
> > error-unwind paths. This is repetitive boilerplate that is easy to
> > get wrong, and several drivers have open-coded the teardown
> > inconsistently or skipped it entirely, leading to dangling reserved
> > memory references.
> 
> Just as a general thing, rather than sending a huge cross subsystem
> series for something like this it's probably better to just send a
> couple of examples, then once the new API is introduced and either has a
> pullable tag or has made it to mainline go and do the conversion.  This
> avoids clogging everyone's inbox with very big serieses.

Apologies for this; this is my first series touching these many
subsystems, and I also learned the hard way when the entire
series was not sent in one shot due to the daily sending limit
via git send-email[1], and I had to cut many cc lists for patches
33/42 to 42/42.

[1]
4.5.3 Your message has too many recipients. For more information regarding
  4.5.3 Google's sending limits, go to
  4.5.3  https://support.google.com/mail/?p=TooManyRecipientsError 5a478bee46e88-30f0bbd2362sm49597158eec.20 - gsmtp


Thanks for the suggestion; point noted.

-- 
-Mukesh Ojha

