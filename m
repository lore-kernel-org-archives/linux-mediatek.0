Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACFFC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 02:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsZs1BJNx6vGVPQsEvFkCkEl46RbmuNQkW/rxaMo010=; b=TlZao2JQqJfu1UQddgTtVYX0XY
	u6WHVvEK7ecbfBN9Ckz/MhQD6GEvKXr8fJMekPL5TnOXRJ199deo82fa0Pj0Zvdg+f6m9yPDJ9j2V
	ZDQKsDVb/YGM2oxCj5sF8BfQRGmlmhnFGs7iwASp0/o761sVmw4L8yh6iT0fvSsGcmod2ua0XKYee
	bz6a4YQHY8Vme+S5HI5mNsk8HgnW7KP034bRY83oHIguyOTPtiwuXy614fhTT10AviYxsFTmwHAbp
	E6M55l4e71ZNZ6bfWmdXc+NUUybYjNZL0G8OycCglZQjQnuFHmLiQWXKMTxy/bw4b+/fOAlDOUVR1
	cN8gE58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kVG-008zWn-81; Wed, 07 Dec 2022 02:49:46 +0000
Received: from mail-mw2nam12on20711.outbound.protection.outlook.com ([2a01:111:f400:fe5a::711] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2kV3-008z8W-Vq; Wed, 07 Dec 2022 02:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYLj1H9IReZlImQpPmTgwg61gEnfLkFqCIxRo2EyyvQVkGs21opRKnkEMOh5YyMDHJtVQsJ7CEvUeNLqNDwnvUp+iN2KIIBqA+yGZiHQOao7csrPdEa+CBe6EDtWxiA90YdbMfeS95ne+7yXidv0lbz/g/E72NVgk16fF1IohXhSEcRLtB18NR8zBK1OmsMTqZeg16sgf03TeQ+fEDE97T9wycYbDCOViD3XsxbS5BfE++/aUSS0mDKqd+ckzSerKSbUN5WSBWoQqy66v+MGNv67wRZmTE2OsRcngc8TOdD3sak4xsyCYSdoqUixIIxJhbYizAVFjtB9sI0TStjNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsZs1BJNx6vGVPQsEvFkCkEl46RbmuNQkW/rxaMo010=;
 b=D1Z4JWKhq52OWNVW7BM9WZkxqjLEzjxoAp7huKpJjHy8Tb7l5oKLGOsbLoMys6ReYnifl6LNCs9E+uDc0ij84gMtjSajjz2gACgONTa6h8JgXLitaULESmkey10erwK/NAaAK29AFCA6Y9nMpt/ghdCnaahelpD02fWuxs/GvXL/MLkAsAEcS/aDlThy1iAchYRE4WwoFivYpsF3ITNchCAxowZoTgZBxFVz5j8ly+79T8kauBJS4fucikAX8ThyVRNRmj+0jXEafhdqIWiLnQLuxW7c6f70D7c/QkKoGuSd9xjPxAV7n+2PUPtS8yP0HCy4Z6VJ6Xz5LmTYib9zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsZs1BJNx6vGVPQsEvFkCkEl46RbmuNQkW/rxaMo010=;
 b=Jw8sTdPrMRB20KctfawHDwQFcVikJ72+7QjeYlZURTaLGbghTXIQERj5PemkP9m093rTTsO/SVpyFLgcCPFXRbfcJhagq0J7J8mU5cI1YSZJRRYKcFpQF4e1G93o6a7tB3Fet14E/JvyW4sdLRLA6Fi+Y2ei0iff9/uA0XS78Pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SJ0PR10MB5693.namprd10.prod.outlook.com
 (2603:10b6:a03:3ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:49:27 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c%4]) with mapi id 15.20.5880.013; Wed, 7 Dec 2022
 02:49:27 +0000
Date: Tue, 6 Dec 2022 18:49:22 -0800
From: Colin Foster <colin.foster@in-advantage.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v4 net-next 8/9] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <Y4//Mtb0a3VHDN+K@euler>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
 <20221206155049.erpgwrvt5gzdf2e6@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206155049.erpgwrvt5gzdf2e6@skbuf>
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|SJ0PR10MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: afc3d02f-12e1-4d1a-3521-08dad7fda7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	63fPmzLc3vsizj907m99q5rMn37o1/0Ycy1B4HBYDXkFCE/eiAelwEsH2RmhHQbapMOk8tt5kzEz+fCkLYE2D5yzI/IJJE9OeEWI+eZAcWd2sXoDfYYYGJJuOKWBo9jfRAw1770dCTTT4COm0MGVZf+3CqRFbDqysm1rXWKg/+LrlJhl+mn6pX/G831UJeIsIgsl+JZTXwwGua2s6bW26kBLhebjCGTQ0bPxMuBrtK+hnnPCuHmYNKJThWGIguWLyW9V3V55eoZqtKzYbapTiklP1hDzD/si8yy7b7Ql/q/GQUkGE3jCVPVuBcT181fSFm1cmaU3HKYPJUdori+TQNpMqJ0RixzzZXixzaAPrDYqxPfqS1+DG1aYvB9guLskulF2tl8taEuwE1kueLs7T34ZYfUIw9FvApGjn30pJBqVDT3bdSsa2TM+IK5fjt/3iOlC1VbKCXivkT/xP8Xk/F1hnz15DsFu0SFS0w+RvOqx9kAJNU+XBQZFHD3ed3Il8Ja/XsMrbK24B/mSxa3NawmQhA7eiMlJlahMq+9qtUbEiLwmpVZc8XnZM9Gsk+EIqdRoGIKUpGMzE69IKzJnA3IUlJRNyWo79lkUtFDOFbkQwsj7PdohQ5A4wogCSk4+0x943P0cjIGutZunz86X9ToQDwTI97ioiiZJ3oZdPfW+lZenemvgD5tHlSAlRFA2COlcn3qOXJJaexcLFXEU8pmvpIMomSPjxvMF5XuRiV6dnW+pPGT3cXgTK1MjV0dP
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(396003)(136003)(39840400004)(376002)(346002)(451199015)(966005)(478600001)(6486002)(66556008)(9686003)(6512007)(6666004)(6506007)(26005)(186003)(41300700001)(83380400001)(7416002)(8936002)(8676002)(4326008)(66946007)(5660300002)(66476007)(44832011)(2906002)(7406005)(38100700002)(316002)(6916009)(54906003)(33716001)(86362001)(109320200003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?j7/8H9CM7YJdDAwCV8I+d5Ij30ad30b74/Qy8l8/hOVB1kU1qFOKC3ORmalO?=
 =?us-ascii?Q?GVCJeVa5+UBpmi7mYgyBhS27syoyLSJ0SQVMXyJIjtPuPVfrbeTmATkJ41hY?=
 =?us-ascii?Q?0m/GWYrGo/mdUx5HAkSrgOFlN+m3aYyZJRZzoQgbi9EdfYX/NK5tAQisGaUL?=
 =?us-ascii?Q?Pro+k42YiV7nA+jBIN/V15w0wtiAYJbwf85VsZ/0gdiiCrTEhBPM3OienPnr?=
 =?us-ascii?Q?gmldg1eBMIhH+srKP7oo9+b2f1ZsvJimG/6tTs7NOwb931yoOz7wKpiQd3rG?=
 =?us-ascii?Q?MOZ/HRuw7m3XG+99ue2WW9HQF+H+7BKsSTnylaSxF25voKGkeBE99RlqUwVk?=
 =?us-ascii?Q?/r1AsiiL8qXVByGqJtGjlal0LWgv2HkP9Jz7eVNP84sTlmYlADIkRZ9ZJBO1?=
 =?us-ascii?Q?5mPAu/x/0MIOl2i0O8agLyCMvwFmL4MZIopnCh/dSLh9jRB0MxrjdEkY8sF4?=
 =?us-ascii?Q?ifP6UXalqYWW7LIxR2xRNUR2iN4IWyefPP4htKH2G1CiQRiPm4qNupVv8wg6?=
 =?us-ascii?Q?8IwM9FglDHxhXYenTlQoxXiO2k2RaheAQOQiZI5YdUBi1MR/Zqvf1R0mI2vo?=
 =?us-ascii?Q?KTy/aw8kASz5traI+XapUG5M9pJj1nyeW+kNhjacXBeHM7gGAehAkW1BLQoA?=
 =?us-ascii?Q?gsAqq4kG72eA0CNmNIrWJnxX+7fEx1NPr9s7NVEAiBt137fBKtE0t1/qhFa5?=
 =?us-ascii?Q?nv5wwjt7+IxhyhlDoJw7+gApwnFUZkhzyT0mNJXY7t3yaDcIbPmyoqn6ELS5?=
 =?us-ascii?Q?kVExs30+0bzoETqdex6iKzr9C89z9adzXOpGErlgKYXnWRef/XyeZY5JLElZ?=
 =?us-ascii?Q?CNc1ChOb/BX2yz4hp6LG29iKpW/uhNC1jgjrjvruYbMpSuByXT1YeDZEWLBQ?=
 =?us-ascii?Q?E2pyaOez9TwzOI5h2kOz2VZklGsD5luvUmA/nMKAdgCvvrrhEj/Wz+j7zZhQ?=
 =?us-ascii?Q?v/WU9+T6ayJbdraVXJmrSFnrQNI1DiRRVYRKCjwbtAslwI/6Ckiyn24lEHCE?=
 =?us-ascii?Q?Uw8F4wEWmdStyJl+tSkuRFkesLSwsMhzzbxvOZOnpjdYB06BuTSLW9Db5O+1?=
 =?us-ascii?Q?AwvoN4vEZ/y+e+iqgCrqCNTdHOAgewBiGdIh3JQLfJ+2FNQxi1qvmqnfeEM6?=
 =?us-ascii?Q?dP+RBw0Run3ZOu9a5KeG2wXKh0FKIW95thXTsKv2JdWDLJCB8Of50vqxnOCs?=
 =?us-ascii?Q?Xt6ZHyMuPpQTOaFa9qEIU4Zqafm0mHySv8OSD6LV0iolwfKaPwS4/+vnptGZ?=
 =?us-ascii?Q?CzH5P+ZWh+Rz23tXuUmWvTr1iU62fH7pgBrq8XcXK0XgTxyoX9cZFYpc9pST?=
 =?us-ascii?Q?BLbnbm1yY/Igq3pcAh/aqJXL87ACruLaSj+f1lgUJj0MheVmmic6elNXrtRT?=
 =?us-ascii?Q?Xztqq3QtSnkhhSClqFWEJS1QB3gN4RULMo7e3ElO9W20tj5Ydx1fM3oIf7LZ?=
 =?us-ascii?Q?x45SFXRTn2yDE1Yh+drMkX5MN8bG/F3E2avnpkTLWvzTtpnuK01RvRaTsAgY?=
 =?us-ascii?Q?xrxvObFrrRX6x6+ATPLeIBiXrh19jOUyDDFnyWL4xMDXw5kfL1YigY+KNOCH?=
 =?us-ascii?Q?HgLN0hY4K8dz7ZDjaibdfyP9aNk07tyQAvJufk6e3WKBXnMIHJCCDL+dfUm3?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc3d02f-12e1-4d1a-3521-08dad7fda7e2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 02:49:27.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOPcguqsWMRTdT4CGcIIpDcHnWwAQDiqeQ8mRQtcyh94jvUbYDnE0kWyMi1jW6bt9rgfAA+8VY0uq1surHxnz3o4OClPzX6KCxj15vBcm5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_184934_051929_A30BC46A 
X-CRM114-Status: GOOD (  18.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 06, 2022 at 05:50:49PM +0200, Vladimir Oltean wrote:
> On Fri, Dec 02, 2022 at 12:45:58PM -0800, Colin Foster wrote:
> > --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/net/dsa/dsa-port.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Ethernet Switch port Device Tree Bindings
> > +title: Generic DSA Switch port
> 
> What are the capitalization rules in titles? Looks odd that "port" is
> lowercase but "switch" isn't.

Agreed. A quick grep for "title:\ " shows... a fair amount of
inconsistency. I'd lean toward Port. [insert nautical and/or fortified
wine joke here]

> 
> >  
> >  maintainers:
> >    - Andrew Lunn <andrew@lunn.ch>
> > @@ -14,8 +14,7 @@ maintainers:
> >  description:
> >    Ethernet switch port Description
> >  
> > -allOf:
> > -  - $ref: /schemas/net/ethernet-controller.yaml#
> > +$ref: /schemas/net/ethernet-switch-port.yaml#
> >  
> >  properties:
> >    reg:
> > @@ -58,25 +57,6 @@ properties:
> >        - rtl8_4t
> >        - seville
> >  
> > -  phy-handle: true
> > -
> > -  phy-mode: true
> > -
> > -  fixed-link: true
> > -
> > -  mac-address: true
> > -
> > -  sfp: true
> > -
> > -  managed: true
> > -
> > -  rx-internal-delay-ps: true
> > -
> > -  tx-internal-delay-ps: true
> > -
> > -required:
> > -  - reg
> > -
> >  # CPU and DSA ports must have phylink-compatible link descriptions
> >  if:
> >    oneOf:
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> > new file mode 100644
> > index 000000000000..3d7da6916fb8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> > @@ -0,0 +1,25 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/ethernet-switch-port.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic Ethernet Switch port
> > +
> > +maintainers:
> > +  - Andrew Lunn <andrew@lunn.ch>
> > +  - Florian Fainelli <f.fainelli@gmail.com>
> > +  - Vivien Didelot <vivien.didelot@gmail.com>
> > +
> > +description:
> > +  Ethernet switch port Description
> 
> Sounds a bit too "lorem ipsum dolor sit amet". You can say that a port
> is a component of a switch which manages one MAC, and can pass Ethernet
> frames.

Good suggestion again. Happy to change this as well. I'm planning to
send an update late tomorrow (Wednesday) to give a couple days before
Sunday. Hopefully that's enough time for any suggestions on these last
couple issues.


