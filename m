Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F3DC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 17:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E642610C7
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 17:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E642610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PT4lLkXeqMlVCpJIMOAbT6CCMYFmupS0aMdRaXiufAk=; b=I7r8AgqxmUbXiCB/OXPCmhlEYo
	k3VCbjbVSajkYOEhOI9Txhb5uUHLD0P/vbheCXBWr/T5yHZrCiMigo+ZuN1U8+ZWGA94XBOb8ZjND
	tYVmRrYdqz/MWZsUo3/sA5jSStQ63yuHrp92v5OBXEUqiMRw2pHCLVHatlpX1pD8O+oOOxDKND3m6
	K489KSikO4uCO+xPKE5t+66kdKx+XVcJcTpQ73shblXfkNnF7cFI3TC1m9v+H5SLNYwk0cpqXyf11
	MEeNyFbzJxSmlXljTC5pIv2sH9+1yoWCdl+cbZChQ8haH1j0ap6MzmnNvrqUYyNipevDDiq7dQ68z
	6N5A7F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5tDZ-00DcDL-06; Tue, 20 Jul 2021 17:07:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5tDM-00DcCR-HN; Tue, 20 Jul 2021 17:07:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E657D1F43318
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, linux-arm-kernel@lists.infradead.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
 <039151e1f17676a101fb9c0682f5ee9fb8ad502d.camel@pengutronix.de>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <a3227633-626d-10f5-c190-86dbf36a469c@collabora.com>
Date: Tue, 20 Jul 2021 19:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <039151e1f17676a101fb9c0682f5ee9fb8ad502d.camel@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_100728_764908_55F4EB9E 
X-CRM114-Status: GOOD (  22.12  )
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

Hi Philipp,

Thank you to take a look

On 20/7/21 12:52, Philipp Zabel wrote:
> Hi Enric,
> 
> On Wed, 2021-07-14 at 12:11 +0200, Enric Balletbo i Serra wrote:
>> Among other features the mmsys driver should implement a reset
>> controller to be able to reset different bits from their space.
>>
>> Cc: Jitao Shi <jitao.shi@mediatek.com>
>> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> The reset controller driver looks fine, just two questions below.
> 
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/soc/mediatek/mtk-mmsys.c | 69 ++++++++++++++++++++++++++++++++
>>  drivers/soc/mediatek/mtk-mmsys.h |  2 +
>>  2 files changed, 71 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> index e681029fe804..6ac4deff0164 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> [...]
>> @@ -91,6 +95,59 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> [...]
>> +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	int ret;
>> +
>> +	ret = mtk_mmsys_reset_assert(rcdev, id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	usleep_range(1000, 1100);
> 
> Is this known to be enough for all IP cores that can be reset by this
> controller?
> 

This time is copied from the downstream kernel, so, tbh, I am not totally sure
is enough or needed. Let me try to reach the Mediatek people for if they can
answer this.


>> +	return mtk_mmsys_reset_deassert(rcdev, id);
>> +}
>> +
>> +static const struct reset_control_ops mtk_mmsys_reset_ops = {
>> +	.assert = mtk_mmsys_reset_assert,
>> +	.deassert = mtk_mmsys_reset_deassert,
>> +	.reset = mtk_mmsys_reset,
>> +};
>> +
>>  static int mtk_mmsys_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -111,6 +168,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> +	spin_lock_init(&mmsys->lock);
>> +
>> +	mmsys->rcdev.owner = THIS_MODULE;
>> +	mmsys->rcdev.nr_resets = 32;
> 
> Are all bits in the MMSYS_SW0_RST_B register individual reset controls?

Yes, all are individual reset controls, mostly related to display but not all
(i.e dsi, dpi ...)

Thanks,
  Enric

> 
> regards
> Philipp
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
