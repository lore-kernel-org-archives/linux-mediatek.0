Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B05C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SX9gY91iJ5C97RtEoZ5jS74bFMMsJkO2URQOmNqhhi8=; b=Zz885Ldy7Fea/j
	chsi/Htc31HIPLd2kkarmMRHGwdVpUrGgO281px7JS1E1qA/JvhB7jILJ4seuAZD4iFXUKjyHnGN7
	2j+iXzp+TKPgiy++0Ks8JGA+xyd3EG+p8HMrHNjWBQWv27evtCAjDEYzWQZxqWnD8jTRK29K6/QcH
	upi3oW5TD/9qYgHJTGHJyVFOZx2y49cnXorLyqQZSQPMkT/EbB4EbNcOdAEup46/QeFta6Z7uOj68
	nBddImiwdE5JRtZg/4bYUJg+KkoyL7F+adHz4E5ttY7oocaiGwR6VcXkG30KanUiUMeZ3FA8uybEt
	zzYf0e9cud0xTHKDb34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nca3V-00EA1I-CH; Thu, 07 Apr 2022 21:52:41 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nca3K-00E9yB-59
 for linux-mediatek@lists.infradead.org; Thu, 07 Apr 2022 21:52:32 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 kr12-20020a17090b490c00b001cb3ee2e4c1so56647pjb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 14:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kWoriqwvAgVuYSUhi7L0THxaE1ScXOQjq9TtzmQJVbU=;
 b=ZUZ1Sl1bpyrH7V1xqH3G+j6LOGGmPSq5C14lxDKWEcyROYeTSspfNGIJxn7CDz7Pgj
 gy1T1XSqNnc7HRCxle1Tav/8w1epUYEaVPjgF0aa+7+i16lP4TE4DHRPdixMGMLqfxLn
 x1NlVxvwRzEkxY0FObdntdiJ5aKcI5GNawAxtGusyOKtPRTKMhHCnLAkMGyQZ6FWkG44
 j/2xjLtX06pshYssYNpAzgXwe+lEQQ3+UXuYSXydqcwvRhyGQsr0XkFo1ogT4JL0ZsiH
 eA7qZMe8wVQgVor2aQP6F1WnNqoNEkt9wp73Pa/HfJkmrMWorSGpXlq/IwKCX0vDjcX+
 Cd0w==
X-Gm-Message-State: AOAM532S5SWO5c9JcZm9Afr+Nj5CImGMr/Y/gtJHlqvh5aQckrHRLhDE
 sXCYgL3PdlqvDt3cbx0v8bvCmg==
X-Google-Smtp-Source: ABdhPJx68cwpLQxSWHj/EY+iJVPBQu4+0qXEpeG0cd544c0QToBKKCAVi2UNtKrdsFxQvAYU4s2rRA==
X-Received: by 2002:a17:903:40c3:b0:156:ffaf:5d9e with SMTP id
 t3-20020a17090340c300b00156ffaf5d9emr6465312pld.134.1649368347628; 
 Thu, 07 Apr 2022 14:52:27 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 y75-20020a62644e000000b005056a2a260bsm2765812pfb.129.2022.04.07.14.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 14:52:26 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Hsin-Yi Wang <hsinyi@google.com>, Tim Chang <jia-wei.chang@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Jia-Wei Chang
 <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 2/3] devfreq: mediatek: add mt8183 cci devfreq driver
In-Reply-To: <CACb=7PUSAF6ui2a7iMYrrXo=v0OaXhCfiF=dPzq4cfUXM3JbDg@mail.gmail.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-3-jia-wei.chang@mediatek.com>
 <CACb=7PUSAF6ui2a7iMYrrXo=v0OaXhCfiF=dPzq4cfUXM3JbDg@mail.gmail.com>
Date: Thu, 07 Apr 2022 14:52:25 -0700
Message-ID: <7h7d808sti.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_145230_231711_5BEAD1DB 
X-CRM114-Status: GOOD (  15.81  )
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

Hsin-Yi Wang <hsinyi@google.com> writes:

> On Mon, Mar 7, 2022 at 8:32 PM Tim Chang <jia-wei.chang@mediatek.com> wrote:
>>
>> This adds a devfreq driver for the Cache Coherent Interconnect (CCI) of
>> the Mediatek MT8183.
>>
>> On mt8183 the cci is supplied by the same regulator as the little cores.
>> The driver is notified when the regulator voltage changes (driven by
>> cpufreq) and adjusts the cci frequency to the maximum possible value.
>>
>> Add need_voltage_tracking variable to platforma data. if true, it
>> indicates soc is required to realize the voltage tracking between
>> voltage of sram and voltage of cci by software approach. otherwise, the
>> voltage tracking is realized by hardware appraoch.
>>
>> Add the notifier to cci so that it could react after svs driver changes
>> opp table of cci.
>>
>> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>

[...]

>> +
>> +       passive_data = devm_kzalloc(cci_dev, sizeof(struct devfreq_passive_data), GFP_KERNEL);
>> +       if (!passive_data) {
>> +               ret = -ENOMEM;
>> +               goto out_remove_opp_table;
>> +       }
>> +
>> +       passive_data->parent_type = CPUFREQ_PARENT_DEV;
>
> It's better to add a note below commit message to state that this
> series depends on
> https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing

Not only is this series dependent the previous series from Chanwoo, in
also fails to compile if CONFIG_DEVFREQ_GOV_PASSIVE is not enabled,
because CPUFREQ_PARENT_DEV defined inside of an #ifdef.

Please compile test this with and without CONFIG_DEVFREQ_GOV_PASSIVE
enabled.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
