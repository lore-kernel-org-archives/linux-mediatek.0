Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2B3C433E3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 10:05:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD48E20720
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 10:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UA2AyK3H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IzRjKEJh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="KM7Rlj4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD48E20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7IEJ7MzTpSzHOuRbcI103fFfvCfqeUYppTWvi6IpGL4=; b=UA2AyK3HQywoEbHqKl6aRO8Qb
	lQBw7vzU416XXRVHwtldA9Dwc21x7THVz1iUaVsxlGbu6EeZo6zVuPK6DzzD2yeYTFu9GEuQ/EsNP
	wBdXDvz6dA+qBLtYIHENuyOgjxWW2v4vO1XtBa2eiRe9t/hKKQVgif+p//XNQD63POE1N5LxDPBIX
	U1tt+AZ9K0bRSGEtMhL6k2ndK8uEhzt0GoHGIzhlPolasDikG4J6IYaMTkL3ugV+znvo01vM0ulZp
	xYc560jkiBE3Jt+dWfND+d27NCPT8VZOPkhpXW7CQ39emxoR2OBWk52yGS3tEeUAVSgsUeR1FAqiz
	ZmmAcoMmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juYr4-0003dS-F6; Sun, 12 Jul 2020 10:05:06 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juYr1-0003cf-J3; Sun, 12 Jul 2020 10:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594548303; x=1626084303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Ntm64vEMrvKnZ7GIwx2zeVmZX0U46qOkaVDnBUJpF0=;
 b=IzRjKEJh0KGTCI+R5QNJdi2nKOK4mzD/8Ce7Ho1HGDCzCeobu4m1TZU+
 uBqsKJXedX/62TE73SUl3lmUft/4DiXkPlV8YguYX0O+oGWTYZbmP6OIk
 fpOn6A07aaS7dBMOAI3FILn4l1x3MJAyZI201oamrnRY5EK5Qyl0m8J6P
 nyJksqELrjxjl79JzIWiOhbxX2O4zQorOuy0iiif8GbBZG0TbebR5Nida
 Uhaq16YlP2Pi7Y61WN0V30P/aOflTDX+Ck+saA3FzT/Va4EGGPlYD4sTl
 W+yjt4JoMcxCK4aMPlX/F1jZyD//Lhti6pOpOHXPZYNwlAikWHn7SwidS g==;
IronPort-SDR: rHbBBZxtZl+VJ/Rs5JRBKii4Q1Oqu2pugHTsoDxxUhduIY3RbH9Cl9L32HF4xmQr8Oh9AIIsuQ
 Ro0D+oqyDQsVopc1FsH5YM7OjERcTLqOcIhyrqGY06Qm/VtTAkA1HY2X2LeQKJEKQYyE/DKA1E
 m+losNwpqoWrt/jdQr+Bi9cp1U6dI/qoHhJtHrEfpYLi5yoKvv4hQHlW36ppRQhjo8jSoIkhmm
 X1jKRZU+KoWvY0jNICiKG+1qhFayRqWIN0fuBvZ7MFfotLiqTpnWpyKl+S1AMskVqgOQ3jkoza
 Xtw=
X-IronPort-AV: E=Sophos;i="5.75,343,1589212800"; d="scan'208";a="251492453"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2020 18:04:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIZyO7DwR1vHwO8DHzBclBllg+GFnQmE3GkcDcHLh20Y6SsNzA8IY7k1Im6NJXEaelKGOFZyPwKlLecFBum6jyj7UmKSRskigXNwq9FyDsv5icsVr3WUzFQ80lrlWlIU7Ltf8w7ALDqrlRy37KFLKV8IU7oUaGzviJwUiyIogLwm3eZ3ueBxODdcQnjPTFnqHZDRWfjuaX1PBcJcj7Y+z1s5cHyctM54T+9+sijhYiPlzST614kk9pvxXUBV0p00m6YsQIsQ26o2lrv3dM8CRwZ8JVygYfLsgwhHjG9S4hN/jCs33w/IERjfKnqeHcYwqReDjMhhdS5Nj3AG9G7Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ntm64vEMrvKnZ7GIwx2zeVmZX0U46qOkaVDnBUJpF0=;
 b=RprVBDDWHVrMOkVYC5f8m2e72VpCf64Zg+3VqFP7xTJvGm5WjCYAfnrJZm2f+AfYa6ItjKtC0q1stkwrwQfRpN8KYS9ZIheCkltvhwXU7lRD90SzbfHjSeVFdk2TMgswI/kf4AQsyPFVS+TgHsOoCqfC3XigfCCEj8LBBhz48RGgoQRAFfqMpmpmQBAtzTmdcu9wHnmQeacQgIegpHyT129Oeq5Owg+WMTq5sXnHTbYQY3G8rX67ikw9z3/ztarv8VUbGHGMH7xULGdhKDD6RltTcSLIvgXGH3nRU84zJ97yh4NO8FpkbaqrTFSUGprfyHjeOBeR8/rJySKmV332yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ntm64vEMrvKnZ7GIwx2zeVmZX0U46qOkaVDnBUJpF0=;
 b=KM7Rlj4YZ3l4bROBw8PTdmEVrrz82nCwa4ztQkgln3AqExYuVHtzreQaXUnfs7n9aD19JeOB6VDoDYD+MtgcJRDeJGllqhzTpN5DiviToHSknWvdGDUch0ompMGy+ln1HlCQXVb7/abrOFX5bAavlZ3qvZ4WsQErEz5YUMXd3IY=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4717.namprd04.prod.outlook.com (2603:10b6:805:a8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Sun, 12 Jul
 2020 10:04:55 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 10:04:55 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
Thread-Topic: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
Thread-Index: AQHWU5heDqJFApuOo0yQOIjuO+/O36j+4j7ggARNXQCAAJBVkA==
Date: Sun, 12 Jul 2020 10:04:55 +0000
Message-ID: <SN6PR04MB4640F34CAA25B3CB58F94CABFC630@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594517160.10600.33.camel@mtkswgap22>
In-Reply-To: <1594517160.10600.33.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 124bccec-cde0-41a4-dfb6-08d8264b06f4
x-ms-traffictypediagnostic: SN6PR04MB4717:
x-microsoft-antispam-prvs: <SN6PR04MB4717D53668807766932832C7FC630@SN6PR04MB4717.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZ8c0DBZBnsCpvapi5aKn7rPwA5yD3HuCLMMREkynrDw3VNZjmI6XebI3RzLqhFJmgZ15aDkfPQmUtTUC2rJhOEGK4F+aZThUkwijz2Ts06v81zZClREqlFwAWP7b9z6Qjd5WZGRRI25O+pXc+Bs5GxJT+IFQ0Regvz1BFbHkq2MXTs9JU221y1giRJhKc/H5Dv0LX6f9wD9NqMwYWdi+pxbxEqKzwQZYzfqoYbQeRWL+cs8uGs40M9qYGb02vEa/4PilqQMsL5Lqa30Zouey5syD3Y4j/+AALprQTuOzdC2ToAVyzq3ceSzoiAS8o1W9YPz2kz8R9ViLq6Xq9YKVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(9686003)(8676002)(55016002)(86362001)(52536014)(316002)(64756008)(76116006)(66946007)(26005)(66556008)(15650500001)(5660300002)(66446008)(66476007)(8936002)(7416002)(186003)(2906002)(33656002)(83380400001)(6916009)(478600001)(4326008)(71200400001)(6506007)(54906003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: eS+XGAadc61nNakJodjuY1dhci+FRw51RdiIeBtfamvs9rgqT3Kl0zH1vt4zCQSeGc25RNHMpZ5YZ3XdGiqFfzt/C8IuVsmCIdqjKCaRUnklJhtUTfh0Ggs+wNCt9uRjDyAXLsRCizRZVM8j9b29o5C6AReTfNS4HTNeTjJ465eOLfiCE4T58G4D6EPlbZiNw95JPZMxbh3XQR7w0PAGAVLepqFZVBk3H16wzDYZWExaPhfWMDVkjWFMECF+YeG1VW9eQNyn2kavg1SX4wdndQnuXSdCS9axtFAYkRh/B/WJMcWEbY5bTFH18yssKop81KJHVrKkJjFTnypis6GQnL6mGqtOXg7w4wUFcpAbuWjVjaK0jd5kOqrvN3AGsJ0Bkr/1ffuWEHnHqdJgqdESceZvAbETGW/b39fwQjYhEB12VbxDvVJTKvPM4iKvQ7w3u8+SSkAvjyrWDgUU1liw7NLazD4uCxdrLUyiC3GM7ps=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124bccec-cde0-41a4-dfb6-08d8264b06f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2020 10:04:55.2130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2jBa4PViyhRO2qUgV9IxSZ4Xkibqqxd1L8H06tu/vYwLr6yqhhy9LxbD75J7ZpMSzpv68grM4A9/RjnoHSsag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_060503_853363_31F4F35E 
X-CRM114-Status: GOOD (  36.83  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> 
> Hi Avri,
> 
> On Thu, 2020-07-09 at 08:31 +0000, Avri Altman wrote:
> > >
> > > If somehow no interrupt notification is raised for a completed request
> > > and its doorbell bit is cleared by host, UFS driver needs to cleanup
> > > its outstanding bit in ufshcd_abort().
> > Theoretically, this case is already accounted for -
> > See line 6407: a proper error is issued and eventually outstanding req is
> cleared.
> >
> > Can you go over the scenario you are attending line by line,
> > And explain why ufshcd_abort does not account for it?
> 
> Sure.
> 
> If a request using tag N is completed by UFS device without interrupt
> notification till timeout happens, ufshcd_abort() will be invoked.
> 
> Since request completion flow is not executed, current status may be
> 
> - Tag N in hba->outstanding_reqs is set
> - Tag N in doorbell register is not set
> 
> In this case, ufshcd_abort() flow would be
> 
> - This log is printed: "ufshcd_abort: cmd was completed, but without a
> notifying intr, tag = N"
> - This log is printed: "ufshcd_abort: Device abort task at tag N"
> - If hba->req_abort_skip is zero, QUERY_TASK command is sent
> - Device responds "UPIU_TASK_MANAGEMENT_FUNC_COMPL"
> - This log is printed: "ufshcd_abort: cmd at tag N not pending in the
> device."
> - Doorbell tells that tag N is not set, so the driver goes to label
> "out" with this log printed: "ufshcd_abort: cmd at tag %d successfully
> cleared from DB."
> - In label "out" section, no cleanup will be made, and then ufshcd_abort
> exits
> - This request will be re-queued to request queue by SCSI timeout
> handler
> 
> Now, Inconsistent state shows-up: A request is "re-queued" but its
> corresponding resource in UFS layer is not cleared, below flow will
> trigger bad things,
> 
> - A new request with tag M is finished
> - Interrupt is raised and ufshcd_transfer_req_compl() found both tag N
> and M can process the completion flow
> - The post-processing flow for tag N will be executed while its request
> is still alive
> 
> I am sorry that below messages are only for old kernel in non-blk-mq
> case. However above scenario will also trigger bad thing in blk-mq case.

Ok.  Thanks.

> 
> >
> > >
> > > Otherwise, system may crash by below abnormal flow:
> > >
> > > After this request is requeued by SCSI layer with its
> > > outstanding bit set, the next completed request will trigger
> > > ufshcd_transfer_req_compl() to handle all "completed outstanding
> > > bits". In this time, the "abnormal outstanding bit" will be detected
> > > and the "requeued request" will be chosen to execute request
> > > post-processing flow. This is wrong and blk_finish_request() will
> > > BUG_ON because this request is still "alive".
> > >
> > > It is worth mentioning that before ufshcd_abort() cleans the timed-out
> > > request, driver need to check again if this request is really not
> > > handled by __ufshcd_transfer_req_compl() yet because it may be
> > > possible that the interrupt comes very lately before the cleaning.
> > What do you mean? Why checking the outstanding reqs isn't enough?
> >
> > >
> > > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > > ---
> > >  drivers/scsi/ufs/ufshcd.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > index 8603b07045a6..f23fb14df9f6 100644
> > > --- a/drivers/scsi/ufs/ufshcd.c
> > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > @@ -6462,7 +6462,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> > >                         /* command completed already */
> > >                         dev_err(hba->dev, "%s: cmd at tag %d successfully cleared
> from
> > > DB.\n",
> > >                                 __func__, tag);
> > > -                       goto out;
> > > +                       goto cleanup;
> > But you've arrived here only if (!(test_bit(tag, &hba->outstanding_reqs))) -
> > See line 6400.
> >
> > >                 } else {
> > >                         dev_err(hba->dev,
> > >                                 "%s: no response from device. tag = %d, err %d\n",
> > > @@ -6496,9 +6496,14 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
> > >                 goto out;
> > >         }
> > >
> > > +cleanup:
> > > +       spin_lock_irqsave(host->host_lock, flags);
> > > +       if (!test_bit(tag, &hba->outstanding_reqs)) {
Is this needed?  it was already checked in line 6439.

Thanks,
Avri

> > > +               spin_unlock_irqrestore(host->host_lock, flags);
> > > +               goto out;
> > > +       }
> > >         scsi_dma_unmap(cmd);
> > >
> > > -       spin_lock_irqsave(host->host_lock, flags);
> > >         ufshcd_outstanding_req_clear(hba, tag);
> > >         hba->lrb[tag].cmd = NULL;
> > >         spin_unlock_irqrestore(host->host_lock, flags);
> > > --
> > > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
