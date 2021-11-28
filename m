Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwciSqicK3Y5UAYCQrTYTxXHHPmbU2W6PNseDqjTFq4=; b=EcDDmf9xBf23QGgWUSHo0JRXTu
	uF/fhnaIKN4IH/C6sTQY1WyzXiIXq9yXSRK+F45tzHXlz4eWzmBoqMhS69IZ3uFBXxGDOaXG5q/al
	H5mX6CN7Tgum20QAR9vdsg6oop4nhHNwj9GH/tMG+5bhZzT2Xv1JrbKi1Dm3SOINdEIkxwGeGrFZ0
	F82Lkj/JINe0Q6Jfheujht/O92FTrA1mtb8f2J1NEs5DX0lWfxWG3xUGCx93iz1d6gSdAkSP7hZsF
	9Wz45TRbhIa/7jZLp6uzjaX7BJjgce4K20+nQW6/WhASqrz5NsqhFGb2CU7AKcM2aBxDktea/m/C1
	ejfUkLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrP0d-00GTRT-Aa; Sun, 28 Nov 2021 18:34:43 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrP0Y-00GTQz-Tc
 for linux-mediatek@lists.infradead.org; Sun, 28 Nov 2021 18:34:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4J2HFg5CHxzQjgG;
 Sun, 28 Nov 2021 19:34:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1638124461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oA8D1lCU7CeyPITNQVRngT8Pi1cm3Q47+Grcj4jH22c=;
 b=RhvH+bJWLyR+8EyBZAG+E+zn99aIXtL7iu/rwcPwG/oPRjmNcU4/cAFdSCslSYlpF8XUba
 mfT4Mi1Ehhf7/wAgUMsrNkyzMNYy+/817a4qEKg6smEapqxDM2EUPaTtUShAiREGPqrPAa
 IdONUAhnQ9CprbCg3cHNFgagugAcz8H24JESkAp0Yfji9EoFVSuqupSdh/6SZrke3tJleJ
 pM6UmjTGttQ1uh/bgKwBVuQGF7FD7HtYmzXcN3yI69tCOHYUaQS3CDdox8DHv9/+rudj/K
 RWeH0JwA49wx3VwGNza95umCexobqswJLGSdhwENFKr97hPoyDZQ+W9rEpKYWQ==
Subject: Re: [PATCH v2] mt76: eeprom: tolerate corrected bit-flips
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, 
 linux-wireless@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
References: <YZ/nv74JH/uQwpBt@makrotopia.org>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <c544231a-4939-4924-ab94-f650c93a66a0@hauke-m.de>
Date: Sun, 28 Nov 2021 19:34:15 +0100
MIME-Version: 1.0
In-Reply-To: <YZ/nv74JH/uQwpBt@makrotopia.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_103440_295490_1B76A987 
X-CRM114-Status: GOOD (  16.18  )
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

On 11/25/21 8:45 PM, Daniel Golle wrote:
> mtd_read() returns -EUCLEAN in case of corrected bit-flips.
> As data was read, don't error out in this case.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

I tried a similar patch on my device before and it solved the problem too.

> ---
> v2: fix wrong variable name
> 
>   drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index 2d58aa31db934..4a5d14473ddc4 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -65,7 +65,7 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
>   	offset = be32_to_cpup(list);
>   	ret = mtd_read(mtd, offset, len, &retlen, eep);
>   	put_mtd_device(mtd);
> -	if (ret) {
> +	if (ret && !mtd_is_bitflip(ret)) {
>   		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
>   			part, ret);
>   		goto out_put_node;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
