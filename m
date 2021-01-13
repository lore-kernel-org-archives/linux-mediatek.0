Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE72CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 21:17:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315E22085B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 21:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315E22085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iLljZLO8+WAqRNUPBXkrJHTgsRRMF9ihgI9HbjQIFnc=; b=HJiolqZu3tQSaYyIhQYyCegPI
	m13LiefckDs7/M9vLZTcfC6PWH9gskqaXAgUkASJHb+yz2Ywic8MkXdDuXasGRdPl1bkKxYWZ1dB1
	DyJwFoHe/YlISerrZDCz0xzQH8XhlJBd+N58aSp/NCMvhC0YQoUAI2jTP3Z3G7PenCw22pADdRT9S
	MvR+3GFkKE7H1gLOsseHsh40te4pAnq5K7xxwK2NHADxWzGCdIxm1LiSm9VZTcd82noZySV9CyBcZ
	O8UCWf9KEaMByQ35NDtJ5+C6gC3ifWH8DkW0VX2a8CQSNxnG0GpCnjcisJMbIeMXh1nAoe6jyRKhw
	vayWYFhBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kznVi-0001LS-Ad; Wed, 13 Jan 2021 21:16:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kznVZ-0001KS-23; Wed, 13 Jan 2021 21:16:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 0176C1F44F75
Subject: Re: [PATCH 2/3] soc: mediatek: pm-domains: Add domain regulator supply
To: Nicolas Boichat <drinkcat@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210107104915.2888408-1-hsinyi@chromium.org>
 <20210107104915.2888408-3-hsinyi@chromium.org>
 <CANMq1KAWCbtpJWMG2nE6k1hOzA=hCWYJxzC7RXb_voEri0v2=g@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <a6cea5be-f7ee-a09c-8300-69792cfa02bb@collabora.com>
Date: Wed, 13 Jan 2021 22:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KAWCbtpJWMG2nE6k1hOzA=hCWYJxzC7RXb_voEri0v2=g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_161649_334822_95811312 
X-CRM114-Status: GOOD (  23.64  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

On 10/1/21 2:49, Nicolas Boichat wrote:
> On Thu, Jan 7, 2021 at 6:49 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> Some power domains (eg. mfg) needs to turn on power supply before power
>> on.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> 

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


>> ---
>>  drivers/soc/mediatek/mt8183-pm-domains.h |  1 +
>>  drivers/soc/mediatek/mtk-pm-domains.c    | 36 +++++++++++++++++++++++-
>>  drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
>>  3 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
>> index 8d996c5d2682d..aa5230e6c12f8 100644
>> --- a/drivers/soc/mediatek/mt8183-pm-domains.h
>> +++ b/drivers/soc/mediatek/mt8183-pm-domains.h
>> @@ -38,6 +38,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                 .ctl_offs = 0x0338,
>>                 .sram_pdn_bits = GENMASK(8, 8),
>>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>> +               .caps = MTK_SCPD_DOMAIN_SUPPLY,
>>         },
>>         [MT8183_POWER_DOMAIN_MFG_CORE0] = {
>>                 .sta_mask = BIT(7),
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>> index fb70cb3b07b36..ae255aa7b1a97 100644
>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> [snip]
>> @@ -275,6 +295,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>>  {
>>         const struct scpsys_domain_data *domain_data;
>>         struct scpsys_domain *pd;
>> +       struct device_node *np = scpsys->dev->of_node;
>>         struct property *prop;
>>         const char *clk_name;
>>         int i, ret, num_clks;
>> @@ -307,6 +328,19 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>>         pd->data = domain_data;
>>         pd->scpsys = scpsys;
>>
>> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
>> +               /* Find regulator in current power domain node */
>> +               scpsys->dev->of_node = node;
>> +               pd->supply = devm_regulator_get(scpsys->dev, "domain");
>> +               scpsys->dev->of_node = np;
> 
> This pattern is a bit strange to me. But Hsin-Yi pointed out that
> there are precedents:
> https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/iio/adc/rcar-gyroadc.c#L397
> .

nit: Strange to me too. Maybe it needs a better comment/explanation and/or use
child/parent as a temporal of_node names to make a bit more readable. Looks like
[devm_]regulator_get only accepts a device as argument and will look into child
nodes.


> 
>> +               if (IS_ERR(pd->supply)) {
>> +                       dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
>> +                                     "%pOF: failed to get power supply.\n",
>> +                                     node);
>> +                       return ERR_CAST(pd->supply);
>> +               }
>> +       }
>> +
>>         pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
>>         if (IS_ERR(pd->infracfg))
>>                 return ERR_CAST(pd->infracfg);
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
>> index a2f4d8f97e058..b2770b5266dba 100644
>> --- a/drivers/soc/mediatek/mtk-pm-domains.h
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
>> @@ -7,6 +7,7 @@
>>  #define MTK_SCPD_FWAIT_SRAM            BIT(1)
>>  #define MTK_SCPD_SRAM_ISO              BIT(2)
>>  #define MTK_SCPD_KEEP_DEFAULT_OFF      BIT(3)
>> +#define MTK_SCPD_DOMAIN_SUPPLY         BIT(4)
>>  #define MTK_SCPD_CAPS(_scpd, _x)       ((_scpd)->data->caps & (_x))
>>
>>  #define SPM_VDE_PWR_CON                        0x0210
>> --
>> 2.29.2.729.g45daf8777d-goog
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
