Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137F0C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:19:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40DE238E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 15:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agURopey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B40DE238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=itdbiMC2i7h+1vfPV++4DZhBTFJiXOSttBTm+gBc+Mo=; b=agURopeyslT4D4LoBE0pGsyKj
	g6SxPnjdDw4u0GteodDLJsdQ3VKkazbocxDMmm6MVyRp4VJUw4sdPXpSgiz37aAcGTxE3SUU/6f6+
	CqtgawsgiTIWMrAFoM0fgwrqnbqTCuCzqgni2W6SpJew9udwzx85CKWQx4CNGJPa/93wghu8AwZP7
	NQIue4ZczZ3g6iIJCEBURKY1npfRLBJXqY5RalJ+9t6pUUNPTsqd3j1eIr9olGdjBIzTu1YEfl27y
	EAiHKo+puWw5h5pZOOVvgNhxFT69YmtuK1eJApj2j+nYgdAmSp7+i1w/P4TgqiCkXIph1HZ4X2CZh
	3UtMUi2QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX4Gu-0003LG-Nm; Mon, 26 Oct 2020 15:18:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX4Gh-0003En-H0; Mon, 26 Oct 2020 15:18:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2AC4B1F44A65
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 06/12] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
To: Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-7-enric.balletbo@collabora.com>
 <ee2b40c3-b565-22ed-34f4-4259d546a623@gmail.com>
 <CANMq1KDNKsE5oWxsg-zPS1L07dZySjoQc-fRWsXc5ngdi98Kgg@mail.gmail.com>
Message-ID: <d894e6de-6f8d-1491-a077-26487636fce8@collabora.com>
Date: Mon, 26 Oct 2020 16:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KDNKsE5oWxsg-zPS1L07dZySjoQc-fRWsXc5ngdi98Kgg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_111843_775435_BDD3C4FE 
X-CRM114-Status: GOOD (  19.46  )
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

Thank you for your review.

On 5/10/20 3:48, Nicolas Boichat wrote:
> On Fri, Oct 2, 2020 at 4:56 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 01/10/2020 18:01, Enric Balletbo i Serra wrote:
>>> From: Matthias Brugger <mbrugger@suse.com>
>>>
>>> Apart from the infracfg block, the SMI block is used to enable the bus
>>> protection for some power domains. Add support for this block.
>>>
>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> ---
>>>
>>> Changes in v2: None
>>>
>>>   drivers/soc/mediatek/mtk-pm-domains.c | 64 ++++++++++++++++++++-------
>>>   include/linux/soc/mediatek/infracfg.h |  6 +++
>>>   2 files changed, 53 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>>> index b5e7c9846c34..38f2630bdd0a 100644
>>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
>>> @@ -56,8 +56,25 @@
>>>
>>>   #define SPM_MAX_BUS_PROT_DATA               3
>>>
>>> +#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {        \
>>> +             .bus_prot_mask = (_mask),               \
>>> +             .bus_prot_set = _set,                   \
>>> +             .bus_prot_clr = _clr,                   \
>>> +             .bus_prot_sta = _sta,                   \
>>> +             .bus_prot_reg_update = _update,         \
>>> +     }
>>> +
>>> +#define BUS_PROT_WR(_mask, _set, _clr, _sta)         \
>>> +             _BUS_PROT(_mask, _set, _clr, _sta, false)
>>> +
>>> +#define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)             \
>>> +             _BUS_PROT(_mask, _set, _clr, _sta, true)
>>> +
>>>   struct scpsys_bus_prot_data {
>>>       u32 bus_prot_mask;
>>> +     u32 bus_prot_set;
>>> +     u32 bus_prot_clr;
>>> +     u32 bus_prot_sta;
>>>       bool bus_prot_reg_update;
>>>   };
>>>
>>> @@ -69,6 +86,7 @@ struct scpsys_bus_prot_data {
>>>    * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>>>    * @caps: The flag for active wake-up action.
>>>    * @bp_infracfg: bus protection for infracfg subsystem
>>> + * @bp_smi: bus protection for smi subsystem
>>>    */
>>>   struct scpsys_domain_data {
>>>       u32 sta_mask;
>>> @@ -77,6 +95,7 @@ struct scpsys_domain_data {
>>>       u32 sram_pdn_ack_bits;
>>>       u8 caps;
>>>       const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
>>> +     const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
>>>   };
>>>
>>>   struct scpsys_domain {
>>> @@ -86,6 +105,7 @@ struct scpsys_domain {
>>>       int num_clks;
>>>       struct clk_bulk_data *clks;
>>>       struct regmap *infracfg;
>>> +     struct regmap *smi;
>>>   };
>>>
>>>   struct scpsys_soc_data {
>>> @@ -175,9 +195,9 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
>>>               if (bpd[i].bus_prot_reg_update)
>>>                       regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, mask);
>>>               else
>>> -                     regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
>>> +                     regmap_write(regmap, bpd[i].bus_prot_set, mask);
>>>
>>> -             ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
>>> +             ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
>>>                                              val, (val & mask) == mask,
>>>                                              MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>>>               if (ret)
>>> @@ -193,7 +213,11 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>>>       int ret;
>>>
>>>       ret = _scpsys_bus_protect_enable(bpd, pd->infracfg);
>>> -     return ret;
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     bpd = pd->data->bp_smi;
>>> +     return _scpsys_bus_protect_enable(bpd, pd->smi);
> 
> Not a huge fan or reusing bpd for 2 different things.
> 
> I think this is easier to follow:
> 
> _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
> ...
> _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
> 

Makes sense, applied in next version.

> 
>>>   }
>>>  [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
