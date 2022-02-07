Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA142C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Zg4gMf+jOlEe4xGxfTvb2LWSKM2rrnJjt3DrmC6A5s=; b=teWCeNetYO+lG4
	c62KQ0skZOIUaZOiDCtvQ9nm76i2bs0mQ0ZJm9dvy4l5C4BBxX5MOw6ItDr6UlNq4iNjF2TSDjHyE
	26UBedP/vTRaPsRIti6PNXrMK5qL+Xm1/gg+2634fBzr+NMmuKVK8kGQDCWL47JiIsSMdKkPtj5Zf
	5JndOvzAFu531XnAGL8dNGOAubI+ab6rI5kvGjIFoxz8MWNgjzGgiPM5V2r3h5n+8Vp3kRbpB5ROJ
	aMiCK0OVVGVtppY4oDb8V6mk6ZR4iVMeb26F5GH0znTlRkPEjxSJBPl6KR+9HWGg5x0eD0DBIK6XA
	vKVAzQdmeNYCrzuunu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6eq-00B0ps-FO; Mon, 07 Feb 2022 16:14:28 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6FT-00AqEw-UY
 for linux-mediatek@lists.infradead.org; Mon, 07 Feb 2022 15:48:18 +0000
Received: from smtpclient.apple (p4ff9f3e5.dip0.t-ipconnect.de
 [79.249.243.229])
 by mail.holtmann.org (Postfix) with ESMTPSA id 2285ECECF1;
 Mon,  7 Feb 2022 16:48:10 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/2] Bluetooth: mediatek: fix the conflict between mtk and
 msft vendor event
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objelf@gmail.com>
Date: Mon, 7 Feb 2022 16:48:09 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <1CE2BE2F-A47D-4EEF-809A-035775125D83@holtmann.org>
References: <52ae30c33f2994efcdff180764801141d59e6e0c.1643435854.git.objelf@gmail.com>
 <2eed797ac2605bd068a025486fc0c09c2687e50c.1643435854.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_074816_177248_AE37A2D5 
X-CRM114-Status: GOOD (  25.38  )
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

Hi Sean,

> There is a conflict between MediaTek wmt event and msft vendor extension
> logic in the core layer since 145373cb1b1f ("Bluetooth: Add framework for
> Microsoft vendor extension") was introduced because we changed the type of
> mediatek wmt event to the type of msft vendor event in the driver.
> 
> But the purpose we reported mediatek event to the core layer is for the
> diagnostic purpose with that we are able to see the full packet trace via
> monitoring socket with btmon. Thus, it is harmless we keep the original
> type of mediatek vendor event here to avoid breaking the msft extension
> function especially they can be supported by Mediatek chipset like MT7921
> , MT7922 devices and future devices.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtk.h     | 1 +
> drivers/bluetooth/btmtksdio.c | 9 +--------
> drivers/bluetooth/btusb.c     | 5 -----
> 3 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 8960a5f89d48..013850fd2055 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -5,6 +5,7 @@
> #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
> #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
> 
> +#define HCI_EV_WMT 0xe4
> #define HCI_WMT_MAX_EVENT_SIZE		64
> 
> #define BTMTK_WMT_REG_WRITE 0x1
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index 8e200e80d2f6..cbb09e1b823d 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -381,13 +381,6 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
> 	struct hci_event_hdr *hdr = (void *)skb->data;
> 	int err;
> 
> -	/* Fix up the vendor event id with 0xff for vendor specific instead
> -	 * of 0xe4 so that event send via monitoring socket can be parsed
> -	 * properly.
> -	 */
> -	if (hdr->evt == 0xe4)
> -		hdr->evt = HCI_EV_VENDOR;
> -
> 	/* When someone waits for the WMT event, the skb is being cloned
> 	 * and being processed the events from there then.
> 	 */
> @@ -403,7 +396,7 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
> 	if (err < 0)
> 		goto err_free_skb;
> 
> -	if (hdr->evt == HCI_EV_VENDOR) {
> +	if (hdr->evt == HCI_EV_WMT) {
> 		if (test_and_clear_bit(BTMTKSDIO_TX_WAIT_VND_EVT,
> 				       &bdev->tx_state)) {
> 			/* Barrier to sync with other CPUs */
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index aefa0ee293f3..55ebab019d29 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2271,11 +2271,6 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
> 		skb_put_data(skb, urb->transfer_buffer, urb->actual_length);
> 
> 		hdr = (void *)skb->data;
> -		/* Fix up the vendor event id with 0xff for vendor specific
> -		 * instead of 0xe4 so that event send via monitoring socket can
> -		 * be parsed properly.
> -		 */
> -		hdr->evt = 0xff;
> 
> 		/* When someone waits for the WMT event, the skb is being cloned
> 		 * and being processed the events from there then.

please fix the reported issue by kernel test robot.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
