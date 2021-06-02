Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52178C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 06:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476FE61376
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 05:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476FE61376
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6kgBmCcM0C+geI2hC4HGjKkiZ0sPoKWVksYmOWgfAWY=; b=j/4w+M7fOoCWC1C/3Seydqvqom
	mzU4RrssnOzqVPmf5sHhQADy+xtZDizv+vAUpRj+/CK0JG2chysxhCVwTojGNuvfJTkwH+6xCKDdA
	NLY3Mo0f9f/8V4Ykwg89XTehKw0PI3kzdO0kk+7H5jt/j96jGlljfbyCqiL5v0p83KthwwcnucCEg
	6qJGDXx1/xSP3urAUFXKXN1Zf9hYILJVbHTYr0a40bX68ZydlJ10Z8FTz1E7KcmMzVrNbeyKeKnx1
	JLpoJGda+rVpm3i2pMeRQHWSyAf2D8nGh5geBneb8UPdQ+QTHx6kcRG709wgf7jH5RQUbu7S16jqE
	Zw1M6XPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loJuw-001y4o-Ii; Wed, 02 Jun 2021 05:59:50 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loJuu-001y3x-GF
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 05:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lN8/WHahPS6Oiuz3dBMVM7+Nsxw5i+AV4hZOC9FGpq4=; b=R26yzoy+oQb5oBSs57uUL8LDQq
 5sZIFKYWdxFE2xroyQfisxed/IzDiw25CTCS+F38p0AisNn8yCXtSViAGMQ87kn5aecbJcc3swjcM
 EGjyxXGkgTp4B0nc5Wiqfh75Cq86y7eDWWIojhdvhxjUhzl/+VvaY9p3CnvMRudlcFPA=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1loJum-0002lU-S7; Wed, 02 Jun 2021 07:59:40 +0200
Subject: Re: [PATCH v2 1/3] mt76: connac: add mt76_connac_mcu_update_sta_cmd
 support
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <6ddea8d1-551d-5a58-267c-506d22cc932f@nbd.name>
Date: Wed, 2 Jun 2021 07:59:40 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <db74f1c3acd2a2729066810ad72b656681a30693.1622610746.git.objelf@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_225948_787475_30803B50 
X-CRM114-Status: GOOD (  17.67  )
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


On 2021-06-02 07:24, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add mt76_connac_mcu_update_sta_cmd support that is the prerequisite patch
> for we are able to update the station record with the current state the
> station has into the offload firmware at runtime.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1->v2: no change
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  6 ++--
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 32 ++++++++++++++-----
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 16 ++++++++--
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  8 +++--
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 +-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
>  6 files changed, 50 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index d64b8058b744..6666507f43ed 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -902,6 +902,14 @@ struct mt76_connac_suspend_tlv {
>  	u8 pad[5];
>  } __packed;
>  
> + /* 0: state 1 - unauthenticated & unassociated
> +  * 1: state 2 - authenticated & unassociated
> +  * 2: state 3 - authenticated & associated
> +  */
> +#define MT76_STA_INFO_STATE_1	0
> +#define MT76_STA_INFO_STATE_2	1
> +#define MT76_STA_INFO_STATE_3	2
Please turn this into an enum:

enum mt76_sta_info_state {
	MT76_STA_INFO_STATE_NONE,
	MT76_STA_INFO_STATE_AUTH,
	MT76_STA_INFO_STATE_ASSOC
};

The _1 _2 _3 suffixes are not that readable and add extra confusion by
not matching the numeric values.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
