Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C50C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:47:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848F520729
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848F520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AnD71WECIxcMqpn8od7pVGDW2XTxcbD+tgb6mdly2bI=; b=Y6tQkKSYVeP4spePrnH2gYBaN
	cb2vH9uSe8pOGhyRn6lyszXXShogwxQ2XmczDuGSYnFmDT71Q8O9Y0+hZDygm0HuiR5vbcE6/49Zk
	CBjKOpna6Kr0cSR03dh9Kws+NP5eOs5q/AWgW6GFBhJ7TGQEWoCy5M2IvJLYouomnQzGc5p2mwLjQ
	10mChva0M+QUMRoSljMX5EUMGMO+cOGuZc+VPkxf5HsPXhi03Kw5Xq/LYbhg+mOo7q8yeQRUNUusq
	w+/VJZy7Ck+Ip0u4HgYdB9ur+SMewQNXTwQ6hQVwm/hTcabCl2RgQvlrcwDnELZ6Nx2NwZ8lcOu8p
	0ox0WLLgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kryrg-0004hi-1y; Wed, 23 Dec 2020 07:47:20 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kryrd-0004h9-E7; Wed, 23 Dec 2020 07:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608709638; x=1640245638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXU6e/VzyD6ZCzVmVVvSrObn73CrGJn0nH6CjnIu29g=;
 b=Zyuuoc44essRs1YVs3C4tNV1CKsXsim6T7cejQ1AR+mgfztoPWWRHACf
 7l9Ao4qYgpg6PiwuByy2iNSM2NyTYAeuvKo7JwzonqJ3UqQoyujX1nu7g
 8M8qsYkdKKXSCy6UfKQFcvAZr0sR31hnUTNJGKcRvDhBj6aH1C1N+eC8z
 DHGtRlvIzuUHtyJO7mN+oOJVovi8+hbouQ7tWwLHvJxReMtNW/+IXOD4C
 BX9ASU+OUSDDiKopFhiNC+spRjGVC9efzRNK79/7g8ymraTXk32F13iDf
 tfyv6p7VhZjiBcJoYSEtuDwn53HMmcSpwQ1P0Z187z8kwA4I9mlVqD680 Q==;
IronPort-SDR: WhjiX1WOv1y6GtRcEaEA53d19pcSWhrCx3VNIdfoRlOSxLdgMrYoXj5ysN8zRXZd0K92rJmzLI
 m2C4nrJMv5JBQ/FlZz1vYRlv4jo11Fmvrn2aSX7iJibpDdPnDVeMUiOHh8oiYFbtE4oXyTCdb0
 aQpEr8pFCWV3TjUBiLjuvnwGwZn79kByb2rr2VAobTAZ6UXX709BbkvF0fI4cp9nWeHVhoAfaa
 HEmn4mQ73Tm1kpaa2yTlFoza7PH+iMG75v+UpzbtVbDRuYCa78T4jwgYkVH8b3bVZuzxn/qqAR
 K+0=
X-IronPort-AV: E=Sophos;i="5.78,441,1599494400"; d="scan'208";a="157077393"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 23 Dec 2020 15:47:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPU2s5TZs1oMLXjoYJcvLfnFLrELimEHyfiHr3mtMub6pRDve//59RhBpDQjp4gfF6LOi5qn62dn8+Rf3XT+0aBKXgFfa6fcLBo03jOMlWPSFUWAShvHLydPjbufVjGLCQ4GQqjk+BfS43ZOfFglhYo69tL9vpaHDh1rrgTbXu3ltgHQNFP+Sgr43xR7Ef+1hM+OUgbVgtSkNYkIZdkzhLUosuvT5hV4Ii9Hz0cdQuEfTEdsYRjS06x/y2sO+KvwUbWlvwMKbrLDGdLhsvhu6tzfJ2UpNaMjjG5k+hz5q7FBFiw304CMh4InogtVnGZyQP8sqAn0gTr7owutfZ9Oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQrmFguAy0jo5pWZamY00ImWiA+kqM+yY6sS9HITnwE=;
 b=Ili0MYGg4cOBVms1d20ViW5YRWAZNsi3VskUkT8ETkiaSJP1dVOn0J8ZWajrWfrg/2VVxHmzIk+1LoVE77wWUyR4UlFYQeeo82+EjUUV9HKvdpqXR6IQRLymzHW52wSrGRWxDJVS+Gvz4aqYJiYuMXNBUejqrmKv7whrH1ohM1u+cXJYn3JpuT8XW26piySX60VeG3xQdhpw2AADu7oLDjv65kHnY9syKwYDhZLNQx+TrBE5cm0wVUmWa/h71ys11xYq1gDjWYhjNHOeFngyAkZ4Dn3y7LD0esYjCqcaEIff4Hc12fw1hURXNCR9xZ7eIrVW/ChM06GJJYfMV06JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQrmFguAy0jo5pWZamY00ImWiA+kqM+yY6sS9HITnwE=;
 b=rIX0WFQXCyS81dSKRJGbyYaQizLQtV0TaEy1kwkyVwQNod/02avB8nqr+wmMVSI4Ujvw6eljC8/wDD5CtYkrN+MVGrygW1gzd7HuzLdFXqNSMEWnVQn7Qe5WyUCGtfVw7HOWAaMb2tpUEITyDyhAPplpIx+0kGQQFkWAg4pPbBo=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB5820.namprd04.prod.outlook.com (2603:10b6:5:167::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Wed, 23 Dec 2020 07:47:10 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 07:47:10 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Thread-Topic: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Thread-Index: AQHW2DQ3JDYDYaEKR0iGb34jWf7AcqoC/HmAgAEYvgCAAAYJAIAAMzzQ
Date: Wed, 23 Dec 2020 07:47:10 +0000
Message-ID: <DM6PR04MB657598535F633F59A1DB1F22FCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
In-Reply-To: <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f7e37239-fa4b-435c-b403-08d8a716f451
x-ms-traffictypediagnostic: DM6PR04MB5820:
x-microsoft-antispam-prvs: <DM6PR04MB5820DE3002EFBB123F0376B1FCDE0@DM6PR04MB5820.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t7hRVQNcP2KjCvvpm86ePRuumlLatGTM7tybCgJs8/68amSBiEiTLbo/vZTq6ujOW6Guygdb1uO1fC574EZwwpVfNVHjCMrXyP5LOayCIPeqdjcFT+kBIqPiOW8prJGtmw4YDFyL190sMtshKiHnExzSKUdoC1hEwHrOwB80NeX3yLu3bLLzlelK+nvlzobVJNtHjZjYteJ46upSaW5narKtDzIbDq/GDiWnuM5szFmxtv5JszxD0bhuiNX10vLsZbuprnnOu89Ndy+IyjYaY+KX5560BjwAtgqj0Flb3O1erqJZIm1Uh3IKxOngSZ34BoRDDRiqq7t9e89PcvLRFnBefMXe4kWWl+yjbsfqbGLA7GJTzeSmXgEEELncIpeCPigs9gw5EBb57VCxav3Idw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(7696005)(66476007)(66556008)(66946007)(64756008)(6506007)(4001150100001)(7416002)(76116006)(83380400001)(26005)(53546011)(55016002)(66446008)(316002)(478600001)(33656002)(8936002)(4326008)(9686003)(86362001)(110136005)(5660300002)(54906003)(71200400001)(186003)(2906002)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jubC//xMMeDXWIc17F0k0aPu5oNK56wg74MOQOlSGMICdpnKaj0kxCWv4WTO?=
 =?us-ascii?Q?u4Jx5mb2nktAPnCay3BlNyUKjmD7vqi+Asq31FgpK96MiNM/+X/89UAqyahA?=
 =?us-ascii?Q?XmHFh10Jz9SuDWgsudm8aWYaeM8pxasv43TF2hbOAIsDOkX/+M4fBlVtRLaz?=
 =?us-ascii?Q?LY5tSSg7sa3EZMTeBpAQ7OY8b9G2SN1Jiq7SFejW7q7dZ5ROpSUXX+ehK31Z?=
 =?us-ascii?Q?OEHK5WOVM3ObTsGeJgRu6vXYE9TFcv7jXxPRC2vmNBrvIvI7y9lQA24DH4Oe?=
 =?us-ascii?Q?0+RUcwa42I9PYWhI1PffRJO3I5H5YVFrB8btRZK7Nld0r0SmCohzN/qvdhDu?=
 =?us-ascii?Q?xM5A2t0W6K/Kmcer7EZiQfnMNfjYQgRXx/Gyyj7VkdMG4XiLp66L4LgUefjf?=
 =?us-ascii?Q?FVR8Gsi777wC7rOXf71ro340gW7rBha0LIAJLw7kZOXPvvmy4dCr/p/x97ee?=
 =?us-ascii?Q?EOCw6hs7bu3+VUdc6j/v2reKCr5nnAgUq18owVZ9ICoHaEhgIwZtBvxvJZLm?=
 =?us-ascii?Q?pETpYrftuQd9nIlYx30prEoJB419Gnpm4+TPuUN8LZkOJaRDsF6VpsQMqCUq?=
 =?us-ascii?Q?m81ZjcDDURSwA/LarTkwHrER2HUqkn8Rb26hSZ334zmipMFSxWGbPSLbJCnM?=
 =?us-ascii?Q?4NA+Wmbu4FHwOf3LhcVgAe9vwPUBO4+qyIuhYsehvNNsrpTmUb2Jv/zDs84b?=
 =?us-ascii?Q?AJpmS693plKfenk7YXiMnkDsw4MT3+F6m8Z9baRuIDmuNMY5D7hNU4zDpZmj?=
 =?us-ascii?Q?80R/KYhZpIe4yHkHvwqQj08To6emRANb8X+3Qofmvp9RJ7V5lIp0ho5SDYGj?=
 =?us-ascii?Q?zs6YwDWTHpKsbCuE4DvoZ83IcBS6ckrpO5hCfy3PxYf6pr8hwSDobZw43D2o?=
 =?us-ascii?Q?dxn/S2NLYQQTb1zF6OrlHxs7/weIDVMHOaQNJFrYFISjKzTDogzJxJCzEV1R?=
 =?us-ascii?Q?EKbg/7oJUn8ihofD4yVohRw787ssBXrtDUnQVz0ZLJU=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e37239-fa4b-435c-b403-08d8a716f451
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 07:47:10.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNF0P6aUAHwZ6USHBBiRysJZXEeLwh1UJlY1XQRUF2LZETNXNlvewNkfEX6d6x+hpLgrA9aMg8qSYU5Rt63irg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_024717_790780_A174398D 
X-CRM114-Status: GOOD (  24.62  )
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
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> On 2020-12-23 12:19, Stanley Chu wrote:
> > Hi Can,
> >
> > On Tue, 2020-12-22 at 19:34 +0800, Can Guo wrote:
> >> On 2020-12-22 15:29, Stanley Chu wrote:
> >> > Flush during hibern8 is sufficient on MediaTek platforms, thus
> >> > enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip
> enabling
> >> > fWriteBoosterBufferFlush during WriteBooster initialization.
> >> >
> >> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> >> > ---
> >> >  drivers/scsi/ufs/ufs-mediatek.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> >> > b/drivers/scsi/ufs/ufs-mediatek.c
> >> > index 80618af7c872..c55202b92a43 100644
> >> > --- a/drivers/scsi/ufs/ufs-mediatek.c
> >> > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> >> > @@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
> >> >
> >> >    /* Enable WriteBooster */
> >> >    hba->caps |= UFSHCD_CAP_WB_EN;
> >> > +  hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
> >> >    hba->vps->wb_flush_threshold =
> UFS_WB_BUF_REMAIN_PERCENT(80);
> >> >
> >> >    if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
> >>
> >> I guess we need it too...
> >
> > AHHA, if you decide to add this in your platform too later, maybe we
> > could change the way it does: Keep manual flush disabled by default and
> > remove this quirk.
Ack on that.
I never understood why it was needed in the first place.
Maybe just remove it, and allow to perform explicit flush from sysfs.

Thanks,
Avri
> >
> 
> Yeah... I will get back with an answer later.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
