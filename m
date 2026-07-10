Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652C2C44501
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=Zsw7DZxrUMelFdSAokLQcU1zbV
	IFxnexR2JcfpHm23x55ph/f3yKucrgAmCi8RxbqeDr3vl9OzZJJcIZwB+LbYLmchmdz04B492gutD
	VPfKOD0Tj/Y4iI/NtRjPoVYUE9xhu1dOUnK+hbC4q/kuFalMV5Dckh89x2VCq1aT02kMDbPNGvNG9
	saodLPRRS7qlKAxvEmXFxK8GSc2o1K5WbkMhjGhT6+1x/QbBYyzDCgHaQsd+etrI6hVaxutd6pnKh
	5Ffexd4cZ7go1KZEvu/EDqPOYLpKOq9nu/V811WuplxElBZSyfpu2nWDF3Wwwl8yg/eBhItYANDhB
	I1gPH89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAyO-00000004ymW-2DH0;
	Fri, 10 Jul 2026 13:08:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAyM-00000004ylR-1Aw7
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 13:08:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7wM5924552
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 13:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=; b=PQbhMoe3PoBcb3Hs
	/DihV9aYD7N2odD9vazHqRjsDv89h5rZHGphaH+tpWhsa7+af5rBKTPuJdW8LPZn
	Mk39Wieqo6Mw60r42dLUd2Gxgi7p8bxjZpLshjrj7AzbL34A0DXvPUZmVUH4NX0g
	MgtJWs+BKx0AJ2Ezx5aSRboaeoiSWTe52rVeK8zpfzJ0RAwKpEqAfSYiOKp5qRRf
	EsdJxs0bExnyDS3qhxtop/v2dbSfVm0i9jaV/APL5yQgCnzY8s/Y1+SDeOsMMPGn
	F/+wgSzwHMID5UrcvHdiCAnKRs1pvv9gBeLt9XKdfGXLhg0wmyfSh8mZwn6Udt4N
	ZKZX0A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0gjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 13:08:52 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-662f741fe3bso1177811d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 06:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783688932; cv=none;
        d=google.com; s=arc-20260327;
        b=KC7DZwLr4c9ZIqN13py+V1Bq8r0HqqhzG0hgqKzqcFfqNbUxf1BvDy/E/WaopriK9K
         DMV+8GdYJn5wfwPzjzrxrfChoRU4rbSkTIfZorQ6UIUADaKhjBWg7K6+RXCWuGPMmY6K
         0DChq1vFis89ETbfFmsYkPMDOhF9D6/2mrxK0AF1CFE9zEP69xAYTR/6UFNvmKxUVAyF
         hrYVCU3VMRXTZqIKlxN3BO0ipsf8AFjPTJjEetm46iKmAqntAxThwa85lLwqFrcvckkG
         9GtuSNG54GAy3M7dJLvuK1vlL5orSEYf95bplQ11bVdOusofYQ26FPCsGoX+/2tkyFW5
         cgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        fh=h66DC5brK4r9bsl+QBp9qMlhy49Cfh0X/2pKxYqYfpk=;
        b=h1Ldn1LdBW/GgsUUkvRfTjCfk8JEy1zVWPBIEwRzSkQyQ80Iod2ew83QlrayygI8nN
         yLSUnkehlzgJHdfqOt+ckEZ2PY1osmZz075Q5aN4RjT75mtcKN4ZpZvCLQ3qdOtTRIXG
         HGSC64gFtuGipe2mHbo4/ZFBjzd/OQ/QbPnQo4r9/r+FiEn27TEDR6iZAXAluATEJST9
         E4qaIkYyWjrPLkrTIY+7JLZV6yUbzwGUcteqiyF6+Ykxq+CaaWtYdEQmXP1yjbNm5cUB
         rbqtftJ0jGkoPrQtOE+eBGY791FBwlktR0i3uC36QVHfHM9RAthudKrVb6a3C9a6ynA2
         frWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688932; x=1784293732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=UWCW52ItrTWelpxoHzAj8L2r4yGrWvcmpcRFLDBiCWvhnRRLuYJpB3TEcPF/hxawr6
         YCcoVyoPAhBBmZ6GxHDmPqvuQQeC9zQDbnlqVfPoHc/8KR5Q95NLIebJ37oJY7fFlId7
         LrmK7/IvpAwxER+bJqwvF+HjoFwqZJVep2oeosdvitjdpnU2dk/F87/T1p7q20xnEN1D
         DbaVVZblr6MJNYizfK4XdiqmsqH9BidgO7nw4cCpNzoGnTaUdPCI+QVht9CL0C4FnAWV
         zA8xIE+dcdNF7ZMXBPzg8IY9O1rGvpd3ZmX3uCERz5+yPyXThUCQygRd5lwKIynf9W2a
         EmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688932; x=1784293732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5Cka933m4keuHC9q+ty9VLjOYV17gugYbjBnwJv6Bo=;
        b=XcKq3tB42mPIj5ZsL3ITVxzNql/keAVGKAtyPNbJJ4vk2qn4FddQvAlNLAjR1Re/45
         wDqqp12KDdlWOP95+s2iohAtjxYN8IArAm58SKmRI3v65t4NKwqgJDHS9FmauXpqtL2C
         oAaTolQaUFljWTzciyDG6dbh//OMP173aWMuhHIdZl1YSavgaNC6rTQ+uNWEcHQnmjHH
         xQOLf5f34gv/By/puIwwQk12x0iODov+Pu6SHipP5cztXTDUeYN4pgJppfaVRCdiVasp
         vlkvttTez/ehz9eVXKJO4IVwt8IMoFjSQmCtcVt1P11yZCTMmNBMUlv9WKwhV0gli831
         acow==
X-Forwarded-Encrypted: i=1; AHgh+RppgBE6E+Z66g2RPbTretga3q+Q/m//5aTPSjAXpOTNBOz8wQ/Hk8wM/hLBkr9hp/L3y00FZB2UXv8bbjYSsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoM8g8suO/uP9yv5lFn+ezm1wVCzWaBkm/TPE3iTosOiRci0xR
	/V8/vlA0N5t31WUqOh9NqJ8vUPhD31gSwmE6zCPMlsPF0bCyBIAlEFfjvTZYa57y2j7MM4eEJuW
	uzIkO/9AYjakbrqyZO+u7Rtl7Z0YvZDOABGzagE7UcG3WTi+NAdz0wNOYFQmJjoZz1W9pnHR/UY
	u/M1ONdkAdlaGtuqDifFQFq+QBprPVmDKc8slh7pBApH407T6s/w==
X-Gm-Gg: AfdE7ckRPgOcTLDGAO7fpzWEY/rFS4c+i9vseeGcsVhvbVkQ4aJkHUt0lvEYIb9qhh/
	V9bWpx9P3iEv5FKks8DVnYaFngnoLlSz7kKpJrE2DN2uoKRUKjZrP1JqVDqqJlj9yTj7BZdicuG
	WuJW2PsImsnYm6bNz9FWYjKtONrSA5CO/H3+pl/xcBdTkiqjRcWMaJpvDHfomy/OsJ8UZ/
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id 956f58d0204a3-6679f245672mr5946293d50.92.1783688931959;
        Fri, 10 Jul 2026 06:08:51 -0700 (PDT)
X-Received: by 2002:a53:bd08:0:b0:667:8b91:242d with SMTP id
 956f58d0204a3-6679f245672mr5945969d50.92.1783688926691; Fri, 10 Jul 2026
 06:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:08:34 +0200
X-Gm-Features: AVVi8CefhojPUiWasaXCCjZmJBb6K9Qzlv92c3u5BPoEMYadIduP2fyzpl9La3Q
Message-ID: <CAPx+jO-hkYQoEOj1Jrp7sn5HXYTDbfAG4U5rpNBW2Wue2TZxhQ@mail.gmail.com>
Subject: Re: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX1rPBEq/7w01/
 cDocqa2FSNhYvv9SaV5cMRc6Lu+cLJYSQKdBcNGwGcGmaJ4/oJQli/MeEwjkjyqEV5Kj+nzBKm6
 gmUiBnNHx0XevkVEOjtaml8ESQgMpO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX1f/RYIxpd3qD
 C2pQjzGFm3untctHh0Fj42/nLlovYPTM0m1kTpZDOXGJNdqWrKa2IdpEt/snnBxJO4fM6KxoNtc
 QHKM4xNMHEoUkMDzSwcirCOmZYRzwcorkHSUM/dFN94vWE63PirEj/YPA7xMknH6F4CLFwavBem
 5pk9S/SLuZLejwjb5wB1e3ZInj0pNTH4PjBwlACrZE24ZqPvQ2c/GSGGLCFu9jqYIF9BYviLiFw
 l5WR2Yl4/xIIPp3h5VZSDOSW6iSUPp2I3oHjEmuNoBehpLCirEwBqXgpw5b/hR0E7JwhM7KztJ7
 o3mosCmrhtaiZo/NxCuvgaerxCurSsCVmhZsM5LPdE3GsTRoKov1HWumTvicYfkdRB59O/zCONX
 KTHh2LRp7XDDFtRw/IwECVPnPwQ/wTH0zs/EMmLf4fuqDDpDmZf+OvLFiVykicB7VTBwO5FwTug
 5pb+QjRLjmGmPPEqSAw==
X-Proofpoint-GUID: jxPOZ-bR2FcwxwisQDPDonl5PxPgoqvg
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50eee4 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=z_eSG8vRrt57AjWXvbkA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: jxPOZ-bR2FcwxwisQDPDonl5PxPgoqvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_060854_436755_B9A8BC9C 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, Jul 3, 2026 at 9:48=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
> of the manual of_reserved_mem_device_init_by_idx()/
> of_reserved_mem_device_release() pair, letting the device resource
> manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-=
bst.c
> index f8d3df715e1a..304554ced690 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci=
_host *host)
>                                   host->bounce_buffer, host->bounce_addr)=
;
>                 host->bounce_buffer =3D NULL;
>         }
> -       of_reserved_mem_device_release(mmc_dev(host->mmc));
>  }
>
>  static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
> @@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci=
_host *host)
>         /* Fixed SRAM bounce size to 32KB: verified config under 32-bit D=
MA addressing limit */
>         bounce_size =3D SZ_32K;
>
> -       ret =3D of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(=
mmc)->of_node, 0);
> +       ret =3D devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc=
_dev(mmc)->of_node, 0);
>         if (ret) {
>                 dev_err(mmc_dev(mmc), "Failed to initialize reserved memo=
ry\n");
>                 return ret;
> @@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhc=
i_host *host)
>
>         host->bounce_buffer =3D dma_alloc_coherent(mmc_dev(mmc), bounce_s=
ize,
>                                                  &host->bounce_addr, GFP_=
KERNEL);
> -       if (!host->bounce_buffer) {
> -               of_reserved_mem_device_release(mmc_dev(mmc));
> +       if (!host->bounce_buffer)
>                 return -ENOMEM;
> -       }
>
>         host->bounce_buffer_size =3D bounce_size;
>
> --
> 2.53.0
>

