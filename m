Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB10CCD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFmSBTjDXkujbvRLVpHQCqTFq4wR+GAI7+ccHnB+byE=; b=GmrQ1Gd1FZto7v35yVPBAsYs6C
	NGGjyFNc+FIET4dnLp6r1gWsK6d/xz4ojU6Gra+hhA9zxxeqF7Wwr7/4TLe7hJqBv7KWptNJU4WVV
	+TC01wxTHNwejmPkuPfo4pZNykwfioI7qfYm48+eORG5iuUkyU2w2XQHwaJ4Pn+Us7CpyJTJnKsW4
	3zM3Isc7fN45KK8dThGsqclI799jvLy8kC2TwdFheYnbz5VazDNTU3OGMA57ePrwrPtXzYcB24JEj
	n4f5TpEF3Cvy+yCe/mceUaVh5/9lGJLS+QYnNXsz+G/ZMJ9Tp9FIwuTrNInStJsmhuiWtevLpr4UM
	INonH51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvKL-00000005oc9-1H7I;
	Tue, 23 Jun 2026 07:13:45 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvKH-00000005oZh-42qQ
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 07:13:43 +0000
Received: from [141.14.13.172] (g427.RadioFreeInternet.molgen.mpg.de [141.14.13.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id F2E0D4C2C37D46;
	Tue, 23 Jun 2026 09:13:17 +0200 (CEST)
Message-ID: <97008590-5787-4e9e-b382-c32e8d9553dc@molgen.mpg.de>
Date: Tue, 23 Jun 2026 09:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Bluetooth: btmtk: Replace magic numbers with WMT
 packet flag enum
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20260623034121.691031-1-chris.lu@mediatek.com>
 <20260623034121.691031-2-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260623034121.691031-2-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_001342_167300_72A6B78E 
X-CRM114-Status: GOOD (  14.37  )
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

Dear Chris,


Thank you for the patch.

Am 23.06.26 um 05:41 schrieb Chris Lu:
> Add BTMTK_WMT_PKT_* enum to represent WMT download packet sequence flags,
> improving code readability. Replace magic numbers (1, 2, 3) in
> btmtk_setup_firmware_79xx() with descriptive enum values:
> 
> - BTMTK_WMT_PKT_START (1): First packet of a sequence
> - BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
> - BTMTK_WMT_PKT_END (3): Final packet of a sequence
> 
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   drivers/bluetooth/btmtk.c | 6 +++---
>   drivers/bluetooth/btmtk.h | 6 ++++++
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..21c08ee1cdbf 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -230,12 +230,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>   			while (dl_size > 0) {
>   				dlen = min_t(int, 250, dl_size);
>   				if (first_block == 1) {
> -					flag = 1;
> +					flag = BTMTK_WMT_PKT_START;
>   					first_block = 0;
>   				} else if (dl_size - dlen <= 0) {
> -					flag = 3;
> +					flag = BTMTK_WMT_PKT_END;
>   				} else {
> -					flag = 2;
> +					flag = BTMTK_WMT_PKT_CONTINUE;
>   				}
>   
>   				wmt_params.flag = flag;
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index c83c24897c95..51c18dde0a80 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -66,6 +66,12 @@ enum {
>   	BTMTK_WMT_ON_PROGRESS,
>   };
>   
> +enum {
> +	BTMTK_WMT_PKT_START = 1,
> +	BTMTK_WMT_PKT_CONTINUE = 2,
> +	BTMTK_WMT_PKT_END = 3,
> +};
> +
>   struct btmtk_wmt_hdr {
>   	u8	dir;
>   	u8	op;

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

