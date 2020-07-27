Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BF8C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:55:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 145482074F
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:55:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ISlQtrLI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="bMgExa5z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 145482074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r7kgB9lALdyxE7aerm+WdrPkZVnfwjLOoBpQKGE0pT4=; b=ISlQtrLIWwbydR5xeii7MCAsy
	tOcOUHme535N2JF7X6TVdfUKehB3t0GTb4zloMlAAYnj/n5r/k9RL8QUrAspHINvq257XdA5RWr2z
	hxk4HBPLmuDsNG9yU7jrsRxqmhYlX40ceesIx9nNnZvwoNdTU87Ia15Gh7vfV377XZBpP8NP9dZoQ
	XmJMK+3SZwB+67CFVSP2YUBaBGDJ6IuUi+7SHa15pf+LrWxOl/auMviqjyONt3E8wkrv/E5OygcBb
	usnfKY90GWINzKW7z0figitIS16hn/CneXXSJvX+wzmwbXIiQxbEIM1n7ayHbZ1fZOv5pQSK06kbF
	DGOD4h18A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02fM-0002JB-V0; Mon, 27 Jul 2020 12:55:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02fK-0002II-9q; Mon, 27 Jul 2020 12:55:39 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RCb6Fo013340; Mon, 27 Jul 2020 14:55:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mjY/7dksrDC7M4Ud2YDvD9iqbnxWCHmQNoGB5GRnp2M=;
 b=bMgExa5ztW937ye1ZcAy14vLwvQA+T0FDcWOyldE4Ee+O+rx6KLOtd/1W9f6ebDxkn1U
 st+MEnKYNB4Khb3BAKF91tFIshx8+JyOOERJth7f+BKjSVx1OGyn0SRmrPokUIfGU+0t
 wonz8gwJcgwlOpoZa1R+vX/doMX4vGmrxqUUxiflw5+m7EfeYbT/4qswjVtkyMH8JLBR
 re2Yjdi5dPsseWdAvg75nJqhV2XUKKBtqjzBbqktITMVU8uF/vX53xg15ZzR4789JnCv
 f1qVMbP5hZf26Pd2Am81CQtKClTVee9e/VmyE4UmdU8cu94oZRPQf0MTHTSjg6xsnH97 Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v99cqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 14:55:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6226710002A;
 Mon, 27 Jul 2020 14:55:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D2EA2BF9B4;
 Mon, 27 Jul 2020 14:55:30 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 14:55:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Jul 2020 14:55:29 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/7] usb: dwc3: convert to
 devm_platform_ioremap_resource_byname
Thread-Topic: [PATCH 4/7] usb: dwc3: convert to
 devm_platform_ioremap_resource_byname
Thread-Index: AQHWX/0W9J7PYecCTkOfnceP/F29OqkbSOeA
Date: Mon, 27 Jul 2020 12:55:29 +0000
Message-ID: <7e8ab37e-d94b-ac7d-3642-b82329c653cd@st.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <1595404275-8449-4-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1595404275-8449-4-git-send-email-chunfeng.yun@mediatek.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <66DBBCCCBDA2664D99A68A00CFC169EC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_08:2020-07-27,
 2020-07-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_085538_740243_05B776ED 
X-CRM114-Status: GOOD (  23.54  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng

On 7/22/20 9:51 AM, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource_byname() to simplify code
>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/dwc3/dwc3-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index c682420..e733be8 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -206,8 +206,8 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	if (!dwc3_data)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "reg-glue");
> -	dwc3_data->glue_base = devm_ioremap_resource(dev, res);
> +	dwc3_data->glue_base =
> +		devm_platform_ioremap_resource_byname(pdev, "reg-glue");
>  	if (IS_ERR(dwc3_data->glue_base))
>  		return PTR_ERR(dwc3_data->glue_base);
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
