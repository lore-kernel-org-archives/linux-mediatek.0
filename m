Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D29C00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:56:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76732231B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 10:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJMTi9iX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76732231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JdQ1Bh/Rbkg27Aigdvzv/ybj9g5bLX3AELr0gy8BBY=; b=RJMTi9iXK8/Myw0jYA2P0ehxp
	2zeGKpIogqPj/iJNPb6zgXJrSCOD8yjG4RTZCsw2bJlh5tti5o1VF/Le+vjizn3fBjb+xvV97el9j
	jXbV2Wp+ePMhy+fMetXSANJVNcld5/hnTwrXOY2mvBeL5VJ35PmJAlmXwPVBnOGedOD4pTE+4d50w
	ap7/qXrDCQpMB8u9+ICw98oq6FaXRC/o48htxAnA44tXJ3ZNPlkCcc7X+tHLYpV0gutiGFPoiRFdO
	wQweClNDUI0K7sskB9rtaXhKcmBd3QJVhO343JInKJEibPEghTs+gxr8kRm9zDPk7aIc7Gko9PeNN
	EOvz9ZkvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYS57-0003Ev-9i; Fri, 30 Oct 2020 10:56:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYS4v-0003AP-L5; Fri, 30 Oct 2020 10:56:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 4081F1F45E6C
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 06/16] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-7-enric.balletbo@collabora.com>
 <CANMq1KCDNH1w+jo5kjyhusLdzCR0hF8QUi3a+jkkDvv75uGK5A@mail.gmail.com>
Message-ID: <adbcc9a6-d101-62e1-265c-146b38c3165a@collabora.com>
Date: Fri, 30 Oct 2020 11:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KCDNH1w+jo5kjyhusLdzCR0hF8QUi3a+jkkDvv75uGK5A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_065617_843951_3B616746 
X-CRM114-Status: GOOD (  26.05  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

Thank you for your comments.

On 27/10/20 3:44, Nicolas Boichat wrote:
> On Tue, Oct 27, 2020 at 1:55 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Apart from the infracfg block, the SMI block is used to enable the bus
>> protection for some power domains. Add support for this block.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v3:
>> - Do not reuse bpd for 2 different things.
>> - Disable pd->smi first and after that pd->infracfg.
>> - Rename BUT_PROT_UPDATE_MT8173 to BUS_PROT_UPDATE_TOPAXI as in all the
>>   other SoCs TOPAXI is mapped to the same address.
>>
> [snip]
>>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>> @@ -266,6 +271,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>>         if (IS_ERR(pd->infracfg))
>>                 pd->infracfg = NULL;
>>
>> +       pd->smi = syscon_regmap_lookup_by_phandle(node, "mediatek,smi");
>> +       if (IS_ERR(pd->smi))
>> +               pd->smi = NULL;
> 
> This is the second time I see this pattern, I think.
> 
> Do we want to create a new syscon_regmap_lookup_by_phandle_optional wrapper?
> 

I think could be useful, yes. So I sent a patch to add this wrapper, let's see
what the MFD maintainers think.

> Also, are we ok with ignoring all errors? I agree we can ignore
> -ENODEV if optional, but I'm not sure about the others.
> 

Right, we shouldn't ignore the other errors.

>> +
>>         pd->num_clks = of_clk_get_parent_count(node);
>>         if (pd->num_clks > 0) {
>>                 pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
>> index e428fe23a7e3..7b1abcfc4ba3 100644
>> --- a/drivers/soc/mediatek/mtk-pm-domains.h
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
>> @@ -34,8 +34,31 @@
>>
>>  #define SPM_MAX_BUS_PROT_DATA          3
>>
>> +#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {  \
>> +               .bus_prot_mask = (_mask),               \
>> +               .bus_prot_set = _set,                   \
>> +               .bus_prot_clr = _clr,                   \
>> +               .bus_prot_sta = _sta,                   \
>> +               .bus_prot_reg_update = _update,         \
>> +       }
>> +
>> +#define BUS_PROT_WR(_mask, _set, _clr, _sta)           \
>> +               _BUS_PROT(_mask, _set, _clr, _sta, false)
>> +
>> +#define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)               \
>> +               _BUS_PROT(_mask, _set, _clr, _sta, true)
>> +
>> +#define BUS_PROT_UPDATE_TOPAXI(_mask)                          \
>> +               BUS_PROT_UPDATE(_mask,                          \
>> +                               INFRA_TOPAXI_PROTECTEN,         \
>> +                               INFRA_TOPAXI_PROTECTEN_CLR,     \
>> +                               INFRA_TOPAXI_PROTECTSTA1)
>> +
>>  struct scpsys_bus_prot_data {
>>         u32 bus_prot_mask;
>> +       u32 bus_prot_set;
>> +       u32 bus_prot_clr;
>> +       u32 bus_prot_sta;
>>         bool bus_prot_reg_update;
>>  };
>>
>> @@ -47,6 +70,7 @@ struct scpsys_bus_prot_data {
>>   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>>   * @caps: The flag for active wake-up action.
>>   * @bp_infracfg: bus protection for infracfg subsystem
>> + * @bp_smi: bus protection for smi subsystem
>>   */
>>  struct scpsys_domain_data {
>>         u32 sta_mask;
>> @@ -55,6 +79,7 @@ struct scpsys_domain_data {
>>         u32 sram_pdn_ack_bits;
>>         u8 caps;
>>         const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
>> +       const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
>>  };
>>
>>  struct scpsys_soc_data {
>> --
>> 2.28.0
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
