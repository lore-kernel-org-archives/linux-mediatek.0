Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30962C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 04:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6EC960232
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 04:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6EC960232
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0+8NipvzRsFvF9VF4HsDMLR79kV9pP7i9thbC8nhFw=; b=bQUOlVJYdvuDWsmfZKdKWKDQI
	7dcD6QIHjHRM6jHT8CiP8nxcWpuDfa/ymAG5XG1+eiYqBMp7VYYL5Hsu9beMeyXfcqPr8WOReK6Hq
	Ky7W8W3QNeLqEXPMINcW6yM1s72nPIw6f8oefXKp6VF6hc33blQTNpPx6ZLPyhfcYY/dy8xXCkE6g
	WJEO/9nUN3KeC76xIHqalAFpuHuYNPsbHOz/pXMWnwkBu50mvsgZ3GLyZ6BNFdVDEwEPpr0pDehNj
	eMcfBT5WJ8KridZt8Zfkl/3sgGojkC3iV8vmMViWPs8H0MWMO5JoO7ykHHr0e7JNPPv5rsVoR7NgD
	WjH2bwrmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGa6X-0001us-S5; Mon, 01 Mar 2021 04:24:21 +0000
Received: from mail-eopbgr760122.outbound.protection.outlook.com
 ([40.107.76.122] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGa6S-0001tw-S5; Mon, 01 Mar 2021 04:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql948GNaUeEaTodMaWy7gkw/DxvawY7BK8dnWwxECCU8gPDFW6CJnOHsxI5a0zRb+rYlrVWLPrPT5FNiXf0SOvgifPZUB0JIeWurRgrxawBYc2aVodz72hu4ugYFBkiBsUICyQXO6bx49Qe/OjY3j0Ibamuy85Cikx02u8PiTb5ucf5VxiCnua5f0z7Mm7ty+vejfH6YIsWvkMrTLTnrpGNVlt0J9VB9OQemfw41GnMqjS7QfijbEJiSszaood4inZT33wk5PawFP8BjUNxXUpBUsJh4luBxKPozFDNpRNAHpoWFtGgrgwjiXuHTekl7hhK3yOEzwJ2sxivSTanrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2icsW3OsEdmdclppKAN4flTxD1k5egjw8P3Y2n4N6M=;
 b=MlSANyILSqWOuCBF7+8ngr7XeVs+RMw5ruT5tRCSE+e48gijuiGfcuVIvjwLoQJqr4hIF7wDQFIS5hzJZrnDfjQ9229T4StPQakGYfiEvvsD13G0xNry/qvS/guHEp5CcG6MO1u/zzxo64zgQipwgyBBWL7/TnmmXScOwBOqc9TwFRLJS7PzBnKKHthL/YAoRdEyfPLysrRE9mVhn2Yg1XvjQzuFj7AWAhRxQJlCUPXv2Xcwe6GhN+zm73iwnf36iYq+o2gZ8rLfDq+HhVNPKObPy5U44LSk8f7hgxwNHGPUx3N14rWD92nlzplKziVmH+LzZgxvSX8qHbbQ6EgZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2icsW3OsEdmdclppKAN4flTxD1k5egjw8P3Y2n4N6M=;
 b=gOExQM9+jQNMb5SNdt4VvQtGffVIOTDHCuAmEXlVkpknOmLxQgM4X+RaMQQQyGGR0rpgyKJQpORKcmoRDXWxSSC2Y3r/zv8i85MzYZSsfVFHKGSjwPGZPe1f8vYHwhL5veO0V7h0iB8Bmh0kGd4CU9W5hnmJDaWLwL/TUpVXlO8=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by MW2PR2101MB1771.namprd21.prod.outlook.com (2603:10b6:302:7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Mon, 1 Mar
 2021 04:24:12 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::9c8:94c9:faf1:17c2%9]) with mapi id 15.20.3912.016; Mon, 1 Mar 2021
 04:24:11 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: RE: [PATCH 04/13] PCI: hyperv: Drop msi_controller structure
Thread-Topic: [PATCH 04/13] PCI: hyperv: Drop msi_controller structure
Thread-Index: AQHXC4iU5jnjuyQltkGI/zHzReHG96pujFzA
Date: Mon, 1 Mar 2021 04:24:11 +0000
Message-ID: <MWHPR21MB15932604EE1703B0E84EAD89D79A9@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-5-maz@kernel.org>
In-Reply-To: <20210225151023.3642391-5-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-03-01T04:24:10Z; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=eabb8b66-493f-4e10-bbd2-5adf76bfaeff;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae85f2f2-95fa-4380-3578-08d8dc69dd8f
x-ms-traffictypediagnostic: MW2PR2101MB1771:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB17718038BC97E46BDA20788FD79A9@MW2PR2101MB1771.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA8Xf97FeNAYMljx+guElN6hLuiADXn+Ors6gSxVINeqsZjYMOdM9QpqBC/SCZJZUsgYlxGyxc6miqwYCyX326kirktKEk/HwqKszapoJoznZiiPy5JbM/hgyZAxHHzq9Px9dgoezx762tGsAbL1HjFcIyXt8Ppoz2xZSZTwAcgmWQUHFSd6wUVdiApwFEfUX9Wd/pNYOFSgwZRIjjz7q47zR2m4v+3HkDWBWQggJS8NGRV5NO83Mg2/sVGEFD6yQNFk316YXpAc0gV5Ad4vN/NytoQY9vCNKAsM0dUCOdoZrZt+C+DRr8I0f4FcyqMpbzyss963VCiNcmnFySOT//iDZcit/IWpJLEbYmS3XEboFW/Ky04/zXa7/5fEmOsrk+swD++KEjIqc6geESxW74wghwc1rYpM7lU8IZ4kaMMhSQndW28w4oac4Hp99oP+4PRpY+ZZ4TmP0VRUQRr+8elW/NQ/6ko+xcH4zNAtm6fVNNtI3SPJpjCkLGZCjoOfSdkB7o0wHeAL/65Ydgps8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(9686003)(54906003)(7416002)(55016002)(5660300002)(4326008)(8990500004)(316002)(8676002)(110136005)(6506007)(7696005)(83380400001)(86362001)(10290500003)(76116006)(33656002)(66946007)(66476007)(66556008)(82950400001)(26005)(186003)(2906002)(71200400001)(64756008)(66446008)(52536014)(82960400001)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BS7e8GTot/mfhUYn4XRAqpCaC9qkKHu5pIQNn26SdVhirzYgribrl9KzyKKj?=
 =?us-ascii?Q?loMZ/d195BsNT562EsvSLfeMux2lyG4HbR4yS12/5/UbQGOFPhD+FTaPwQY1?=
 =?us-ascii?Q?bAxfNHnqgeYFhNgVrzNN/sX6MDrmnAFFXH1k04GOS8jHUAhODVr/C2llx8to?=
 =?us-ascii?Q?/lHdHwiP3uzezEfTC+48HcIbmwBKwXMpFD5RS9zzpk3+5wLpwL38QXsMNwxL?=
 =?us-ascii?Q?54T1wj9KlWe5BSC9RgFSNARERKiGT8UrEbXIP456pJP0FMiWEkWqHxlLYLLw?=
 =?us-ascii?Q?tXsFV+4noEVziUrr5As86LQZHETT6non+/8OISrGQPn+OGv0aPgxL0BGm4Oo?=
 =?us-ascii?Q?R6kS8xlqlphrp7KByjPuWRlrfg5ejM7gm5qtdYITlyaArfYCiY1ugMd7AEJ5?=
 =?us-ascii?Q?GHZ6N4o8jcRmtvJp27TirSYDkR/0gEhOCPu7H3nb30/4v8tvntFn35wgUvEW?=
 =?us-ascii?Q?P2PWK8SHoUJWSARbOUrWaKp9Kr8hbLH1ummjlA0htD2FDwokF6hcU+UDocjA?=
 =?us-ascii?Q?vWfHbta3d4z34NjCRcx4BlFBhjTfsFdhjUpbYnkPQZENpNPnsfNO9JO3N+Hh?=
 =?us-ascii?Q?RRwdSkOU+2HmgI1rjZrDSGhcLwbIwQkGKYIX2AK5R6tvlZ33urIGx+TnnNcn?=
 =?us-ascii?Q?W/4byB7Mri8uvN3vF/PoZyh9XwFJjkap2cSStDdl4vP1Kjqpo9Ohc7JjVyKn?=
 =?us-ascii?Q?RCPNXihrgvYBf3gTKX2+kGNJOnuctIS8RshIvmEAT4alr3auI7QLPBB+6uow?=
 =?us-ascii?Q?rFDwkLveGcfdCVCYfjTXPGwTMdKyh8oJlJYEQYeaWms/3uKd3cE5sWZPW4oc?=
 =?us-ascii?Q?GZkf8vbuSV1y08fQUk6Lz3nmpd82e91T5nWQmnDwx2SJYXxhhguL8cGlpinT?=
 =?us-ascii?Q?8NEyNCjpAZFN/UnRpfmShv1Smwt2JhVhEh+Uq53L6ufNAH5rZAVDW3aHmKdI?=
 =?us-ascii?Q?HFQ7IFJVCVbx9lMbtZ/nqss5TtILG39LABfQq8XcBK6C+IRjASFUXYJbERQx?=
 =?us-ascii?Q?SXPzGy2hUnJ0MhaP/fDtjmdzc5MOiDcjHkb1JygG4CvAlGQEH2COh3yWXu14?=
 =?us-ascii?Q?3+6DSrzxcSp4sm5SQ425AzjdKFo0TpB+zaIdUeKCo/N2UjdIcRcXVFrtZSRi?=
 =?us-ascii?Q?NJhd2rwq3o75aCzYyVTNgiWajNIbn39smgQ2/3Qd4vqHNgP38QgukD5tvxxQ?=
 =?us-ascii?Q?uxuzombJrsZoaNsKf5i349hqppZ5x+VB+ZT8HtFQIUuHIEP/83cOvHOSoIAN?=
 =?us-ascii?Q?6INQgy15s5pZxnQvEP+t+Of18OS6jsvgrz83d7Ch4HkAnWUsmik+gsW0tDz/?=
 =?us-ascii?Q?iMxcaCyvlCF4ScZzwOMblODS?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae85f2f2-95fa-4380-3578-08d8dc69dd8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 04:24:11.8282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+O5UsEWE9p2BnBFvIgm9albmGBjI85pKIIq3L0urnCof6QKmTCRClUpDznQAspFSfUjwtTuRu5HWQB+ryEA1sCejGQztMC36Yu9FTt1CkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_232417_129513_C60776D6 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, KY Srinivasan <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <treding@nvidia.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Marc Zyngier <maz@kernel.org> Sent: Thursday, February 25, 2021 7:10 AM
> 
> The Hyper-V PCI driver still makes use of a msi_controller structure,
> but it looks more like a distant leftover than anything actually
> useful, since it is initialised to 0 and never used for anything.
> 
> Just remove it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/pci-hyperv.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 6db8d96a78eb..93dc0fd004a3 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -473,7 +473,6 @@ struct hv_pcibus_device {
>  	struct list_head dr_list;
> 
>  	struct msi_domain_info msi_info;
> -	struct msi_controller msi_chip;
>  	struct irq_domain *irq_domain;
> 
>  	spinlock_t retarget_msi_interrupt_lock;
> @@ -1866,9 +1865,6 @@ static int create_root_hv_pci_bus(struct hv_pcibus_device *hbus)
>  	if (!hbus->pci_bus)
>  		return -ENODEV;
> 
> -	hbus->pci_bus->msi = &hbus->msi_chip;
> -	hbus->pci_bus->msi->dev = &hbus->hdev->device;
> -
>  	pci_lock_rescan_remove();
>  	pci_scan_child_bus(hbus->pci_bus);
>  	hv_pci_assign_numa_node(hbus);
> --
> 2.29.2

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

I also tested in an Azure VM on Hyper-V, with a Mellanox ConnectX-4
virtual function as the PCI device.  Started with a 5.11 kernel and
applied all 13 patches in the series.  The VM booted up correctly with
nothing anomalous in the 'dmesg' output. The Mellanox VF was
detected and configured properly.  'ethtool -S' output showed that
the Mellanox VF was handling network traffic as expected.  I also
hot-removed the Mellanox VF, and then hot-added it back again.
All worked as expected.  So,

Tested-by: Michael Kelley <mikelley@microsoft.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
