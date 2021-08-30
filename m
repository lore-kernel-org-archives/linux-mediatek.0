Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B749DC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:04:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7926860C40
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7926860C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrRaJckLT5XCUbFTWSUT9QWckbplqzx9QEfVYPnGFWQ=; b=GzzXtQusT9z2I4
	6STyX9WSjU53iNTccy1LzoY+QVLlqNDdMr3VUhQfp5AEq/LhnzJAZV0eTmGCBLtHvLQsKGourhKoN
	sBti0cM69EuP4PMf9s+lFLCS7++io93w+MLZmao8yMShXrvoB9tY9BgjAMwriX6MHzqpfu6PtEWiJ
	xZIGjU8XhjtvrPk0pDDwl0n1rqwE9WqF1UA/jbM5P1bmZ/scv87qlLYotN+1zlNguz+I63Grd4IQS
	Bvaqt1eUIik/HS7vVHhfdTS8IvyydMDg5GpwO6ob6RhCEckgeAuxOYG93ADWbvLZSMNp+DiXgojlR
	A53Ln9DfnNGn+kLWmHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKipT-00HUdv-PW; Mon, 30 Aug 2021 15:04:07 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKipQ-00HUck-VL
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 15:04:06 +0000
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
 by mail.holtmann.org (Postfix) with ESMTPSA id E63E2CECC3;
 Mon, 30 Aug 2021 17:03:59 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Support public address
 configuration for MediaTek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210824154430.27689-1-mark-yw.chen@mediatek.com>
Date: Mon, 30 Aug 2021 17:03:59 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, michaelfsun@google.com, mcchou@chromium.org
Message-Id: <CF258C9C-BB3C-4C10-88B0-F6F3A03303D5@holtmann.org>
References: <20210824154430.27689-1-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_080405_198209_27579354 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Mark,

> The MediaTek chip support vendor specific HCI command(0xfc1a) to
> change the public address. Add hdev->set_bdaddr handler for MediaTek
> Chip.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 60d2fce59a71..41e7c9f28d82 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2200,6 +2200,23 @@ struct btmtk_section_map {
> 	};
> } __packed;
> 
> +static int btusb_set_bdaddr_mtk(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> +{
> +	struct sk_buff *skb;
> +	long ret;
> +
> +	skb = __hci_cmd_sync(hdev, 0xfc1a, sizeof(bdaddr), bdaddr, HCI_INIT_TIMEOUT);
> +	if (IS_ERR(skb)) {
> +		ret = PTR_ERR(skb);
> +		bt_dev_err(hdev, "changing Mediatek device address failed (%ld)",
> +			   ret);
> +		return ret;
> +	}
> +	kfree_skb(skb);
> +
> +	return 0;
> +}
> +

this is not a permanent change, correct? Meaning a power cycle will bring back the original BD_ADDR?

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
