Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72114C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13UEtX5YGWKXRHMyrcmYRMWbAh9SqlNU8ziC2RUtldg=; b=i7PUi4NG58UuaJ
	wsNPar+VZqLrRlQg3xbNnOI+audna27j7iTagUsuI8W/rqYTNaXIxJGpM9cHr4kbL8vWWbe6scUwE
	nUna60wCfsOe0s4Qfg8bUcgjttBB8IMyZUDjrgFHc4uXEsLBoLToalDHe8UTYp7Lzi+6UELIJLuqH
	MrJ+8prXbUueGtiPk03D+kpz1a0nnO57KeciWpmHvzs+C8HjM47ryGNemY/wAV2EWlsBqbjujyECU
	/QztwOJeF+HWhw7az5GQxDUFX/5q3WkFJFk7jFk2D7RF0vS0eWWQJkKESZHwI59Mdiqw1defkP/+5
	ZOyTE+D10fR5+fIZjkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzC4-00BgcU-WC; Fri, 20 May 2022 09:45:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzC2-00BgbO-BK; Fri, 20 May 2022 09:45:11 +0000
X-UUID: 04c33c8b63094022bc7f7d63f3e5524b-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c047dfc4-579c-4da2-bf41-97d5205bd7ca, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:ecaef0e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: 04c33c8b63094022bc7f7d63f3e5524b-20220520
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1820662098; Fri, 20 May 2022 02:45:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:35:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 17:35:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 May 2022 17:35:00 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <yassine.oudjana@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <bgolaszewski@baylibre.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <ikjn@chromium.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
 <sam.shih@mediatek.com>, <sboyd@kernel.org>, <tinghan.shen@mediatek.com>,
 <weiyi.lu@mediatek.com>, <wenst@chromium.org>, <y.oudjana@protonmail.com>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock drivers
Date: Fri, 20 May 2022 17:35:01 +0800
Message-ID: <20220520093501.28758-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <NJC6CR.M4CF312LSXXV1@gmail.com>
References: <NJC6CR.M4CF312LSXXV1@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_024510_424644_B6FBBE47 
X-CRM114-Status: GOOD (  12.99  )
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


>> 
>> Thanks for submitting this patch.
>> 
>> I compare this with drivers/clk/mediatek/clk-mt7986-apmixed.c,
>> and other clk files are using macros to make the mtk_pll_data array
>> more readable.
>
>I'd actually argue that macros make it less readable. While reading
>other drivers I had a lot of trouble figuring out which argument
>is which field of the struct, and had to constantly go back to the
>macro definitions and count arguments to find it. Having it this
>way, each value is labeled clearly with the field it's in. I think
>the tradeoff between line count and readability here is worth it.

It is easier for multiple developers to work together if we have a common style.

How do you think?

Thanks,
Miles

>
>> 
>> Would you mind following the same style for all c files, please?
>> 
>> e.g.,
>> 	static const struct mtk_pll_data plls[] = {
>> 		PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x00000001, 0, 32,
>> 				0x0200, 4, 0, 0x0204, 0),
>> 		PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x00000001, 0, 
>> 32,
>> 				0x0210, 4, 0, 0x0214, 0),
>> 		...
>> 	};
>> 
>>>  +	},
>>>  +		.reg = APLL1_CON0,
>>>  +		.pwr_reg = APLL1_PWR_CON0,
>>>  +module_platform_driver(clk_mt6735_apmixedsys);
>>>  +
>>>  +MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
>>>  +MODULE_DESCRIPTION("Mediatek MT6735 apmixedsys clock driver");
>> 
>> Would you mind changing all Mediatek to MediaTek?
>> i.e.,
>> 
>> s/Mediatek/MediaTek/
>> 
>
>Sure. Will fix it.

thanks
>
>> 
>> thanks,
>> Miles
>>  +MODULE_LICENSE("GPL");
>> 
>
>Thanks,
>Yassine
>
>
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
