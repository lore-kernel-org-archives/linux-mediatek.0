Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59956C30658
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSMC+c4D+91oQ/aFTj4qOoq5RazmFV0oKchLh0O2OvE=; b=GHPB3eygTd8RRa87crK2kE16LN
	q6NAjvw3541D+yqLtzQZK633SmwBJaAyhWTGsxDnX2ZLjuqsQo8vHnyGsQ0IIRgGJesAYWo7d6940
	dOVgFpKZUZffGyLTALxzFiujfMsrHIFSc6A2FFwRIdmdBjw1LpyVQghsfFaMhMNtGspq5Df0S+0aB
	NDACB4+UrxXbBFJxGQ6EoeOGmYiUU5muPMJHNSQeFBb3P3RE8RSTxqlxlkB4xGYDb+Qoi7JYYewLA
	cCQbocFfLDhqgkF8tKIanYAR1WGhJfzQ+OYuF6ltzUkM77Aa8p853tE0HAmyptIruE9JOsz9Mqgdy
	2OjUp8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZSG-000000064jh-2w35;
	Tue, 02 Jul 2024 09:05:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZSD-000000064j0-0gCb;
	Tue, 02 Jul 2024 09:05:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sOZS4-00000000346-1GZX;
	Tue, 02 Jul 2024 09:05:28 +0000
Date: Tue, 02 Jul 2024 09:05:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Elad Yifee <eladwf@gmail.com>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next=5D_net=3A_ethernet=3A_m?=
 =?US-ASCII?Q?ediatek=3A_Allow_gaps_in_MAC_allocation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <3bda121b-f11d-44d1-a761-15195f8a418c@intel.com>
References: <379ae584cea112db60f4ada79c7e5ba4f3364a64.1719862038.git.daniel@makrotopia.org> <3bda121b-f11d-44d1-a761-15195f8a418c@intel.com>
Message-ID: <C24C4687-1C00-434D-8C37-BDB85E39456C@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_020537_223367_1A3BBFB2 
X-CRM114-Status: GOOD (  13.52  )
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



On 2 July 2024 06:58:22 UTC, Przemek Kitszel <przemyslaw=2Ekitszel@intel=
=2Ecom> wrote:
>On 7/1/24 21:28, Daniel Golle wrote:
>> Some devices with MediaTek SoCs don't use the first but only the second
>> MAC in the chip=2E Especially with MT7981 which got a built-in 1GE PHY
>> connected to the second MAC this is quite common=2E
>> Make sure to reset and enable PSE also in those cases by skipping gaps
>> using 'continue' instead of aborting the loop using 'break'=2E
>>=20
>> Fixes: dee4dd10c79a ("net: ethernet: mtk_eth_soc: ppe: add support for =
multiple PPEs")
>> Suggested-by: Elad Yifee <eladwf@gmail=2Ecom>
>> Signed-off-by: Daniel Golle <daniel@makrotopia=2Eorg>
>> ---
>> Note that this should go to 'net-next' because the commit being fixed
>> isn't yet part of the 'net' tree=2E
>
>makes sense, and the fix is correct, so:
>Reviewed-by: Przemek Kitszel <przemyslaw=2Ekitszel@intel=2Ecom>

Thank you the fast review!

>what about:
>4733=E2=94=82 static int mtk_sgmii_init(struct mtk_eth *eth)
>4734=E2=94=82 {
>4735=E2=94=82         struct device_node *np;
>4736=E2=94=82         struct regmap *regmap;
>4737=E2=94=82         u32 flags;
>4738=E2=94=82         int i;
>4739=E2=94=82
>4740=E2=94=82         for (i =3D 0; i < MTK_MAX_DEVS; i++) {
>4741=E2=94=82                 np =3D of_parse_phandle(eth->dev->of_node, =
"mediatek,sgmiisys", i);
>4742=E2=94=82                 if (!np)
>4743=E2=94=82                         break;
>
>should we also continue here?

Good point=2E As sgmiisys is defined in dtsi it's not so relevant in pract=
ise though, as the SoC components are of course always present even if we d=
on't use them=2E Probably it is still better to not be overly strict on the=
 presence of things we may not even use, not even emit an error message and=
 silently break something else, so yes, worth fixing imho=2E

>
>4744=E2=94=82
>4745=E2=94=82                 regmap =3D syscon_node_to_regmap(np);
>4746=E2=94=82                 flags =3D 0;
>4747=E2=94=82                 if (of_property_read_bool(np, "mediatek,pns=
wap"))
>4748=E2=94=82                         flags |=3D MTK_SGMII_FLAG_PN_SWAP;
>4749=E2=94=82
>4750=E2=94=82                 of_node_put(np);
>4751=E2=94=82
>4752=E2=94=82                 if (IS_ERR(regmap))
>4753=E2=94=82                         return PTR_ERR(regmap);
>4754=E2=94=82
>4755=E2=94=82                 eth->sgmii_pcs[i] =3D mtk_pcs_lynxi_create(=
eth->dev, regmap,
>4756=E2=94=82 eth->soc->ana_rgc3,
>4757=E2=94=82                                                          fl=
ags);
>4758=E2=94=82         }
>4759=E2=94=82
>4760=E2=94=82         return 0;
>4761=E2=94=82 }
>
>

