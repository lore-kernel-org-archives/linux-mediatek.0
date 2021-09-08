Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 18:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAD760E77
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBAD760E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bHazCxAYmUoQY0723vasjhP7ISHNXIXfY2lLlNH9uI=; b=r0IFVXIAOWCjeq
	3RaCg0T2jNAHYt2xoYtpLBeaHVbvauhoT8d9hhk/RJMxyvfsySdMUgB2TcAD0j6jUn1DhweR6EzX/
	xavTA9P4azTenxTqCAAQeb6IgSWaxGlT0ZsCieDqhaswH7DT5bTK5No8/f4s7b6Da37FtNb1AFmiO
	tl7Jz8IbwEQQIc11tPG82fNulvxwmyzklAc+3sJR1FzH5Qyc1+0kQdoa+wtccM/yFjPoPs477EHqW
	F8bRkNsWpiQIPkF/y5EyVKshZz9/IgWTZrZXT8U+3sWyU4csMoSEtyM4B/vzof0GFmZ38EoVLzLUf
	BzT2V9CN/TYm1OI6V7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO2je-007QOv-Oz; Wed, 08 Sep 2021 18:55:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO2ja-007QOZ-Iy
 for linux-mediatek@lists.infradead.org; Wed, 08 Sep 2021 18:55:49 +0000
X-UUID: f1949c60623c4a3da9ffb01be0a0b360-20210908
X-UUID: f1949c60623c4a3da9ffb01be0a0b360-20210908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1007522865; Wed, 08 Sep 2021 11:55:41 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 11:55:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 9 Sep 2021 02:55:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Sep 2021 02:55:26 +0800
Message-ID: <dbb767a306983d59beb68cb6249cd089805bb5e8.camel@mediatek.com>
Subject: Re: [PATCH v3 8/8] mt76: mt7915: set muru platform type
From: Ryder Lee <ryder.lee@mediatek.com>
To: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Thu, 9 Sep 2021 02:55:26 +0800
In-Reply-To: <20210908094144.25641-8-shayne.chen@mediatek.com>
References: <20210908094144.25641-1-shayne.chen@mediatek.com>
 <20210908094144.25641-8-shayne.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_115546_705216_B4AB9D5F 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, 2021-09-08 at 17:41 +0800, Shayne Chen wrote:
> Set muru platform type by mcu cmd to notify fw to init corresponding
> algorithm.
> 
> Suggested-by: Money Wang <money.wang@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
> v3: - fix endianess
>     - rework muru ctrl function
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 17
> +++++++++++++++++
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.h |  5 +++++
>  .../net/wireless/mediatek/mt76/mt7915/mt7915.h  |  1 +
>  .../wireless/mediatek/mt76/mt7915/testmode.c    | 16 +++++--------
> ---
>  .../wireless/mediatek/mt76/mt7915/testmode.h    |  4 ----
>  5 files changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index 229ba3c469d1..afafc47264cd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2949,6 +2949,21 @@ static int mt7915_mcu_set_mwds(struct
> mt7915_dev *dev, bool enabled)
>  				 sizeof(req), false);
>  }
>  
> +int mt7915_mcu_set_muru_ctrl(struct mt7915_dev *dev, u32 cmd, u8
> *val)
> +{
> +	struct {
> +		__le32 cmd;
> +		u8 val[4];
> +	} __packed req = {
> +		.cmd = cpu_to_le32(cmd),
> +	};
> +
> +	memcpy(req.val, val, sizeof(req.val));

Will this lead to undefined behavior if memcpy size larger than source?
what about passing u32 and using put_unaligned_le32?

Ryder


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
