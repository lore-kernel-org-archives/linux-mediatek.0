Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tf7kIQAukaHATARF74Y9iWt67QMZWC13W6pA4iwh/Rs=; b=aC+h181bCc4C52
	Bns2/+3sAPkYwW3rwt7Rq3PfYf47LAyIQgBSxrGEh9m1lDv6jwFxU2krM02dmhyWsnKg0U3rJElB6
	cAfslcc4kHqd7Af4v+A0zmsMmK1c3dZP0yJ5q1RN3oqbAfYeJFuR5iuqEF/lQy16ythuxV/or4sDs
	hcKFXsd+jksM/k+O8j1IX0y43MiojCjQ2RLQKDUGdZE9Way+tTsnL1xrln+5+Jxcwakw7kD9pKPp/
	AKncZxeAED+3J6VVV3wEsYCM/rdMHNLp0vWjwSWsjIZNyDueHhRU8+d1CEHvpEND2kS1iOQKHRPg+
	tYCkQ6+NiR2YeLPbTEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndyXX-00A07I-7d; Mon, 11 Apr 2022 18:13:27 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndyXM-00A03b-73
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 18:13:17 +0000
Received: by mail-pf1-x42f.google.com with SMTP id s8so15257330pfk.12
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Apr 2022 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Jw2w5fc9s7LYCxNyjF4Anw/31mGnF1Xnlp2YCJojif4=;
 b=zYUmChAbevCzMKAOteYpCt8iCZnXii2/ZAqbsWsSzdO+W6XUiXCDFOfEFJO4LuI29J
 GRfLdTG71rNc/4fdqQ6qUxbUXZRjAg/2nBe3XM+bYVDggr68EsmbxVGph1uscr1XvI7I
 H9thhM8YlDLthSuyIVx3oKcri5EMQCZNH7Nx7iBufxmFnXpJjfMSVZ1CC/4i58B1ZoSZ
 pt68xA/6LSO9ec+sEYg8O1wBSGS4tPWSCfCz0lyB+uncZ0kG0QoNZkTTEmpHD+r/98yR
 ppY5AdTcH52vSTE6T7ECEiu34gSQpmbib1ZrOqRGx9VPczLU12Rjrt+V9ksp8ODe2T0+
 LRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Jw2w5fc9s7LYCxNyjF4Anw/31mGnF1Xnlp2YCJojif4=;
 b=eY47TaVkcQI/RX4MFahqJFK60hTNNxVtIxP+GtkNEV285qOj7JAY0oDOQRhFt690l0
 y5MsqfPNFhFh+bFgYIWeWWGTZvSkjobkFLKOuCJ9BKSb4Lr3nME1BRueT0045YBnfQqJ
 OGXgJ25kJTcekXm8g9cD+NfRIX5by70UTJtiEmID/YoDow9WaML/ojtU7Iijmnmg0gdm
 HxQYx5DA+/SaiCRVMvR5PHaIQuOTWP8Dwuj13iJL0adgoSoF9qxuFTOnbLu9sNLgFnW6
 ROpE9hohgEo5AzF5ZG+nIJZ0wWwrYVwNUmC8hxPg8Z8xu/0roHqmjszbv4K89jzUJ9ve
 PxyA==
X-Gm-Message-State: AOAM533I5hkp9enfaB4vLDKgrxwGXtuzoI8veT0E+IjrRQRXqbgo8GRW
 k0Arl4Ho281roMsOyIP1YXqtQw==
X-Google-Smtp-Source: ABdhPJwFnQOXCSv95jf3Mtp1Xp4D95v+w5pquv+GUaB8VSDncNnmKQidKvtg+7Fpe/4FvzhLFVMuQw==
X-Received: by 2002:a63:6e07:0:b0:398:1337:d99e with SMTP id
 j7-20020a636e07000000b003981337d99emr27022351pgc.23.1649700793750; 
 Mon, 11 Apr 2022 11:13:13 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa79a45000000b00504a1c8b75asm17752885pfj.165.2022.04.11.11.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 11:13:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
Date: Mon, 11 Apr 2022 11:13:12 -0700
Message-ID: <7hwnfv4hfr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_111316_306392_FCEC7805 
X-CRM114-Status: GOOD (  24.00  )
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

> On Fri, 2022-04-08 at 13:54 -0700, Kevin Hilman wrote:
>> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
>> 
>> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> > 
>> > In some MediaTek SoCs, like MT8183, CPU and CCI share the same
>> > power
>> > supplies. Cpufreq needs to check if CCI devfreq exists and wait
>> > until
>> > CCI devfreq ready before scaling frequency.
>> > 
>> > - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will
>> > start
>> >   DVFS when CCI is ready.
>> > - Add platform data for MT8183.
>> > 
>> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> 
>> The checks here are not enough, and will lead to unexpected behavior.
>> IIUC, before doing DVFS, you're checking:
>> 
>> 1) if the "cci" DT node is present and
>> 2) if the driver for that device is bound
>> 
>> If both those conditions are not met, you don't actually fail, you
>> just
>> silently do nothing in ->set_target().  As Angelo pointed out also,
>> this
>> is not a good idea, and will be rather confusing to users.
>> 
>> The same thing would happen if the cci DT node was present, but the
>> CCI
>> devfreq driver was disabled.  Silent failure would also be quite
>> unexpected behavior.  Similarily, if the cci DT node is not present
>> at
>> all (like it is in current upstream DT), this CPUfreq driver will
>> silently do nothing.  Not good.
>> 
>> So, this patch needs to handle several scenarios:
>> 
>> 1) CCI DT node not present
>> 
>> In this case, the driver should still operate normally.  With no CCI
>> node, or driver there's no conflict.
>> 
>> 2) CCI DT present/enabled but not yet bound
>> 
>> In this case, you could return -EAGAIN as suggested by Angelo, or
>> maybe
>> better, it should do a deferred probe.
>> 
>> 3) CCI DT present, but driver disabled
>> 
>> This case is similar to (1), this driver should continue to work.
>> 
>> Kevin
>
> Hello Kevin and Angelo,
>
> In my review, if we do not get the link or the link status is not
> correct between cci and cpufreq in target_index, I think it will never
> established again for this link.
> Because it's not checked in probe stage.
>
> So I think we just need to deal with the issue without cci device, and
> don't expect the link between cci and cpufreq will be connected again.
>
> If I am wrong, please correct me.

I don't fully understand your questions, but I think what your getting
at suggest that you might need to use deferred probe to handle the case
where the ordering of CCI and cpufreq probing is not predictable.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
