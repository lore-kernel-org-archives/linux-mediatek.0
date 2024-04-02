Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD1CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4nRvJ0c59zUyR8ezgAHKzFD+7G8QnVomCEdYphyOZA=; b=rwqgTHaDfja1J3qyW/6QyLgbUK
	nJayYzQnTQtwcgv5NtYPlJ//t/vE9rPq8EgflLJk//oUSu/phioFEKz2tsVmegDcwOWUad6TkHlw/
	LBszw39LQGUnkB7u33USpMsD6fKLjbFPJgKgY4MzvLJ/1i8KNf1d6SRtyOLp6fyP0kvhJvq69lhV2
	VWaaDlP+8a5zpbclKTHfyl4bRRHxPceX2R4Xs5/nc23rHCR+iGZL/Dd2hMNWIcscPgkF9WnL93P5m
	1FP6L7EomCOohkQ0CKN5QBcGs80NJpORUm4bGaC1v4+K7fMcKg1DB5Vimz0nvptYt6gw/oU94gDt9
	i36BPnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZG7-0000000ABn9-2T72;
	Tue, 02 Apr 2024 08:12:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZG5-0000000ABm8-1H9r;
	Tue, 02 Apr 2024 08:12:42 +0000
X-UUID: bfe5144cf0c811ee96d5dfc950b7243d-20240402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d4nRvJ0c59zUyR8ezgAHKzFD+7G8QnVomCEdYphyOZA=;
	b=O88CmPZUqkw0d5Ku+niN01bdy5m91N9rFlOXocdLkbhoWEzGPET0ZydKqWl3YBaa7clFW5oK0+/HO32jEveKw9E4GXxCb81AUfWjlca6DX6Z2EhfIAin8hKofh90+UxkIIYGyNghGMaAQ5kaKwgdbN5iX1PoFj54+lRo3avLZHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:7573147f-50ff-466a-91dc-5f97ab722e95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:cd0a9d00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bfe5144cf0c811ee96d5dfc950b7243d-20240402
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <guoyong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 6007752; Tue, 02 Apr 2024 01:12:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Apr 2024 16:12:25 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Apr 2024 16:12:24 +0800
From: Guoyong Wang <guoyong.wang@mediatek.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Guoyong
 Wang" <guoyong.wang@mediatek.com>
Subject: Re: [PATCH] random: Fix the issue of '_might_sleep' function running in an atomic contex
Date: Tue, 2 Apr 2024 16:12:14 +0800
Message-ID: <20240402081214.2723-1-guoyong.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320090242.10318-1-guoyong.wang@mediatek.com>
References: <20240320090242.10318-1-guoyong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.181500-8.000000
X-TMASE-MatchedRID: VfovoVrt/oZq0U6EhO9EEya1MaKuob8PC/ExpXrHizyo+b+yOP0oGAAt
	9g7dvMC1IKdjJZRyIZmrMtdnoedbNxHzG0HT5tBb/1aBDnIV4ikWTveLitVUgcwHSQ+yXjTD/VQ
	G3oVfx34Pu+MfgwheR2w5+V5bC8rHsEBAuoaUqK8QNC45RlqcS167veYUroY0yWCL+8tLbvaPdB
	sWkfHN7SQPHPUuX+yXwFVmU96WjVi8f06ZoOZQY0KcYi5Qw/RVQrO4XR6BRQNgg+UjPGL1RUTNC
	ucTZFZapt+BKnbPggH9KP9acIz8sx8TzIzimOwPVnRXm1iHN1bEQdG7H66TyH4gKq42LRYkIxUs
	k7Y5zqotD17eyPoKssqg3Bx5SzilnGVR9vPBa4t+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.181500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 06C58068D73256DA76C0B51F75B979DDFF4EDD0C74A25AEFEA31C055BBFF53672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_011241_400440_DEC6A5FF 
X-CRM114-Status: GOOD (  17.52  )
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

On Web, 20 Mar 2024 02:09:21 +0100, Jason A. Donenfeld wrote:
>> Hi Jason,
>> 
>> Thanks for your suggestions. 
>> 
>> I am inclined to accept your second suggestion. My reluctance to accept 
>> the first is due to the concern that "&& !in_atomic()" could potentially 
>> alter the original meaning of the 'execute_in_process_context' interface. 
>> Regarding the third suggestion, modifying the logic associated with 'input' 
>> is not recommended.
> 
> Doesn't something like the below seem simplest? Just move the call out
> of the spinlock and we're done.
> 
> diff --git a/drivers/input/input-core-private.h b/drivers/input/input-core-private.h
> index 116834cf8868..717f239e28d0 100644
> --- a/drivers/input/input-core-private.h
> +++ b/drivers/input/input-core-private.h
> @@ -10,7 +10,7 @@
>  struct input_dev;
> 
>  void input_mt_release_slots(struct input_dev *dev);
> -void input_handle_event(struct input_dev *dev,
> +bool input_handle_event(struct input_dev *dev,
>  unsigned int type, unsigned int code, int value);
> 
>  #endif /* _INPUT_CORE_PRIVATE_H */
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index f71ea4fb173f..2faf46218c66 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -391,20 +391,22 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
>  }
>  }
> 
> -void input_handle_event(struct input_dev *dev,
> +bool input_handle_event(struct input_dev *dev,
>  unsigned int type, unsigned int code, int value)
>  {
>  int disposition;
> +bool should_contribute_to_rng = false;
> 
>  lockdep_assert_held(&dev->event_lock);
> 
>  disposition = input_get_disposition(dev, type, code, &value);
>  if (disposition != INPUT_IGNORE_EVENT) {
>  if (type != EV_SYN)
> -add_input_randomness(type, code, value);
> +should_contribute_to_rng = true;
> 
>  input_event_dispose(dev, disposition, type, code, value);
>  }
> +return should_contribute_to_rng;
>  }
> 
>  /**
> @@ -428,12 +430,15 @@ void input_event(struct input_dev *dev,
>   unsigned int type, unsigned int code, int value)
>  {
>  unsigned long flags;
> +bool should_contribute_to_rng;
> 
>  if (is_event_supported(type, dev->evbit, EV_MAX)) {
> 
>  spin_lock_irqsave(&dev->event_lock, flags);
> -input_handle_event(dev, type, code, value);
> +should_contribute_to_rng = input_handle_event(dev, type, code, value);
>  spin_unlock_irqrestore(&dev->event_lock, flags);
> +if (should_contribute_to_rng)
> +add_input_randomness(type, code, value);
>  }
>  }
>  EXPORT_SYMBOL(input_event);

Hi Jason,

As I mentioned last time: Your solution may not be applicable when 'input_event' is executed in users spinlock. 
What are you thoughts on this? I'm looking forward to your suggestions so we can reach an agreement and expedite 
the upstream process, Thanks!


