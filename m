Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DACC4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 17:07:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2724823A82
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 17:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2724823A82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bevfxj2VmHXFc8CgTwVLUh0oTkIOh9h7Pnm8uoIp8XA=; b=2cmO4N7oyX/8TbtXMzajXMWSL
	ldaGajZdNfoUGpL7YlgKohYbVF2usJjp+eo5ZEimlsr+/S8GPL3MW6GSapIPV3e5xalcj+wWQNGZf
	xT5qUqVUghRnoLTWLzb5PJ/d2es9aH0T3+uievke+cfF5s+yLY5iUiRkX8Y0F63H5/n/vQuacmrG7
	rjJ3Bm3tIRuD/bX/lsMwakCQZkRW17M4fY/B1njCZplnH1bXQk5iyMUj7n566/Lt+6TH9BSJXu2dt
	jXA+p7dAcYLtODDs04vy6/zat9UEIQWlCt8xyqh92nujo2fckmWa//2Dh2vI2+TeL2sVT3Zmf76w8
	q314zZfzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqfhR-0005ML-Iz; Sat, 19 Dec 2020 17:07:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqfhP-0005Lu-3A
 for linux-mediatek@lists.infradead.org; Sat, 19 Dec 2020 17:07:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id z12so3119214pjn.1
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Dec 2020 09:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zcPwcPXMVpnY+3eclfJ/8aqJ3GoVY62IrGy7/V75q7k=;
 b=fD3UkN+hE3I4EXEN4uJ0V0s6uTHGW/RZwKYBi91VPLSZhW+LnT2hIId8K/QN5m7gz6
 oBnPA3JSId0M8/3sBGWKCnjsL17SNeuIGUo1ez/PjV1yQ637srrNsgnwpG76UcAfioFt
 HYQPMCQbCcZjQrDuSintyvhWhdIEyZMTqv0XsPXCjOVLaRAgBw+bPOXpC90m8WWpi+7p
 P9Ybk5He7MZbXl+7nWrifu+3ugwomWAY0Pd+m8j5M53zhgA4uR9tZzSjOKlc4869wGuU
 Kwd8vX/La5S9EcM+Ugtxn6NhHdzHdAkXez5rhraQhmeeeIEck+mfwuVnLklt3ktP2MNQ
 OvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zcPwcPXMVpnY+3eclfJ/8aqJ3GoVY62IrGy7/V75q7k=;
 b=FgVUza/oFjn7jlvDe9zoZQe7RLaFSGIB346yvGxufsHKjMXRWHYybhHECnX1PNW75S
 6OPfHyk/ySIlVvXdTp8svsZtNgbyeDY3zUd89bSK6Psg2fUfnn2mSIGRLwlt+aBgCBMS
 UPU5BBIyfxOk76M0ju+aUBH0lXs2k6U8UsMSW9TWxhfr0rPyNu2xtaeUda+t8yn7yGhi
 AJ5TwjHLA1w9R+06G03SYXsFZ5IW2UkA5GdDptfktUEsDsZ4Dl315mqduHwki22BP9uK
 ycOEGIZ6PnGyr2sg12KrOtTRAFx5tEHGOWTVkrL3rAixdM4hMs8cS1zlnj8rEOXzk8ij
 9j0A==
X-Gm-Message-State: AOAM5338vNeNEexA7wIW8CWjFzokAZqUGPCPagaOFvMVsivKXSStFXK9
 seGACo3qC9s1LO9MdpDvSwY=
X-Google-Smtp-Source: ABdhPJzCNJAHHMGz9gyVfixo1zoozcw1G2uxKs1g3WPUZvjZcf5GHk4cal7zZ5ovqjJxxy/A2Yc14Q==
X-Received: by 2002:a17:90b:24c:: with SMTP id
 fz12mr9719452pjb.138.1608397636641; 
 Sat, 19 Dec 2020 09:07:16 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id v3sm11452583pjn.7.2020.12.19.09.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 09:07:15 -0800 (PST)
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
To: Andrew Lunn <andrew@lunn.ch>, DENG Qingfang <dqfext@gmail.com>
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
Date: Sat, 19 Dec 2020 09:07:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201219162601.GE3008889@lunn.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_120719_221314_D97F7469 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/19/2020 8:26 AM, Andrew Lunn wrote:
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
>>  };
>>  
>>  static const struct of_device_id mt7530_of_match[] = {
>> -	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
>> +	{ .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
>>  	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
>>  	{ .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
>>  	{ /* sentinel */ },
> 
> This will break backwards compatibility with existing DT blobs. You
> need to keep the old "mediatek,mt7621", but please add a comment that
> it is deprecated.

Besides, adding -gsw would make it inconsistent with the existing
matching compatible strings. While it's not ideal to have the same
top-level SoC compatible and having another sub-node within that SoC's
DTS have the same compatible, given this would be break backwards
compatibility, cannot you stay with what is defined today?
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
