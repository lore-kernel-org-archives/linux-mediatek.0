Return-Path: <SRS0=fxQu=2M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838D1C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 14:15:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554C220665
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 14:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANfy4zUP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="trcjrr1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554C220665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFVixLGKrz1KW9SVK/DoyT5yn3b6nMmSAJrlwFUEuRo=; b=ANfy4zUPYdboRN
	S+Sww3N8gogfQrLj9ALlxDVJaadRiHDBEt6d8tI+LCcO7dmLlV0h0HmoHg8L0ssRU89URyX/scGl1
	n4BiyvXLDbAb5dAvmsjvCZNH4Sziv7M967z+EslTOoc25eS+9rZjzaiIQx4Ea3/oIrr4opxNBk2KP
	vqlIioobEZ6byJC5bI6jXTIfeASMSoutw+uZ5iHGW5x1jv80Q/RQXOvGWqf99zceUagHgH0K3zsLz
	UbECbbuggCKeqGXV9QrHWF1kMt9wcC6+4aj03AfwMjt7o5RfPoiUgXGxjVYnFYF5h7OlwiNM16D8m
	eOffHY6gxnbviLRe5kQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij20T-000510-4e; Sun, 22 Dec 2019 14:14:53 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij1z5-0003oT-9H
 for linux-mediatek@lists.infradead.org; Sun, 22 Dec 2019 14:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m0FgooPBBIw1l4x4W2SABSMsW8gCsRYOEWrhJk0KSk8=; b=trcjrr1L5OUiRNoawN+h04Qicr
 GyfvtVwhZbylyzWYSwPL/rfT2N39PmXENs4hpxRFmblIdqYnOkKWqyp0zowTj3THxKB/3R4NmDjj8
 MEGzqOosu38d0cY9tb6JLFexPwi5O8oOCIkF8qgsKmWJp/w2q11ETb0L6KoKRJZbKj9M=;
Received: from [81.95.5.44] (helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ij1yz-0000ut-DI; Sun, 22 Dec 2019 15:13:21 +0100
Subject: Re: [PATCH 2/2] mt76: mt7615: add set_antenna callback
To: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
References: <d3d47e29e2a39c42adfcf912a27b9d19a01d5010.1576381077.git.ryder.lee@mediatek.com>
 <6b3ac6736c0cfa12492f383ec9cfcaad91bfb965.1576381077.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; prefer-encrypt=mutual; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCfTKx80VvCR/PvsUlrvdOLsIgeRGAAn1ee
 RjMaxwtSdaCKMw3j33ZbsWS4
Message-ID: <a29cf0f3-6f7d-9fe5-8d5f-70712963366d@nbd.name>
Date: Sun, 22 Dec 2019 15:13:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <6b3ac6736c0cfa12492f383ec9cfcaad91bfb965.1576381077.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_061328_107757_19B254EE 
X-CRM114-Status: GOOD (  16.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2019-12-15 04:56, Ryder Lee wrote:
> Add a set_antenna callback to setup per phy tx/rx streams.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/main.c  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> index 759a66997c6f..70791544a088 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -48,6 +48,8 @@ static int mt7615_start(struct ieee80211_hw *hw)
>  		mt7615_mcu_set_mac_enable(dev, 1, true);
>  	}
>  
> +	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
> +
>  	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
>  
>  	if (running)
This chunk needs to be moved to the first patch to avoid creating a
regression.

> @@ -635,6 +637,33 @@ mt7615_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
>  	mt7615_mac_set_timing(phy);
>  }
>  
> +static int
> +mt7615_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
> +{
> +	struct mt7615_dev *dev = mt7615_hw_dev(hw);
> +	struct mt7615_phy *phy = mt7615_hw_phy(hw);
> +	int max_nss = hweight8(hw->wiphy->available_antennas_tx);
> +	bool ext_phy = phy != &dev->phy;
> +
> +	if (!tx_ant || tx_ant != rx_ant || ffs(tx_ant) > max_nss)
> +		return -EINVAL;
> +
> +	if ((BIT(hweight8(tx_ant)) - 1) != tx_ant)
> +		tx_ant = BIT(ffs(tx_ant) - 1) - 1;
> +
> +	mutex_lock(&dev->mt76.mutex);
> +
> +	phy->mt76->antenna_mask = tx_ant;
> +	phy->chainmask = ext_phy ? tx_ant << 2 : tx_ant;
> +
> +	mt76_set_stream_caps(&dev->mt76, true);
> +	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
This call is unnecessary, because antenna settings can only be changed
when the device is not running.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
