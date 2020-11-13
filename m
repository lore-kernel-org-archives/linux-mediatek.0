Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C518C4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F473217A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 09:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5CruVqm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="i7/VX5hU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F473217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=il+wS1TnmdgGlIgAWaYq3Gln9dJhOdvSeubvRm4PtCg=; b=R5CruVqmZoQ/VRxvp4lNK6BTy
	ml8vndvE+jFF7vUc7TRI9NO+EagZiX0qwsH7hwFmOoBgVjx6NDm2R1U7Q29WKHv4oUq2So3FY6SHx
	Evll3XLovroW0gPGEKP5TQPK57xaScjJUgvMbT+XeXLchQuQ4Dqkc3YIiQqXMXsTaZwmeekMYn16P
	14avYhoQ57ew2DjLqnf64twbMTEOZcU5iGq56MtFDNdzR6u5qd1oOyN2HvMZzd52nDHhiJZtZfCud
	XtRL2zs0e43i6E2BPDbg97B/nZWC59G+PFCAJWD7ozqgj52edm0HeboqyzukexVbSW9w7UggaG79F
	KmaW3ZtCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdVAO-0008LR-OM; Fri, 13 Nov 2020 09:14:48 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdVAM-0008K8-2K
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 09:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqXYk2ETNE7WFfoledUUVvStmR78ICCQIeEItBNL28Y=; b=i7/VX5hUFc0tJOCr8P1Xw/8hCN
 hXLf9sPgW7BpCFhKs7L8XYiQ/gD5+pgGXEAWwJ9is9BVbNRlfDtEkpa/RHFex3tK0bxvYaZN9x2Tj
 /G6pAQyPLUyCDbl7X+Ut4vsnWVs1ERhLgs7A4S4vCPRhovLbfnjV2TCzFI99TTJVgoYA=;
Received: from p5b206c33.dip0.t-ipconnect.de ([91.32.108.51] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kdVAK-00017y-7Z; Fri, 13 Nov 2020 10:14:44 +0100
Subject: Re: [PATCH 3/3] mt76: mt7615: support 16 interfaces
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
References: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603988327.git.ryder.lee@mediatek.com>
 <a4ad2ad2b3de3ced1ca2a214da598cd0a5fea604.1603988327.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <dc6a370b-cf82-9cbe-1bb5-7df2e4652282@nbd.name>
Date: Fri, 13 Nov 2020 10:14:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <a4ad2ad2b3de3ced1ca2a214da598cd0a5fea604.1603988327.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_041446_289669_0154ED54 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2020-10-29 18:11, Ryder Lee wrote:
> When looking for a MAC address slot, start by using main BSSID slots 1-3,
> afterwards use 16 repeater mode BSSID slots, then start using the slots
> usually used for AP mode.
> 
> This search order should prevent unnecessary conflicts with AP mode interfaces
> on the same PHY.
> 
> Note that two PHYs share global 32 omac slots with each other.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/init.c  |  4 +-
>  .../net/wireless/mediatek/mt76/mt7615/main.c  | 55 +++++++++++++------
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 49 ++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  1 +
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    | 25 +++------
>  5 files changed, 94 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> index f72506d9f646..496c46f1073e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
> @@ -176,7 +176,7 @@ struct mt7615_phy {
>  	struct ieee80211_vif *monitor_vif;
>  
>  	u32 rxfilter;
> -	u32 omac_mask;
> +	u64 omac_mask;
>  
>  	u16 noise;
>  
This also needs to be done in struct mt7615_dev. I've fixed it up locally.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
