Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4285C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 23:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB84610C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 23:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FB84610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lw34UKVo7VRpN42fvOAU866EU61ge/h0dpU4hvF8bM=; b=kXsj+rMOXqUJMb
	MaD9e3xRWYXeEDo/si0M4xEk5rF78edv2DecWuL5FAWEx5bFj4f14kKlLZf+KiSuf1ru7PLbnoUAt
	AwauYwiYsHpdIES+ON6sHEKyUfo7hMHh9xacA3N5NAD47vLh1iGOK63kE0gsrJSA8imDHqDpN8RCj
	tpxF+ZTDXnMbZOJsrRqWt2Q6/c8Hs/UoYjm/jD7++l+hAEL9T5IEs6H9UHt/0LCXUeE2ECZAy6X5Z
	4Q0QwyKPZ9rjTRowhXsqZkmTTXuqlJoQm8YEo2VgOg6eqXXKpKLmntwTm7n61Tc4gU8T9NjWRYd2v
	SDlssAh9sDf2pVoqf0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ2GG-008hXW-CT; Wed, 25 Aug 2021 23:24:48 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ2GD-008hWd-Vo
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 23:24:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id i28so2468793lfl.2
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohnyH/sYJ4RhitC7WS5XOqlr5Fq+L2Nsz7HS2qyXv2Y=;
 b=fFTMTLVaSYyrU35PgaGSgyyOg1shsRQ+Vfs/Ao7B4oHszJKMa7Zb9cRkHJZH29RFgO
 q9xVAdKnNr+tuNBJ+fYIGc5UOMoTpdrKSiE+v4QqVwEA9KVFSiD69ThhdrTIkdUfILiM
 AcBYL50IBx3zgSyuh5EEkh6mn4UzaT1Xyx1SZuv8uG2LQsa6bKGXAv1Bijq4BfbNMyEb
 9emQnQH9e0/+9TAhi//CJOgs0TLz7sPAKIVbnTG5ymqKpeG+A3mNyGTrCOURPbGI5Peb
 tCoC3ri3zUPvFid8hu/lauw5jj4o4pvzWQX3bhFIc/V8fNmOhdntAl/xQzYpAKZ0gkyh
 dUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohnyH/sYJ4RhitC7WS5XOqlr5Fq+L2Nsz7HS2qyXv2Y=;
 b=I0TTbcByPQEnb/Hu3HfBBVe/d1bCXTImR9uqMgYgDv/1hGwAJe6WMUVtty3OhogTmL
 aDEFMDnja6XpHz35XmRwih8yAASeLt781oYoVwCnJBz/UcGBLOP7g6VRKGVbwj0Y7jWU
 5yJ3gPY6hUy3jcx4MgRb4YOx2CbD+W3afSeR5PW/xi+ayJWU741wo7G75hEGlic9kBnJ
 UMpyoUS+Bsj4Oo17jt1S2IpTLyp4uWfvqW+b0ns1AgvOU6ispKxgGIEw/keZZnIfpHqN
 ie6/kjAAGWgwuh+Id4fSkCurG8R7DyzIPhxEn8l3R7omEsjF6c6X1L9xCq/H4pHxY1Zr
 8bhw==
X-Gm-Message-State: AOAM532AcqFsprZARrwRyloUFVm1Yv2/74IC0ddHHFSMAN83aHNXiFOD
 9F7Uo9tljhiXqN1vugMaPmoppTdTn78heQZ5gW0=
X-Google-Smtp-Source: ABdhPJx0yuexm2urpVSvrUS46piujDlfdC3y6Zpjw9XL+wDgCd6LNhL1oaONJBO/qYI4XxDSIfnnEBzIDSad6f4E2Ak=
X-Received: by 2002:a05:6512:3d15:: with SMTP id
 d21mr431412lfv.474.1629933881878; 
 Wed, 25 Aug 2021 16:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <51ddd9063eddbd5ffb880728f610fba95428a313.1629925713.git.ryder.lee@mediatek.com>
In-Reply-To: <51ddd9063eddbd5ffb880728f610fba95428a313.1629925713.git.ryder.lee@mediatek.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 26 Aug 2021 09:24:30 +1000
Message-ID: <CAGRGNgW+4CG=TWxDMcocA3VuxLtY-d0MZAoWhFO3G-D0sDZm6g@mail.gmail.com>
Subject: Re: [PATCH v3] mt76: mt7915: introduce mt7915_mcu_beacon_check_caps()
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_162446_069929_AA6673A6 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Ryder,

On Thu, Aug 26, 2021 at 7:22 AM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> Beacon elements might be changed by hostapd configuraion, so driver
> should compare both IEs and PHY capabilities to get the least common
> denominator before association.
>
> Co-developed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> v3 - rebase and rework LDPC part.
> v2 - clean up codes.
> ---
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 164 +++++++++++++-----
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  12 ++
>  2 files changed, 137 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index ab8fc27646e0..640e0f06bb97 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -83,12 +83,24 @@ struct mt7915_sta {
>         struct mt7915_sta_key_conf bip;
>  };
>
> ++struct mt7915_vif_cap {

Extra +?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
