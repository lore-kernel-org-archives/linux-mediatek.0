Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE410C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy6ydHY6pQ8DYm8xK8PeLsM+pd6WltoQh0mGRUSj86E=; b=aEu107bpnQ+xyefUxk5y4ZM6WG
	/AFGcqtMazWTJg6+1xRmrDPxH6r4ISjFho+nm/R4Rmht9CJdoivkuJI/x7+e7RfInw6WEe5i+/X59
	DRjqpJPlASIUxkF7GcJ9eN5TcCS9fqWXg4TyBXza+FgPDrU8M9LpDLT3wJc3FgvOn76LF8J/76/QQ
	C2+qORiVOTKnpel8g52MK7z962+p21DsbvUu8wGyBIZtc1bZPS6CHd1UZX36mxFxbUIH2oYo4UL2T
	WeYAB5Z2YCcjK9L5uf4xbVOhUaEUIniQIPQum2ALwDEgtiK+99HRYe8cbWjr0SB70EogJxinfww/U
	z6tlsBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4rs-0000000G0ZF-3i1X;
	Wed, 17 Apr 2024 12:58:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4rq-0000000G0Wb-1XnK;
	Wed, 17 Apr 2024 12:58:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43HClsCK003624;
	Wed, 17 Apr 2024 14:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=Oy6ydHY6pQ8DYm8xK8PeLsM+pd6WltoQh0mGRUSj86E=; b=or
	tz7J2eIpRjwTS6nxsow94Im5O+PJ8pyQKEzgQC9x+TEQyuiVxirXsxSqUmOFi5z6
	j9JuaMCVAueB7+ptBoHkZGcb+q5wgjo9DutZh3e/xcZNv9ir2WSLw5Tx3J4ORSCe
	EA73ib1bb2NSzUytaI+3EJVy3k1Q1gI0fSP3IQEsjwu2YJe3ZCZaDZ9kzaEBLiHp
	IczYev9vu0LgIHwFgY0toURY1M4EinAS1+idFQEUfhYnNuSSXU5+tp4rEI3eP1EF
	QiCs84WlUXA+URlFhvVZDuDiVG8dZypP1QlE91pV8tkChGQWA45K8voZ9I1+fYd5
	RRPfPDBlEjqpZ5kxlIMg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyea3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 14:57:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E01244002D;
	Wed, 17 Apr 2024 14:57:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E51CB214D29;
	Wed, 17 Apr 2024 14:55:47 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Apr
 2024 14:55:46 +0200
Message-ID: <ea60a9e8-6240-4a0a-a224-e132b67160b1@foss.st.com>
Date: Wed, 17 Apr 2024 14:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/35] media: i2c: st-mipid02: Use the correct div
 function
To: Ricardo Ribalda <ribalda@chromium.org>,
        Martin Tuma
	<martin.tuma@digiteqautomotive.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Paul Kocialkowski
	<paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Sakari
 Ailus <sakari.ailus@linux.intel.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya
 Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli
	<luca.ceresoli@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
        Abylay Ospan
	<aospan@netup.ru>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Dmitry
 Osipenko <digetx@gmail.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylvain
 Petinot <sylvain.petinot@foss.st.com>,
        Jacopo Mondi
	<jacopo+renesas@jmondi.org>,
        Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Pavel Machek <pavel@ucw.cz>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-staging@lists.linux.dev>, <linux-sunxi@lists.linux.dev>,
        <linux-tegra@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-22-477afb23728b@chromium.org>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240415-fix-cocci-v1-22-477afb23728b@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.72.241]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_10,2024-04-16_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_055826_812663_88602265 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Ricardo,

Thanks a lot.
Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

On 4/15/24 21:34, Ricardo Ribalda wrote:
> link_freq does not fit in 32 bits.
> 
> Found by cocci:
> drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/st-mipid02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f250640729ca..93a40bfda1af 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
>  	}
>  
>  	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
> -	do_div(ui_4, link_freq);
> +	ui_4 = div64_s64(ui_4, link_freq);
>  	bridge->r.clk_lane_reg1 |= ui_4 << 2;
>  
>  	return 0;
> 

-- 
Regards,

Benjamin

