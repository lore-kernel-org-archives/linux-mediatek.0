Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B863FC83004
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 10:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8966B208FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 10:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cRdLQUsl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="V6Bl6Mg8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8966B208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyMCXt9UGtikOL7G0BkT5/Nroy7lFBWDAA32h/+F7VU=; b=cRdLQUsl95BQZW
	AxKry5tS3MyAT0Y224gGilLnpSKd9n7iyYbfIwZliN0n/KJFrrkdeUTzFjddEGwudoII6AUEXv7WN
	sfwE+BmxDT1PgcNjZQy3fwK0slE9umxA+9/ybq4d5x3b97OgES5xqILA+UvoSWKO0Eav8vUa37JAT
	gj+PJ3llGJk5cpdMfbrKxR1ktExxS34y5plvR+hSguxEH1/Ih1Ycm9P/6R6KSUxc+2wRdLIcJJ0Kv
	x0IsbpdfbgQ2mnwgfgZ8xGnpdZUMIFb+ah2suSAjumNF0DGQrWGxWkTyEPXRuUIgPwal9H/tDl1h4
	tBqbOZqVVB00XxUOpSDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTjoP-00059b-CQ; Wed, 29 Apr 2020 10:19:29 +0000
Received: from mail-eopbgr690049.outbound.protection.outlook.com
 ([40.107.69.49] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTjoN-00058t-Bz; Wed, 29 Apr 2020 10:19:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2br6Dy6CljlW2VRorth7yEsx5OyCR8Vomi3VnY8DRhKkR4DzxIum+E/bzJPYOr0L3dJHYUYyxmQxFGd1mQ60UmGUVHaEY/zsw4Vb2aGn/f1vfqXA1CybK+VJmypIyCvJnWxV1DwCCViE6cLrZaHgHQHUuvYKuxDwYoA2eRXxiruh/8Xdx6JWMv0eKwSQVaDuzJILVr0ZI6DqniN6RnetH7Siicuu4ZgLJAhOYwVSMGgcJ5HuX11I6XjkwuM37CxJYeGehYoF+5nZeIUxJYJpcYQH6Nri+0ZkgAtZKVHYRTA6dwwJfvuY0NLk/j890zbVXqKw2RUTNsP51gI+8JvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hrjxsBHiSrJukurep1+xddXg60vu3XEDZmrQeLfhw0=;
 b=U7KLTeAJZUJy1PIxuXLkt7hk2uAHU/aSFkB3NnRItIbxaPrZfnu+Iv0/xSxnYzjKi9cK9RHnp4ZOqYjrEkn5Hv9uBR2Gomi+qi46foI1t5zIBcS8NjnAKE6XNQ6NLXvZKggpVmVfvG6q7N7lXIUk82lbtp9V5hKqGIgE6dWCZvHNZ3L5LhTttAqBPTKYrDFM5AqrGlMya4t3G5jNntO2GISDezhvaiDABs/ctIL9ibFjQNZsOO02kyMgNCIOrCCc/tCIxOweYf9FXWqXEkWxaeJ8wOtqhy+USpvVUOuacET5hvgxeQcNEa6nbzC+rxdiwWgVxmpuS9hFtu+4wcabtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hrjxsBHiSrJukurep1+xddXg60vu3XEDZmrQeLfhw0=;
 b=V6Bl6Mg8HBJBUihJgYyatp860tEZvf7dPnUSM8eSKjEvps5FLxQYM23OGdqO0AYz27a+AAcj14OOqECs4Cpff9F87h/F+BVgMFhcA/RY0d4WJOk9S1ygpso57n9+0rsUtQ/oiLyJUXGgeQSnqSKWzSNI1lhDZWRwuEO5TJ32mKA=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4210.namprd08.prod.outlook.com (2603:10b6:406:fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 29 Apr
 2020 10:19:13 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.020; Wed, 29 Apr 2020
 10:19:13 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Subject: RE: [EXT] [PATCH v1 4/4] scsi: ufs-mediatek: enable WriteBooster
 capability
Thread-Topic: [EXT] [PATCH v1 4/4] scsi: ufs-mediatek: enable WriteBooster
 capability
Thread-Index: AQHWHU4ihpQ3MTM+9UKTJOebA4liOaiP5HcQ
Date: Wed, 29 Apr 2020 10:19:13 +0000
Message-ID: <BN7PR08MB56845966D744DA36404FF054DBAD0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200428111355.1776-1-stanley.chu@mediatek.com>
 <20200428111355.1776-5-stanley.chu@mediatek.com>
In-Reply-To: <20200428111355.1776-5-stanley.chu@mediatek.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWRjZTQ3OTJiLThhMDItMTFlYS04YjkzLWRjNzE5NjFmOWRkM1xhbWUtdGVzdFxkY2U0NzkyZC04YTAyLTExZWEtOGI5My1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjE2NTYiIHQ9IjEzMjMyNjI5MTQ5ODk5MjQ5MyIgaD0iNHV5VFd1S2hPcVdHYUJGNmpEZDB6Sm9VKzVzPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFCdEF6NmZEeDdXQWNSVUhzWG5iZ1Q2eEZRZXhlZHVCUG9BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9b0a53e-0dd7-43ca-842a-08d7ec26c3fe
x-ms-traffictypediagnostic: BN7PR08MB4210:|BN7PR08MB4210:|BN7PR08MB4210:
x-microsoft-antispam-prvs: <BN7PR08MB4210A9F9230DCBED625D5F7DDBAD0@BN7PR08MB4210.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 03883BD916
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /nYFDACwLFqDb17xxsAfjRlg90OBCysEP144xSW1f/vEVqKL8hF6K8F+vy/4HBDq1BNnuQGWPsdYOGmWs6sC0oPtJRmmRsblQaPZ8GC4168qSh2Mchtk6yKazT4jIlqcuWl8+R0vsMNj9hasY5ImKCCBUlxeKw83gQ9xHOmXyx3Utw+60wDegLJdEE+ZkTO6ZJzxpLQO+RSca23MR/VKXZBep8tKSq40cEFYy098pZ+lMA++72DBtpDouQLbKbC9vFjxnSxSx+kTSdQs4OdnwDVaqjDP77OkLn5oiBmvgosVjP7I50qVnBfbjQmibGDRk//7wiZ5VcseJ6aEKl0QrUjsPSXoWxtNoFngh+v2lt9I/h91C9zfoYoJHxbsAXUi6hdVVAH3f+T57BQf0/TbrSI2X/D90r1LuX2j9lfx9TASycFE/VdIWxNN9n/G7N97
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(5660300002)(71200400001)(54906003)(8936002)(86362001)(316002)(55016002)(66946007)(9686003)(76116006)(7696005)(110136005)(8676002)(64756008)(33656002)(66556008)(66476007)(478600001)(66446008)(52536014)(7416002)(186003)(55236004)(26005)(4326008)(6506007)(53546011)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1TRRHh2QrQllKaiwsWyyZV3Xgjhw0C24sE4nf3wITHm7gNQ2KhFB41FHS1EUjdHZCXafAbVJfxX/PSVdlfe98CqrHpKSVPj+ImWX7fB4ljtCyygLVPngQ5TA41fO3r5+1MtPSZJOx5yFHBxYkdm5pOcandFaad01kBFQksIU3ESl7HcoVAPYIKSxDuqrcMDfIEbbiBo6uG9QhsEMbMaTFG32KL5at8nkFbrV0PAxiIxaCK76P6OL7P6tURwe6nCOTQw7mZ6+yV7EncmwHpzLKRhROtDRjWGiIxDN6rXopPR58vHgU3zc0+eBhbBtFjEKKKzeRQkhPOaRwME3xCq0haaTT1od0/nl7OWydqEpRPvFS/IQB5JAAT/AoXgNryk1ebBh9Vua8ZssXdotfn0D6LDWDxNvfTcemaiVE+vF+0tWYeIIy1uqWBYTQ3qiiA28hSkmYFVgyN5fX+M9adMm+QGqULnsukVdPHPVJnleS9iwePnDpYLWmqEbQFzML7hW9zexRH4eAhIhvnWgeSxQUnbJk1mGJ/ZUaAP0JIEMU0/SdFUD5Yx5UdoCtvD1A8w50SEsz8N31DG8RW4YnH5CT9QBTpafR/UmNmg85jOxzLuevepkyaYvqXJKE+vn6aRA6QGqp5P5REkI+ufg3A3ruZk5Jv6ZUwF3pJ/lLXzlO/9cBZQ+AA0r4u6YXwqvCr2PeHNtS9l/02VVwJvbZlIMi3jqTrO/zk08p2uSNdvVOONglRQbiNI3/Yao2t2xGnRgO0T/tzjcLRzb6FH9g83iD31YW/sHxeE0P16cMw2/Lj0=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b0a53e-0dd7-43ca-842a-08d7ec26c3fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 10:19:13.5934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvqyrgC/1tcWyb9MRA1v5eHqsXiUM8A6i3AzOb3ePCKSjYKdBr7AD5y378+1TEmZ7Hy9WT8h1t22q+k6WVVqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_031927_415898_EC6055BC 
X-CRM114-Status: GOOD (  10.57  )
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Stanley Chu <stanley.chu@mediatek.com>
> Sent: Tuesday, April 28, 2020 1:14 PM
> To: linux-scsi@vger.kernel.org; martin.petersen@oracle.com;
> avri.altman@wdc.com; alim.akhtar@samsung.com; jejb@linux.ibm.com;
> asutoshd@codeaurora.org
> Cc: Bean Huo (beanhuo) <beanhuo@micron.com>; cang@codeaurora.org;
> matthias.bgg@gmail.com; bvanassche@acm.org; linux-
> mediatek@lists.infradead.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; kuohong.wang@mediatek.com;
> peter.wang@mediatek.com; chun-hung.wu@mediatek.com;
> andy.teng@mediatek.com; Stanley Chu <stanley.chu@mediatek.com>
> Subject: [EXT] [PATCH v1 4/4] scsi: ufs-mediatek: enable WriteBooster capability
> 
> Enable WriteBooster capability on MediaTek UFS platforms.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 673c16596fb2..15b9c420a3a5 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -263,6 +263,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>  	/* Enable clock-gating */
>  	hba->caps |= UFSHCD_CAP_CLK_GATING;
> 
> +	/* Enable WriteBooster */
> +	hba->caps |= UFSHCD_CAP_WB_EN;
> +
>  	/*
>  	 * ufshcd_vops_init() is invoked after
>  	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
> --
> 2.18.0

Reviewed-by: Bean Huo <beanhuo@micron.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
