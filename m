Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADC0C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 04:14:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872E8619A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 04:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872E8619A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lWm0ffCBwgPVSTTEkAEwslyUHGl73h/omgay0gRwI3c=; b=FfojVekFXWGfUPQt9Mky4aRI3
	l3xKQscXLN8ZRh6lSc4SRd6KuNxa2+3FYvo0o/ZCUTupJfKniHFrJ1XpVvG4tsf99N4uSQs1u+vFt
	4dtxvEJdf75lMY2fwoXXnivQGIUbdAMB2eXpoPNcy/mgL3nKkhWeJKYFCMyRiyIXHYrZJCiTNqX8W
	5vtmv1e611sPR5Ncqs8OFhdIYHJ17Q584DWPw8TF7OFApsNFcPR9+nVaDFieZ/JywY3O7PYZnv/I8
	QPyjQ1+/tZH+VlOb+ikPw4hd2wXnHiXGFSG0NqBSPEo11lPyzDEFaIk3TVc9VaQNoaNcaptl2oq1U
	5CiQEae3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPHNt-000ZgF-IL; Thu, 25 Mar 2021 04:14:13 +0000
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com
 ([40.107.93.75] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPHNa-000Zes-8o; Thu, 25 Mar 2021 04:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq7rb+0aWuy4gF12MWGJ6t4xTrY8+q/SjPDOUUH0uiNAODDC1ECC9G+cHoGLbQSmOpn4j83E/wyBNTIei+PJz+O80gRY8fPrQAOKwHkMmLO37VmrWy6QDtUHG13Zlwi8ggHa7exZZ/D8jYtmAEME/lITDCnAqzS50re/xSE+CI6Sj4c05HwD2Gip9zco7UMjQvpaFAmKihPKaX1FD6WUJWIJPlLQjNstVvh27uWmjeynY5NqxWu8NsuH3yArw499LcpuKp5I6AR3d9PwPoO9nbtFPDuO8Mh5VyOOxI45TmMPEqjCxi7+5GVj3koVXLiRNXz07t4nTPXWBR7KrTMkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym/zs6GXH76u5X6/xkOkadV2vByg5V50D5RcKgXBJyM=;
 b=GK1MWP4be1vESPT5L4xhEwDkUIrtGxVjH7ZENP+OrVRjFX/CQ5nK5Sk7VCE8bIx7pbPVeN68Djeln58IxIJBJf12q0tTDVrsl++KsGWCWJX2LACz5bj3xRfJ8oTk5IJNh37xban7YZm7H7ZZD8T2bHjHDyem24CVSSif93hW0lg2Sm3Yo9uoqlZj4spbOCZ2X8MvIWNyRHnYqJsX5yaWV5qGjtCay8SXrg3277M2k+CfJ/R2jds4fwgrq9hBjMhtvTz7jT10UIa+45OeoXZmCeXulgNX5mk4XS8VD+anL96VaIg/OtrIKFPQPA62QGbKfohYaz16oCFN1kmwGLBbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym/zs6GXH76u5X6/xkOkadV2vByg5V50D5RcKgXBJyM=;
 b=PUdzJPd6PESzi/s+2+3V/XpRftzu2c2qdydbQSYRgWxVP+4+03HjxRvFdAOAU/dh5JfudY9V0JJjDb2z8l++rrmyiOiOkQr+2qethyt5p09RXD5dklcb0eELOLSXSCI8nqhhrtSh2GHmXwvUaPTqEAbIDDFLH9dZo5SzBKTFu+c=
Received: from BYAPR02MB5559.namprd02.prod.outlook.com (2603:10b6:a03:a1::18)
 by BY5PR02MB6450.namprd02.prod.outlook.com (2603:10b6:a03:1b4::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 04:13:45 +0000
Received: from BYAPR02MB5559.namprd02.prod.outlook.com
 ([fe80::2418:b7d2:cbb:27f]) by BYAPR02MB5559.namprd02.prod.outlook.com
 ([fe80::2418:b7d2:cbb:27f%5]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 04:13:45 +0000
From: Bharat Kumar Gogada <bharatku@xilinx.com>
To: Marc Zyngier <maz@kernel.org>
CC: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Frank Wunderlich <frank-w@public-files.de>, Thierry
 Reding <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen
 Hemminger <sthemmin@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michals@xilinx.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>
Subject: RE: [PATCH v2 05/15] PCI: xilinx: Convert to MSI domains
Thread-Topic: [PATCH v2 05/15] PCI: xilinx: Convert to MSI domains
Thread-Index: AQHXH0vIUXC892kDXkW3zUak9HM8+aqTE3EQgAANhwCAAArBcIAADnoAgADhkxA=
Date: Thu, 25 Mar 2021 04:13:45 +0000
Message-ID: <BYAPR02MB555950A0F187D36B1EA16E58A5629@BYAPR02MB5559.namprd02.prod.outlook.com>
References: <20210322184614.802565-1-maz@kernel.org>
 <20210322184614.802565-6-maz@kernel.org>
 <BYAPR02MB5559A0B0DA88866EDC7BDFE5A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
 <877dlwk805.wl-maz@kernel.org>
 <BYAPR02MB5559590C1395C15205582976A5639@BYAPR02MB5559.namprd02.prod.outlook.com>
 <874kh0k3tn.wl-maz@kernel.org>
In-Reply-To: <874kh0k3tn.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f47583b4-eeb9-4f27-61f0-08d8ef446228
x-ms-traffictypediagnostic: BY5PR02MB6450:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6450C2E06828D50EF318E0A6A5629@BY5PR02MB6450.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7bdx78r8hOVqLpxrW9wbSEIWAsXL7EwD9L8SJOZXsDF5lBfvn8LyEfu9EUjLKeuEShtUz3y6nILOzfysJqgTigAl/tk5UaxeHykpCZgstSwmsJ4XM3nLSvCdiDraGrLJv/B7XhHxtF0qgWvLffksCYUHCQTHl5ZGMjKu2QUMxAOdp6kwFaBJuHpugCxd1la1w0pAHGc5Uf0KWGM44JSPIrySpevAG5JybnT8mGK6ATpfnQXykN3uIVcDIBqtlq7TNIMOvFew3pCCv/na80YVFm7sPS7AT8X0IgaXysAAlOEPL8T93B7C2gq2JiLWXJMzYqwkcpnjCkLRFmbXQcGv94Bc7DfEDzUvAi9F4yd/W6H9JnGcjm5HNg3uAL/hI22hQ9SaHRuzoT4p8WjFm5LUpWINS9T6MBoeBhHHamR2zkbQwkbaKGHge2h94YIgBj9V719nZgKc4WNIBGHuPFk08HXTEjqdwgjbRypZ/Rp05xTFbrntAWjhG2GxeaQxusfIJGZSHW6qroWyYJg7cttqkqVaYSrwoeNSsu14Bv/SOFR7dARLup+ozoU6kN3Ncb0jzwwUBbdAUtSKJz7VnXtxtpveLdS6M6YV0ZHSaqOT1QkGlmQa3PtKkgUVXpZuSxYc5pcPXap8L/1drRRujSoB3EIOxaDaWEP1EhAXQW0J0RY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5559.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(86362001)(7696005)(38100700001)(5660300002)(4326008)(6506007)(55016002)(71200400001)(6916009)(52536014)(8676002)(8936002)(9686003)(7416002)(2906002)(76116006)(66556008)(66476007)(64756008)(33656002)(54906003)(66946007)(186003)(316002)(478600001)(66446008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?C//sewGlZGB2UB3YTVcdz7EtWz6J1G9ieUhsDyQt86pO2UXIVitLLNfmzmyL?=
 =?us-ascii?Q?FquS9KEpFt2hY8K3v83L/h2cC8p+VGa6IFf+ltnjaPfw9vVm8IS9LyujpNIh?=
 =?us-ascii?Q?MgpH+R6P/BVnoT2uXvXVgJ9kZXlZ2p92vbnE3YzIDAtrZT23KD1mw0Iv2141?=
 =?us-ascii?Q?38dwbpuB6rAIb6uZgSlL/hEmN3BAOLRnE2TSOIp6EEMElgs2s8OUlO0wBuYe?=
 =?us-ascii?Q?+l2ZneBbzoFTUbfBZlg1ENCy4+tqRG6m5lyzU1qabi5EnqJu2hJNtpz43KYO?=
 =?us-ascii?Q?UAhTRh4sUshWU/Cq/G5nNGrsMt9R6gSfRHE1tXugMfPZFFjMTbdhoZKAklvj?=
 =?us-ascii?Q?EmMz+RtM7tGLh5vYzuOke+A/sM6/XDKKoOEXgIr4CCx1vpHb1bcKX7Ez6BEP?=
 =?us-ascii?Q?piGBYpL5QLKRhw1FOWVVUp8N3vqAyEuAqT2lBFFWd7uYdjuWSMdftvx4uhOv?=
 =?us-ascii?Q?NGkycuJp3PLb4+bmAljbza4Jj3HDB5hUSlOjAemZGbAHR/eb3lhqiTRFM5Vy?=
 =?us-ascii?Q?rgQXD6zulL3Saw0WT88ZKuXKxD7zStv1C1MDB31eQ3P/4v5v4wA/JQlFjw9n?=
 =?us-ascii?Q?AZ0QxmzjeHoi0yJL8a6Kjc3X6r0dR242D+F8bexa1ye0lBs67lFXZAjM88jj?=
 =?us-ascii?Q?R4qQshN5WNgqTccqKkk+XilzfLjeabyqwhwYdmTu7lnA29615CarsEyPK+cI?=
 =?us-ascii?Q?vOmCEGaQGJ83iqhMJM8wqWZyv3hrRf5n/8vHu7iwxQxfR4bEKLy7MYdHcpwF?=
 =?us-ascii?Q?TJbX3siPt/WXH6jcIXX6xKZVdbGhhTDugV77PW2CFVeo3zPlfFaBRSdPphyr?=
 =?us-ascii?Q?yLknKBsLg5Qf5ONOwb7MNK+4p1+0IlIYvM8Lv6GellmLsmb1HrH23e+4UGnN?=
 =?us-ascii?Q?CB2w5mPaIxeoLFynTmURut7GXRgeNHZ7Q7a9WFhAhC4Ok6KN1Dn8JgPKFpEY?=
 =?us-ascii?Q?pqjxJNuL2uVnC1kR19xRr2mP/pHMo45618IQwR9YtabdZYn+D/3KG5M6jf53?=
 =?us-ascii?Q?IP7gXcQz5p+5P17RrW/fE8zhNEpq/uOqZYQulZUBDAmShHrrfhJqwKAmb5EO?=
 =?us-ascii?Q?A4mx5zd9x7seh7hqqk8FfkBcf33j5Pf5p0SSTp+9RIouM2I24KjLPZQRQ7Kq?=
 =?us-ascii?Q?WVoNrJzqkpKwyve0bnwu1rr6exzfeWXmUGkS4o0+Cw5mtT18z8QHffVkfvKW?=
 =?us-ascii?Q?qmI6ZBNBTKVysDn13qzUk/68fmjEvj55G+oGJj1fISiTrOsQqStdC6CLXEfp?=
 =?us-ascii?Q?MjfQ+R1mSxAqd8hDCt+iy3LJQO4CODzeDGxvkt/OmdLnDLRVT2i6A80CswDz?=
 =?us-ascii?Q?vh4GS0jS0wLRD0V4bBDYHgSW?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5559.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47583b4-eeb9-4f27-61f0-08d8ef446228
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 04:13:45.3655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScqB5RpmHBMusJgDXgTrAbPnbcWOr/eyf1VPbFv0nPKoREV70Nle3J2sqobeRxoyDZUy/CHGo1qzYLTIfoQOnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_041357_107915_C606832C 
X-CRM114-Status: GOOD (  24.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Subject: Re: [PATCH v2 05/15] PCI: xilinx: Convert to MSI domains
> 
> On Wed, 24 Mar 2021 13:56:16 +0000,
> Bharat Kumar Gogada <bharatku@xilinx.com> wrote:
> 
> > > Thanks for that. Can you please try the following patch and let me
> > > know if it helps?
> > >
> > > Thanks,
> > >
> > > 	M.
> > >
> > > diff --git a/drivers/pci/controller/pcie-xilinx.c
> > > b/drivers/pci/controller/pcie- xilinx.c index
> > > ad9abf405167..14001febf59a 100644
> > > --- a/drivers/pci/controller/pcie-xilinx.c
> > > +++ b/drivers/pci/controller/pcie-xilinx.c
> > > @@ -194,8 +194,18 @@ static struct pci_ops xilinx_pcie_ops = {
> > >
> > >  /* MSI functions */
> > >
> > > +static void xilinx_msi_top_irq_ack(struct irq_data *d) {
> > > +	/*
> > > +	 * xilinx_pcie_intr_handler() will have performed the Ack.
> > > +	 * Eventually, this should be fixed and the Ack be moved in
> > > +	 * the respective callbacks for INTx and MSI.
> > > +	 */
> > > +}
> > > +
> > >  static struct irq_chip xilinx_msi_top_chip = {
> > >  	.name		= "PCIe MSI",
> > > +	.irq_ack	= xilinx_msi_top_irq_ack,
> > >  };
> > >
> > >  static int xilinx_msi_set_affinity(struct irq_data *d, const struct
> > > cpumask *mask, bool force) @@ -206,7 +216,7 @@ static int
> > > xilinx_msi_set_affinity(struct irq_data *d, const struct cpumask
> > > *mas  static void xilinx_compose_msi_msg(struct irq_data *data, struct
> msi_msg *msg)  {
> > >  	struct xilinx_pcie_port *pcie = irq_data_get_irq_chip_data(data);
> > > -	phys_addr_t pa = virt_to_phys(pcie);
> > > +	phys_addr_t pa = ALIGN_DOWN(virt_to_phys(pcie), SZ_4K);
> > >
> > >  	msg->address_lo = lower_32_bits(pa);
> > >  	msg->address_hi = upper_32_bits(pa); @@ -468,7 +478,7 @@ static
> > > int xilinx_pcie_init_irq_domain(struct
> > > xilinx_pcie_port *port)
> > >
> > >  	/* Setup MSI */
> > >  	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > > -		phys_addr_t pa = virt_to_phys(port);
> > > +		phys_addr_t pa = ALIGN_DOWN(virt_to_phys(port), SZ_4K);
> > >
> > >  		ret = xilinx_allocate_msi_domains(port);
> > >  		if (ret)
> > >
> > Thanks Marc.
> > With above patch now everything works fine, tested a Samsung NVMe SSD.
> > tst~# lspci
> > 00:00.0 PCI bridge: Xilinx Corporation Device 0706
> > 01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
> > NVMe SSD Controller 172Xa/172Xb (rev 01)
> 
> Great, thanks for giving it a shot. Can I take this as a Tested-by:
> tag?
> 
Yes. 

Regards,
Bharat

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
