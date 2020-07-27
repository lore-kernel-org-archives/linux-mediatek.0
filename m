Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74854C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 10:47:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33FA1206E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 10:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dt+vYvaQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="efLvQJCo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="eloYusz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33FA1206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=syAdAsGgruSMQ+FAC5KrV9NAwaUVF3Vs66R45yuVZtE=; b=Dt+vYvaQdJivgZ+K43dUP2nbb
	eiH872H0VEdXhwsytuO90ISafqnobl5m2L5feccepzz5K36L5tPtcPI5E391d1SABtMHdyjzXYHs/
	m4AAaWmD/sPEfyCHLhkmbFtNc1SFKFQV0XcQVZGeDb+u5/VcRe5KMk347UnTHEet7UpVxIvTvFUn4
	6rwFvchX/ZsmKYuoVGjkilgBr/HjH6Ns10QHz6nToA8pEb6avxwmqxh2TwiVXJFrle2JVRHvwpBgS
	R09la5aRswh2iAkItcTVL40VHKTzAZGx0jtlX672ZRhu+xRfD5xL0y0+WeZLBp+knlNlmR8Bdq6Cm
	zDtNuBaeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k00eq-0005Tj-8i; Mon, 27 Jul 2020 10:47:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k00en-0005SD-Gw; Mon, 27 Jul 2020 10:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595846841; x=1627382841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j6Rzy64zoC4ZU7XIY61BAMb5m/N4Y7UuxmwqR+wVpCA=;
 b=efLvQJCoQdahjaFZ9dsmducQFX3OzWFc94K2lEwZNja+S+bsz2Y2er+Q
 bZhIUqDYFbWnPpU4a7KlYwxBFQcKaWyRu+Wb8f4RDP9rYsvq9wZCbjtE7
 tT72olUiE3d2hWnbbVTSVhCi4P3gzXPORWILo+2IMUfbrMid84casFvqv
 JNRMdokfMyZ4fPO+SrBHLVIR+lROvA4SJnJl6HDDyMwovuYOUxfL02vxU
 3MbOxYy5JrQmEzQ6JOOtM0YoHd9b1ILF9r0cciSTJLUAa+FU0nfJZbsPw
 TunUgQHeL0oJYkR1zcYm0Sn5E/pHxnoeLNSDxr0TB3UlPEqTEneNIDgAB A==;
IronPort-SDR: ciYy0iLo79LQuiBMG/LIo4ENwTu7+nuV19iNuQN/gHt48LmHUxay7savo6gCRQjmkygiX0/vT2
 phR4f5zPX8xkNZqifU0zM09NjgjMRB4cZUHEGMt/622aeqrKl0RRw7s9p/lizoZBg3db+9s8Q+
 kP7EX29oPznlOFtJfzdH4vF2og/y9XUcrz9L5zHQgcynb+3WlJuh5CgiApnD6ZbxfJbfqz3YRp
 5+67B6ySeyWj19GCzeeHK9zlBvGC4VNuhxTLSeZzeTCGA4VALGlUsfqNhQnbACGbAhYYxFe/fh
 9kc=
X-IronPort-AV: E=Sophos;i="5.75,402,1589212800"; d="scan'208";a="246543177"
Received: from mail-bn3nam04lp2050.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.50])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 18:47:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzsdvQlfeppTVX2uZX3sJNTHFOkoCju6iHPfVFoYyxaVfv1XPt4ukNXgxcD+rSkOpEQSpJQp3QZeE9M0gFnC9ULgR16FbEShW1F98H8i/Fl+EOOfmPrIVKnn5K/DIS7OwG/jl28q+x0p/QaEujy0RVhffY8t9inRgWUHRQux6oHIz/zBhgdtsPBDom1opCDJ3BDDMhqx8yhaLDrwhovFD3gTppICtfGoI1CaoINd/ZuhX+jDZ9HiIRyUpBNpKaTg5qJwU63gKzVEhqPajuvnQ5yyNsXVKtGsIbevtqdszOSrvsQj2BKcIbEHbcY89eeaobqlOfpG9vYrUvidMJUiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Rzy64zoC4ZU7XIY61BAMb5m/N4Y7UuxmwqR+wVpCA=;
 b=NnxRYcRJcfHyA4ahrpO7zoUcITGcrr6JrZinfSYzwacxHURFm9xsaWBBfX3muLAs2k+fw4K3WzKS6puVz7n363b9WKAtR+pITJ77VbZLZ8FEFQzSt/rSdD/mb3IHW1gQDtwVS7gfHYznoj5xrGXrqwz9vRvZyspBHRAjvZfUoe7HzT3OWuWSC/wuBgjlMpdeXgKcBacaCDiFPYxUZ/5M+0bVYSgG6JTex9fbsz2LZey55P2NRXbC3xNzOSs9Nj9YjDn6WFyWWWexVAtzrkvMNS9eR1Ltey/0FZc/gOjVmDoWbCbZQZ9+rZl61791t4su7s/yJLsTAKSs7XQ+IhVk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Rzy64zoC4ZU7XIY61BAMb5m/N4Y7UuxmwqR+wVpCA=;
 b=eloYusz7vygAy1wRgE7ilrqbHsX5G8F9oPFrcMc5HKCsUO2Q99BrYtSWu54wtUDrJCjtC3r7FknzlCkyT0DB9SOwjqe3cZJVSdX6pj61KraASFQMhzC5D1B1C8lwGM/UQIWOrXVBCe/Bxz+nZCdUv2sfSM+bAKIaXqLwQ88fEgc=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB5438.namprd04.prod.outlook.com (2603:10b6:805:102::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 10:46:50 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 10:46:50 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, Bart Van Assche
 <bvanassche@acm.org>
Subject: RE: [RFC PATCH v3] scsi: ufs: Quiesce all scsi devices before shutdown
Thread-Topic: [RFC PATCH v3] scsi: ufs: Quiesce all scsi devices before
 shutdown
Thread-Index: AQHWYAkzclwz5Nu9F0qZh2VTtgbNvqkbRdjA
Date: Mon, 27 Jul 2020 10:46:49 +0000
Message-ID: <SN6PR04MB46401CB0D89FFD24496B33A6FC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132218.21171-1-stanley.chu@mediatek.com>
 <2465978d-28d3-e30f-248e-87333c789743@acm.org>
 <1595409534.27178.19.camel@mtkswgap22>
In-Reply-To: <1595409534.27178.19.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 049f745c-8daa-4ef0-eccc-08d8321a5e0f
x-ms-traffictypediagnostic: SN6PR04MB5438:
x-microsoft-antispam-prvs: <SN6PR04MB543861B59BE0ACB70C0BCE77FC720@SN6PR04MB5438.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UH5lGeKQ+iadKC33Y8oug60ekpNXxUNmJQz+ad1fMlIz18APdvWPziATHjkmLD3tqZyLm9xb+7HF+nN+Ycn7PSzy3O2IpFFEW55MysOJG9L695D2xwmTE17s81YHRtA2JENjuPI1m35sNLg+WNU0T51eH73PToFIoByTOJwmCfQEIeyYuLgW1OuL90QlbGCamEcrPw9j8623KU4IANzskGefV8SvGmnQvCmvVV1cZBgW2gszBleagmgRfRpdjAwrDkNXF6QrzUTssx8WIu8HREycHif2jRLLdZJGXgKSLjoINgWCJeOiRw5nr8eMSImmD0YSkbRUxP0x7v+4wd0iDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(55016002)(5660300002)(316002)(54906003)(9686003)(110136005)(4326008)(8936002)(33656002)(83380400001)(8676002)(71200400001)(7416002)(7696005)(26005)(86362001)(6506007)(53546011)(2906002)(66556008)(186003)(478600001)(66946007)(66476007)(64756008)(52536014)(66446008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AE2tOC9HMI1o4/BgLhqNbq0X7hiD7PAjDTAhB6g70wq/lLM+h04cR+llVLvpzprKC++oneBaxmopZVh2FX+N+0iWr3kAEZAkqFQl1Y0k66X2YiLyFoEIVxDKEPZX7tJOwYV2GdKAEafBQ2rW5/5M9ZCshldFFmc7mNemr1o6vSQEGJJ2w/Uf5SljXSBatBsjXl3I6kKCu/tlSi+XXY9O2Th4djFRE0p7w3RK+EFRI5IgxMc72ukXux0vQE8kCIRd5VjaxG4oyY2qmu62ELxQrFOU/oFUzF0B1jHMTUtVdUcJc4qT3yAg4wEUl8WVMB47qTO3einr31FOOigTAEMZZg4JHoosyV5JUnvRUpmixU6Y2kiZTVhN8QS4rjEKUKYxbyboleOX5r4H0tqdl3FjOPjwSJ65I7n1DwbcDNbBZNLxWRNFoYue6rknayPsT+Zi4kvAp+1jaAKcuL3A91GZ+b1LBilNofqPns6FYwsC561TZr7A9PoDKY5n3NRU/HUm
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049f745c-8daa-4ef0-eccc-08d8321a5e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 10:46:49.9986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 688ynMJQsp5qkKYIFjc1o1f+uDXSdao7T8BFJwNVBslzbzmh6FvCMlOACGHva34YFHBptbwIW5EZBNADTW+WPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_064657_748478_78DB28DE 
X-CRM114-Status: GOOD (  23.65  )
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
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Hi Bart,
> 
> On Sat, 2020-07-11 at 20:21 -0700, Bart Van Assche wrote:
> > On 2020-07-06 06:22, Stanley Chu wrote:
> > > +static void ufshcd_cleanup_queue(struct scsi_device *sdev, void *data)
> > > +{
> > > +   if (sdev->request_queue)
> > > +           blk_cleanup_queue(sdev->request_queue);
> > > +}
> >
> > No SCSI LLD should ever call blk_cleanup_queue() directly for
> > sdev->request_queue. Only the SCSI core should call blk_cleanup_queue()
> > directly for that queue.
> 
> Got it.
> 
> So may I focus on fixing racing first by quiecsing all SCSI devices only
> and do not touch blk_cleanup_queue() in UFS driver, just like v2?
> 
> 
> > >  int ufshcd_shutdown(struct ufs_hba *hba)
> > >  {
> > >     int ret = 0;
> > > +   struct scsi_target *starget;
> > >
> > >     if (!hba->is_powered)
> > >             goto out;
> > > @@ -8612,7 +8632,25 @@ int ufshcd_shutdown(struct ufs_hba *hba)
> > >                     goto out;
> > >     }
> > >
> > > +   /*
> > > +    * Quiesce all SCSI devices to prevent any non-PM requests sending
> > > +    * from block layer during and after shutdown.
> > > +    *
> > > +    * Here we can not use blk_cleanup_queue() since PM requests
> > > +    * (with BLK_MQ_REQ_PREEMPT flag) are still required to be sent
> > > +    * through block layer. Therefore SCSI command queued after the
> > > +    * scsi_target_quiesce() call returned will block until
> > > +    * blk_cleanup_queue() is called.
> > > +    *
> > > +    * Besides, scsi_target_"un"quiesce (e.g., scsi_target_resume) can
> > > +    * be ignored since shutdown is one-way flow.
> > > +    */
> > > +   ufshcd_scsi_for_each_sdev(ufshcd_quiece_sdev);
> > > +
> > >     ret = ufshcd_suspend(hba, UFS_SHUTDOWN_PM);
> > > +
> > > +   /* Set queue as dying to not block queueing commands */
> > > +   ufshcd_scsi_for_each_sdev(ufshcd_cleanup_queue);
> > >  out:
> > >     if (ret)
> > >             dev_err(hba->dev, "%s failed, err %d\n", __func__, ret);
> > >
> >
> > What is the purpose of ufshcd_shutdown()? Why does this function exist?
> > How about removing the calls to ufshcd_shutdown() and invoking power
> down
> > code from inside sd_suspend_common() instead?
> 
> ufshcd_shutdown() configures below things different from or more than
> what sd_suspend_common() can do now,
> 
> - Set link as OFF state
> - Regulator and clock toggling according to required low-power state for
> shutdown
> - Auto BKOP toggling
> - Vendor-specific shutdown flow ...etc.
> 
> Therefore UFS shutdown callback would be still required.
And this is also why, that each chipset vendor implement its own dev_pm_ops.

Thanks,
Avri

> 
> Thanks,
> Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
