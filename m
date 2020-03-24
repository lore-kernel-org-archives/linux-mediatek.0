Return-Path: <SRS0=XWkL=5J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE5C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 17:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E4F206F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 17:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rg3gCK0Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com header.i=@dialogsemiconductor.onmicrosoft.com header.b="mankuWOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E4F206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kcrif/3CVf9VXiPWRZ57ahmoX+m2S8gqenFxpTPBCPo=; b=Rg3gCK0YDjfrNU
	cbvp9TJQwZ3VZ8xjwCdukvZGDqkmWNjepFzeq5nZwQkyRqSyjXPZR341w3VWOr8G7/sNRxIlxHoZi
	Ah3JNhF9veJidk3G8v7m3WuqZEbTBAGDoagXGsn1bOtKG0Sb4ynNZiwGih0RfqW2QBwzjGz91r74D
	/VvlPV0ZZpdYfvvLNS7b8bPU5uUWxliW7JkE51HGaxuudW5YYVw14Id+e8fNRWZjBKLHEK8CcUhUk
	ZADs9lDoOsXez9clXDnWMz0hczLJyzou4LZ829a4rc9NPYITJWXHsXpgvhNcoUsDnXFzHDAtXxRXY
	L6eks3BzrstSa4BNRXVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGn3b-0006CP-SQ; Tue, 24 Mar 2020 17:09:39 +0000
Received: from mail1.bemta26.messagelabs.com ([85.158.142.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGn3Z-0006Bo-5V; Tue, 24 Mar 2020 17:09:38 +0000
Received: from [100.113.6.235] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 4F/1A-11388-9F93A7E5;
 Tue, 24 Mar 2020 16:48:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WUeVBTVxTGvW+NSuwTUW6pVBulHbWJLDP2qO2
 MS+282urYsZ067ZQSSIQoBE1CBaYuoLEVRCFCQWRRWUUUEtQqizCIClFIE9HgXhatLJKpIoIg
 NiFo2/9+53zfPee7b+Y+AekaN95DII/UyFVKaaiImUCFzBeCeGBhtL93efUiaGofoiCjpJiBf
 U+OkpAQm0pAZ+IFBIN9NgQvdZdY0KeV0NCXaaTgSnUvBUn754C55QAJKa0dDOjNlwlo1hoQpK
 b8gSDDtIuCen0pBdl1TTQMNOso2JlTwkB813QwmUpZ6G/+lYDk4QICDO03aEiqbmThWnkGA9d
 2mhEcyt1PwdOEOgRppvME5FnNBBRezaYhdpcf/N7fxkBGXj0FOQXvw6OcBwgKXpykoLTsOQFP
 bdU0vGp/RkNmXwoJj++kUmBOM5GgrapjwVzYR0BVaj4NVyo08FtmFQtlBrutunklWJ/csmsjg
 xQM1prsdO8pgkt/D6Ili3it5SXDF2cVI37ohQ7x/c90FG9r0bJ8adtxmj917CbBD11sZ/lz6X
 dZ/kyNF3/YEMGXFc7lcyo7Cd5QtIfhdflHaf7OjUpmzYzvaIUyMDwygA45ZW2kNiUQkT0Dxew
 O1I3i0AQB4vJI3Jq7i41D4+3FJQpbYr2cQhnCQwmDjKOguHoS307PHz3iyu0ncF1KD+Ms7iJ8
 2dBJOM4zHOAD9X8yDnbjwnHH3tzRPskZ3fDZLh8HT+GW4vtFI6TTswzHlnSPsS9+EHN61E9xX
 lhvSRydI+R+wIXPrrPOZUcQ7tPaKIcwnlPg80bdWHBP3BdznHQuc8e3OrJHB2GOw7mVJtLJU3
 Fn+wjt9MtxQ2wLcvY/xI3WjjEWYXPjXdbJntiSHT/WX4XP1OePzZyLDx83jjHg3HitPY/AzrP
 xSG2Usx2KW4/V0E72woauhjH7dHy+YufoXTCnp3D+iftkIvJO/09sJ0twS0oy4+R5OP9IN5k+
 +i0m44aDHdRhRBWhhYEqRXCIJkyqCBX7eHuLfXz8xB+Jfb0XSKTR4kCJPEIcJFdqVFK7KpFuU
 UvUUWFBoTKJUq4xIPuDlG1mm84i/QmbpBa9LSBEU4UrfKP9XScFhsuiQqTqkB9VEaFydS2aLh
 CIsHCm/eW6TlbJg+WR6xWh9mf9WsYCF5GbUAZ2WajeJA1TK4KdkhH5CRI7M4+SAqutKo90pZT
 hSrmHuzDAYeUc1pAI5ZtBr38RFuTpMUWIxo0b5+qySa4KU2j+r3chdwESTRF+6cjjolBq3uzr
 skch7FGC07c4omik/0oeO4hD0zYGVJ20em+LaVpu61X9ItV9E1O3Qhz09Wfl/v7yBMHq05/HH
 Fr73gLXJK5nfvTGx7PO7FAWkZsnlH3gv4HYPm3p7KueXMXLtZ9ufdUiy+pdXGdUu1QEuFv3ub
 SSgT3nmN3s2ZndbZK21Ixtt4d7163e/fGJki+yjMSSWqt1j8l6sckYsLarfmXLg2/XBc5a5eb
 /16R7Pu2WAdlwzU+T3yl8YfGlFn5VpnSpuzDx4Bzt+oLh4q012ZUPm6LNF5INsvz+zueB96v0
 QW8Znq9IM6ffbPNrmLgsrlq55ubi5NiEn+mkgnPNDz/JPK141ydLf/3ycu20qL0b9g3Nmxe+U
 fZo+wzf78ulIkodIvWZS6rU0n8A07S+ap0FAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-246.messagelabs.com!1585068536!590282!1
X-Originating-IP: [104.47.13.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12406 invoked from network); 24 Mar 2020 16:48:56 -0000
Received: from mail-he1eur04lp2056.outbound.protection.outlook.com (HELO
 EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.56)
 by server-3.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2020 16:48:56 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUo5MiP9UiP1Pd/9EgE/sYEM+opDn1zuv5prE0U6qCLXRqZnkGjyVbOvZ2Y9Wd7OmA4xAeo8TPoYrOj6vPo891gJTekEDS+0E6jO+hb0vyfGoLolVi4Nw6voptT/qOdYQTl++otxfzMHArj0fcim6/FsU6CwXhCtN/ISN++keKcBs8Sa2FsfM0ZFJT7TnQD+xTb6o3ITUdG8LibSFAlHSAma2K2qZXVs4LUzPjV4vtsgTQeR9cn99LeFYA4h5Q0SVh+NRPuELQtw7SPtRb1VzoKluOYgPU81+P1lAemsesNpHuIbwxDr4TYYxcT+ma3cR1QsTAjg8nkkgYoWqxMiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t5y5uouBXlTAEUWUkQT4VwMSEUjWx47R+cC2XcMq/M=;
 b=QV0WUXg+bgMYUyY2YZnQJKZt4SRGjVMFYSmz3LWyS9E/hgdcZH6Ufg6D6DWZ/t9ZtX0LFyYJDcQb2IHjpYDfhZnZiXjq5eCqexLzKwjAOKqne+QXWN3qvqFuKQAJIMvhQEr6ltrOMsuYF2ilM7akrq7sjF0xDvIdL8ykr0IoMsyu5oJ4wFR+4vvpsGAnoBOSEfREY32De5KmMzM/R4WOCKif3HCmCwDE0CnNCYiM6nNUL4Fl8yDDT9VdQ7M4ECTRS75Z7+6IBEL7YLTtd1MGpg72jtbdpyUlob2uCR1liXyiDzhAHAkiaMtTKY645VpojjZ/NCmWM21OuLipAW32bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t5y5uouBXlTAEUWUkQT4VwMSEUjWx47R+cC2XcMq/M=;
 b=mankuWOtawyFwj5enRIqU42yDsw8GzQB/7sNNn+k+XM2xFBfqhGFHUr+ZeVjofwI6aZgSOAh5KhX3URJE+EWZeRQUIDjeD3K8wYwisVpzOnZcO0boSlLH9+dztXDiao1ELUmw6gw0druZ+9ysPfYvgcIrskpEkhDuDakmDgKmA4=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2648.EURPRD10.PROD.OUTLOOK.COM (20.179.1.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 16:48:55 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 16:48:55 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Subject: RE: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Topic: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Index: AQHWAbaWez6HzlxGiU6+/dMhkx1yFKhX9DAw
Date: Tue, 24 Mar 2020 16:48:55 +0000
Message-ID: <AM6PR10MB2263ED5E8EBABCFBF2FD79D380F10@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28802bc4-1a97-44b2-3f77-08d7d0133db8
x-ms-traffictypediagnostic: AM6PR10MB2648:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB264867B25CC874B3773B15CBA7F10@AM6PR10MB2648.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(2906002)(478600001)(26005)(76116006)(55236004)(66946007)(66476007)(66446008)(66556008)(64756008)(53546011)(186003)(6506007)(8676002)(52536014)(558084003)(81166006)(81156014)(55016002)(9686003)(33656002)(86362001)(316002)(4326008)(54906003)(5660300002)(7696005)(71200400001)(110136005)(7416002)(7366002)(8936002)(7406005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR10MB2648;
 H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4gHaMgj6wXrScuJNsCva2LznlLCnUlizN703py19dP6mkaJCnNUzFQAVGTob2gSmnJqNviHgHSIyCMmMzv8nJUKJoUfgat9UiN9HwGSCkTEz1IPxgblQPu+IAlO/pVjPt+rXXUEOZCRESkoXni020VDOASajPNcZc1HhpH/gvr0R0XuUhB0bmCkzuZf2vXWhLp8aF/FXiS10jP2SDdAr/eoIAkjAqiwucl0aLLpZdIMC111ca6NmWO9dP+QGtCliVPKUaMn37MAnis6jezXSY8scMJceBlCHQz1hmoGrUGuXmErjq0P/5FiEnhHFrShEnngJl9DHEPFB3hzOcxnIOI/KOiUPr/66KT7FwHQMPvf7FuDj85qbjftJ2owF4W5nu+x23uI3ye+oTNdVZcOz+NaU4HK14h0eJB93tiYhwy3twj7/yD5YzYLZGToE+RVK
x-ms-exchange-antispam-messagedata: 5ok6I3emv/j89OSg3rEkOj4FHEnWEMJ7Ul1nbc+UObt38Y7mFwsu9CkkLBipu4+yzfMsSsVKfd5MbB+RutAb2H9jGhXKV1AlF62//dEvOIdVCWiMoDyHYXmOWFxnXK6u7j6lMdjYuWfvxUGyl6pKrA==
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28802bc4-1a97-44b2-3f77-08d7d0133db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 16:48:55.2918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zu6PnT4oq+gsspyQWOq+L6i6eewouuIx8GBCK/0rf3NHOa3k63rVhLASfdTXqWbiKXaXRvwC/P95sJQEP4atJfwrGwd//g65cI0ZFJh7foE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_100937_407852_9795543F 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Milo Kim <milo.kim@ti.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mikko.mutanen@fi.rohmeurope.com" <mikko.mutanen@fi.rohmeurope.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Gary Hook <Gary.Hook@amd.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 "markus.laine@fi.rohmeurope.com" <markus.laine@fi.rohmeurope.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Sebastian Reichel <sre@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tal Gilboa <talgi@mellanox.com>, Changbin Du <changbin.du@intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24 March 2020 08:31, Matti Vaittinen wrote:

> Change the regulator helpers to use common linear_ranges code.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

For Dialog da903x:

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
