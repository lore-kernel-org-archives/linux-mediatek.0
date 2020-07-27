Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AF1C433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:18:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BFE20809
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w6Ym5fvi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nYN4022E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Op3IuigR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BFE20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t87GTsVuvdj3TgNvv6PiV+S+vymnFbWG9Rn/fhNRKls=; b=w6Ym5fviffBroKgM5kpDywQi3
	N1tMBc15E0dYpRvLHYwrtTPtBMt8yOs2L6he0X+RHU99QQEOuHgigeqMxo16vN3MA/HnQ6Ia9TUPq
	GWtMBosKuzxZuSoeo77rl9RyEeA+fqX+F/p7m4u4altOc7fPCKbFAv2Sc4tRCyIDtPuHdpY56Fawk
	p01fqQUlk9eosoS1v8sU936oYhwTsGVeRW8HbiRTnX1ERXvqmUuHaujWI4sdZZiI8e7kwXwICYGn7
	sPPy0z5yiFft35Ren7TFwYhjX0dmmrCv7vm8C84jB4qJMnJbP/LUHhBsSb7zMqdc2/+J/P95qDlWg
	iowQPAYQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0199-00032W-Bo; Mon, 27 Jul 2020 11:18:19 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0195-00031B-Lf; Mon, 27 Jul 2020 11:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595848696; x=1627384696;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c8EIjWXnbH2oBGmL7112mIVw+PdEXk7KPjpWn1sqidk=;
 b=nYN4022ERro5m1XrKUn80a1wG0viAONOwPhnGOKoCM6i5YP6YKB+HEtM
 K3v8VfyKwu0EcfMROJCObQ3VyVMnDVHkjwajmkMMI8MhLieQlcei10lGR
 OZNcaVpuNYW2PHMHD32xNbUkmtP7b71xilKqDz6BovdsHuTcMPuF7L0ZQ
 xQCajpI4UhtSfZPd+cFhPie4n9veyh4V50hCupuPSIlTaTFf7gknMl0Ve
 14zS43DfGmWO94/Ph3Yht99tXiEHn8Qt9GCpw9KhUgfK9u7pNtH0WdWr1
 ATcdv2RSmEUsAPFDkxhv95HkxDWM8693+7mHU/sHUEMTkohlODsfTi5yR Q==;
IronPort-SDR: VT1UqbKb1VI8aFzuq4oRufFt6cT9Zx25gPoo3qhGCnHm/kLduYSyJIvmb/or9MjxtfMF2l6lgS
 q3LZGeoCDQGrcL0p8jQv+bMnFmZgx8WeDvYfaisxvVbE6S22/q9nLiuc33KiBZUEsbuV9fNvmJ
 ENz1UQ5aQf2P0JnN4i26MAJql+kmRff+PrrSUEAKptCMnPo5uPxCHFHi76h439LIPF49LMzoGT
 fZYFBcZQIxv+Edz2Qui45zx4lP/my9yKEFZGxo3W4Af9ObyjRv0TTLeJgU9jn7Qj3Q3q70rdyF
 FME=
X-IronPort-AV: E=Sophos;i="5.75,402,1589212800"; d="scan'208";a="143553051"
Received: from mail-bn3nam04lp2050.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.50])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 19:18:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISH0K9wCLZlute+7IPPxHhLhjO0hbrCBBMwvo32mBnC12ct4Ztv/YjCxefcM6CoGeo+PJJm213i09YGqCwdVt7GQLI6yfxDb+btJS2j5ovjng1nAUTSJd3IAAclGdmBqt92CA6cadeNm7//Lm49YsnxPgEweiJ9fd4rnkdW3HUUcb1+yGKFyCSmVdA74Cw6vjmtpaRNWi6igrQwQSSFYe0AhUy1xwQQpP//BwHoTb5nTD7Lt5UQBEgukVRwKTlSeIjdndN/8h5IftyUiOZIdaWZ1OBIOzwj3/9ja1eakSjG5zrrhhFPQUE4gBSM3BgZM+Zuy+LlHTsaQdVQnTWIotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLnHnvqXla8KJsK5HbiscMK9nsoTlh93ObvFsv/vqG8=;
 b=aloRqL1IIsHrN4DEhWTiBMp5NTdy2JYpzZ7hbU8koLOZF2Jda008s/fZzoiQmmo3hP09GqHGhA8kZERk57TZ2P6E9lclINWlNfeZ6j6GKW9M2u120PotBfpY3jCZT7rqSG7S+iVyIHcy/DBZYreffISSWaYInw1HKCPIpYw3EpT2rs5lwe+pZcblpl54zaYpbMKXdIx19fU4T15b3MYgJBIJOvqbgWB61DQqXUsLSvou8BhTqup90CDkpTGPcEiU6A9/rlJA5RUiRo4+PrOkpfNHZO8SJu8KNim5VWcerb+FDMoDiKtlWdlATffUDg8+Dh4w4/xiQwWKQvVx+mQMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLnHnvqXla8KJsK5HbiscMK9nsoTlh93ObvFsv/vqG8=;
 b=Op3IuigR9KX5zyttrFjPvifvkccfvWkQUt4km3QRd5JfxqAkZr5U+Swl5UBE449APqRrOnmgwpQbvPiLqlpPkslZR2BJlYW5CleEADQL5s10ZSI3a1zzvNWiV6bXr2ZlcbEZaZE4Hwub2GkiG0WOFyjx4uLiytqfLYVkGHCif+I=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4720.namprd04.prod.outlook.com (2603:10b6:805:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 11:18:09 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 11:18:09 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>
Subject: RE: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
Thread-Topic: [PATCH v4] scsi: ufs: Cleanup completed request without
 interrupt notification
Thread-Index: AQHWYcMiC3zRSkow3EiZadPqZ74zZKkbS2ZQ
Date: Mon, 27 Jul 2020 11:18:08 +0000
Message-ID: <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
In-Reply-To: <20200724140246.19434-1-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98c4a9ac-b818-48dd-721c-08d8321ebe08
x-ms-traffictypediagnostic: SN6PR04MB4720:
x-microsoft-antispam-prvs: <SN6PR04MB47201B821E9E062E37592672FC720@SN6PR04MB4720.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8CHwKsTprq30QUOtFeqyOxrnqMbGBumTBVc78OMB0LxHNk/YDXM0aExC6Bu6Icfvz7G0/Uu33UnqNbw1+aN5081S8pYYjGOcW+anRQItTbH8BkRil/ZtUpeSmHC0/MTih4L6Goh7UNdHAuG3CkZjExd0m9J2nal2pmCaWDpHHA2m6UshfC3RysckpEhycvaLlnorR7CXyVTEL4oh8nGgtdVUa3uAhnhRrEed506Kr8+nzfHMSkz4jXKT11J9NhbmPY8+1xblsFsNQeUYqes8V7mJadj26XHg1N5iYvIIal2AVHyvllcrG5443MIdAm260UEBK6sCbFd+7BjEXePpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(55016002)(2906002)(83380400001)(8676002)(33656002)(5660300002)(26005)(7416002)(186003)(9686003)(8936002)(4326008)(71200400001)(7696005)(66476007)(6506007)(66446008)(66556008)(64756008)(15650500001)(110136005)(54906003)(478600001)(66946007)(76116006)(52536014)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: R7V1oYXQj8wmqaQtSXDHtYZcnP0WjjlfmPnpnOjPQl2VG4Re+vvV+BxagGuciHo1Pfi7r+W3Kq3sXXdzwydeiZDtNEZyHu4sAjCeJphkXILLLMpp5qCIHEEF81rEYdZjpWPdks0Zu9beizo5QWApAzLDjQJKCIU/Zzs0+ZPAMTAV9cj4UtxAmaYGxe5r6MP6SBVri6mq904os5KPAgd8IR3YReyy/Irc1d3VJBHvi1Id4U2MWp1REjc7wdkvyGZh3KN1Znrh678XH5sD3+5oLcJ46DSUkA+iHsKCb+kWgLtifAwIfM/AVM0Irjw+R6GhEi/3ey2h6BP9RplQq9eFcZ0Gy5IcAGqryByqazwCYcPv9F+LSEKuogIOUECno51QqVY7G0ckSJgwnmnyWHd5Eddcmn/uDVIFWLaBgxZvmIvSXhCd8uDaPzbIR7+MbLkp+WVKyagodDcHpEvUKl9UiHcHloH63GVeA+TYTwHDJkqc9LzHiWE16mezkSaj2DmI
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c4a9ac-b818-48dd-721c-08d8321ebe08
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 11:18:08.9788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lgpvmmzz730vFFCZGnuX0QuVq7XalUk7i/6rspSXLwa64XDSOPIvD+Stp4D0m6+/CQn+mXzo+bHGZxkqsRg55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_071817_493061_4A5CEBC8 
X-CRM114-Status: GOOD (  20.20  )
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
Cc: "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Looks good to me.
But better wait and see if Bart have any further reservations.

Thanks,
Avri 
> 
> If somehow no interrupt notification is raised for a completed request
> and its doorbell bit is cleared by host, UFS driver needs to cleanup
> its outstanding bit in ufshcd_abort(). Otherwise, system may behave
> abnormally by below flow:
> 
> After ufshcd_abort() returns, this request will be requeued by SCSI
> layer with its outstanding bit set. Any future completed request
> will trigger ufshcd_transfer_req_compl() to handle all "completed
> outstanding bits". In this time, the "abnormal outstanding bit"
> will be detected and the "requeued request" will be chosen to execute
> request post-processing flow. This is wrong because this request is
> still "alive".
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 577cc0d7487f..9d180da77488 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6493,7 +6493,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>                         /* command completed already */
>                         dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from
> DB.\n",
>                                 __func__, tag);
> -                       goto out;
> +                       goto cleanup;
>                 } else {
>                         dev_err(hba->dev,
>                                 "%s: no response from device. tag = %d, err %d\n",
> @@ -6527,6 +6527,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>                 goto out;
>         }
> 
> +cleanup:
>         scsi_dma_unmap(cmd);
> 
>         spin_lock_irqsave(host->host_lock, flags);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
