Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0D1C636CA
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2718613BB
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2718613BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CenL0S95gQlLgpNLgnKeBWVdTW0wWa5eKiaz8SRRh3g=; b=Lg2CiFJkF9ET6J
	qKaag5EW40EXi3zCpYJeDMw5zEPtJGVVOz9oOYRkDWmirJSXQWUSeGHgfrbIyyQcz0/7Qq1nJDvBe
	IeyKzVu91PjA0IdqQdysTiRhKQD7tEPrHXwIxeMSNmssWITsbLhLSp2r2/RFsE1h0iixU1aYjsXXn
	SYMXO9epQjlpN2liI1Bp2tcOivOEMFZ4qGC2XHlBIVRInRZ26oBxYFZs6cON+Wf8JUg/HS1WYqim8
	sVClCmT2iHdXYbDChh7YzcY146brK4i5faaEcgRVcdYS42hqZizP9hcWto5mRv/WlqogLWAPU2Il6
	sq5QMIz4IpWJRplMjbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4fOk-0067sA-Bt; Sat, 17 Jul 2021 08:10:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4fOX-0067qT-0T; Sat, 17 Jul 2021 08:09:58 +0000
Received: by mail-ej1-x636.google.com with SMTP id v20so18892103eji.10;
 Sat, 17 Jul 2021 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=0PC1GdkYY+PBBRzD0FwMonDpEhuRkLmD9anK7ZjygqU=;
 b=gMBzf9tXlsjrEBxfrcD9XGMe3rpOz+RdQbsCd7Vl+yQc1oiG1DA88QG67VZa8MebWH
 /BBnoZDbofYQi5+5gyJWL06FIo+LbaTPNFL13kDbsMhgQhq3LNJaMDaRyDpjECBHN2jx
 WSOdfXacfbKl3T2/actz+uBstLtYl7Zufj0iVtCgaiRNJg8wNnA90ngx8ACX0yisoLAc
 TaIvKhK0iROT+noiDiMOczjTof0n94hloeV6Vrx7DqziuGpSJa8gP+Ovzs1JtH4arxg1
 cfBacZL2JR2uCOPngFVip9sZe1ahDtlJ5hYjfbCGXPBL3/Gj2ariCTPKKI/eKatXxGbY
 6AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=0PC1GdkYY+PBBRzD0FwMonDpEhuRkLmD9anK7ZjygqU=;
 b=g4eceK5uacq+dt5f/RMPv/BU6QrBn5VHOhipPt61111Y+UPLNMrPMNTa38pH1vld6d
 i5VmZoVZrTC8N15ASTecVvSMEmvza4dF8Y9UE1X1mG+HUdiAdmaLmD3SdWLfej2xDBUW
 C3sy0+bXRoddXDKYBZve9KaBVcT6Q5cQTgMWlCVqwv0CrHXzadZj5qttyojGf1FTz2SS
 +xF8QOqZcuYcvF2R4+cg1qhigBDIzxvvfCCAZVVXagj49n2vW+5slbQ7wKTOkFAj9PjM
 qJ8StOOyow/qMTebDxFL4H5uJV4QCmbPNtZl4Bp1vCsFxMyrFNMeJCEtlu3kX7nASaZI
 oA4Q==
X-Gm-Message-State: AOAM5301ZMlBS11QlltCn/SJX0vvG/QFbU5XdpEuztlgksFGD4ACsmrA
 iBNj0ztWdMyCFX0matDkig8=
X-Google-Smtp-Source: ABdhPJyQ5DJmgnZam4idrp0qUQ23XWMuygNlkWlalSG8Ws590Mlu86hZM5HcMzfwcjR5G7mwWhonKA==
X-Received: by 2002:a17:906:4f1a:: with SMTP id
 t26mr16578489eju.84.1626509395094; 
 Sat, 17 Jul 2021 01:09:55 -0700 (PDT)
Received: from [192.168.1.158] (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.gmail.com with ESMTPSA id m15sm4678223edp.73.2021.07.17.01.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 01:09:54 -0700 (PDT)
In-Reply-To: <20210716210655.i5hxcwau5tdq4zhb@skbuf>
References: <20210716153641.4678-1-ericwouds@gmail.com>
 <20210716210655.i5hxcwau5tdq4zhb@skbuf>
X-Referenced-Uid: 5673
Thread-Topic: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
From: Eric Woudstra <ericwouds@gmail.com>
Date: Sat, 17 Jul 2021 10:09:53 +0200
To: Vladimir Oltean <olteanv@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Landen Chao <landen.chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>,Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>,Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org,linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,linux-kernel@vger.kernel.org,
 DENG Qingfang <dqfext@gmail.com>,Frank Wunderlich <frank-w@public-files.de>
Message-ID: <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_010957_098878_B53A1C63 
X-CRM114-Status: GOOD (  18.13  )
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


You are right now there is a problem with vlan unaware bridge.

We need to change the line to:

if (vid > 1) reg[1] |= ATA2_IVL;

I have just tested this with a vlan unaware bridge and also with vlan bridge option disabled in the kernel. Only after applying the if statement it works for vlan unaware bridges/kernel.

On Jul 16, 2021, 11:06 PM, at 11:06 PM, Vladimir Oltean <olteanv@gmail.com> wrote:
>On Fri, Jul 16, 2021 at 05:36:39PM +0200, ericwouds@gmail.com wrote:
>> From: Eric Woudstra <ericwouds@gmail.com>
>>
>> According to reference guides mt7530 (mt7620) and mt7531:
>>
>> NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
>> read/write the address table. When IVL is set, MAC[47:0] and
>CVID[11:0]
>> will be used to read/write the address table.
>>
>> Since the function only fills in CVID and no FID, we need to set the
>> IVL bit. The existing code does not set it.
>>
>> This is a fix for the issue I dropped here earlier:
>>
>>
>http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
>>
>> With this patch, it is now possible to delete the 'self' fdb entry
>> manually. However, wifi roaming still has the same issue, the entry
>> does not get deleted automatically. Wifi roaming also needs a fix
>> somewhere else to function correctly in combination with vlan.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>> ---
>>  drivers/net/dsa/mt7530.c | 1 +
>>  drivers/net/dsa/mt7530.h | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 93136f7e6..9e4df35f9 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -366,6 +366,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16
>vid,
>>  	int i;
>>
>>  	reg[1] |= vid & CVID_MASK;
>> +	reg[1] |= ATA2_IVL;
>>  	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
>>  	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
>>  	/* STATIC_ENT indicate that entry is static wouldn't
>> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
>> index 334d610a5..b19b389ff 100644
>> --- a/drivers/net/dsa/mt7530.h
>> +++ b/drivers/net/dsa/mt7530.h
>> @@ -79,6 +79,7 @@ enum mt753x_bpdu_port_fw {
>>  #define  STATIC_EMP			0
>>  #define  STATIC_ENT			3
>>  #define MT7530_ATA2			0x78
>> +#define  ATA2_IVL			BIT(15)
>>
>>  /* Register for address table write data */
>>  #define MT7530_ATWD			0x7c
>> --
>> 2.25.1
>>
>
>Can VLAN-unaware FDB entries still be manipulated successfully after
>this patch, since it changes 'fid 0' to be interpreted as 'vid 0'?
>
>What is your problem with roaming exactly? Have you tried to disable
>hardware address learning on the CPU port and set
>ds->assisted_learning_on_cpu_port = true for mt7530?
>
>Please note that since kernel v5.14, raw 'self' entries can no longer
>be
>managed directly using 'bridge fdb', you need to use 'master static'
>and
>go through the bridge:
>https://www.kernel.org/doc/html/latest/networking/dsa/configuration.html#forwarding-database-fdb-management
>You will need to update your 'bridgefdbd' program, if it proves to be
>at
>all necessary to achieve what you want.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
