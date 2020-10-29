Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C0FC55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E590120719
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 10:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLCxGzDI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="zGCfAuRF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E590120719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xC0rVlRzFqV557tRW1n3ObPId8coQDfDINxy8yqL1t4=; b=GLCxGzDIpwXtJXsh8phYq3xi2
	gbcJRRuM3Mr43V5MZjvcybzGPdLIOkPUMa85o/u/LKw5fMc/Y8SIP7lu7bMDuWYydaGHGOnoliCfH
	PY77RO5cZqCAKXzODYJ/GzXQb+pGLh3fWiKex+Hpvxfuom1IB9MclOoJyuS05PIYOa5vkTKr/VBfP
	AxfOHpvibOAKozTZHzqWrMv6jV3Ao2VvQCkVLPqVd7Tm2icnLmHhAwPc4HBhlMsq9ZYRLLqhL2Jb1
	gHQQx649EAczfS6gD+ANMSMpr+wKT995HXrkJAA/8eecjs8q5Bd1tOXLPNYkr6a3+nRRu1b1Bdl/9
	AnIU+Tnzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY53e-0000Rf-MB; Thu, 29 Oct 2020 10:21:26 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY53a-0000Pw-W1; Thu, 29 Oct 2020 10:21:23 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TAHDMM004599; Thu, 29 Oct 2020 11:20:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qld9yon9YboDN8H9lMAvI0/c1iFxnx7SJQj59lzAMVg=;
 b=zGCfAuRFsjl3iJlYvPrc8g5lv2YzZMxgRpTawt1867zj1AC+pTE0UYtvxKwrpTvzPDD3
 nswiy8lFodnYptO6s9UrSWALmQrKnvtWwXSFN7OfP0koXAqLsAHOA8KGUwV3hB7WnJ0l
 a9A+3p3azduvwH0rZnyPSlu7uWOhwKuXPzXZTMhtWeow2HwrY8TT+ZNhGd1kweUEX4Ag
 yXgEwKQJpC9fY9N0g2o19Efuh3QO3RyBJhpw5GqEArAJz+LoAY9mP/uG5LhBwSkynr4M
 ZWTX0xDcuPDaazenQgSYyA+5biK3Y6y/+80wukGo3PmKvB5Q+ohSxu9iEjnncAsVjHAc qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3yg7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 11:20:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 477E5100034;
 Thu, 29 Oct 2020 11:20:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F200025D241;
 Thu, 29 Oct 2020 11:20:36 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 11:20:33 +0100
Subject: Re: [PATCH 15/17] phy: phy-stm32-usbphyc: convert to
 devm_platform_ioremap_resource
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-15-git-send-email-chunfeng.yun@mediatek.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <64bc5ff6-5495-30de-108f-80a4a8c54e91@st.com>
Date: Thu, 29 Oct 2020 11:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603940079-8131-15-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_03:2020-10-29,
 2020-10-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_062123_243319_9EFA53C2 
X-CRM114-Status: GOOD (  20.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Sanket Parmar <sparmar@cadence.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Ma Feng <mafeng.ma@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Remi Pommarel <repk@triplefau.lt>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/29/20 3:54 AM, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>

> ---
>   drivers/phy/st/phy-stm32-usbphyc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index 2b3639cba51a..0ab18f2078db 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -311,7 +311,6 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
>   	struct stm32_usbphyc *usbphyc;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *child, *np = dev->of_node;
> -	struct resource *res;
>   	struct phy_provider *phy_provider;
>   	u32 version;
>   	int ret, port = 0;
> @@ -322,8 +321,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
>   	usbphyc->dev = dev;
>   	dev_set_drvdata(dev, usbphyc);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	usbphyc->base = devm_ioremap_resource(dev, res);
> +	usbphyc->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(usbphyc->base))
>   		return PTR_ERR(usbphyc->base);
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
