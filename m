Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B150DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 10:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB0922288
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 10:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB0922288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xb9ya8G+3tev1m3pm/WwJbmwP0mZ4z2ZpAXsfYY++r0=; b=J4iD988RdO570MrdRhMaiZwVR
	Le3P5VZ7onNS3ozoJRA8/tLt3AH7pIbILBK8xtU/B0dnedFqniaKR9SAE7UuBnEDLX4KoKSSuKbcD
	tAaTcLzfRC1cYAjq725tDicgBbg9q0r+q4RjNHM/O0hw9lbORz97msCUuGWRvLN8p+F0ekE1lQ/5Y
	5h6PEZQTgq3pV+1Ad8RXffZUFm01XtcB9HvukdS9YtB3UNpbJ4dBuIroHVGIfZMJP1cMDwpYq5Cm6
	LIBgyEay52QfYDPpmLJsr9stHwOr/qA0Ve22sb5lffMM4wG3v0jR7nmPf9sSPZpnEt0/ZxPkMK/nl
	VLZuTjaZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks0yp-0001SE-Uj; Wed, 23 Dec 2020 10:02:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks0yj-0001QP-RB; Wed, 23 Dec 2020 10:02:46 +0000
X-UUID: 181c65a5a2984b3aba8c58b84b0cb475-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vr5A2JBVZ/YhzPjaegMhl5R2Mqj+btrfDGHqq1PAzkU=; 
 b=qJJtDA+tcKnIvTiNzWSNOZgwouKT8/TMEneT1OC207fyLUepp+N2353i19X2CiInmqvDDN9cDHtcDbKm0qYPMa9KPETQoPnf9T5Avvyfu8xpdtXDwMfpB+J3/je6O00PkrnsUupALl7NRJcgzD6cA8BTn/8Sm6aZRvZwmo1EpXs=;
X-UUID: 181c65a5a2984b3aba8c58b84b0cb475-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382256912; Wed, 23 Dec 2020 02:02:41 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 01:52:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 17:52:31 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 17:52:31 +0800
Message-ID: <1608717152.29691.1.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] arm64: dts: mt6779: Support devapc
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 23 Dec 2020 17:52:32 +0800
In-Reply-To: <1608713092-26952-2-git-send-email-neal.liu@mediatek.com>
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_050246_082489_93D6C567 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Hanks Chen =?UTF-8?Q?=28=E9=99=B3=E5=BD=A5=E5=BB=B7=29?=
 <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>,
 Jackson-kt Chang =?UTF-8?Q?=28=E5=BC=B5=E5=9C=8B=E6=BE=A4=29?=
 <Jackson-kt.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+add comments & reviewed-by Hanks

On Wed, 2020-12-23 at 16:44 +0800, Neal Liu wrote:

Support DEVAPC on MT6779 platforms by adding device node.

Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 370f309..52ecfc7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -189,6 +189,14 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		devapc: devapc@10207000 {
> +			compatible = "mediatek,mt6779-devapc";
> +			reg = <0 0x10207000 0 0x1000>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> +			clock-names = "devapc-infra-clock";
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt6779-uart",
>  				     "mediatek,mt6577-uart";

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
