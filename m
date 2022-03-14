Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONjQ+sh8JFV4Ph8r1ZuCENFMfqGFzfz5CDaLqtHuA/U=; b=KGa7Zm67cL6HR5
	uUMgj3LK+4WYvyf3TFD4VCxPusaTP3NSAEGZuf9ja5wQf8BHUuOg7tcBuFAMqEl8/S7HSM6/eF5qv
	8hC1qioDc7dpUaVtb57qLllIQojhKVZkjfTTgcwrd8nvD4s04g8OSOOggCcOy9OTdAoctI+8A15R5
	a0yKNrSZKGGz/extZlG2GWCysK1C7JkgfjgQacrkvo87BoWT3wJNMCGDj8+7N3uWk/hdQoilp3IwU
	eIAtC5eW8EjqfjqMBJvgRTb9M6Nrdj9kaPbLYMRv4tacbSLr2OB4mlp1bQA4eHrmVGK1XrE2w5wUp
	nR1hcfgW0Q1hlXlcUiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlpL-005hXF-CO; Mon, 14 Mar 2022 14:37:39 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlpI-005hVn-4i
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 14:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xNq6R8CjDCXlgfqdVyRSKbiUrrTEQsCB2SHbde1EVIo=; b=ueQzZMLY6sv7oib52NnvNSbThC
 eWn9zwDVUwopsUyoFCrk2MfooDF2l9LxG1hn4u5BGLF+pgFtlgTj1v+hsDBQ8csOQSgLv221ErlgG
 5334gc72PuVvJ6lajzxB/rsgYtXdXt+TBsef4wHnYfrOF4knT1ryeOlelAfIQQF9yQTQ=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nTlp9-00006D-9L; Mon, 14 Mar 2022 15:37:27 +0100
Message-ID: <f105dff0-f78e-72c5-5558-ab532e95f87e@nbd.name>
Date: Mon, 14 Mar 2022 15:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] mt76: mt7915: fix MBSS index condition in DBDC mode
Content-Language: en-US
To: Evelyn Tsai <evelyn.tsai@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Bo Jiao <bo.jiao@mediatek.com>
References: <20220309140249.10285-1-evelyn.tsai@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220309140249.10285-1-evelyn.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_073736_421083_BA2DC382 
X-CRM114-Status: GOOD (  14.26  )
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

On 09.03.22 15:02, Evelyn Tsai wrote:
> MT7915_MAX_INTERFACES is per-band declartion.
> 
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt76.h        | 2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> index 5e10fe156926..c60af144f611 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -727,7 +727,7 @@ struct mt76_dev {
>   	u32 wcid_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
>   	u32 wcid_phy_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
>   
> -	u32 vif_mask;
> +	u64 vif_mask;
>   
>   	struct mt76_wcid global_wcid;
>   	struct mt76_wcid __rcu *wcid[MT76_N_WCIDS];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> index c3f44d801e7f..9eefc132d77a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -205,7 +205,7 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
>   		phy->monitor_vif = vif;
>   
>   	mvif->mt76.idx = ffs(~dev->mt76.vif_mask) - 1;
> -	if (mvif->mt76.idx >= MT7915_MAX_INTERFACES) {
> +	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
This patch is incomplete. There are several other places in the code 
that are not prepared for vif_mask being 64 bits wide, including the ffs 
line above.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
