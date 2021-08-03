Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E77DC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA2061040
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAA2061040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEFaqQG4702yl4szz3Br9Rrrxn4toyqk6FanLDk/+hg=; b=ECRtEiSJwqf1CX
	D/d2qxjz1UAUXh9e0KG6Y6dpQ+M1LlJejqTS0QnqVB2IwQ+omvEHzdNWld33z5STAVsWUtdb0vz/T
	JLYQeRPYy/IHJ3tBPl/CTaBaWEnP/7aGQ6HoUXdJHNSZ+UKnMIwTd1ixZ9SjtR6457nF2O3r7uRZw
	ma5vngVm6dJP2iygcPjnjIM+z5KKD6mxjW9bDSY2nEddw0F1quPSRghHpUEWGkDY5hZ2KBDqMmuNR
	vFQ+bA7l5Q5JaNSHqyX1z4l7LRy1KbXIYuOfVuB3xllZc1knFU0PmkIp3KaKc0E9o151ljNgup6XO
	Y99NDUGrKnS2ragKi/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAveE-003Fx6-MI; Tue, 03 Aug 2021 14:44:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAve1-003Fva-Na; Tue, 03 Aug 2021 14:43:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id x11so35833408ejj.8;
 Tue, 03 Aug 2021 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=21UEaA5NxYYRGJ/hxwmq634fV1jMJGF++85jofJtE4A=;
 b=Q4oH2X4OQYM73if3DK/fZ+5YpoM9OTrVM+kYPYrIMzB92rcHm/00kpquUGrft3M6Aq
 bhog5UVno6hGuaED69POea7w3kKwejBNU7W4OFPcWxF3DYJOVA9wCODq6ljR8oB/Xqlq
 CixV30eSX2w8G1JCJkff317rU62YhLloYVuz0tIErdz4OEWfrs8GY4N9I0/zXb6OpHD2
 5LmCa/uXKuUFxtym0ZiM8YUE+TRaKAtwLRnmIlBQ/ytnN8IANA/MDIO9tr02tEOX2kMC
 AXih8MH8W/HtLxJH9iEafug5VMjfm6+tx7JJaWwJhcz+xFlrAjuPKPqv5Axc1VWQk8qi
 KJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=21UEaA5NxYYRGJ/hxwmq634fV1jMJGF++85jofJtE4A=;
 b=tzo2jNuOjRuvkPPlN8mO/QUXlDYVYlSgYW/QiC4/wvrir2OrR8QHfzCmT+2pxxMNZ0
 bCV/GOlYeVQ/YpvHnOO6aAxP4Z7l867PH3T2F87Gy4PE1qG8Z77evsmPVIUK+9Asb16r
 AflhXxLoWtD/ot1OrxX5Ts5IcpriLvvb806LPYiyinobT6NpLSPZH+hOf+WVHJnMo+M+
 DAzvGaelGMzdBv3mch9K5u7F6bcNVTy0f/Sy/2qAwGoFgql45COAxXFN4Hy2RwqG97/8
 CAQeEzbRhKAOaUr2XZm0B4hfQUS9OWbq6NeZAO1VLmPrurmN1GT0+wV+OqTiLEpOJ8O2
 OtYw==
X-Gm-Message-State: AOAM532btEUp2hfgg+GPwIB7yVbqLALvs5f8VIyM7YZNUMGZ/7FWf88D
 asSxBXhV7s4ZWjMSQio/KnM=
X-Google-Smtp-Source: ABdhPJxBxb7VU3wDfc3Bj+zyEzT3+H5FmMb9p5alU9qeXPwGhB2s1WjRkH53fmF9Kynm+p4O7FWrrg==
X-Received: by 2002:a17:906:2dc5:: with SMTP id
 h5mr10464333eji.515.1628001827204; 
 Tue, 03 Aug 2021 07:43:47 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id dg20sm8120790edb.13.2021.08.03.07.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:43:46 -0700 (PDT)
Date: Tue, 3 Aug 2021 17:43:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next 3/4] net: dsa: mt7530: set STP state on filter
 ID 1
Message-ID: <20210803144345.jmucndmrflnqlfo3@skbuf>
References: <20210803124022.2912298-1-dqfext@gmail.com>
 <20210803124022.2912298-4-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803124022.2912298-4-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_074349_814090_AB8914E0 
X-CRM114-Status: GOOD (  18.72  )
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

On Tue, Aug 03, 2021 at 08:40:21PM +0800, DENG Qingfang wrote:
> As filter ID 1 is the only one used for bridges, set STP state on it.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC -> v1: only set FID 1's state
> 
>  drivers/net/dsa/mt7530.c | 3 ++-
>  drivers/net/dsa/mt7530.h | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 12f449a54833..8d84d7ddad38 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1147,7 +1147,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
>  		break;
>  	}
>  
> -	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
> +	mt7530_rmw(priv, MT7530_SSP_P(port), FID1_PST_MASK,
> +		   FID1_PST(stp_state));
>  }
>  
>  static int
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index a308886fdebc..53b7bb1f5368 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -181,8 +181,8 @@ enum mt7530_vlan_egress_attr {
>  
>  /* Register for port STP state control */
>  #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
> -#define  FID_PST(x)			((x) & 0x3)
> -#define  FID_PST_MASK			FID_PST(0x3)
> +#define  FID1_PST(x)			(((x) & 0x3) << 2)
> +#define  FID1_PST_MASK			FID1_PST(0x3)

Not a reason to resend, but I still would have expected a macro:

#define FID_PST(fid, state)		((state) & 0x3) << ((fid) * 2)
#define FID_PST_MASK(fid)		FID_PST(fid, 0x3)

#define FID_STANDALONE			0
#define FID_BRIDGED			1

and called with:

	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK(FID_BRIDGED),
		   FID_PST(FID_BRIDGED, stp_state));

>  
>  enum mt7530_stp_state {
>  	MT7530_STP_DISABLED = 0,
> -- 
> 2.25.1
> 

Anyhow.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
