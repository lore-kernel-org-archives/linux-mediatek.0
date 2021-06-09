Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE55C48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:18:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E552E61059
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E552E61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhiUqTctwJiqDZr1Cu3dUcTy4tNWoyuJOSnrPgvCRrg=; b=Gt/35ElJejYsW4
	HgttWmJ/hOtiu2W9IHzE86Op1JlJzf/n3ft55x6L2AAV/1fXtsSR96VylZ07aa/8R+cb1nUCecH5Z
	cGe5gvUQwzqFrf9YpMdxCdYzwkHwVljnJ6GZ4LlFvio+WTgs0CrI4+p0FuliVW+NKKLMJCetkgFbt
	23fGNXTAbuz3gIZQl5Ynlf9USGx+iiTiOhQosUqsa0p+zmOwSRvAj/nYPnXDSFyQM0pnFBhcS+Li2
	oFiUyvUsKk6/+/9snVj6PJC1ziLPig87/EDpk/rKkienpOV2daTP9gC1AHAauCGy/1obQSuOh0lSG
	qz03PEVN6tBGBMEJXLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr3iE-00FgN0-3b; Wed, 09 Jun 2021 19:18:02 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr3iB-00FgLb-MP
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 19:18:01 +0000
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de
 [79.239.201.214])
 by mail.holtmann.org (Postfix) with ESMTPSA id 19970CECD6;
 Wed,  9 Jun 2021 21:25:52 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Record debug log for Mediatek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210609190734.30088-1-mark-yw.chen@mediatek.com>
Date: Wed, 9 Jun 2021 21:17:52 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, michaelfsun@google.com,
 shawnku@google.com, jemele@google.com
Message-Id: <35B0FA64-903D-4747-8D39-4FA48D30A680@holtmann.org>
References: <20210609190734.30088-1-mark-yw.chen@mediatek.com>
To: mark-yw.chen@mediatek.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_121759_936487_ABC7FA8C 
X-CRM114-Status: GOOD (  17.21  )
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

> 1. Add btusb_recv_bulk_mtk to receive debug log.
> 2. Send the debug log via hci_recv_diag channel.
> 3. The upper layerd use hci_channel_minitor to receive
>   these packets.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 67 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index b015dcecfb13..2a55ae0a5f8c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3851,6 +3851,72 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int btusb_recv_bulk_mtk(struct btusb_data *data, void *buffer, int count)
> +{
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +	int err = 0;
> +
> +	spin_lock_irqsave(&data->rxlock, flags);
> +	skb = data->acl_skb;
> +
> +	while (count) {
> +		int len;
> +
> +		if (!skb) {
> +			skb = bt_skb_alloc(HCI_MAX_FRAME_SIZE, GFP_ATOMIC);
> +			if (!skb) {
> +				err = -ENOMEM;
> +				break;
> +			}
> +
> +			hci_skb_pkt_type(skb) = HCI_ACLDATA_PKT;
> +			hci_skb_expect(skb) = HCI_ACL_HDR_SIZE;
> +		}
> +
> +		len = min_t(uint, hci_skb_expect(skb), count);
> +		skb_put_data(skb, buffer, len);
> +
> +		count -= len;
> +		buffer += len;
> +		hci_skb_expect(skb) -= len;
> +
> +		if (skb->len == HCI_ACL_HDR_SIZE) {
> +			__le16 dlen = hci_acl_hdr(skb)->dlen;
> +
> +			/* Complete ACL header */
> +			hci_skb_expect(skb) = __le16_to_cpu(dlen);
> +
> +			if (skb_tailroom(skb) < hci_skb_expect(skb)) {
> +				kfree_skb(skb);
> +				skb = NULL;
> +
> +				err = -EILSEQ;
> +				break;
> +			}
> +		}
> +
> +		if (!hci_skb_expect(skb)) {
> +			/* Complete frame */
> +			if (skb->data[0] == 0x6f && skb->data[1] == 0xfc) {
> +				usb_disable_autosuspend(data->udev);
> +				hci_recv_diag(data->hdev, skb);
> +			} else if ((skb->data[0] == 0xfe || skb->data[0] == 0xff) &&
> +				   skb->data[1] == 0x05) {
> +				hci_recv_diag(data->hdev, skb);
> +			} else {
> +				hci_recv_frame(data->hdev, skb);
> +			}
> +			skb = NULL;
> +		}
> +	}
> +
> +	data->acl_skb = skb;
> +	spin_unlock_irqrestore(&data->rxlock, flags);
> +
> +	return err;
> +}
> +
> MODULE_FIRMWARE(FIRMWARE_MT7663);
> MODULE_FIRMWARE(FIRMWARE_MT7668);
> 
> @@ -4669,6 +4735,7 @@ static int btusb_probe(struct usb_interface *intf,
> 		hdev->setup = btusb_mtk_setup;
> 		hdev->shutdown = btusb_mtk_shutdown;
> 		hdev->manufacturer = 70;
> +		data->recv_bulk = btusb_recv_bulk_mtk;
> 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);

NO. The recv_bulk was meant for cases when bulk was faster and needed to redirected as interrupt/event data. Doing a complete copy of btusb_recv_bulk is not acceptable. You need to introduce data->recv_acl.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
