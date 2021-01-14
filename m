Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D3C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:35:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7506422CE3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7506422CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cWqHxZQw7hOh6Emfoh9vxNaRUxlighJcvNNQTQjBZYM=; b=GbkB+Bjp8o7OUp+McCFX5oEzN
	44cX6z6hYrIXOesMJX2IR23xu+KbPEhV9qTm8psCREb+ebZKLBC6Y65BVEdu4Ai/zUdOkhYgO00ka
	KImtw4d/5K0S7BXLABjoImB4Oy/e8lW1f4n8gpmPbAg+M2swZww08fywPhsAjC65NoSX3boxqCSce
	wkB9OGdVC6znBTZy9p0R4wj+J37/L5IlinSbFh44fWKbvsTTndJuWrR30Nuah7Eiua0cKSX8ScG3/
	m438AdUwVNJuaM7KMEdkFa1zjA3ewC4nn+2jFd9eHTeeAKpK3koU+aiU5wN5o63HFnNdxXgZkktsy
	mS8xEM0gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzz2L-0007iV-He; Thu, 14 Jan 2021 09:35:25 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzz0o-0006vB-7u
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 09:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NoyuDLH/uTNtcownHjy45bgi6oB6avEVSl4tL4ZrXdE=; b=Gk2pDQd6svRbj9hZ6kLeg+aUCQ
 MC0ESatxg/M81/0SGc3OzpqT4Mi4aG4UM07iuVcXjTC7Ay8z9NYM+HaxzJL1I9/xTiXbkeR3S7TqU
 GgXIKZcqUP5dRR0OT5xQ0Do6U6SSTm5E/l2mF98yz9VdvoefqscDRzJmgPQc7hRDouLw=;
Received: from p54ae91f2.dip0.t-ipconnect.de ([84.174.145.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kzz0k-0004yu-C7; Thu, 14 Jan 2021 10:33:46 +0100
Subject: Re: [PATCH] mt76: testmode: add support to set user-defined spe index
To: Shayne Chen <shayne.chen@mediatek.com>
References: <20210105054124.5946-1-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <a2d8b06c-f4d7-b460-f988-8fe7b9b50540@nbd.name>
Date: Thu, 14 Jan 2021 10:33:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210105054124.5946-1-shayne.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_043350_560729_AFF57F88 
X-CRM114-Status: GOOD (  18.77  )
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


On 2021-01-05 06:41, Shayne Chen wrote:
> Add spatial extension (spe) index as a configurable parameter in testmode.
> This is used for specifically configuring TX path, such as different
> WF TX priority, number of antennas and spatial streams.
> 
> If spe_idx is not set, TX path depends on tx_antenna_mask; otherwise,
> both spe_idx and tx_antenna_mask are referenced to decide TX path.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h         |  1 +
>  .../net/wireless/mediatek/mt76/mt7915/testmode.c  | 15 ++++++++++-----
>  drivers/net/wireless/mediatek/mt76/testmode.c     |  4 ++++
>  drivers/net/wireless/mediatek/mt76/testmode.h     |  2 ++
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> index 7efad685a17c..f215b377d7fb 100644
> --- a/drivers/net/wireless/mediatek/mt76/testmode.h
> +++ b/drivers/net/wireless/mediatek/mt76/testmode.h
> @@ -29,6 +29,7 @@
>   * @MT76_TM_ATTR_TX_LTF: packet tx LTF, set 0 to 2 for 1x, 2x, and 4x LTF (u8)
>   *
>   * @MT76_TM_ATTR_TX_ANTENNA: tx antenna mask (u8)
> + * @MT76_TM_ATTR_TX_SPE_IDX: tx spatial extension index (u8)
>   * @MT76_TM_ATTR_TX_POWER_CONTROL: enable tx power control (u8)
>   * @MT76_TM_ATTR_TX_POWER: per-antenna tx power array (nested, u8 attrs)
>   *
> @@ -56,6 +57,7 @@ enum mt76_testmode_attr {
>  	MT76_TM_ATTR_TX_LTF,
>  
>  	MT76_TM_ATTR_TX_ANTENNA,
> +	MT76_TM_ATTR_TX_SPE_IDX,In order to avoid breaking the ABI, please only add new entries at the
end of the enum, above the "keep last" line.
I'll fix it up locally this time.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
