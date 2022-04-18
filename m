Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deXpRSaNAQJMBZ4QKgwSlVL1V+UgIK9rvXvLjwopx2g=; b=i/e9yZvmP80eyK
	wtWBRw9nY38BNmDVZ8nEIO+WwqSpgLZTJTrggVmtPohuQwofeJpqFJqVgNn2UshW5JdpGKtJmQVSy
	67hFjbAaAi/hVoijGUlDIuiawdw6T5Ip9Nle2PqfMYostE7b4oHqoyLXWTJI740vQW63v7Z1fKG0c
	er+yETaM5bk1bjW5oTDqCo7jrF74f2tAIo638Boapse/OrV09VcasRjan9IOqGI0fGsH6ktfP63TI
	G6yUJ6FbZ3mqewxKZuTTFyQiwGDpkHUkzPGUP9TM67QXSL4P6KBub9bfvJK8/yoUXnA924tP61VIt
	ZKbsGzhPAm6kSQlQMwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGXo-00FH9o-JI; Mon, 18 Apr 2022 01:51:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGXd-00FH7m-Nu; Mon, 18 Apr 2022 01:51:03 +0000
X-UUID: 6e0190bdfed94a9381de84c667f62111-20220417
X-UUID: 6e0190bdfed94a9381de84c667f62111-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1305747108; Sun, 17 Apr 2022 18:50:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:46:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 09:46:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:46:03 +0800
Message-ID: <f4ce1101bb536e7314f23790675437ad77aff97e.camel@mediatek.com>
Subject: Re: [PATCH V3 13/15] arm64: dts: mediatek: Add opp table and clock
 property for MT8183 cpufreq
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 18 Apr 2022 09:46:03 +0800
In-Reply-To: <a1ae5616-48b8-054b-aad3-a9569eed20e1@collabora.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-14-rex-bc.chen@mediatek.com>
 <a1ae5616-48b8-054b-aad3-a9569eed20e1@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_185101_811942_CB5EFE6E 
X-CRM114-Status: GOOD (  20.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-04-15 at 14:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> > - Add cpufreq opp table.
> > - Add MediaTek cci opp table.
> > - Add property of opp table and clock fro cpufreq.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  32 +++
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 270
> > ++++++++++++++++++++
> >   2 files changed, 302 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > index f3fd3cca23e9..8953dbf84f3e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> 
> ..snip..
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 4b08691ed39e..4ae3305d16d2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -42,6 +42,244 @@
> >   		rdma1 = &rdma1;
> >   	};
> >   
> > +	cluster0_opp: cluster_opp_table0 {
> 
> Please don't use underscores in devicetree for anything that's not a
> phandle.
> 
> 	cluster0_opp: cluster0-opp-table {
> 
> > +		compatible = "operating-points-v2";
> > +		opp-shared;
> > +		opp0_00 {
> 
> Apart from the underscore being invalid, across the kernel, you can
> find many
> instances of opp tables, containing names related to the frequencies,
> so, for
> consistency (this is not a rule!), perhaps it would be a good idea to
> do so.
> 
> 		opp-793000000 {
> 
> > +			opp-hz = /bits/ 64 <793000000>;
> > +			opp-microvolt = <650000>;
> > +			required-opps = <&opp2_00>;
> > +		};
> > +		opp0_01 {
> 
> 		opp-910000000 {
> 
> > +			opp-hz = /bits/ 64 <910000000>;
> > +			opp-microvolt = <687500>;
> > +			required-opps = <&opp2_01>;
> > +		};
> > +		opp0_02 {
> 
> ..snip..
> 
> > +		opp0_15 {
> > +			opp-hz = /bits/ 64 <1989000000>;
> > +			opp-microvolt = <1050000>;
> > +			required-opps = <&opp2_15>;
> 
> P.S.: Please fix the typo below!
> 
> > +		};	};
> > +
> > +
> 
> ...also...
> 
> > +	cci_opp: opp_table2 {
> 
> 	cci_opp: cci-opp-table {
> 
> > +		compatible = "operating-points-v2";
> > +		opp-shared;
> > +		opp2_00: opp-273000000 {
> 
> This one is fine instead :))
> 
> Cheers,
> Angelo

Hello Angelo,

OK, I will modify this issue in next version.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
