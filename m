Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6D9C36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLiTjAfO3VovUn3zVLLPrqMzdMiQpK1B1IVgeKroo3c=; b=K9yYOm5HyudfbTdCBZ0m4Y4x2K
	p8UJ5WhFLR5jYoWHovodlYjKKPLcLiXl0ZoRgc4g1rFGAFFRU5NpNAHz3C1qiRR9+Q6sG5HXScO/N
	SuIGijYFJAE8nWeJckPnD3Yj9WsQ0rqjONFVStDH75+F7gCNvXDb9i78qKXUoWLtF/Eaks8Ff9hVQ
	5E7rCOllfLFz0jfDOJH36zbZf0cnctJjv/l+LarnZeaZ63cfM6Ux+WiIORmlb7nVaNKky2QJ69ABH
	nlByWCih/uT7cDyG18Pj3NL8hHrcqY0thFRdGvBALZKMh8Aq1UnwuLGPWaIK0a5rBBOmBziQskibS
	fUpV2LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DTR-0000000Djqj-37Zs;
	Fri, 11 Apr 2025 12:27:09 +0000
Received: from e2i655.smtp2go.com ([103.2.142.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DPE-0000000Diux-0x2R
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 12:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1744375066; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=vLiTjAfO3VovUn3zVLLPrqMzdMiQpK1B1IVgeKroo3c=; b=VkmNvoLHMMW/T1904aro1ObkBf
	ds85M/x/ANIqpbkCIkv/YnMnlZeayAWsNMBHOSNU4121bj+6CWCL4aiJG1xzs1vGS0JfLhgywp7bN
	qHe1LVW7wq0EPS6ON1nYIChnIcmnKF+tafI/rT29nUHaUX247yHNPm1Yghs8lv6Cs6igGT+sM/9wN
	tKYD9n9h9/R+3pBP01ujVgsveAtksfQjhFUupYTV3gKC6ys7QO5bSb4XRsQwM1pi6LdPXjEcvCC0w
	/5oHN1wQg27rA64+SWIvDMu5R3VRSZiixvN9u3HeIcY6E4o1v8ZuL7QmCZ36uA6TIC2KJnhkZ4j4L
	dgmLiO0A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1744374166; h=from : subject
 : to : message-id : date;
 bh=vLiTjAfO3VovUn3zVLLPrqMzdMiQpK1B1IVgeKroo3c=;
 b=ViP9sTf+CRP7RIM2c79EBZNH+sLhiyCwAjUo9fuQAx5MLMiRwE6PqB3cA0qeNzsX7GIMp
 H9QrRzJyuSACon+ISuwI5rlT2uOcNOkS5Nizxvk3vas6yYGkssAky2TZQzQVqjBH4nH9dbE
 OkgiPeacZtHgXjY+DlGMy9wOlwCLVmjwjtpCaxIBuz0VSVVfF+0+NY4LAQ8JGNZMPRSeQKZ
 VrKMgFLR5f5oJhrbDRSW05EwOQ+fElyDAobpJ2tDhIpR2wDFbuHUs6+lXGIFe1JXpNTa/Tp
 JQBrIAxlU0b1I1GPLmM0IBf2WAvEw2doToR1au0fJWyxMKMPEN/gcDzxsTrQ==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3DOq-qt4G4P-GK; Fri, 11 Apr 2025 12:22:24 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3DOq-4o5NDgrtE4J-kMgP; Fri, 11 Apr 2025 12:22:24 +0000
Date: Fri, 11 Apr 2025 14:15:52 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes@sipsolutions.net, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
Message-ID: <Z_kH-AuYGGNb3R4t@pilgrim>
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
 <20250410215527.3001-1-spasswolf@web.de> <Z_jpq26P99qzPP1c@pilgrim>
 <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
X-Smtpcorp-Track: xWRZWvew0kIM.VLiaXJOyKq9g.qHUHXA58wkT
Feedback-ID: 510616m:510616apGKSTK:510616sBGiWowcYh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_052248_807240_D74FD4FD 
X-CRM114-Status: GOOD (  41.37  )
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

On Fri, Apr 11, 2025 at 01:10:02PM +0200, Bert Karwatzki wrote:
> Am Freitag, dem 11.04.2025 um 12:06 +0200 schrieb Remi Pommarel:
> > Hi Bert,
> >
> > On Thu, Apr 10, 2025 at 11:55:26PM +0200, Bert Karwatzki wrote:
> > > This commit breaks the mediatek mt7921 wireless driver. In linux-next-20250410
> > > my mt7921e Wi-Fi controller is no longer able to connect to a network.
> > > I bisected this to commit a104042e2bf6 ("wifi: mac80211: Update skb's control
> > > block key in ieee80211_tx_dequeue()").
> > >
> > > Hardware:
> > > 04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
> > >
> > > This debugging patch reveals that the change causes key to be NULL in
> > > mt7921_tx_prepare_skb().
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > index 881812ba03ff..3b8552a1055c 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > @@ -13,6 +13,7 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> > >         struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
> > >         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
> > >         struct ieee80211_key_conf *key = info->control.hw_key;
> > > +       dev_info(mdev->dev, "%s: key = %px\n", __func__, key);
> > >         struct mt76_connac_hw_txp *txp;
> > >         struct mt76_txwi_cache *t;
> > >         int id, pid;
> > >
> > >
> > > So why is info->control.hw_key not updated by ieee80211_tx_h_select_key()?
> > >
> > > diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> > > index 34f229a6eab0..2510e3533d13 100644
> > > --- a/net/mac80211/tx.c
> > > +++ b/net/mac80211/tx.c
> > > @@ -631,8 +631,10 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  		case WLAN_CIPHER_SUITE_WEP40:
> > >  		case WLAN_CIPHER_SUITE_WEP104:
> > >  		case WLAN_CIPHER_SUITE_TKIP:
> > > -			if (!ieee80211_is_data_present(hdr->frame_control))
> > > +			if (!ieee80211_is_data_present(hdr->frame_control)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > +			}
> > >  			break;
> > >  		case WLAN_CIPHER_SUITE_CCMP:
> > >  		case WLAN_CIPHER_SUITE_CCMP_256:
> > > @@ -641,19 +643,23 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  			if (!ieee80211_is_data_present(hdr->frame_control) &&
> > >  			    !ieee80211_use_mfp(hdr->frame_control, tx->sta,
> > >  					       tx->skb) &&
> > > -			    !ieee80211_is_group_privacy_action(tx->skb))
> > > +			    !ieee80211_is_group_privacy_action(tx->skb)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > -			else
> > > +			} else {
> > >  				skip_hw = (tx->key->conf.flags &
> > >  					   IEEE80211_KEY_FLAG_SW_MGMT_TX) &&
> > >  					ieee80211_is_mgmt(hdr->frame_control);
> > > +			}
> > >  			break;
> > >  		case WLAN_CIPHER_SUITE_AES_CMAC:
> > >  		case WLAN_CIPHER_SUITE_BIP_CMAC_256:
> > >  		case WLAN_CIPHER_SUITE_BIP_GMAC_128:
> > >  		case WLAN_CIPHER_SUITE_BIP_GMAC_256:
> > > -			if (!ieee80211_is_mgmt(hdr->frame_control))
> > > +			if (!ieee80211_is_mgmt(hdr->frame_control)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > +			}
> > >  			break;
> > >  		}
> > >
> > > @@ -662,9 +668,13 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  			     tx->skb->protocol != tx->sdata->control_port_protocol)
> > >  			return TX_DROP;
> > >
> > > +		printk(KERN_INFO "%s: skip_hw=%d tx->key=%px\n",
> > > +				__func__, skip_hw, tx->key);
> > >  		if (!skip_hw && tx->key &&
> > > -		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE)
> > > +		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
> > >  			info->control.hw_key = &tx->key->conf;
> > > +			printk(KERN_INFO "%s: info->control.hw_key = %px\n", __func__, info->control.hw_key);
> > > +		}
> > >  	} else if (ieee80211_is_data_present(hdr->frame_control) && tx->sta &&
> > >  		   test_sta_flag(tx->sta, WLAN_STA_USES_ENCRYPTION)) {
> > >  		return TX_DROP;
> > > @@ -3894,6 +3904,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
> > >  	 * The key can be removed while the packet was queued, so need to call
> > >  	 * this here to get the current key.
> > >  	 */
> > > +	printk(KERN_INFO "%s: info->control.hw_key = %px, setting to NULL\n",
> > > +			__func__, info->control.hw_key);
> > >  	info->control.hw_key = NULL;
> > >  	r = ieee80211_tx_h_select_key(&tx);
> > >  	if (r != TX_CONTINUE) {
> > >
> > > This patch reveals that tx->key is set to NULL (in the @@ -641,19 +643,23 @@ chunk)
> > > and so the updating of info->contro.hw_key is skipped:
> > >
> > > [   17.411298] [   T1232] ieee80211_tx_h_select_key 647: setting tx->key = NULL
> >
> > That means that we are trying to send non management frames using
> > AES_CMAC, or BIP_* cipher, aren't those ciphers used only for group
> > management frames ?

Thanks for the debug.

I completely miscalculated the line here sorry. In fact it means here
that mt7921e needs a key for null data frames or for non protected
management frames.

As a lot of your frame control dump does not make sense to me (e.g.
0xffff) maybe you could try to print the fc here at line 647. Just a
wild guess maybe mt7921e needs MT_TXD3_PROTECT_FRAME for NULL data
frames ?

> >
> > > [   17.411300] [   T1232] ieee80211_tx_h_select_key: skip_hw=0 tx->key=0000000000000000
> > > [   17.411307] [   T1232] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key = 0000000000000000
> > >
> > > If I revert commit a104042e2bf6 while keeping the debug patches it shows that
> > > the for mt7921e the key is never updated in ieee80211_tx_h_select_key(), mt7921e
> > > relies on the key your patch is setting to NULL.
> > >
> > > Is this a problem with your patch or with the mt7921e driver that just got
> > > revealed by your patch?
> >
> > Not sure yet, do you happen to know which kind of frame mt7921e is
> > trying to be sent using this NULL key ?
> >
> > Thanks,
> 
> I modified my debugging patch to print mgmt->frame_control, if needed I could
> also insert a nore complicated function printing out frame types using the
> ieee80211_is_*() functions:
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> index 881812ba03ff..cfbe7e1e4713 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -13,6 +13,9 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void
> *txwi_ptr,
>         struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
>         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
>         struct ieee80211_key_conf *key = info->control.hw_key;
> +       struct ieee80211_mgmt *mgmt = (void *)tx_info->skb->data;
> +       __le16 fc = mgmt->frame_control;
> +       dev_info(mdev->dev, "%s: key = %px fc = 0x%hx\n", __func__, key, fc);
>         struct mt76_connac_hw_txp *txp;
>         struct mt76_txwi_cache *t;
>         int id, pid;
> 
> and get this, while unsuccesfully trying to connect (also note that one time
> getting a key worked):
> 
> $ dmesg | grep prepare_skb
> [   11.775642] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   11.800047] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   13.365330] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   13.370257] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   16.468481] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   16.472407] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   16.542017] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x188
> [   16.549581] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x188
> [   16.597120] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xffff

Thanks again for taking time to debug that.
As said above some of those fc does not make sense to me as I am not
expected first two bits (Protocol version) to be non null.

> [   16.612263] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xd0
> 
> Here we actually go a key:
> [   16.614478] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> ffff89c275297230 fc = 0x4188
> [...]

-- 
Remi

