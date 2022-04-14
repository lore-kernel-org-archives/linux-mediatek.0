Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A037FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6brPaPx2eqTcRHQ2l62YZtoJxczHiTeMl/6SvzWPis=; b=x99FU8ZgxF5h5/
	QSoXdfV7ykvC2sbhKwwMe9cUE3yFVfM6qnocQPzE5ELxMT9W0LaECrDPzOshicALBWIFMWFqC6Pjc
	FccJO0T6STfG6ZWIPVlXmjp0vHTPd8NQy4rljsvGdy+n9XDGLOpjd9H8XkCd9JEZrBCIlCb7B1CRN
	jST3iIHTxV2RojS7qCV6O7EkY7rJWHMgMi8qwYz/gwByFgDljCfcZEP1zNL75mNs5L2l6ed9ydukr
	9zUwLrpYN1nUeYXTQxDa1EQQjqDTGULUSC6TWvUn9Ts74rKWKaL4Q3As3322yEC1AjlFy+8OoXeBN
	7q7LfEog9zTyqVgqBYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf38b-006aPz-9S; Thu, 14 Apr 2022 17:20:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf38X-006aOI-T7
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 17:20:08 +0000
Received: by mail-pg1-x52f.google.com with SMTP id t13so5309372pgn.8
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FfSoG7Td6Wp+hFUw88AieR0tVnt6wZxfF+2zMZy9eaA=;
 b=u1dsiSU8Oc8b8MGmKSXynmmw14Fwb78ccQEfVYdGz2ligTny5q/N6pnA6Ebe28h6Qg
 9rGnEHQNiSaC61xxeIRqzttu6T5MKhxMX6EGXNDv0bHalHqIas60PEfUt06tX9DHEfOH
 V0wRk2ynFkERT2/lHsbehTn5wPHw1thtrieHyN90V8JxpzH5OVYM+zdlH3OWT9Wt27nt
 ptAEJxf0UJYKz8qackmb4vXAapzFRg+BMddZw6pyUOxEtELf4A72XfikvVE1zRTnlRkr
 LfIPUAVJId1kbo7Nrwzic79JTC5bcC8GIxFkxARqw/kkK3YY7mPDEw5RhVBo5f0LH3IC
 zGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FfSoG7Td6Wp+hFUw88AieR0tVnt6wZxfF+2zMZy9eaA=;
 b=GD6w3GxeBJ9NnEzMU6SKRfkbaRUAbfBCmKbgqp9NiBBpNCvakM/Uv3619Y4S6O6Mk1
 2uBn0TsF07RSzENGs55MzuahG+VWzfgxb8MvHtT5ek+Ldlapvi8gfS/rNuonucYrgUil
 JHenxKJKedQlzqtegboDPYS10J9jeboD54j6IBUqQgceT3U89jA/7T7eT47hmtZWYgfu
 3gnm2967nTDNxcwwXSXRbS8OcJEuLcm5PSNv0xXw7vRM5gAkgS1AQVpLBAP5tfirN4RN
 qtjpLaJB5e+QyxaOdwEGsm0ywfQlu3g6vW67JND1CwpkoLlcxTJiGZK+URYgWhr3ANNU
 qspA==
X-Gm-Message-State: AOAM530WTlMCtH3cvmicbJA9V5lLAuY5m2cK+YRd+UTzqRZ05pMxlQh1
 vyoBVhQxic/VaF9syUE3lINk6A==
X-Google-Smtp-Source: ABdhPJw/SW4QlRCUT88YW6sv8vX3wad3KLpdA5XMS4E4+CURIKOHEWUI9+4tm4ZEYV/Gaq5GfqQoiA==
X-Received: by 2002:a65:5ac2:0:b0:399:dea:cd1f with SMTP id
 d2-20020a655ac2000000b003990deacd1fmr3117689pgt.80.1649956802674; 
 Thu, 14 Apr 2022 10:20:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 p8-20020aa78608000000b005082c3cbfd2sm421053pfn.218.2022.04.14.10.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:20:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 10/15] cpufreq: mediatek: Make sram regulator optional
In-Reply-To: <be86691b529dd691203fbb5b35f8572e7e9119a8.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-11-rex-bc.chen@mediatek.com>
 <7ho81b5n9v.fsf@baylibre.com>
 <be86691b529dd691203fbb5b35f8572e7e9119a8.camel@mediatek.com>
Date: Thu, 14 Apr 2022 10:20:01 -0700
Message-ID: <7hfsmf37lq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_102005_964432_DDE619C4 
X-CRM114-Status: GOOD (  20.03  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> On Fri, 2022-04-08 at 13:32 -0700, Kevin Hilman wrote:
>> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> 
>> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> > 
>> > For some MediaTek SoCs, like MT8186, it's possible that the sram
>> > regulator
>> > is shared between CPU and CCI.
>> > 
>> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> 
>> nit: missing your sign-off.
>> 
>> > ---
>> >  drivers/cpufreq/mediatek-cpufreq.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
>> > b/drivers/cpufreq/mediatek-cpufreq.c
>> > index 9e9bce0ff235..8f688d47e64b 100644
>> > --- a/drivers/cpufreq/mediatek-cpufreq.c
>> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
>> > @@ -435,7 +435,7 @@ static int mtk_cpu_dvfs_info_init(struct
>> > mtk_cpu_dvfs_info *info, int cpu)
>> >  	}
>> >  
>> >  	/* Both presence and absence of sram regulator are valid cases.
>> > */
>> > -	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
>> > +	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
>> 
>> The changelog says that this regulator may be shared with CCI, so I
>> understand it's no longer exclusive.  But here you make it optional,
>> which should be explained in the changelog.  If it's not actually
>> optional, then it should just be normal "get".
>> 
>> Kevin
>
> Hello Kevin,
>
> Since cpufreq and cci devfreq might share the same sram regulator in
> MediaTek SoC, it is no longer exclusive as you mentioned.
>
> The reason to use regulator_get_optional is we hope regulator framework
> can return error for error handling rather than a dummy handler from
> regulator_get api.
>
> I will add this to commit message in next version.

OK, sounds good.

Thanks,

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
