Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E9CC282D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Mar 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNYNMfF+jTDzLVW8608KEeCxEFIshIP9ukCWf/tuSYo=; b=KUTntzwkZ5xd9WQnl2GHmmvuiN
	p6T7GAJiQFttXY0lgmymbou9p0OGPkQ+JDzjBxEe2XEm0Wgs7dNbY85j5D+x9ngw3Tt+TeY93/DIt
	GNPsBxOwmpeT/c/bHsmGZSgL/MCEmdyqpUv5z9TMGX4ee/cDFW5E8q7fqjVFBfl3wI45c8cVluhst
	1CvEXF6Kcnox3ToRHEHcR2qHvWLzvpdxaF1wRiwfdIRqq05DKwoT3XnE4QAZq3EIlTJH/5ABEBlRA
	vja8icc6b3geQ0/M97FudZW91ShcW0UUivBd8WPxwpmm/2IZnloOrtZmP0LtNCmZfn5QSwOjoqe2F
	1Fx3cwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp79l-00000001B2g-2vEp;
	Mon, 03 Mar 2025 14:52:33 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp73R-00000001A0K-4Aqh
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Mar 2025 14:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741013157; x=1741617957; i=ps.report@gmx.net;
	bh=lNYNMfF+jTDzLVW8608KEeCxEFIshIP9ukCWf/tuSYo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lKlxEGz5BeYGhunB3zRChQD4xVSF3uHrpSxfUlaPkWo7CVp5x5RUmWvUzhdvbYyA
	 ckciuu8bj3xEVe90H6MxzL6lKMt/JtysImg8tyX+EVO4zN+lyxplPDyRhipsaX8Cc
	 VoyC7peLwF5ANuOHdOIYHgFkuOmZ98+NtObJWjqNRpa1M4EWIpDCqdtmMNm5nIjKh
	 1gOBow9+6iF3J1H5pnnqBqDZeIDG+UWm5DxjeEZUzB7vS9motKAxlYU7jffNLqzl7
	 FwpkPk9Rhvc6Tav+qbjZHGP7eXpeD5fWBE+lp6uwFGqc6TGSiKyOoWnaEulv/sEq+
	 UC5ZuOIcqdfJmDXtDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.38]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Un-1t2nxe2K6V-00tVYS; Mon, 03
 Mar 2025 15:45:57 +0100
Date: Mon, 3 Mar 2025 15:45:55 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: sean.wang@kernel.org
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com,
 deren.wu@mediatek.com, mingyen.hsieh@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Caleb Jorden <cjorden@gmail.com>
Subject: Re: [PATCH v4 1/6] Revert "wifi: mt76: mt7925: Update
 mt7925_mcu_uni_[tx,rx]_ba for MLO"
Message-ID: <20250303154555.1c30150b@gmx.net>
In-Reply-To: <20250226025647.102904-1-sean.wang@kernel.org>
References: <20250226025647.102904-1-sean.wang@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:836C044Eg2UJLCy9pN4JUDK8y5DgKT703fQVi6O115P8SRA5667
 iuQkJJXxSnGk/bGIYqVNRkH3a3f7crtii7vmwpHMNlONV89bkpYapyPWjO9YM+JSX/QH1pe
 vv6hBhkntiohazCTEMa8N1Pq4oS9nQL3YplzyzsrwgfdzGpppbhyhkzmpI9/Icfy9jh2RKZ
 N6MpP+osdIsTWWKLou2ag==
UI-OutboundReport: notjunk:1;M01:P0:JTu01PcOoyg=;RH9N20BrApwxaQGskNc9JlGRep2
 gAVcwauIGA+tuFgO3S8dABeSE6Q/L56AHkGmfV6QRixvhsDWP+P0YQw+DAOMhNXRS4uzXEwub
 RFPpUXUv2kvNcrOvBoPaaIc9D7Gugbkjch2cF3ah9lOsy+XS5ujSl0/RuPGsgmIYNY9Klo6iY
 WoJJWJVpcSoEoNEe/oaz3xcVSI5kJvs2mUg17oHOj4jKRyArDOVgT3m2NgtuoNeCYrTQhpWBY
 z+TCWSNZtJld2xYHWH/XlfRXY5vjqBHURbV/dkzku+oVDxfQ5yO+F7hX4buD9QREjIW7h6yW7
 llAoW6VlbYVf/bgkyuyCmUyKJ6ubSXwfqvTixPEYdL9QgQtVEAK+oB+jCH1ezZnSMgHot7T7T
 ElUpIvb+nBFMnvGaSB/Kax4FM6GK9Rfxl1C0/ZGL+36QLjIP45GdYUQ636ngjyj2CYrXEyS3j
 juS97eW1kVt1aoHmylhuN/gI6rnHbHY+dERqZgLbvPFu7va2aRYn0/UBEU9G3nDbRibQ0BP5K
 QTmWcH0OZwiHvoMOURWrIahdBxOm1/zgsWGPTAlhHVb73OWNp8DhoB8EVhoRXSnfuKgGE25D5
 OlTWDXcOmD9xgFVubRDMx5a7l6AyFRyApVFM05O4ll/vo1tdhjYccqvydvjAeDrS5C/1iCqo3
 JoVweiDmWoU+SXvDNVw+6CNnBSoehQZ2V6Loh7xVOkekP90WK5RUs1UANG/+dLjfH15AkxJrW
 rn/8dRJiQDnZOU0U0Ph38zg1Bu4xVQE5bcBB3/GPAqCcv9EfLK7+psZ+hZsDnbR6+h+nI6qH+
 ETqkbJKWRzGvOPxIg1yq3r6hhRGmXg3h6/8wMf9xD4JrNC7bY5SvnxLS+/bBM6YAekHU4AJWm
 TSI1+JwyKEvyT2RB0pk3vnOTrqZxXMkmfbXN2QXDV5swkJ7WxXHjgVIYrNROMDuPgU56ybr2R
 lqMVhNHz1gyHlcf2AUv446U11gkLngjtXnE5xy7KTA0QrK8jsBk4lxu5xZmPcZI7KHPVLgESg
 AopchiQmq/gXggZIaa8FZYWmITZHB3hSU3QglGEw8WLg3g45fyEoG15yk9oWklkzU58lfDaFr
 +nmC7PABNhMLQCFgOCfFB5LoRaMPGe3kiPMWj+z+xiYF4wHd3URrfoOGSptO3vu6TK6RalILd
 9rrKyAXS2Vo0qBM5N+RWHJ4qYU3lteWdVDEsU2Igt0bxGK6QpYwF4h8zPkQv/OYDITMTZKLZp
 zFHtEQary1+GgUH/E9OQd2ebC4f0FCX+uMJKXvjP/Y8PPL85Ts3K0OhvKEHxRS80yGpwH/W8L
 I243PIMA8SOfL2ldW9XKhR4o9MF2r6WWlzpQJ8wAKu76GOYdT7m3BlV8la5IfcSSZA1V0tfQR
 gjE84wpJyfrQ0GSzA3zYqetSsjfZ4H32fCubgjKrlbxdGcEFbX7w4Lk0hO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064602_350633_60AEC684 
X-CRM114-Status: GOOD (  19.99  )
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

Hello *,

On Tue, 25 Feb 2025 18:56:42 -0800, sean.wang@kernel.org wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> For MLO, mac80211 will send the BA action for each link to
> the driver, so the driver does not need to handle it itself.
> Therefore, revert this patch.
>
> Fixes: e38a82d25b08 ("wifi: mt76: connac: Extend mt76_connac_mcu_uni_add=
_dev for MLO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Tested-by: Caleb Jorden <cjorden@gmail.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Seems there is some interest/testcase for this revert here [1] too...

	https://lore.kernel.org/linux-wireless/b994a256-ee2f-4831-ad61-288ae7bc86=
4b@heusel.eu/t/#u

Regards,
Peter


> ---
> v2:
>   1) generate the patch based on the latest mt76 tree
>   2) update the commit message
> v3:
>   1) fixed the merge conflict
> v4:
>   1) added tested-by tag
> ---
>  .../net/wireless/mediatek/mt76/mt7925/main.c  | 10 ++--
>  .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 50 ++++---------------
>  .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 -
>  3 files changed, 15 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/=
net/wireless/mediatek/mt76/mt7925/main.c
> index 98daf80ac131..8dba17c8697c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -1289,22 +1289,22 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, str=
uct ieee80211_vif *vif,
>  	case IEEE80211_AMPDU_RX_START:
>  		mt76_rx_aggr_start(&dev->mt76, &msta->deflink.wcid, tid, ssn,
>  				   params->buf_size);
> -		mt7925_mcu_uni_rx_ba(dev, vif, params, true);
> +		mt7925_mcu_uni_rx_ba(dev, params, true);
>  		break;
>  	case IEEE80211_AMPDU_RX_STOP:
>  		mt76_rx_aggr_stop(&dev->mt76, &msta->deflink.wcid, tid);
> -		mt7925_mcu_uni_rx_ba(dev, vif, params, false);
> +		mt7925_mcu_uni_rx_ba(dev, params, false);
>  		break;
>  	case IEEE80211_AMPDU_TX_OPERATIONAL:
>  		mtxq->aggr =3D true;
>  		mtxq->send_bar =3D false;
> -		mt7925_mcu_uni_tx_ba(dev, vif, params, true);
> +		mt7925_mcu_uni_tx_ba(dev, params, true);
>  		break;
>  	case IEEE80211_AMPDU_TX_STOP_FLUSH:
>  	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
>  		mtxq->aggr =3D false;
>  		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
> -		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
> +		mt7925_mcu_uni_tx_ba(dev, params, false);
>  		break;
>  	case IEEE80211_AMPDU_TX_START:
>  		set_bit(tid, &msta->deflink.wcid.ampdu_state);
> @@ -1313,7 +1313,7 @@ mt7925_ampdu_action(struct ieee80211_hw *hw, struc=
t ieee80211_vif *vif,
>  	case IEEE80211_AMPDU_TX_STOP_CONT:
>  		mtxq->aggr =3D false;
>  		clear_bit(tid, &msta->deflink.wcid.ampdu_state);
> -		mt7925_mcu_uni_tx_ba(dev, vif, params, false);
> +		mt7925_mcu_uni_tx_ba(dev, params, false);
>  		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
>  		break;
>  	}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/mcu.c
> index 15815ad84713..4c133200c70b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -607,60 +607,30 @@ mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt7=
6_vif_link *mvif,
>
>  /** starec & wtbl **/
>  int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
> -			 struct ieee80211_vif *vif,
>  			 struct ieee80211_ampdu_params *params,
>  			 bool enable)
>  {
>  	struct mt792x_sta *msta =3D (struct mt792x_sta *)params->sta->drv_priv=
;
> -	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> -	struct mt792x_link_sta *mlink;
> -	struct mt792x_bss_conf *mconf;
> -	unsigned long usable_links =3D ieee80211_vif_usable_links(vif);
> -	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> -
> -	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) =
{
> -		mconf =3D mt792x_vif_to_link(mvif, link_id);
> -		mlink =3D mt792x_sta_to_link(msta, link_id);
> -		wcid =3D &mlink->wcid;
> -
> -		if (enable && !params->amsdu)
> -			mlink->wcid.amsdu =3D false;
> +	struct mt792x_vif *mvif =3D msta->vif;
> +	struct mt76_wcid *wcid =3D &mvif->sta.deflink.wcid;
>
> -		ret =3D mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
> -					enable, true);
> -		if (ret < 0)
> -			break;
> -	}
> +	if (enable && !params->amsdu)
> +		msta->deflink.wcid.amsdu =3D false;
>
> -	return ret;
> +	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
> +				 params, enable, true);
>  }
>
>  int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
> -			 struct ieee80211_vif *vif,
>  			 struct ieee80211_ampdu_params *params,
>  			 bool enable)
>  {
>  	struct mt792x_sta *msta =3D (struct mt792x_sta *)params->sta->drv_priv=
;
> -	struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> -	struct mt792x_link_sta *mlink;
> -	struct mt792x_bss_conf *mconf;
> -	unsigned long usable_links =3D ieee80211_vif_usable_links(vif);
> -	struct mt76_wcid *wcid;
> -	u8 link_id, ret;
> -
> -	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) =
{
> -		mconf =3D mt792x_vif_to_link(mvif, link_id);
> -		mlink =3D mt792x_sta_to_link(msta, link_id);
> -		wcid =3D &mlink->wcid;
> -
> -		ret =3D mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
> -					enable, false);
> -		if (ret < 0)
> -			break;
> -	}
> +	struct mt792x_vif *mvif =3D msta->vif;
> +	struct mt76_wcid *wcid =3D &mvif->sta.deflink.wcid;
>
> -	return ret;
> +	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
> +				 params, enable, false);
>  }
>
>  static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/driver=
s/net/wireless/mediatek/mt76/mt7925/mt7925.h
> index 8707b5d04743..fd5f9d4ea4a7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> @@ -263,11 +263,9 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev =
*dev,
>  				 struct ieee80211_vif *vif,
>  				 bool enable);
>  int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
> -			 struct ieee80211_vif *vif,
>  			 struct ieee80211_ampdu_params *params,
>  			 bool enable);
>  int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
> -			 struct ieee80211_vif *vif,
>  			 struct ieee80211_ampdu_params *params,
>  			 bool enable);
>  void mt7925_scan_work(struct work_struct *work);


