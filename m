Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B679C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOeCv3rGXWjZ+fJC8gBaIipySh/SPnnAhvt0IMz+f6s=; b=BkNEMjkQJsPtWWnFepvy9tJqwC
	fJhD228R9LNaRNEfmj35qeQMgU/8D6bnTfX35CCNUnfhf2gsENFDNqdTKNJfKEG6BEHzUdtejaoP7
	kK5cwTu0T5kmH2gYu+qgIrqzyGglqIP5aiLkJHjCLfpbIZaRjU189KjDvEVwiuQdm36qpTASJ+ovR
	wd6xLI3mj1SBWQ4V+IFADo6h7RI+SwkbrayMSFM4ipMBcIjqcJ8dJaglyOX1x5QWbYwNpnMRnvFeh
	0Y+T6EhrMO8xCQ8lRIkhxV97kQvN2ve6y09LEcBm5bHU3A7KPqEFeFRu+QDjZba9vkPDr5SWCMiVU
	ri8gFl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAf0m-00DCco-Oy; Thu, 20 Jan 2022 21:30:28 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAf0j-00DCbm-Mm
 for linux-mediatek@lists.infradead.org; Thu, 20 Jan 2022 21:30:27 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.67.122])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id EF5B52007F; 
 Thu, 20 Jan 2022 21:30:23 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 4047940076; Thu, 20 Jan 2022 21:30:23 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id B6D6213C35B;
 Thu, 20 Jan 2022 13:29:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B6D6213C35B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1642714197;
 bh=wWAFAxJF0zSOqb6KEtOQDHZ7mZGvdgkvvMEky74Df98=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sRRbSEwIrDPlQfY3d8I95lcpEVwx34qv7gWNbi/5oJlo/ds8E7yDSFS2CAMZI64Aw
 l9iABZgNnsRHbZ8XEpSEDt0dUWqEat6gm24Q9eeoSfgAijTvADC1YbYiGG3lBdICL8
 WuHYPM2lTZAVBVZiF+MIMWTGIfDCH7YAgITGiXbk=
Subject: Re: [PATCH v4 05/12] mt76: mt7915: add firmware support for mt7916
To: Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <cover.1639965732.git.Bo.Jiao@mediatek.com>
 <6b2d86cbbe6426a5ed0d91b8248b95ac3390885f.1639965732.git.Bo.Jiao@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <edd5b78c-5277-e192-b404-1b771e1a5242@candelatech.com>
Date: Thu, 20 Jan 2022 13:29:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6b2d86cbbe6426a5ed0d91b8248b95ac3390885f.1639965732.git.Bo.Jiao@mediatek.com>
Content-Language: en-US
X-MDID: 1642714224-FtK0ZQ9pkwJ8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_133025_833486_A1625EE1 
X-CRM114-Status: GOOD (  25.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/19/21 6:17 PM, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> Update firmware initialization for mt7916.
> This is an intermediate patch to add mt7916 support.
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
> v3:
> - modify the function mt7915_wfsys_reset to support mt7916
> ---
>   .../net/wireless/mediatek/mt76/mt7915/init.c  | 75 ++++++++---------
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 81 +++++++++++++++----
>   .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
>   .../net/wireless/mediatek/mt76/mt7915/pci.c   |  3 +
>   .../net/wireless/mediatek/mt76/mt7915/regs.h  |  6 +-
>   5 files changed, 115 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index 2da342d..edf0d7e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -511,41 +511,53 @@ static void mt7915_init_work(struct work_struct *work)
>   
>   static void mt7915_wfsys_reset(struct mt7915_dev *dev)
>   {
> -	u32 val = MT_TOP_PWR_KEY | MT_TOP_PWR_SW_PWR_ON | MT_TOP_PWR_PWR_ON;
> +	u32 val;
>   
>   #define MT_MCU_DUMMY_RANDOM	GENMASK(15, 0)
>   #define MT_MCU_DUMMY_DEFAULT	GENMASK(31, 16)
> +	if (is_mt7915(&dev->mt76)) {
> +		mt76_wr(dev, MT_MCU_WFDMA0_DUMMY_CR, MT_MCU_DUMMY_RANDOM);
> +
> +		/* change to software control */
> +		val |= MT_TOP_PWR_SW_RST;
> +		mt76_wr(dev, MT_TOP_PWR_CTRL, val);

val is not properly initialized in this path.  I also notice this is not the version of the patch
that was applied to nbd's tree.  The 'else nic is 7916' clause that this patch creates is also different
in nbd's tree vs this patch.

I'm not sure what is correct, I've been testing with the 'v3' series and have not gotten
7916 to work yet...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
