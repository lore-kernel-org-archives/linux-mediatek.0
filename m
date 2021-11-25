Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmHcDlFFGAtm9vmky9Ybzu75cTfCwKtuy9BAXOhCYkk=; b=gpJeB26IGcEYpp
	3nnUR8MQOIoaesANATl/W1B8/UnFSelVeUwb/1zXhOjBwJOQJ/2bDp28dYthLSn9cysy7paoqbYXA
	EwSkt7ygmZRf8Cde2rekbWVK/PnGZAVIa+M1v5XaMCSbd13PDsN5QKriSl/PY/stigcQACI7RQcIc
	08ie64zmUtqnWLX2T1nRcV+RfvWO0A994tgWKtvwUcAnhiMbwQl3wUCKxGvw3ObbJzvqG2TCiaWlv
	mQ0C1TBnBv/gD2tB66TThWqnhq6FvzMsdKCxFUstV6MwAZk+g9IJFVlPxZ5XuIZp638tSZyymph2E
	1M5C4umCXSVW//GCrQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqJjX-008THq-Pi; Thu, 25 Nov 2021 18:44:35 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqJjU-008THV-9S
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 18:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygId15sHVDSUgzordb/RZ26Hm8zOUDkkt5ndBILk9Hc=; b=Fr4fNeN61PCsABSBEVh2FWVyMi
 m0Odj2QKLZewBWg/KsNqW/bM/QIgHcjhNlcuABLT+oAt+MLenHI79i2qDyzRXyX5CxTPkxoPWr6nm
 MT7mat/E2hV5ohLK56nhnFbIL7yk9fDgyq/9ifyp0NIsHjwQwynR4crLjsvlbaMqY6ac=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mqJjP-0000xx-6s; Thu, 25 Nov 2021 19:44:27 +0100
Message-ID: <8ed35f3f-b0a2-dd93-e78c-33233bc6497a@nbd.name>
Date: Thu, 25 Nov 2021 19:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] mt76: eeprom: tolerate corrected bit-flips
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, 
 linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
References: <YZ/XvfwzqUyjmBCm@makrotopia.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <YZ/XvfwzqUyjmBCm@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_104432_701758_B8B7F703 
X-CRM114-Status: GOOD (  13.47  )
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


On 2021-11-25 19:36, Daniel Golle wrote:
> mtd_read() returns -EUCLEAN in case of corrected bit-flips.
> As data was read, don't error out in this case.
> 
> Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index 2d58aa31db934..0eb98f7ff7ec0 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>   	offset = be32_to_cpup(list);
>   	ret = mtd_read(mtd, offset, len, &retlen, eep);
>   	put_mtd_device(mtd);
> -	if (ret) {
> +	if (ret && !mtd_is_bitflip(err)) {
I don't think this will even compile (err vs ret)

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
