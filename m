Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC5DCD4851
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=; b=Hxjt2SbhqgWUxuhP6JLbLHbUxJ
	b6oAU2Ivj4eFw8nI23EUL46H7GaCGYEtTXsNxW2dMWz8iLyxpP70C8WzZsiviFKAdCR3aQRTK3AQk
	w/g2BAtRFSlbYaIRO/my+4FHHxmIAskKG13fJtTTNm4mwZD7C+W6gc9y3dYrXBo1r+KYm4cBgP1w+
	kZbds/eQvMCOuTUtfUQBdk7NFaFQr6LH+rrIKP8/uEe+VgRlBQIrNBiuSGxZQETOe3ygEQY997uZZ
	wpdBf8xkbiAd7LcuBu9W+vacp908cBPppRJxyPZOKAdpMSCaS7MSF/cKV7kUdGiT90GnUdGN5usi3
	VyjJ8lOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9bQ-00000002kHR-2Zs7;
	Wed, 13 May 2026 13:26:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9bN-00000002kEj-2Gq9
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 13:26:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8woaP4159611
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 13:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1A2JIuivfxTHNE33J+4ZfrSn
	HuAPEzqRV86Vt32AWoc=; b=k2+sVBYmVZ6IQNmSNTSEz1M1qd4wswCJFFvnyNxc
	kR7lMnI/qoifc5tBfwJtdRKCTTiGgdsMz53yoebwClcfnY4u2z7KDVV8N0s5w8pM
	W8cKzo6Pyw49XSwLNl/sGtES8RtxR5OCVPg+6l6DrndShstRX+wLtSHhICzhmews
	uiyfDo5q4si49V20xzR96tc/NOXPeH4eyVCo+zdiJIPFh4emrffgdjOMqnK6ZoGV
	oJ9ZRRaP4uFdbrNL+30g4uuGP9zSrK3seLT8SuPK1egfaPDPK2XirOkRWhQ/qoyn
	8L7rD/LIjoc0YeAGlxRJ2/m/+QPHuV5C/YWW/sNOMVpgvg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91ry2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 13:26:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6326fc1256aso5443719137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678776; x=1779283576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=W/ikqESy1J4jWck6+0wbX8YI7sWKcMP9ASTe9zxORvPPh80jhPiT5pAaUyWDdY/Utl
         rm0spFgq7dV8weEojQGUY/TO2iEx7ZYpzTtIfVPtlEjOwriAyqxTBXWtEJoE4ojVx+cg
         UjjK+EdIHGyHDp6jRejN7swMUxPTgivoXr0sTIA4k5huexTt4QBBKpf/xtOFrtM0N3Ct
         RR5R5PL85cBqMweBXFLejIizPBkwrpuIC29sXtkyfddYLhATIWFFc0nlWxpKuXHeKMDb
         CPxS6//ndcrYjRr3vO7gVJ0c8BpCwSwJD/c95zPj87DUzqpiMryAPmzMjUr5/MMrLv9r
         aHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678776; x=1779283576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=lH/dEyA3r/FGdJ0T8ykDZcohfGSHn/bU/zUMCj7PXvZq3MhC6VyupgXKZboP8T8+r2
         7LkY7myO1CWDmo+CKtaIeGx2BhFNAM7dJQvF5cTJT2ywc1qC+jNFhLt96/TLIIVw1Ram
         N4l/Kbuq8BMW5HWMKyxzVKx7C4YFwXjTXmVOlCBRfhdUsBv1c9PglS5FRlR8hqa2nfYN
         J112e/YM+6O1uV2sDuSpqvtEyRpysFD01FUxlRz9w1vXL5GwIZOhF3+0KB3MnGkuIOx8
         ZaR7WJ610eiJfbDXMpPjTdf6VSZDkJQFWY2MKOOo3sK5vV2lfp7yRTfzufqMjICjyhdj
         W3KQ==
X-Forwarded-Encrypted: i=1; AFNElJ86P0yp4Z9n67+I2SVJApS5x2rPrWyfJOEpgjKLvpkR448AgXnFuO4zVVtmQ7DTj0kyKDiWHAKhrthEfJ1FYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+q2VkiiW5bqsnpwnBGNSarZgDY+dFGBI8r8baVhYl1xTjKgjl
	8HsJx+hiarRqqh0trTNPiyr/RZDwHtJy34qCTmjDQLn1Xipy0aXqADj6EPxcl+TipR3fgg4+Te5
	lc7wDh6qsmAlDy8kStv8vzQ+eQ+9jF2G1m7BYGz5qz0jN7ZoMlSdOXcFh1a2aC2CJb425zJhxKi
	s=
X-Gm-Gg: Acq92OFHOYNfEII0+T0XSsBv0TdmON9Krd8gWI3vHC1+UZir37Or/p58YNNZZzgpuCG
	1Vi8Z4ohKr6HyJIIvnRoMtDBzhXLlXeBsrMnFEHK62jXEaXAeNf+at+rP6Z3kSsZ2vsaArRKOkp
	74rStYsZVQV1pHLY6r4rC8g9+lKioac/8K8JPHtu8cH2ZOI37tgqll/99gNKVmKpDVPpBtGSRL+
	zDL0uzlGRWT8/RirbJmne8dufLPxBwvN1Y0Ccul910wA0t+Gg1ClfYxhdReSm4OhTlDVtadwwiS
	vdEVpiwU4UYWIXy95ud1BBpTjvm5MQpUKEAq8QBia9rjrAwV+qMtbBvRvGhEsYy3hzlDcEItFH2
	uS+ccIwwpx01HJ9g2bkYxihXXI1snHHQ1yy9Un/qfUV/0RkoXR02pwHq6IWb798MDGxRqldC57i
	/Tont6qcfHEdFb0z8quCV/o+7GDlcg6vTB2ck=
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509828137.5.1778678775961;
        Wed, 13 May 2026 06:26:15 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509786137.5.1778678775359;
        Wed, 13 May 2026 06:26:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db2f3sm41011661fa.22.2026.05.13.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:26:13 -0700 (PDT)
Date: Wed, 13 May 2026 16:26:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Detlev Casanova <detlev.casanova@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, MD Danish Anwar <danishanwar@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Parvathi Pudi <parvathi@couthit.com>,
        Mohan Reddy Putluru <pmohan@couthit.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linusw@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        "Andrew F. Davis" <afd@ti.com>, Hussain Khaja <basharath@couthit.com>,
        Suman Anna <s-anna@ti.com>, Ben Levinsky <ben.levinsky@amd.com>,
        Tanmay Shah <tanmay.shah@amd.com>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <ldpcnzvloffhiubmv6zxhfzqo4oz3ntkmav6zjprmbnsrxd46z@t72iga4xvaji>
References: <20260511165942.2774868-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Proofpoint-ORIG-GUID: JZCjGm5tHT4HOVoACkWpZkHg4mPRgMiC
X-Proofpoint-GUID: JZCjGm5tHT4HOVoACkWpZkHg4mPRgMiC
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047bf9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VwfjHJzzgIKQiJfiZN8A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfXz5WCaDajKK/0
 HV/PGB+4YwOsRsgPejg3aEqG4EbisrKTPfd4WIHEHWg4ANbP0xls0Fm1fwkYK1IwV65SDR0rpWB
 qydFMxZQLWzG74HpjUj2CGOSdLUy6NYaerIbrF5ONi6Q7Sy9mBskfg1gIUa80NM66cpHvWF+YT3
 u3eSdXwoMxtyX6SktgyNZNkaMKI6XpWR4yVSKDyy6ZBE3HeJr6+lD7nILFUiZEnhk4llGzavZ1v
 kUXK8OL+We7Nhw9w3Oi44e1pRL08DzBAQnxCVQ9QJl9PlPM+0VxwgOskwpOjuG6ZJ7Be3RBrRwb
 ehelThgYbWkw/bRxEn6wam04VVH7AfVioXsDvSMBS8xzdtoBJLAOsBrstZpCYl1XW6Yas5nXB3w
 gaj6tzoWPbbs9W9cqLXEG7cg9JNLVCuouZegWmqiFd5O2q5nyl4bMkfj7CmH72vKLpimwVEOywX
 GEKmMUWYnrm+v/USqhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062617_589394_D9EE1D58 
X-CRM114-Status: GOOD (  15.36  )
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

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
>  .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # display/msm


>  .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
>  .../bindings/media/cnm,wave521c.yaml          |  2 +-
>  .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
>  .../bindings/media/rockchip,vdec.yaml         |  5 ++--
>  .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
>  .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
>  .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
>  16 files changed, 48 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml
> 

-- 
With best wishes
Dmitry

