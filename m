Return-Path: <SRS0=N9OQ=NM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140EEC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 10:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC94661163
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 10:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC94661163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=069eI5GNvswgNoGCMyQTw38tytdwbQiaV2pzvmgY3WY=; b=rXaXfuf3ag0g5G
	yDidKmihwHVbvpDb8N55jvpzUi62YnfdZvdopAgzaU0D3C0CKG+R0S3qap+JiK8GAD7V691WM0ak3
	Ge/5jIPpqmBuRheGD6WnzDpT4v+kgxRXXqkFQJb+ZSAhMC46SjSm+P8Jd7r6Zw7YB6aLZ4MaMg1EO
	0eSsIGsbq4jA80BAWvJvGStufYtYU4Ma0c9aNQr2X0n1/VTqrHXCB3js0cHl1gWrTadKt0MC7OdLL
	pECCEIaVRnKjDoPPxkDOS+DECKzAaCtPa1QSdWqZVZwhTGXhWiDgvs0Lg7IUrIADJNhjWiL27b6vu
	bDuy0cVYgErnSlmsvJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHNxR-00Chd9-Go; Sat, 21 Aug 2021 10:10:33 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHNxL-00ChUd-Eg
 for linux-mediatek@lists.infradead.org; Sat, 21 Aug 2021 10:10:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629540627; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=0Jn1p+jiNWNrQR9dfmyf/Iou1gyXyNX1MhpjET/zZuU=;
 b=Mi6iNIXIOjfjyA8oLakTgq3OOamTyZWTsNHie9aw1Jy9yKHTsVE0+AK+1mz3fzuiTPlI74qz
 78t/TaQsQmIDRrfYppndd5iPOvCYKW2ty8y9weqwlFermYVgHoAWiW59QA2kB6w0lI12dR0M
 ZyM+O8+VWpJg/L2CoAiVIsOsUiA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6120d11389fbdf3ffecc2a20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 21 Aug 2021 10:10:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 51092C43616; Sat, 21 Aug 2021 10:10:26 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D2BFC4338F;
 Sat, 21 Aug 2021 10:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0D2BFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: jing yangyang <cgel.zte@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Colin Ian King <colin.king@canonical.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, jing yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] net:wireless:mt76: fix boolreturn.cocci
 warnings
References: <20210820024117.11688-1-jing.yangyang@zte.com.cn>
Date: Sat, 21 Aug 2021 13:10:20 +0300
In-Reply-To: <20210820024117.11688-1-jing.yangyang@zte.com.cn> (jing
 yangyang's message of "Thu, 19 Aug 2021 19:41:17 -0700")
Message-ID: <87y28vt8fn.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_031027_561108_1C390649 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

jing yangyang <cgel.zte@gmail.com> writes:

> ./drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:172:8-9:WARNING:
> return of 0/1 in function 'mt7663_usb_sdio_tx_status_data' with return
> type bool
>
> Return statements in functions returning bool should use true/false
> instead of 1/0.
>
> Generated by: scripts/coccinelle/misc/boolreturn.cocci
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c | 2 +-

The subject should be:

mt76: mt7615: fix boolreturn.cocci warnings

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
