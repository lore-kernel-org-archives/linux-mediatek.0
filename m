Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 03:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdUwf4oCP6VLBqM/ChBqBxnCloDSW9uJwzwsP99EfOQ=; b=eFUdATm5Rywk2J
	jvmhP+xPofg/N9aBqPGdCqs5OaUGIocVV+1ySxdTPA+T0Rc0q+LC84q748kffBcgO591htC2eMZbw
	FXZxvt5simOTpEb+oHgK19kT5E7/UrmavXnSI5ZZck78eYorwf6cnCLObWb2B3QB9h7TYbGJDe6h3
	lDqMwlzCaCvSRxpZtmdvpVq+GG/7MM25703ZG1CIwT6iZRx9BYeyATTcbohTrQzYCFFW+HAF+PSPh
	PYbQoewBRF1XCOC+vVX6NGvWNSyaCqDdyAVSzKiSm25+CLzDrqTOC4ckyrB5psnbv3eweBQUPa8Ol
	zxyzFFupeCyDH6YJcpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nliq5-003WFp-HR; Tue, 03 May 2022 03:04:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlipv-003WDR-8Q; Tue, 03 May 2022 03:04:28 +0000
X-UUID: 8815a85ea2cd4a1f88fdee3bf6cb5aa8-20220502
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a3e092ca-8889-4192-a5af-52f83d5f48a2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:5b5842c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8815a85ea2cd4a1f88fdee3bf6cb5aa8-20220502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1074321624; Mon, 02 May 2022 20:04:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 May 2022 19:54:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 10:54:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 10:54:13 +0800
Message-ID: <bb99742f40762d18baa342e7f5ee697fe5a86c09.camel@mediatek.com>
Subject: Re: [PATCH V5 12/16] dt-bindings: reset: mediatek: Add infra_ao
 reset bit for MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 3 May 2022 10:54:09 +0800
In-Reply-To: <c56464d3-d33d-1797-2c98-67bec34df756@collabora.com>
References: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
 <20220428115620.13512-13-rex-bc.chen@mediatek.com>
 <839978c5-c337-7784-a04f-26b9883c703b@linaro.org>
 <c56464d3-d33d-1797-2c98-67bec34df756@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_200427_336122_A40C924B 
X-CRM114-Status: GOOD (  30.11  )
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

On Mon, 2022-05-02 at 16:54 +0800, AngeloGioacchino Del Regno wrote:
> Il 29/04/22 23:13, Krzysztof Kozlowski ha scritto:
> > On 28/04/2022 13:56, Rex-BC Chen wrote:
> > > To support reset of infra_ao, add the bit definitions for MT8195.
> > > The infra_ao reset includes 5 banks and 32 bits for each bank.
> > > 
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >   include/dt-bindings/reset/mt8195-resets.h | 170
> > > ++++++++++++++++++++++
> > >   1 file changed, 170 insertions(+)
> > > 
> > > diff --git a/include/dt-bindings/reset/mt8195-resets.h
> > > b/include/dt-bindings/reset/mt8195-resets.h
> > > index a26bccc8b957..463114014483 100644
> > > --- a/include/dt-bindings/reset/mt8195-resets.h
> > > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > > @@ -7,6 +7,7 @@
> > >   #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> > >   #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> > >   
> > > +/* TOPRGU resets */
> > >   #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> > >   #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> > >   #define MT8195_TOPRGU_APU_SW_RST               2
> > > @@ -26,4 +27,173 @@
> > >   
> > >   #define MT8195_TOPRGU_SW_RST_NUM               16
> > >   
> > > +/* INFRA RST0 */
> > > +#define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
> > > +#define MT8195_INFRA_RST0_RSV0			1
> > > +#define MT8195_INFRA_RST0_DISP_PWM1_SWRST	2
> > > +#define MT8195_INFRA_RST0_RSV1			3
> > > +#define MT8195_INFRA_RST0_MSDC3_SWRST		4
> > > +#define MT8195_INFRA_RST0_MSDC2_SWRST		5
> > > +#define MT8195_INFRA_RST0_MSDC1_SWRST		6
> > > +#define MT8195_INFRA_RST0_MSDC0_SWRST		7
> > > +#define MT8195_INFRA_RST0_RSV2			8
> > > +#define MT8195_INFRA_RST0_AP_DMA_SWRST		9
> > > +#define MT8195_INFRA_RST0_MIPI_D_SWRST		10
> > > +#define MT8195_INFRA_RST0_RSV3			11
> > > +#define MT8195_INFRA_RST0_RSV4			12
> > > +#define MT8195_INFRA_RST0_SSUSB_TOP_SWRST	13
> > > +#define MT8195_INFRA_RST0_DISP_PWM_SWRST	14
> > > +#define MT8195_INFRA_RST0_AUXADC_SWRST		15
> > > +#define MT8195_INFRA_RST0_RSV5			16
> > > +#define MT8195_INFRA_RST0_RSV6			17
> > > +#define MT8195_INFRA_RST0_RSV7			18
> > > +#define MT8195_INFRA_RST0_RSV8			19
> > > +#define MT8195_INFRA_RST0_RSV9			20
> > > +#define MT8195_INFRA_RST0_RSV10			21
> > > +#define MT8195_INFRA_RST0_RSV11			22
> > > +#define MT8195_INFRA_RST0_RSV12			23
> > > +#define MT8195_INFRA_RST0_RSV13			24
> > > +#define MT8195_INFRA_RST0_RSV14			25
> > > +#define MT8195_INFRA_RST0_RSV15			26
> > > +#define MT8195_INFRA_RST0_RSV16			27
> > > +#define MT8195_INFRA_RST0_RSV17			28
> > > +#define MT8195_INFRA_RST0_RSV18			29
> > > +#define MT8195_INFRA_RST0_RSV19			30
> > > +#define MT8195_INFRA_RST0_RSV20			31
> > 
> > These are not proper IDs... don't work-around usage of bits with
> > fake
> > reserved IDs...
> 
> Hello Krzysztof,
> 
> Actually, I get that it may seem that Rex is trying to cheat with
> fake
> reserved numbers... but it's really how the registers are laid out:
> there
> really are reserved bits in between used reset bits.
> 
> I don't think that the reserved bits are doing anything though, so
> the
> best way to proceed is to just remove them and map the dt-bindings
> IDs to
> the HW register's bits in the driver instead.
> Even though the current approach is very simplistic, I agree that
> this is
> not how it's supposed to be done (and I'm sort-of sad about that).
> 
> Rex, please map these values in the reset driver so that, in this
> header,
> you'll get something like:
> 
> #define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
> #define MT8195_INFRA_RST0_DISP_PWM1_SWRST	1
> #define MT8195_INFRA_RST0_MSDC3_SWRST		2
> #define .... (etc)
> 
> Cheers,
> Angelo
> 
> > 
> > Best regards,
> > Krzysztof
> 
> 

Hello Krzysztof and Angelo,

Thanks for your advice and review.
I will modify my driver using index and I will just add some reset we
curreently use.

reset.h will list like this:

#define MT8195_INFRA_RST0_THERM_CTRL_SWRST	0
#define MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST	1
#define MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST	2

For this, I will add a new mode for input argument because we alos need
to be compatible with previous reset drivers.
For input argument with different mode: 
enum MTK_RST_CTRL_MODE {
	MTK_RST_CTRL_BIT_MODE = 0,
	MTK_RST_CTRL_INDEX_MODE,
};

If register MTK_RST_CTRL_INDEX_MODE for reset controller, I will
implent new xlate function to transfer the index to offsets.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
