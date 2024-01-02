Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A51C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 19:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGWoUo2kZlWi4+ZRV37RZOEE77veWDQM4/zk4+0W71I=; b=neBLXBmqA9jrcM
	wweOasGqFFtC6v4y7I2zHVf2MhIIfQuNBPv9gpOXT0ljn+wgiD5+p4S48kZgf7AMkAoSk2XtgifwM
	81YOU2rr5CnvqTycl3XsLCRcT0JXNX7188s8FSTTEJ8Zi0677V3qXZWlfiQ4II8hsw1dF9bsdvncT
	sFnMRvCSRy8IccGT5gZB0toLOHJ1GEnH5ZqBUsrzjebcpjko5J3ZbrOOOBJy9Pe5K/gx8WLepIRBp
	naAxJGsEk/ZRrk9OnsCCasezFbHr/wyyOCkczC82hwGgug8s2wVcyo2KQO1kXWep6dLDD0lDeUiIA
	yem8X7vqEzawEih3SdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKkWJ-008qpG-1r;
	Tue, 02 Jan 2024 19:33:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKkWE-008qnQ-2K;
	Tue, 02 Jan 2024 19:33:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50e7dd8bce8so6921962e87.1;
        Tue, 02 Jan 2024 11:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704224016; x=1704828816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGWoUo2kZlWi4+ZRV37RZOEE77veWDQM4/zk4+0W71I=;
        b=QqP4ys1UBJF1djwNz/agrIdv1bPghuiTqjdRZpUtSp7NaJrE1fo52rXhGwzPLJDLG3
         xIXGt9GmPUJE0ou80ammxZju1tQlVYorzjliLMFlGkeKvU1je5O4KndPTJc13T1+v8ue
         7IjWlaXbECsn1RacNaJRydYFIAmGTDS0UCtK67RI14gRAN45R72mf2AIcPz7z17FHgF2
         uOM8ucQUHja7ZAE8vg+PAvMW6FE3VtcjEYmsktrkS53KVOAqwqGvvWchceiS111DUmAS
         uNoQzQUNxC1RkndqKSpOzgwl4an/dyGCtDeS0AYSvwyAW9xU3zYNYNmf+jjlAzh8f9yN
         q8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704224016; x=1704828816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGWoUo2kZlWi4+ZRV37RZOEE77veWDQM4/zk4+0W71I=;
        b=vIPT1KQPa4aKoBn4bX0Q17j2Av87v8V9lt+pADwGYte9+eVOi2XFfM5dgb7sMWQ61E
         lUMQuLhWgO4kGo11yorbzZLr0/TrqUPqEYujnuPI3oYXrxyiUZhhov+WoZPKiqaDtObH
         8NhPJSQJ/memFToUmi5oHY1Ejbpka3HILPNkIejDvYdDYiOeA55jfq86xJxfiThzo3HT
         cz+KfDGMM7n5sKIDTg6dogEFkm13r+/TQIjq96lxsU2K22eZV99AP4kyjhi7/fUWtm0a
         s7cyFwt9un4zv2CUN8QSpvuWtDCv2CasAeQQYkCiAMsWqdPaFqqVs2g3PMHBhLudFaPC
         Aa/w==
X-Gm-Message-State: AOJu0YwVB/Ku3K6gQQC+5G4qjTvsZmHVq05PUExEGGMau/oezytdkFX/
	eWyM//fX01LdGwqhKCHsPr4Zd0IMvsXPBg==
X-Google-Smtp-Source: AGHT+IHAMCc2uUTYdMnHH6EZ3MG+3mPuQY5aw/m25i+1vyPNfiDcSX8Fpt45zOIL54FWe3//85BuDQ==
X-Received: by 2002:a19:5e56:0:b0:50e:80d2:4dd2 with SMTP id z22-20020a195e56000000b0050e80d24dd2mr4459004lfi.103.1704224015732;
        Tue, 02 Jan 2024 11:33:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id x14-20020a19e00e000000b0050e7433d7d7sm3205889lfg.52.2024.01.02.11.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 11:33:35 -0800 (PST)
Message-ID: <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com>
Date: Tue, 2 Jan 2024 20:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix
 mtk_pcs_lynxi_get_state() for 2500base-x
From: Eric Woudstra <ericwouds@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240102074408.1049203-1-ericwouds@gmail.com>
 <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
 <92190426-3614-4774-9E9F-18F121622788@gmail.com>
Content-Language: en-US
In-Reply-To: <92190426-3614-4774-9E9F-18F121622788@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_113342_785428_CE1AA0B2 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


With some extra info:

echo "file drivers/net/phy/* +p" > /sys/kernel/debug/dynamic_debug/control

The log looks like this when sfp inserted:

With the path (on original net-next, no further modifications), Traffic OK:

[   71.212634] sfp sfp-1: mod-def0 0 -> 1
[   71.216403] sfp sfp-1: tx-fault 1 -> 0
[   71.220140] sfp sfp-1: SM: enter empty:up:down event insert
[   71.225716] sfp sfp-1: SM: exit probe:up:down
[   71.230059] sfp sfp-1: SM: enter probe:up:down event tx_clear
[   71.235803] sfp sfp-1: SM: exit probe:up:down
[   71.240195] sfp sfp-1: tx-fault 0 -> 1
[   71.243939] sfp sfp-1: SM: enter probe:up:down event tx_fault
[   71.249688] sfp sfp-1: SM: exit probe:up:down
[   71.254052] sfp sfp-1: tx-fault 1 -> 0
[   71.257810] sfp sfp-1: SM: enter probe:up:down event tx_clear
[   71.263542] sfp sfp-1: SM: exit probe:up:down
[   71.534808] sfp sfp-1: SM: enter probe:up:down event timeout
[   71.570662] sfp sfp-1: module OEM              SFP-2.5G-T       rev 1.0  sn SK2301110007     dc 230110  
[   71.580153] mtk_soc_eth 15100000.ethernet eth1: optical SFP: interfaces=[mac=2-4,22-23, sfp=23]
[   71.588848] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 10,13-14,47
[   71.598941] mtk_soc_eth 15100000.ethernet eth1: optical SFP: chosen 2500base-x interface
[   71.607605] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,00006400
[   71.619321] sfp sfp-1: tx disable 1 -> 0
[   71.623287] sfp sfp-1: SM: exit present:up:wait
[   71.636489] hwmon hwmon0: temp1_input not attached to any thermal zone
[   71.684749] sfp sfp-1: SM: enter present:up:wait event timeout
[   71.690587] sfp sfp-1: SM: exit present:up:wait_los
[   74.704872] sfp sfp-1: los 1 -> 0
[   74.708199] sfp sfp-1: SM: enter present:up:wait_los event los_low
[   74.714389] sfp sfp-1: SM: exit present:up:link_up
[   74.714422] mtk_soc_eth 15100000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control off

Without the patch, No traffic possible:

[  261.515414] sfp sfp-1: los 1 -> 0
[  261.518740] sfp sfp-1: SM: enter empty:up:down event los_low
[  261.524418] sfp sfp-1: SM: exit empty:up:down
[  261.528799] sfp sfp-1: mod-def0 0 -> 1
[  261.532541] sfp sfp-1: los 0 -> 1
[  261.535843] sfp sfp-1: SM: enter empty:up:down event insert
[  261.541406] sfp sfp-1: SM: exit probe:up:down
[  261.545748] sfp sfp-1: SM: enter probe:up:down event los_high
[  261.551481] sfp sfp-1: SM: exit probe:up:down
[  261.555859] sfp sfp-1: tx-fault 1 -> 0
[  261.559595] sfp sfp-1: SM: enter probe:up:down event tx_clear
[  261.565330] sfp sfp-1: SM: exit probe:up:down
[  261.859940] sfp sfp-1: SM: enter probe:up:down event timeout
[  261.895690] sfp sfp-1: module OEM              SFP-2.5G-T       rev 1.0  sn SK2301110007     dc 230110  
[  261.905218] mtk_soc_eth 15100000.ethernet eth1: optical SFP: interfaces=[mac=2-4,22-23, sfp=23]
[  261.913929] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 10,13-14,47
[  261.924104] mtk_soc_eth 15100000.ethernet eth1: optical SFP: chosen 2500base-x interface
[  261.932199] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,00006400
[  261.945449] sfp sfp-1: tx disable 1 -> 0
[  261.950886] sfp sfp-1: SM: exit present:up:wait
[  261.973346] hwmon hwmon0: temp1_input not attached to any thermal zone
[  262.009896] sfp sfp-1: SM: enter present:up:wait event timeout
[  262.015771] sfp sfp-1: SM: exit present:up:wait_los
[  264.842218] sfp sfp-1: los 1 -> 0
[  264.845544] sfp sfp-1: SM: enter present:up:wait_los event los_low
[  264.851770] sfp sfp-1: SM: exit present:up:link_up
[  264.851801] mtk_soc_eth 15100000.ethernet eth1: Link is Up - Unknown/Unknown - flow control off


So if phylink_mii_c22_pcs_decode_state() should not set the speed, then it is not correctly set somewhere else.

On 1/2/24 13:55, Eric Woudstra wrote:
>> Please describe your setup more fully. What is the link partner on this
>> 2500base-X link?
> 
> I use a BananaPi R3, with the oem-sfp2.5g-t module. It has the SFP quirk that disables autoneg. I was trying Marek's rtl8221b patchset, but found that even with unmodified code,  original net-next unmodified, I could get link up, but no traffic is going through.
> 
> On the other side is a.rock5b with rtl8125b.
> 
> Only after applying this patch, it works and eth1 reports link up with 2.5Gbps instead of unknown speed.
> 
> If you need more debugging info, I can supply it at a later time.
> 
> 
> On January 2, 2024 1:10:01 PM GMT+01:00, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
>> On Tue, Jan 02, 2024 at 08:44:08AM +0100, Eric Woudstra wrote:
>>> From: Daniel Golle <daniel@makrotopia.org>
>>>
>>> Need to fix mtk_pcs_lynxi_get_state() in order for the pcs to function
>>> correctly when the interface is set to 2500base-x, even when
>>> PHYLINK_PCS_NEG_INBAND_DISABLED is set.
>>
>> Please describe your setup more fully. What is the link partner on this
>> 2500base-X link?
>>
>> In PHYLINK_PCS_NEG_INBAND_DISABLED mode, this means that phylink is
>> operating in inband mode, but Autoneg is clear in the advertisement
>> mask, meaning Autoneg is disabled and we are using a "fixed" setting.
>> state->speed and state->duplex should already be initialised.
>>
>>> When the pcs is set to 2500base-x, the register values are not compatible
>>> with phylink_mii_c22_pcs_decode_state(). It results in parameters such as
>>> speed unknown and such. Then the mac/pcs are setup incorrectly and do not
>>> function.
>>
>> Since Autoneg is clear, phylink_mii_c22_pcs_decode_state() won't
>> change state->speed and state->duplex, which should already be
>> correctly set.
>>

