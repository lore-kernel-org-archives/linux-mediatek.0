Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4345AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F7222CF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xZUgnScj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9i0qvly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F7222CF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VTHpPt8if0efqRxgY9nDRwWTTIKdf/lw6Qr23jMat7E=; b=xZUgnScjcbZ9WYqxjB5Z/vdOP
	j6NurtVf5wrVvPcuWUa2wQNnWT/ZiV9WXAibkuwA8MlQzoVx6Ay3yn8ANQOqk7XwiG7ZZhlbn/sEA
	ZyGCq56sFD/zt0hK1GamGT0PgyZeCaBN6h/BJuiiS3cEHJhBOE6ZHpxOHemTRkcf69VuvIx8FkP8v
	Zr7rHlDyKFyAikesIIsD65Op5cWYJf60IFmndjlWE5UVF2NkC8csNOmIcnffmqDMV8mSaqh392tO0
	6csFQ85HIUDkIAL54CwHUN26S8WLZsrsHbGWxua19VY1i9YdpwNwGlcsKRCGELj6dXvm2SZXabgo3
	dPbMZUT2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ZQ9-0005pP-Pt; Thu, 06 Aug 2020 06:30:33 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ZQ6-0005ou-Fr; Thu, 06 Aug 2020 06:30:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id l2so32290929wrc.7;
 Wed, 05 Aug 2020 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TGBk281x4usHvdNF4g8zlmo5D8Bhv5Q8McyHFyF9+HM=;
 b=S9i0qvlyIu7dYtrctjS8zURJfTNuaHUJFmsq4RntwuztGPv3fezc0gZ2Inj8VFKNBP
 4rhI8IZMOrILBx/Nbiu+ecCVYOd6XKJ4IIXi84lO/jr0ffXbsSPR8BVfOXcKV+7zVLPv
 5lQyCgYIBncfg0vVH+zfq4RCtq4+YpON6IY+zrQI0YuRYdezFn4PU8pDKr4sX20MPbR6
 iO36Y7WznBJxbke2ec0xKTU746X/WAqFqCAY5rM1p/koUVFiGPSoZEyXvJKrKc8Nd69L
 6j+pSMvOmWkc9u17AydlJuDf+u2HEQLwt1/sWDZjwKMIlzOfkgzmIOW7+l5pz6QcMiri
 A/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TGBk281x4usHvdNF4g8zlmo5D8Bhv5Q8McyHFyF9+HM=;
 b=pe4QBnN/bqDNom+r7b2w3FwKj1qC6m1XDJaqAOV2QAF7x63FJVyqvwln1VvlR88YPS
 U45H2uw6LaR/oXUQg7UEIcQjDIuUU7bPg3mHRjJUrx8PabDc2dVYdTnVDgHFhB7GfNl9
 AevsFPmOLUB5+ICDx5vSIEH9juYBDRwSoQ+mwox4+S0wwpjLJ+i4iA3v4Ut+ndV+sd7U
 EUU0+p1rA+hMgWdjYf9ogmxm8Q6Nww0Rd0t34LEE5c5qvLOu7O9X9B5WQm2xQcA4v0it
 ND53YqGh64GGxwZJ0Vpoc7Knq3IfBPGPQhkafry00ekMn1a4eQxl3rZAm9hAUl394pA/
 CnsA==
X-Gm-Message-State: AOAM533nka+06b6ApY7SVLA3TwO4uMxsAyvp75vU7JgezTpOhIOR1T95
 IdwSWV+SPXQ5jAJZTFqBh6c=
X-Google-Smtp-Source: ABdhPJz3fQId2Mfvo2IM9cPHd13bLT4jFeUUbQi44lKhwcEHOz/i4+jVOl9dhB1/oKwPNdmuXVjHIA==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr6294501wra.150.1596695427645; 
 Wed, 05 Aug 2020 23:30:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
 by smtp.gmail.com with ESMTPSA id t11sm4967586wrs.66.2020.08.05.23.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 23:30:26 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] add i2c support for mt8192
To: wsa@the-dreams.de, Qii Wang <qii.wang@mediatek.com>, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
 <20200805214242.GA2182@kunai>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <249df8b3-6125-6ebd-2835-ab703f05b85a@gmail.com>
Date: Thu, 6 Aug 2020 08:30:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805214242.GA2182@kunai>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_023030_628212_67B7A14F 
X-CRM114-Status: GOOD (  17.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/08/2020 23:42, wsa@the-dreams.de wrote:
> On Wed, Aug 05, 2020 at 06:52:18PM +0800, Qii Wang wrote:
>> This series are based on 5.8-rc1 and we provide four i2c patches
>> to support mt8192 SoC.
>>
>> Main changes compared to v2:
>> --delete unused I2C_DMA_4G_MODE
>>
>> Main changes compared to v1:
>> --modify the commit with access more than 8GB dram
>> --add Reviewed-by and Acked-by from Yingjoe, Matthias and Rob
>>
>> Qii Wang (4):
>>    i2c: mediatek: Add apdma sync in i2c driver
>>    i2c: mediatek: Add access to more than 8GB dram in i2c driver
>>    dt-bindings: i2c: update bindings for MT8192 SoC
>>    i2c: mediatek: Add i2c compatible for MediaTek MT8192
>>
>>   .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +
> 
> Applied to for-next, thanks!
> 
> Sidenote: I get these warnings when compiling the driver:
> 
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_low_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_high_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_su_sta_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'max_hd_dat_ns' not described in 'i2c_spec_values'
> drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_su_dat_ns' not described in 'i2c_spec_values'
> 
> Is someone interested to fix these?
> 

I just send a fix for that.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
