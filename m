Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C084AC53210
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jan 2023 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl7sPhrK+DRObggd+2QVBxFsItNWuyTEnlasljqdniY=; b=lMNYjlaJS02LPCyRBH1UHChJVw
	dIvE0O13JbOwDq8JiYZc9yAKzT5P0+umlJnVc0icckOL1aReY8tPxStmiYLtFyjioEAVIHiDwBBz2
	+SL9eM1PRc7+8XrnvnoNHFX4BwO9+V14BmbE8Hv/IqsYeb2A8GfY+05/zlclgsZo8BrouX/y1iirp
	l1wj7xL4ytoN7ZUsG49Oi4AWf+9qYuLNe8C9P13m3ZeMcJRexaN69DKwf0Psbzg4wcUQniXUW1cNd
	AbAY2S/0LH9bvJ9xIP+Ts1uWspYVWUQ+OX2CY8IE4ELh1ACduPx/mmbG1JA7QoJDprVVvuy+XH1y3
	WVYIM/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWLK-00DyBS-R6; Sun, 08 Jan 2023 14:08:10 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWL6-00Dy9A-6T; Sun, 08 Jan 2023 14:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673186876; x=1704722876;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0JO44a6TP/Whpsx+Vpq0JEinNmF/qxJY8OAm9sasGMw=;
  b=AL/XCHGynCj8QRLl5VzOkcoc2ulwiIY8aXhlGhpv6f3NU0InOjFvy9xF
   cDDpFo6/nBDVJlOrhK6d2VB3A3Ossn6BgCX1k7rx3L/3NGyuIN5Y+fn7w
   nQiSMu+o9p3XzAdVibk6bd4i5STkTiNWBFAmYTZpvLGHg3diu4Yp9MO5I
   KWwTvDpESyuj0I0teJ12GFql9VhD3T4jQ1FmtfY3s/aP7jtIf6gSzymDZ
   l5K8i3l8cHeM9Dd7U6mW4VIddZqeX2YqaWMCMPpPByd9rw3NrQPoODrb2
   OjIagj6/w7RzzABwGF+/Ru8Ss2HImdt9Vr/r6ooEnhfpj1i3jOXmH707v
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="306246931"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="306246931"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:07:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="649762467"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="649762467"
Received: from mckumar-mobl2.gar.corp.intel.com (HELO [10.213.110.20]) ([10.213.110.20])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 06:07:39 -0800
Message-ID: <e392d2df-48b3-fb7b-86d3-2ea22aa11467@linux.intel.com>
Date: Sun, 8 Jan 2023 19:37:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 net-next 2/5] net: wwan: t7xx: Infrastructure for early
 port configuration
Content-Language: en-US
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, netdev@vger.kernel.org
Cc: kuba@kernel.org, davem@davemloft.net, johannes@sipsolutions.net,
 ryazanov.s.a@gmail.com, loic.poulain@linaro.org,
 ilpo.jarvinen@linux.intel.com, ricardo.martinez@linux.intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 edumazet@google.com, pabeni@redhat.com, linuxwwan@intel.com,
 linuxwwan_5g@intel.com, chandrashekar.devegowda@intel.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Madhusmita Sahu <madhusmita.sahu@intel.com>
References: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
 <cad74cd61423dbf01375a96432b3d1dbfcce0f1a.1673016069.git.m.chetan.kumar@linux.intel.com>
 <8b1bd24c-f14c-0244-d2fb-69d4f02b46d5@intel.com>
From: "Kumar, M Chetan" <m.chetan.kumar@linux.intel.com>
In-Reply-To: <8b1bd24c-f14c-0244-d2fb-69d4f02b46d5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_060756_463450_A1A63488 
X-CRM114-Status: GOOD (  22.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jesse,
Thank you for the feedback.

On 1/7/2023 12:01 AM, Jesse Brandeburg wrote:
> On 1/6/2023 8:26 AM, m.chetan.kumar@linux.intel.com wrote:
>> From: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>>
>> To support cases such as FW update or Core dump, the t7xx
>> device is capable of signaling the host that a special port
>> needs to be created before the handshake phase.
>>
>> This patch adds the infrastructure required to create the
>> early ports which also requires a different configuration of
>> CLDMA queues.
> 
> nit: use imperative voice in your commit messages: no "this patch".
> instead:
> "Add the infrastructure..."

Sure. Will correct it.

> 
>>
>> Signed-off-by: Haijun Liu <haijun.liu@mediatek.com>
>> Co-developed-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
>> Signed-off-by: Madhusmita Sahu <madhusmita.sahu@intel.com>
>> Signed-off-by: Ricardo Martinez <ricardo.martinez@linux.intel.com>
>> Signed-off-by: Devegowda Chandrashekar 
>> <chandrashekar.devegowda@intel.com>
>> Signed-off-by: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
>> -- 
>> v3:
>>   * No Change.
>> v2:
>>   * Move recv_skb handler to cldma_queue.
>>   * Drop cldma_queue_type.
>>   * Restore prototype of t7xx_port_send_raw_skb().
>>   * Remove PORT_CFG_ID_INVALID check in t7xx_port_proxy_set_cfg().
>>   * Add space before */.
>>   * Drop unnecessary logs.
>>   * Use WARN_ON on early port.
>>   * Use new MISC_DEV_STATUS_INVALID instead of MISC_DEV_STATUS.
>>   * Use macros instead of const identifiers.
>>   * Change ports member type from pointer to array type.
>>   * Prefix LK_EVENT_XX with MISC prefix.
>>   * Use t7xx prefix for device_stage enums.
>>   * Correct log messages.
>>   * Don’t override pkt_size for non-download port under dedicated Queue.
>>   * Drop cldma_txq_rxq_ids.
>>   * Use macro for txq/rxq index.
>>   * Use warn_on for rxq_idx comparison.
>>   * Drop t7xx_port_proxy_get_port_by_name().
>>   * Replace fsm poll with read_poll_timeout().
>>   * Use "\n" consistently across log message.
>>   * Remove local var _dev prefixes in fsm_routine_start().
>>   * Use max_t.
> 
> ...
> 
> 
>> diff --git a/drivers/net/wwan/t7xx/t7xx_reg.h 
>> b/drivers/net/wwan/t7xx/t7xx_reg.h
>> index c41d7d094c08..44352cd02460 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_reg.h
>> +++ b/drivers/net/wwan/t7xx/t7xx_reg.h
>> @@ -102,10 +102,28 @@ enum t7xx_pm_resume_state {
>>   };
>>   #define T7XX_PCIE_MISC_DEV_STATUS        0x0d1c
>> -#define MISC_STAGE_MASK                GENMASK(2, 0)
>> -#define MISC_RESET_TYPE_PLDR            BIT(26)
>>   #define MISC_RESET_TYPE_FLDR            BIT(27)
>> -#define LINUX_STAGE                4
>> +#define MISC_RESET_TYPE_PLDR            BIT(26)
>> +#define MISC_DEV_STATUS_MASK            GENMASK(15, 0)
>> +#define MISC_DEV_STATUS_INVALID            GENMASK(15, 0)
> 
> I don't see any uses of this, even though it's mentioned in the commit 
> message. The only reason I looked was because it was weird to have 
> DEV_STATUS_MASK and STATUS_INVALID be the same values, is that correct?

Both are unused. Will drop it.

> 
> 
>> +#define MISC_LK_EVENT_MASK            GENMASK(11, 8)
>> +
>> +enum lk_event_id {
>> +    LK_EVENT_NORMAL = 0,
>> +    LK_EVENT_CREATE_PD_PORT = 1,
>> +    LK_EVENT_CREATE_POST_DL_PORT = 2,
>> +    LK_EVENT_RESET = 7,
>> +};
>> +
>> +#define MISC_STAGE_MASK                GENMASK(2, 0)
>> +
>> +enum t7xx_device_stage {
>> +    T7XX_DEV_STAGE_INIT = 0,
>> +    T7XX_DEV_STAGE_BROM_PRE = 1,
>> +    T7XX_DEV_STAGE_BROM_POST = 2,
>> +    T7XX_DEV_STAGE_LK = 3,
>> +    T7XX_DEV_STAGE_LINUX = 4,
>> +};
>>   #define T7XX_PCIE_RESOURCE_STATUS        0x0d28
>>   #define T7XX_PCIE_RESOURCE_STS_MSK        GENMASK(4, 0)
>> diff --git a/drivers/net/wwan/t7xx/t7xx_state_monitor.c 
>> b/drivers/net/wwan/t7xx/t7xx_state_monitor.c
>> index 80edb8e75a6a..76fb5d57d4d7 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_state_monitor.c
>> +++ b/drivers/net/wwan/t7xx/t7xx_state_monitor.c
>> @@ -206,6 +206,34 @@ static void fsm_routine_exception(struct 
>> t7xx_fsm_ctl *ctl, struct t7xx_fsm_comm
>>           fsm_finish_command(ctl, cmd, 0);
>>   }
>> +static void t7xx_lk_stage_event_handling(struct t7xx_fsm_ctl *ctl, 
>> unsigned int status)
>> +{
>> +    struct t7xx_modem *md = ctl->md;
>> +    struct cldma_ctrl *md_ctrl;
>> +    enum lk_event_id lk_event;
>> +    struct device *dev;
>> +
>> +    dev = &md->t7xx_dev->pdev->dev;
>> +    lk_event = FIELD_GET(MISC_LK_EVENT_MASK, status);
>> +    switch (lk_event) {
>> +    case LK_EVENT_NORMAL:
>> +    case LK_EVENT_RESET:
>> +        break;
>> +
>> +    case LK_EVENT_CREATE_PD_PORT:
>> +        md_ctrl = md->md_ctrl[CLDMA_ID_AP];
>> +        t7xx_cldma_hif_hw_init(md_ctrl);
>> +        t7xx_cldma_stop(md_ctrl);
>> +        t7xx_cldma_switch_cfg(md_ctrl, CLDMA_DEDICATED_Q_CFG);
>> +        t7xx_cldma_start(md_ctrl);
>> +        break;
>> +
>> +    default:
>> +        dev_err(dev, "Invalid LK event %d\n", lk_event);
>> +        break;
>> +    }
>> +}
>> +
>>   static int fsm_stopped_handler(struct t7xx_fsm_ctl *ctl)
>>   {
>>       ctl->curr_state = FSM_STATE_STOPPED;
>> @@ -317,8 +345,9 @@ static int fsm_routine_starting(struct 
>> t7xx_fsm_ctl *ctl)
>>   static void fsm_routine_start(struct t7xx_fsm_ctl *ctl, struct 
>> t7xx_fsm_command *cmd)
>>   {
>>       struct t7xx_modem *md = ctl->md;
>> -    u32 dev_status;
>> -    int ret;
>> +    struct device *dev;
>> +    u32 status, stage;
>> +    int ret = 0;
>>       if (!md)
>>           return;
>> @@ -329,23 +358,55 @@ static void fsm_routine_start(struct 
>> t7xx_fsm_ctl *ctl, struct t7xx_fsm_command
>>           return;
>>       }
>> +    dev = &md->t7xx_dev->pdev->dev;
>>       ctl->curr_state = FSM_STATE_PRE_START;
>>       t7xx_md_event_notify(md, FSM_PRE_START);
>> -    ret = read_poll_timeout(ioread32, dev_status,
>> -                (dev_status & MISC_STAGE_MASK) == LINUX_STAGE, 20000, 
>> 2000000,
>> -                false, IREG_BASE(md->t7xx_dev) + 
>> T7XX_PCIE_MISC_DEV_STATUS);
>> +    ret = read_poll_timeout(ioread32, status,
>> +                ((status & MISC_STAGE_MASK) == T7XX_DEV_STAGE_LINUX) ||
>> +                ((status & MISC_STAGE_MASK) == T7XX_DEV_STAGE_LK), 
>> 100000,
>> +                20000000, false, IREG_BASE(md->t7xx_dev) +
>> +                T7XX_PCIE_MISC_DEV_STATUS);
>> +
>>       if (ret) {
>> -        struct device *dev = &md->t7xx_dev->pdev->dev;
>> +        ret = -ETIMEDOUT;
>> +        dev_err(dev, "read poll %d\n", ret);
>> +        goto finish_command;
>> +    }
>> -        fsm_finish_command(ctl, cmd, -ETIMEDOUT);
>> -        dev_err(dev, "Invalid device status 0x%lx\n", dev_status & 
>> MISC_STAGE_MASK);
>> -        return;
>> +    if (status != ctl->prev_status) {
>> +        stage = FIELD_GET(MISC_STAGE_MASK, status);
> 
> if stage is only used down here you can declare it locally. cppcheck has 
> a check that will find these for you.

Ok. Will consider it.

> 
>> +        switch (stage) {
>> +        case T7XX_DEV_STAGE_INIT:
>> +        case T7XX_DEV_STAGE_BROM_PRE:
>> +        case T7XX_DEV_STAGE_BROM_POST:
>> +            dev_info(dev, "BROM_STAGE Entered\n");
>> +            ret = t7xx_fsm_append_cmd(ctl, FSM_CMD_START, 0);
>> +            break;
>> +
>> +        case T7XX_DEV_STAGE_LK:
>> +            dev_info(dev, "LK_STAGE Entered\n");
>> +            t7xx_lk_stage_event_handling(ctl, status);
>> +            break;
>> +
>> +        case T7XX_DEV_STAGE_LINUX:
>> +            dev_info(dev, "LINUX_STAGE Entered\n");
>> +            t7xx_cldma_hif_hw_init(md->md_ctrl[CLDMA_ID_AP]);
>> +            t7xx_cldma_hif_hw_init(md->md_ctrl[CLDMA_ID_MD]);
>> +            t7xx_mhccif_mask_clr(md->t7xx_dev, D2H_INT_PORT_ENUM |
>> +                         D2H_INT_ASYNC_MD_HK | D2H_INT_ASYNC_AP_HK);
>> +            t7xx_port_proxy_set_cfg(md, PORT_CFG_ID_NORMAL);
>> +            ret = fsm_routine_starting(ctl);
>> +            break;
>> +
>> +        default:
>> +            break;
>> +        }
>> +        ctl->prev_status = status;
>>       }
>> -    t7xx_cldma_hif_hw_init(md->md_ctrl[CLDMA_ID_AP]);
>> -    t7xx_cldma_hif_hw_init(md->md_ctrl[CLDMA_ID_MD]);
>> -    fsm_finish_command(ctl, cmd, fsm_routine_starting(ctl));
>> +finish_command:
>> +    fsm_finish_command(ctl, cmd, ret);
>>   }
>>   static int fsm_main_thread(void *data)
>> @@ -516,6 +577,7 @@ void t7xx_fsm_reset(struct t7xx_modem *md)
>>       fsm_flush_event_cmd_qs(ctl);
>>       ctl->curr_state = FSM_STATE_STOPPED;
>>       ctl->exp_flg = false;
>> +    ctl->prev_status = 0;
>>   }
>>   int t7xx_fsm_init(struct t7xx_modem *md)
>> diff --git a/drivers/net/wwan/t7xx/t7xx_state_monitor.h 
>> b/drivers/net/wwan/t7xx/t7xx_state_monitor.h
>> index b6e76f3903c8..5e8012567ba1 100644
>> --- a/drivers/net/wwan/t7xx/t7xx_state_monitor.h
>> +++ b/drivers/net/wwan/t7xx/t7xx_state_monitor.h
>> @@ -96,6 +96,7 @@ struct t7xx_fsm_ctl {
>>       bool            exp_flg;
>>       spinlock_t        notifier_lock;        /* Protects notifier 
>> list */
>>       struct list_head    notifier_list;
>> +    u32                     prev_status;
>>   };
>>   struct t7xx_fsm_event {
> 

-- 
Chetan

