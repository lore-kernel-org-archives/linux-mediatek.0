Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6184CC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dzfWiXKBE+tj309kCs/onZ6dnkvYCDL4hHYz1o5FJg=; b=4gcaDbVJP2hCW2aDENj0ihBbEf
	eRPmal1Ge6NcEU2OhjJeH8dJjFSwfeKy0MvxBMpxDGLKulypwzVCg6SEbf/sWj9wGayPTkIJHOGS3
	GHnKJs/ya/6H5xORaFjxpq7Dzoddf89yNqw41SlWxUBziF2nFChi/Gr50E93Z2UuLl12F2MlYEFNJ
	DU1YlEVynF5t33NiHTsP2dPU90khnjo4ut+SSpegWlRrth2VWeQNnWW3eSM4oMkY0oi5Z/9RSakI0
	tSbUmrluSgqWIRZSHgto/9LyCydd50x3TpjLxTNFycEBdLKEYrd+OOe9c4AyxE9ni2yyZ/L1v3Iq8
	G4fbs8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfOH-00000001YQV-1Scg;
	Mon, 11 Mar 2024 13:08:29 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfOC-00000001YOq-1zyV;
	Mon, 11 Mar 2024 13:08:27 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rjfO2-0001bg-00; Mon, 11 Mar 2024 14:08:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9BF5AC0694; Mon, 11 Mar 2024 14:05:01 +0100 (CET)
Date: Mon, 11 Mar 2024 14:05:01 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Extend devicetree coverage of MT7621's UART
 interfaces
Message-ID: <Ze8BfZl0IBFmK/1a@alpha.franken.de>
References: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_060824_825605_31F2860C 
X-CRM114-Status: GOOD (  12.46  )
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

On Fri, Mar 08, 2024 at 05:56:13PM +0200, Justin Swartz wrote:
> This patchset associates the uart1_pins group with serial0 and adds
> two nodes, serial1 and serial2, that define the interface to the
> MT7621's UART2 and UART3 respectively. 
> 
> Changes in v3:
>   Added spacing between properties as requested by Arınç ÜNAL.
> 
> Changes in v2:
>   Reordered properties as requested by Sergio Paracuellos.
> 
> Justin Swartz (3):
>   mips: dts: ralink: mt7621: associate uart1_pins with serial0
>   mips: dts: ralink: mt7621: reorder serial0 properties
>   mips: dts: ralink: mt7621: add serial1 and serial2 nodes
> 
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

