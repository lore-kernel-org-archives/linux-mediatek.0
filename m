Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B0CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:24:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B45423A3A
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 10:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B45423A3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDvZxE8WBx3ZzKr14oPN8E2KJUC/4iukTTDt1guOdoI=; b=mI86xEqFlEfCvTDAmUBuBr9KA
	Y8++q4j9snaKF0LuOUFdc4I13MeVMHni6+kYNaef3nQJs5RQ5ZiPSx8QlzTUPY/eK0y7cneKqcXnw
	peiUljL9bjW1sW4Gy5K2K2id2YCtw2gmIRnMMbp7YiVaS9/gANp3hslBJrwnByX3TeDI/sqn1GvB5
	U+aYMf5/pRZbEGzDULdLpPW6Z/BsXKoTK644XKtFFRLHQ0cFt2pZYsI+NMMvVCcxX9WdadTC49PMc
	+gbp+ewrU6dRnmEJ1MbUG+h/vcWplweYxI8iE7whdBc94V+TB/y+yFK5K9yt52WrWvX08yHiJlf0t
	rFb6F0mhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzznQ-0007u9-Nf; Thu, 14 Jan 2021 10:24:04 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzznL-0007tK-7W
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 10:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lbn6cYCk9/muYNK6QM9qsrM6esnGSsnu6m/z0AGuWLw=; b=LUS3TKKsfynbqt6gqpfWzogLg6
 /1F7pqWim0z+f04zNnWgrs3c5GCD4pAZ3J3ko3NkVkjr9s1EDXcfQ0mj4DT3Xs1yRCzy39pCJkRW0
 a5GsRtLoR++p0+6/JsB+AAzZqeW8uv+TMfa+VRnCvXFd6yqcixEc7cfG6C+smnHeuwbw=;
Received: from p54ae91f2.dip0.t-ipconnect.de ([84.174.145.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kzznJ-00072a-6U; Thu, 14 Jan 2021 11:23:57 +0100
Subject: Re: [PATCH 3/4] mt76: mt7915: add support for continuous tx in
 testmode
To: Shayne Chen <shayne.chen@mediatek.com>
References: <20210105113045.17815-1-shayne.chen@mediatek.com>
 <20210105113045.17815-3-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <926cb2f7-e66f-6804-a0ff-5fbd62193c59@nbd.name>
Date: Thu, 14 Jan 2021 11:23:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210105113045.17815-3-shayne.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_052359_424361_2E197AE6 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-05 12:30, Shayne Chen wrote:
> Implement continuous tx state for MT7915 NIC testmode.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   3 +-
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   1 +
>  .../wireless/mediatek/mt76/mt7915/testmode.c  | 160 ++++++++++++++++--
>  .../wireless/mediatek/mt76/mt7915/testmode.h  |  40 +++++
>  4 files changed, 192 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> index e5af42c70e12..68b170308c4a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
> @@ -469,15 +475,144 @@ static void
>  mt7915_tm_set_rx_frames(struct mt7915_phy *phy, bool en)
>  {
>  	struct mt7915_dev *dev = phy->dev;
> -	if (en) {
> -		mutex_unlock(&dev->mt76.mutex);
> -		mt7915_set_channel(phy);
> -		mutex_lock(&dev->mt76.mutex);
> +	if (en)
> +		mt7915_tm_update_channel(phy);
> +
> +	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, en);
This leaves dev as an unused variable. I'll fix it up locally.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
