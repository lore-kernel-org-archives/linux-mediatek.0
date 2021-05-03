Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A47CC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 07:05:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876BB611CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 07:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876BB611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IqZjCeYMszx9rF4gDLVzlVAVQMEmIgCvQcVYkcoNTlI=; b=ZW/ck2BA5xVBjPFRzovZMU4GZ
	aT6CxTSJav1aCKvfy2v6tavhg4ud4Y/m5cUXS0Qp+RN+yQG9O7iBNp72jBJYE1PXPy8C0V3o98OxW
	Z6Df7eeuQghsQ/t5HizzhbOCHDxnwViYb4bJWxj53SmFxosR8M3drTwOvwSiSnhpX/ZpsIEzVV6Lr
	4gA8G2vVjfU+G7RdSHTq7ZH0gTo9d8vsKTpZRp9A6bRpoMCGQ7dLpb6k7ernB42pEcFhi+kAfqL/K
	wRW3Dy0hscLTcQg2dlevxbG6NJp3AFKqawMaHJJyB2Wym8s9lGTZ5jZgNF93y9EBlJCr0IA08SYoI
	G875HCOmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldSdQ-00DLIe-0u; Mon, 03 May 2021 07:04:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldSd6-00DLGQ-BP; Mon, 03 May 2021 07:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=A2LUi98bQEsBLs6+EHyBIVyeTOOCSHH3hPDWNj+yY6c=; b=IP0jB0gn70EfWyEXYBbfjDR5+a
 +uV2Ac5PEjH6rav7mkIfbpn38M5dWMn/dTSa87/E6rTWrPu031eyq30+zhIuk3U1neRgDxREPKimX
 453hm/I9wa93btBe7mNy5Lb9R0KVGiNUzdsy5fM3YE94P/9p8uEjGNyYecNX82QVXRGktOkqfebKo
 1e9hqZ2zUDT0B7sx/lNpTjfckgo7uJn1VmQ9XRdhRV29uJmPmq/83TTTgIEOlGH0lC0GmaDZvGedY
 rdWQyM0+qi2ik9fJPcbC36Ii7VFWt/UeAjU72r+bWSTSm0+ikdvaUBS61Qw7+h+SWoVvrxtuI1n9f
 9SBQHYAw==;
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldSd3-002shB-OI; Mon, 03 May 2021 07:04:31 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1436jSSO125386;
 Mon, 3 May 2021 07:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=A2LUi98bQEsBLs6+EHyBIVyeTOOCSHH3hPDWNj+yY6c=;
 b=Bi4VLwxwlYpvLUg5nYwEXFoLf9b1AbGySJ/WjfihKqE9kJlVg5bFWkFtVIaSTGch+n/D
 VeDURr3lKTWlZZtRdai6UcdsmIlqVqnVb0ow10CkQyBTtpKosxtB16aBHzontgI56pdx
 EZC2baxfpORkyfFFv9a8YTdHuGDFpDSKh8GOZywnEHsYowFfqG/SyC84GGB9JeJw+mb0
 c+9NxwTwZdXWM1R4/YIKBICPXaHzkW88pJqUCZfmTM4owdRMj4uX/IWSHHw9JAfxY4eN
 OKN6gTA9XDqL7hPsTk26sb91j88eGe6dhbzJsyYwM03K0magBKNsM4NO2uouisbL23Lr KA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 388vgbjs15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 07:04:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1436jDfw072686;
 Mon, 3 May 2021 07:04:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 389grqau13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 07:04:08 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 143747Bk155347;
 Mon, 3 May 2021 07:04:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 389grqau0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 07:04:07 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 143741qO029906;
 Mon, 3 May 2021 07:04:04 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 03 May 2021 07:04:01 +0000
Date: Mon, 3 May 2021 10:03:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Colin King <colin.king@canonical.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
Message-ID: <20210503070351.GJ1981@kadam>
References: <7a512e3a-2897-ac12-ac6e-06be28735279@wanadoo.fr>
 <20210430163450.GA657994@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430163450.GA657994@bjorn-Precision-5520>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: -HUAwuDF2LXDw3bFyBbGcmZlTdgK708b
X-Proofpoint-ORIG-GUID: -HUAwuDF2LXDw3bFyBbGcmZlTdgK708b
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9972
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_000429_906303_B7667558 
X-CRM114-Status: GOOD (  28.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 30, 2021 at 11:34:50AM -0500, Bjorn Helgaas wrote:
> On Fri, Apr 30, 2021 at 09:47:06AM +0200, Christophe JAILLET wrote:
> > Le 29/04/2021 =E0 13:00, Colin King a =E9crit=A0:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > =

> > > The call to platform_get_resource_byname can potentially return null,=
 so
> > > add a null pointer check to avoid a null pointer dereference issue.
> > > =

> > > Addresses-Coverity: ("Dereference null return")
> > > Fixes: 441903d9e8f0 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver fo=
r MT8192")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >   drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > =

> > > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pc=
i/controller/pcie-mediatek-gen3.c
> > > index 20165e4a75b2..3c5b97716d40 100644
> > > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > > @@ -721,6 +721,8 @@ static int mtk_pcie_parse_port(struct mtk_pcie_po=
rt *port)
> > >   	int ret;
> > >   	regs =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-=
mac");
> > > +	if (!regs)
> > > +		return -EINVAL;
> > >   	port->base =3D devm_ioremap_resource(dev, regs);
> > >   	if (IS_ERR(port->base)) {
> > >   		dev_err(dev, "failed to map register base\n");
> > > =

> > =

> > Nitpick:
> >    Using 'devm_platform_ioremap_resource_byname' is slightly less verbo=
se
> > and should please Coverity.
> =

> Not a nitpick at all.  Jianjun is correct that devm_ioremap_resource()
> does check "regs" for NULL and it fails gracefully before trying to
> dereference it, so the extra check shouldn't be needed.  And most
> cases in drivers/pci/ look like this, without the extra check:
> =

>   res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "app");
>   base =3D devm_ioremap_resource(dev, res);
>   if (IS_ERR(base))
>     ...
> =

> If devm_platform_ioremap_resource_byname() keeps Coverity happy, I
> think that's what we should be doing across drivers/pci/.  Coverity
> false positives are a hassle.

Smatch knows that devm_ioremap_resource() will return ERR_PTR(-EINVAL)
when we pass it a NULL.  ;)

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
