Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F7C77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyXrnPA+SkyO4YF2T9X8RYQ0xk0l+3Tn+Ec/OwFQBKE=; b=mVp2LrprflogZw
	IvZNSvSMYR7AXU2tvQIdSKbeaMh8JDGupYZu3z4hIVmcQqc6LTuk637ygIoJm6aObx5msjkCG9sK+
	NVFz8vnRnpqWP7fJtINXvlNAZAEsqAVny7LG71HsOW/DNnhJ8IYWI4wVI1mZ+2j469XtnfWfLEOc6
	fH+qPRO5RWwQ4plhD8y2Nu1g4J1yBQUexgp+klSHPirw5Xl+BSHl4reiB/ugYxQhp0gyiK9ua2hCg
	7iEnOAoZjPjwekiFowSzKgTPgoWe3RAs3EtLsbirjt5UNCnbLQx0qvXgjoM17KTXjwNgU/7cbhVSS
	lWy1D5wOc7iwZMu+YeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptufY-002MAs-2M;
	Tue, 02 May 2023 18:24:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptufU-002M9j-2o;
	Tue, 02 May 2023 18:24:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1aaec6f189cso21971465ad.3;
        Tue, 02 May 2023 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683051843; x=1685643843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyXrnPA+SkyO4YF2T9X8RYQ0xk0l+3Tn+Ec/OwFQBKE=;
        b=YB3v24W5xyeIsoNG7b4+SsjsszwJ3V0SySFaHCag1NHc5VerC3c+LYDwV/XE4Grcq0
         vgNCiPnTKvne6m5fX2vS3b4cYJqPco33DYRyolpueX6jDt6fQa286O1tuqW0HgxKQmDn
         Q/uMBim4/mqZwHJyxvd5SvFirWVaW9KqGmc3snJN1i4jj1sR9s212WJZXx2z6u7cfq76
         fV9G//AsBOZOKrPdDCOiDCIVWXVmhWynfosVRX0JmDSZ7axiC38HmCrvM1g6hdY6Sjrb
         pLOnHMylqAUsq2xAhtrRJqmshs4qMrpsHqfKESfZSRJ2oeDgnMHqg90cRePvpvgwdk5x
         auEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683051843; x=1685643843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyXrnPA+SkyO4YF2T9X8RYQ0xk0l+3Tn+Ec/OwFQBKE=;
        b=XCKtJ5qsKxPm7NAp9bmIBp0kVsOFzFhsVq/2mA9qAO21CrtkHXWxJueCydq+PuRnZV
         plJOsZHWa+sgUcbHYzOtn0dYyfStSiBwK5top6KypTwrvRt0MEfI8I9+qbMoBlFkoem4
         NZburInvXo+QmPz9gBeW+Qj5o7Hkx4y3YAwc4ZGVtnOb3CFt8GZrgWE1NpA70WB4ZdLe
         NU6WIi/RD/+sO22uO2owgWxp/suKtEufRESGpuW9JNEoJcqnGh/GDdkdHpcGexS1nIil
         JHEKuA2sXFJ6St+QycI3rjVa79KXZ1Q33tAoxIdDkLqLr/V+Y2GDKqjZ0W5BfQQ/jlbF
         09mg==
X-Gm-Message-State: AC+VfDxFfFR9DY1m9YRA0b453cJKh0Hd8y08fnuHkocvo6MopsXCd5nV
	Oxf/ecfuGWoH7latRLyjSps=
X-Google-Smtp-Source: ACHHUZ4LK12ztNRyp7y/Em4paeVtiFv9NYBulnnc1VUZwjGW57iY/+aNCpzRFQOFa4xyZqxiBXtfHw==
X-Received: by 2002:a17:902:ec8d:b0:1a6:566b:dd73 with SMTP id x13-20020a170902ec8d00b001a6566bdd73mr23045645plg.60.1683051843232;
        Tue, 02 May 2023 11:24:03 -0700 (PDT)
Received: from [10.69.71.131] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id jj2-20020a170903048200b001ab016e7916sm3072086plb.234.2023.05.02.11.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 11:24:02 -0700 (PDT)
Message-ID: <6dd0ae37-9de9-c1fa-002c-b2b114b094a5@gmail.com>
Date: Tue, 2 May 2023 11:24:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: fix corrupt frames using trgmii
 on 40 MHz XTAL MT7621
Content-Language: en-US
To: arinc9.unal@gmail.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20230501121538.57968-1-arinc.unal@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230501121538.57968-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_112404_917099_EFB6F218 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/1/2023 5:15 AM, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The multi-chip module MT7530 switch with a 40 MHz oscillator on the
> MT7621AT, MT7621DAT, and MT7621ST SoCs forwards corrupt frames using
> trgmii.
> 
> This is caused by the assumption that MT7621 SoCs have got 150 MHz PLL,
> hence using the ncpo1 value, 0x0780.
> 
> My testing shows this value works on Unielec U7621-06, Bartel's testing
> shows it won't work on Hi-Link HLK-MT7621A and Netgear WAC104. All devices
> tested have got 40 MHz oscillators.
> 
> Using the value for 125 MHz PLL, 0x0640, works on all boards at hand. The
> definitions for 125 MHz PLL exist on the Banana Pi BPI-R2 BSP source code
> whilst 150 MHz PLL don't.
> 
> Forwarding frames using trgmii on the MCM MT7530 switch with a 25 MHz
> oscillator on the said MT7621 SoCs works fine because the ncpo1 value
> defined for it is for 125 MHz PLL.
> 
> Change the 150 MHz PLL comment to 125 MHz PLL, and use the 125 MHz PLL
> ncpo1 values for both oscillator frequencies.
> 
> Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/81d24bbce7d99524d0771a8bdb2d6663e4eb4faa/u-boot-mt/drivers/net/rt2880_eth.c#L2195
> Fixes: 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
> Tested-by: Bartel Eerdekens <bartel.eerdekens@constell8.be>
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

