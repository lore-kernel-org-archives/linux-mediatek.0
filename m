Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E78C4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 11:54:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CCC2065C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 11:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HicQ4vNX";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="mq+YJWqQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="wWwzdCc0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8CCC2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QrfapVIByv3q45xKTVwE0AdXK2aI2hIsS1O6t9q0UI4=; b=HicQ4vNXDV5rQn+/JCsSuDZdr
	4QycfwcL286tr37ewHhK5DZD9kKOSfF38nTEzp/mAfd26ljPtnZzUpxTCYvEOG99jwwABDX/wU7xx
	dUqKV4sYq2i0drmE+nLBlphgNeyCk/ME1b2NAInL00HwFRtmkaos4907nPl4tNlHFQjRVP7oixsra
	PvaWN6tOv/+hImWEFD50LoEnBeH2MAV1Gjy04+4UVr7x+Vc+lw0ei6Nx4rePmJ2kww/SaVe2iauqH
	MJp55yc/pYgbJLB8FIo/t+TkLbsk2wkPDHoFi1AQQjSBphWfIMmSdwllK+vUqXeq4aKctIuBGc01x
	0FPbCFvXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEDR-0007HI-7l; Tue, 29 Sep 2020 11:54:41 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEDP-0007FW-9f; Tue, 29 Sep 2020 11:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601381261; x=1632917261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VpYaatWRBTgIADFT4VpUUpHV0hbtu2L7RhXCauNw2dU=;
 b=mq+YJWqQiLIHyZjR6X4hv5YxoFiMk7n+63W5PafqhDTBHPAwr5/btkIl
 KiiK28vPA86TB/Gd6bBbHosW5WKjFienoHlbXwutVwlIbJ7W1BdijiuXN
 XC4iygaKnGe2vYLfleDMYYH+ZiQz75a6N+KOHsx2N3HBdbQTM+G2t6Po7
 TcTVpUZA2T9aNYBVOTIxqOz8ri+IRBuGQjLZQZrm5L3UDzjR762/LRmVJ
 ozvq0kS2Xt7dFH6TvfFdJogCuxyVmhGg8buRtdhtRnxXu8mfGd7th+SQ2
 DEqKZP5FInDAHogjFRjbTr2PW/CQC8NZLVMH7t2sPqcoZKPn9zCONAv0U Q==;
IronPort-SDR: FMQuFLFbWihNy1nQ/QdOcfTo4ijt4T28LHj9OGaS7cWVDoQrvfmOoI5bmjVT5fQX1C9cYFx+VC
 mMh/Rtp9/8pB8iQishQuzut9v1gYGl0abuT4bftTcrvOV7MyyDmYZkc5RoBR7SkI1XWm4o1o26
 +d1DlTm/eygSTLg92O+uH61VWTmY/Pn6q2ZiVHYCXhCBAuQKT+5K0UrC9yB2cp9D5H1VIhySYC
 2kC+LAk3Lha2lXN066IHRznbJKiL46EmVCgBF4Q0YJ3WVj24+ISu4Rrej5T9ZcrqE2eVFMP9l8
 IvA=
X-IronPort-AV: E=Sophos;i="5.77,318,1596470400"; d="scan'208";a="251949948"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 29 Sep 2020 20:07:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJQgvpGqJbd+uOvHyhEBv5lG3zJ5qASTNn+1EVgqcOKq9nmx0YbNJKDz+j/nyGiiZ4YhA1qjcvew0i4AXUTviBM5g40R+DQjOzdxLJQq+Y98C7CiRJ7h8xmrPN8PR+Fkl/MgifEM/si7kqG5/P3KWMllheTeanDDrAeJ3MHvnj2jr1c4nMF0rEZNTdyQxD3e9PLTT429ajnvR7Fe6pmp0SRvlGEhoLVQrW4gCfcA51Lp+ioMYJSQhhQbsIOoexUqgjt19VwZsZeKCbAmOv7V69/msPr6UcwXuhv9TbvqA6VSypvN3tP18zfJwoJ87wCrmnqXU7Qb4VCaJ3oD/XUbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXKAJeCwzBd2FMLiHxP+hr4uDpxxNEop/tOnmKg6MVs=;
 b=eVnBgNjMkF5SHtc43qEQ5Vwb2yh2r33J+uza8WMtjlLxG2Q9BuOQ5OvlQU7jsyLDGuF56B03mAtc463r2MLZm+nGsGKYmxpvNoDy+4RI0oWQjL9Nrlq1Eth1JPVLOHFIreB9mjtQ3vk2NaV8UtZ5wKosjG4nrNPLczS285dGAhhoyJyHxdbodFy3XeFwS2SVq3kHTtA79zgF1pvTvbOmZRIuoCp9831a6op7q2m7ZQCCMgK0xzcCCjCWUJPJ0I7Z34hratR7PbyA+a1j4aWq7qHIdqoMd3EOzNyVGqsxjwQI1UkbfPWOp7VPHZpoPeK//ZOP0v3860LlozIyrKXdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXKAJeCwzBd2FMLiHxP+hr4uDpxxNEop/tOnmKg6MVs=;
 b=wWwzdCc03nxWvjKhcq7zVS9ITLuRu3Qkj9aYO3ENRuZ2j9x531b9OVeh1zULu8t/dGhce9THOJSTYlZMKEUrHcQ2l8DdOmAjsFwMm8BH9F8HAIhMpunTb8QAzZvWRhvyWTO5GVCUJcAa0F8hZKBFAcXRhRfGmK20jF5i68ttN7w=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BY5PR04MB6312.namprd04.prod.outlook.com (2603:10b6:a03:1e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:54:32 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::2c49:48e2:e9fb:d5a0%9]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 11:54:31 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH 4/4] scsi: ufs-mediatek: Add host reset mechanism
Thread-Topic: [PATCH 4/4] scsi: ufs-mediatek: Add host reset mechanism
Thread-Index: AQHWhauhM77uE6w2t0y0fOl12ucOUql/osKg
Date: Tue, 29 Sep 2020 11:54:31 +0000
Message-ID: <BY5PR04MB6705873E1F5DBCE7C97D12AEFC320@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
 <20200908064507.30774-5-stanley.chu@mediatek.com>
In-Reply-To: <20200908064507.30774-5-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f27844c8-661f-4fc9-30ae-08d8646e6d8c
x-ms-traffictypediagnostic: BY5PR04MB6312:
x-microsoft-antispam-prvs: <BY5PR04MB6312D9EB78AC4DBF3BF22333FC320@BY5PR04MB6312.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qR2bEb2cxUGPS8T+zT4J4G/mkBDaoqpYJwQARlBm39lYANuOEjPjxJswl50wwekC1DAqr9bFR26o4Z3lf9Hdw7fE8I64avuvKydcrzRRJ1wh+8ZA3Hhg1/fqiaeIvg08MmwRUaZNnzibAv8sK112RrxjDbUAq2PQolJSiXW/ebC62ebUffk0x0kDMRgsxHb6ae7qTzGeFr0Dj+D36q+UjNssfXtBlxPPJuxSk2iwmTbcI/UB+uCqGuy9PsiTlskNeZY1a3Of/uSxXmhq0R6KdhhcxyxOPz3bYfuNbzvOzW3HgZz5Y5Lvkkt/fl6w2qTF9vlGIPkfLaS9npJ3mnwP8N/nU6wgHYMg3A7ov4Ni/EMKz9YUUcB5MBtMSjdRP3ON
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6705.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(498600001)(5660300002)(71200400001)(4326008)(7416002)(66946007)(66476007)(66556008)(54906003)(7696005)(76116006)(52536014)(2906002)(33656002)(4744005)(8936002)(66446008)(86362001)(8676002)(186003)(110136005)(9686003)(26005)(55016002)(83380400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /2NhCWPA0++LDwuEHPdjnrvhCdz19AD05AjQ/6w7TnGuqSmEQPRgqqof6tGahPwwivNexOyNn862kedX5Neaz9bnUmu8JZ0pl7hZyV+EqdCO1B5A1MPgxsI+cLPzMffwywTHo+FJXZg8/KYDj2tYCGXFAiJt9iVe2paZGlyP76CFdJ7wnOEKhNwB2uomL2hszjamJo9JU6whOtbtCeq+mRevvWlfIqvcBzUbWeK/PVGcgIuT8kqxMz+ZGWbS1JdR9WAxewytcTfkn7qI5e0AwIGCOnF1BLkOGvF2e50xnZKYqEpeK8gdLQKPK8DUy9r8nnq3XVIAOawyLD7kAJDF4v27kajhuxDjUX7YiXFnMZPTF9yBqPyWfOvoszE9XQ3J20j64ZiBfF856TkFQ1zqQwj7clVpj31kH3ppxGlB7rYZxGmSqPQIR871ZGfQ3bwj9ZfSy6eGJYITsQOP0wFoltvYuk1cKKTxv2Lrr8760iY4WcHEI6poLWdFR99i9NRA1KwQfsyrLpAZAH/evi2sk4JVML//b/ao28ipchWP87eHbm+iOG1caWNOGGDdryZPdbEksfX1PoKgGBDPMUoIpg1IAZWaXtOrITbqyLx+o6mP49R/kEmhR42T8pRw5/Hy6H9LJjOEs7TQe0kOTxaFEw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27844c8-661f-4fc9-30ae-08d8646e6d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 11:54:31.8406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIW+v/RUrIXMbQ/jSAQSwlU5JmvZzDjNtGi18DSrRCF7Cw8Ebs1+QACTUPySMAiEQutjJPy22tRZ1koS+VIC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_075439_664226_0C606220 
X-CRM114-Status: GOOD (  13.19  )
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
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> 
> Add host reset mechanism to try to recover host-side errors
> during recovery flow.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by Avri Altman <avri.altman@wdc.com>

See some nit below as well.
Thanks,
Avri

> +static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
> +                                      struct reset_control **rc,
> +                                      char *str)
> +{
> +       *rc = devm_reset_control_get(hba->dev, str);
> +       if (IS_ERR(*rc)) {
How about verifying that the line is not shared as well?
Although this might not be an issue on your current platforms,
it might save you aggravation in the future..

> +               dev_info(hba->dev, "Failed to get reset control %s: %d\n",
> +                        str, PTR_ERR(*rc));
> +               *rc = NULL;
> +       }
> +}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
