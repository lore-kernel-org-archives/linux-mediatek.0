Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934FDC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 07:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3EA2166E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 07:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EsMdGghg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="O524EbmZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="tyEWNc9j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3EA2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZn7Ag5OOP1RXRKz7mxsPyz5lRUKq7+5qbiB72PcPhg=; b=EsMdGghgLC3Xrr
	7xUuBfCNXSPnpGgNBq8tiN8HuY1NQh8rOFIPpvnLo7xaKLDJT0GpDk5FmhP0uYXHFqHh2VNyx1jkY
	N6KVr4I6piVHFqR5kOVKSxXpOvfVE8PrCniaRIxULYZ4+y9TNd+3UvmEpMZncp4VG7M5+6jdrm1Qb
	MQFJXzODQUY3kswhmvW8h/RX+1tJSbDPiNj6duCfjeMjbRgGzwxtmozctuCrKJvtbI9h7/cbK8W7B
	DUA9nhCLXPEPumdTvIdk6Lku3FMyghhyJI0CWD5tDLBwplti01mDzYUY5AnrO+RdijuzkUDPAzzyG
	3Hq2gYqtYcRojrLmEZ4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j92K5-00059x-Po; Tue, 03 Mar 2020 07:50:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j92Jq-0004vx-9v; Tue, 03 Mar 2020 07:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1583221822; x=1614757822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NlOSpDkjdSJVMNz7NFEhP+weptJrJ09zSvzxJC+0DoE=;
 b=O524EbmZKNNcMHXlXPN4cNoY4bAM4qpE0DicHxSTW8/A30/9Xu27nEpl
 T1O3TRyEKGy2OiS8OOu+PmLBU3BDKiJ/4OD69uO2BirTLMqurSWfNeM+i
 f/40lTLuCATLn9qVshKuOfj7qGBkLnEi/a5RxUwTCv9jV42GkxPOpRdLY
 eSphyFGveMWTOY5VkFs7EPU6wQPZBwJLn+RfJ+kR3WUW2oUJHQo1xbK6c
 FzhyJAmlJU26kA2q3/Iyz60ghfsz9qFsOCsQMXMGbu6WlfBYD6n8KCNld
 4v5rRTH9OxI8n75+1VkjRVsVVh2hTF526hSr00yiTd/grWIiGjV+P/qDv g==;
IronPort-SDR: FFuONEQx9Cl+iPT4OGiaLWhxewuB92qYiiu50pcbvlBoDHvtrhQ1f0GfcGqqeOJHXNj23lHiQU
 KwmDvfmfQXsSw2ELcqXRXez5i/9QKeLTPwpMfrClHbhcXocZtq2MgRDYR8sUQt+IOXElGJ6UeA
 zbdU3tFTk3rNtpyprDTeqQmArV1NLCHY12A3LhxmhCZ1zzHb8t9GGdmq4lrE1A/d7JKgyK31/D
 uqO+v9PmQ0sxVkgY8rcV/xrd9Lp0mi0P1SsxBvXPlFJnrifq+zF12Lt8WiHabxu/HpJm+JOduE
 0Ns=
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="131229515"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2020 15:50:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPnvTaKJGnKBDiRahMI9uRdzJeMoVPE4e7QSDIAaKb8hcsLjiI6fOcV7pLO3buI4y4FxBBAwnEziDVRatHaEOneyyCVFqNsmA556iqgU45+2f/mU0UTdowKYGTyyYRh6Ms/bpePW80G0WT3e8cXp0XZQNUatAH/LVKEKff+S3CF8hk4Y2S2CavuamvtKkqf/86dtqDv+r5cKnayO3+xObXLgqCu6eou9U+soXhlyQgAp6kOiCvithT1793XKeqj67qX+PR/WCFDtti73/13tIJ9J5z2SblCGq/VJthXbzskXiM26hSlZXQttj8b/5NNUdIc8Hf0jos1Mrh0r17/zCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1QZm9wfN5xfPgmYIvpp5WXK/68HtkNBVYRx0hTUy5k=;
 b=F3wRhakffA9pbW/waqu4SCeQSXIgA4VRk20FSIvrBWYczcIAv91nFUT0nWTh3kKbkak6hwkz9gWKmIJ/L2xLTTe6XVaMu+CTl4fvhEBCyOz7oi1Y3YfMZ38NMpkKol4jkj0wwNPfiLezTha24hFuUcD1U91sVnk12+VpIcQ9z73f/DlDBDoVyztyrU9BRC9KR4BV6CftfbljKzfG3tXnIOPL0IdjsYlStkERNZ1YfLNek/d6qLQso5ihRVNCxZiUnghrRbiSAs3H920ZcKbY20FdSQXZf0e5kjhSP6k7pBFsgNONqtfuXT1HTsexMSaiv7pxjKtCXZExC8o8bbHnkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1QZm9wfN5xfPgmYIvpp5WXK/68HtkNBVYRx0hTUy5k=;
 b=tyEWNc9jrmKd+RlGMq7nVQqkwVJRiIoTN129lUYWenujBm4F6jmYNFy3rS67/dBr9ZyxLXp1oiiqmeV54RfvoL7J9//RBwmtqrSmCCXBNa1IbzvG9gsjdEu/yKUOWecWPiyTQal5s1mF1CAdNvpWO5lvBXRuoNsk97aDXvjHUIU=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 by MN2PR04MB6654.namprd04.prod.outlook.com (2603:10b6:208:1f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Tue, 3 Mar
 2020 07:50:15 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 07:50:15 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH v1] scsi: ufs-mediatek: fix HOST_PA_TACTIVATE quirk for
 Samsung UFS Devices
Thread-Topic: [PATCH v1] scsi: ufs-mediatek: fix HOST_PA_TACTIVATE quirk for
 Samsung UFS Devices
Thread-Index: AQHV8JoHZrCjeCNY/kOFC1Lcztl966g2f1oQ
Date: Tue, 3 Mar 2020 07:50:14 +0000
Message-ID: <MN2PR04MB6991B5FF18C846FC47B34B70FCE40@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20200302135346.16797-1-stanley.chu@mediatek.com>
In-Reply-To: <20200302135346.16797-1-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a08b2ab-f551-408f-db98-08d7bf47829b
x-ms-traffictypediagnostic: MN2PR04MB6654:
x-microsoft-antispam-prvs: <MN2PR04MB66549AF2CE48AA59F05D9E96FCE40@MN2PR04MB6654.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(7416002)(2906002)(64756008)(66556008)(66446008)(66476007)(55016002)(54906003)(8676002)(110136005)(9686003)(8936002)(81166006)(81156014)(26005)(76116006)(66946007)(4326008)(52536014)(5660300002)(33656002)(86362001)(478600001)(316002)(7696005)(186003)(71200400001)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6654;
 H:MN2PR04MB6991.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iNlVIVgA94bPPz47njPXhJEJLl3v3KKOK1DYj+hsdY94RiXnBV971frNI1VsC9mpCXtuuxjbtPbVZ24XAj/bsPCxp0PvDrmo4k7kHXQN5wg5s1ZaeOZv6CiYgkNCkfTyQRrJWOLHGY/CpklkYEG99bKO4aDPtpOok1jGpdk4r2lEVC7O+bJFoceEEIxiQWVR1A7SscmnuK1+GtsoSyHUkSzN37W8rtt9DQAn3VyAUq+ihbHxF1Iu8mbI8fPktTB0xwc4xFiUL3eJ6ddIzNnfT0OeYpsJj3wO9Ld5IlPHozr90C8+xPkV1juE6lBD0F5ASMEzwBZ7JJc6yQ8Cd23q/4QBARjiCQAwI9cAbDP+hCXMajUjJqYj2v+4sYZ9YnWYcGKOnWUKQib/A/YGPXXeLhFDIdHuNOtYASGU9lEmlnMYfcH+NEBfpNIx4+AOf3mT
x-ms-exchange-antispam-messagedata: g8f/jogaibEUJzxDMji2b1JV006kWXJChosxeFJD12YnpYybapILCWIiq5oOs6f0ySs6raarQYRlIONLBi0IRaTAs6FRN0LkhqHgJVmeLIwnfNABH/JdWyOSoNCA4liAj+fQXmTBqTq3YypyzXZecQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a08b2ab-f551-408f-db98-08d7bf47829b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 07:50:14.9417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B99//8jVKzxgeHnKiewMI3KnVEFGkoPNyt3KaGfGa8XJW9EmuKaXl4WNW8eyLyClav7EWrAMUv+VZsch6/bttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_235022_420484_C7E135BF 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> 
> Device quirk "UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE" is enabled for all
> Samsung devices by default currently.
> 
> However MediaTek UFS host requires different host's PA_TACTIVATE
> configuration. Hence clear this quirk first and then apply vendor-specific
> value in vops callback.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index de650822c9d9..3b0e575d7460 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -533,8 +533,10 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba
> *hba)
>         struct ufs_dev_info *dev_info = &hba->dev_info;
>         u16 mid = dev_info->wmanufacturerid;
> 
> -       if (mid == UFS_VENDOR_SAMSUNG)
> +       if (mid == UFS_VENDOR_SAMSUNG) {
> +               hba->dev_quirks &= ~UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
>                 ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
> +       }
> 
>         /*
>          * Decide waiting time before gating reference clock and
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
