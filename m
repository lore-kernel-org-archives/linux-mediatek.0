Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58883CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YriEPBtKGtIXqM5Df/lPqipwYiY6kEfqEv/SB2R7NXc=; b=YYSjUxQhAvRQEehL36PQZAetxb
	t1DF7TcmZY/+yCya20lhwNqNC3bTmr/6ud4Z5TCuIR+P7H+G2blFBEoABMMRO60LI/EbGs+syHmnN
	yJ9y6UXIEqkTQL1QwVjeNL4csgwhCZWC48/JzXNe9nfh6yRnHwmaPOxtbOhFTQ2K5lkzNGAehhogn
	M7WxSIpOd/qfQMsja/wj/lrxkL3P7gvbNQcbwncDxEpqBBwKqPlNieTdbHpXy9h9asjS0iK8Xln2k
	aJpQtmsoh04VeBolTlCXgNpKWzXtlI09k8ahNfnMzcZwB1wQX9kb/2mR3BvJqAq9C5AYyiiyFO+4V
	1W/b+ctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwu8-000000093GZ-0kZu;
	Fri, 15 May 2026 18:04:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwu5-000000093Fb-152n
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 18:04:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b936331786dso3436766b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 11:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778868291; cv=none;
        d=google.com; s=arc-20240605;
        b=fbnFLX6H7WA3YoDQgqenVZ3hO72ud6f01DsZalVtBrEzjwCNqhm88v7Z9JTGBPo9ib
         6109PPOlBNphEqlLCBWNdZ2XWpZsCq7VdlYWluD/EcOcvciDKAp6m55ygn9TcE0uzpgF
         E/y53nxwwFq9JjxIiYrnC01G8b9rZE5kpJZRtfQYMpbmGaLNR9yAsZ82xvsmmWgqdgB8
         rExN6aeSibps63cXfhUlzOiNDwYF1NZHOSguEm/10qyAl77RNqcc+K/Tm04POz2qDyfc
         KH8PEonyfF5/MN5PpO/pRrtd9Zx9rX+SQr82Av2iK73yuUuZMJ2BtITU0VKJpaPurZdR
         vbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YriEPBtKGtIXqM5Df/lPqipwYiY6kEfqEv/SB2R7NXc=;
        fh=j95qxFHmVpD089DsbYDC6HgPq8b8GJwPnWHtMexKS0I=;
        b=Gzw/GDYdnXilgme/eMZSyo5+g2FDAGUL35LHuM+s3rK2nZkiR1wajpFIIsAwEYFStZ
         mDIwAcSFRHO7FaZH/iBnFdVTrlf3WhcV1d/oT0VY2grI3u4Ptelez47qh7Q2wrGL9czz
         /YbS8zK9yDsMJcjpPWMp8llgzWUjWg99H3w3lB26t15mRO84m1R7fq7yH2RZYkQGeDiA
         PIpFNbMtySGNi+BY+aGzy2saBzSNi+6P4hltjKztNvDFocnTIgeg2Y63wNMcDcau608h
         32THnKbH6QtY0xa2AHR6fESnNJIQcSQA7R/3GAG5mv7xBU44w6T8+1MBWbHzSYoJS3sR
         1S8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778868291; x=1779473091; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YriEPBtKGtIXqM5Df/lPqipwYiY6kEfqEv/SB2R7NXc=;
        b=ZavdU+6Vy2q0KDTEnIHo2twRyjVSruiS0thCQRJq0czqGh/SvPrQUhOaK4QC6/0W+d
         a0IwPlpTlQR1PF+Bce5sE4Bn+0MvqNPMWKYEbx4zp8fesdSYHJ/Jyq6tYJUqsUbYeQhv
         E/dRgIDZdx3NSGJ8QLfC94NqFqNm7FDsEYp0C5oR0RIDCZeTRVqNXt46L3yDyM53tyGJ
         LmyoLF0Nd2DAn6e3ZuuwnnxQBKnT5FzKXPt6xpmQACI/k6DcaNwSMTgrz92wsq3RlzF7
         xyUvINibJQaimHNzR/+ZCFPE/2lclv7iBQPd2OTBOgeUmdkvxMt6kOQpK58PdYUnN108
         IYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868291; x=1779473091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YriEPBtKGtIXqM5Df/lPqipwYiY6kEfqEv/SB2R7NXc=;
        b=nhMXh1u0oxdaII6DSYPRwEEevWFD730UsvZJx6KJAH0muOXmQYbsBNpiIxm83Gn+Dv
         BQ116/D1Majezi7wsKFZeJJvGp3ZDEGqH8R3IsBDGrwiA2rbhJaiaOlxhSMBO+Ql/ZJ1
         qpmNYS5r4JT9obGlvLSTSvkr9rxv7vmclcnIVEEuX3llMaP6IcL1gstiPkDs+cmODl1w
         7z+V3if11dYU2/vf6bAdAPgoejthXSNNJdT63Ay3EnNKjW8laco1xvesB54PT8s+/5X4
         nraLKbGPugweO816avtkTYoQG20EwNXgEqj+D31fvg4mUlwrS4IJfosD9pkkZuZthuu1
         Xrfg==
X-Forwarded-Encrypted: i=1; AFNElJ8FD30ee0Gbq8ktmDedS5dpcAe/DEjVlITuPexBc8hloMpQAb4SGM45w36eYwF8EFUD2sK2KSo8iq4fdYXKew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3wAeGJhcwzDzSfn0GyUsi+EQSxS5dGui76O0/22SmKna2xREO
	fJDnZpvWWs6fr3yoMOBSlm+mu9gg9knclIGGBfutO/t1AoeJgU4t8i4viqbeDetVVnsA4p4/PB+
	gc9T6QOHaZOAiQdaU1xVKToHL5Z60d5g=
X-Gm-Gg: Acq92OFGWN2aEjk2kMj9+gTvuG2ngZU6VUHykswOQeEfBqoIjVP6bfz/ZB5UwzAhmor
	JeOP+X7y8mcTXKGlWRn656bDheiFu7ij+/1fzFJi+7QgjNaj8jbEaQQuwgc5r5Ea9HomcCVyMPF
	JovPLVGGfhGUtOoq4Ex5xSMWreTRgk0xkmITia7ou+Ode7r0+F9gYxGqqd0FL1VISjB1llK3akU
	BARhSkVtPybZBeeJKRgvFz7exvwgaUlpwRiBjDGO2ZbzG9M4WWBphcZ8QnQew4xOC9mCZZ8w+BP
	hjdnC8gcmyRaNKQ0tMInbNjulpVhzSbkQVx5Wap9
X-Received: by 2002:a17:907:e15c:10b0:bd3:417e:b85d with SMTP id
 a640c23a62f3a-bd5177ea873mr224170666b.13.1778868290941; Fri, 15 May 2026
 11:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com>
 <agdJ1EtZjjWh2R1h@lore-desk>
In-Reply-To: <agdJ1EtZjjWh2R1h@lore-desk>
From: Cheng Hao Luo <roychl666@gmail.com>
Date: Fri, 15 May 2026 11:04:39 -0700
X-Gm-Features: AVHnY4KbrKR9CaA_jQmHLyQZ08ngRHLldKj46sSAK1t83aUKIVFRDiqTWe1rvrA
Message-ID: <CAHoxojJX2BRRTLMuM_QcJqMMmshxS4EAwrB1VjU3rsZ+0k2PAg@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid memset overwriting tx_info->control.flags
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Shayne Chen <shayne.chen@mediatek.com>, Roy Luo <roy-ch.luo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_110453_326772_199EC9EE 
X-CRM114-Status: GOOD (  10.38  )
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

> struct ieee80211_tx_info {
>         u32                        flags;                /*     0     4 */
>         u32                        band:3;               /*     4: 0  4 */
>         u32                        status_data_idr:1;    /*     4: 3  4 */
>         u32                        status_data:13;       /*     4: 4  4 */
>         u32                        hw_queue:4;           /*     4:17  4 */
>         u32                        tx_time_est:10;       /*     4:21  4 */
>
>         /* XXX 1 bit hole, try to pack */
>
>         union {
>                 struct {
>                         union {
>                                 struct {
>                                         struct ieee80211_tx_rate rates[4]; /*     8    12 */
>                                         s8     rts_cts_rate_idx; /*    20     1 */
>                                         u8     use_rts:1; /*    21: 0  1 */
>                                         u8     use_cts_prot:1; /*    21: 1  1 */
>                                         u8     short_preamble:1; /*    21: 2  1 */
>                                         u8     skip_table:1; /*    21: 3  1 */
>                                         u8     antennas:2; /*    21: 4  1 */
>                                 };                       /*     8    14 */
>                                 long unsigned int jiffies; /*     8     8 */
>                         };                               /*     8    16 */
>                         struct ieee80211_vif * vif;      /*    24     8 */
>                         struct ieee80211_key_conf * hw_key; /*    32     8 */
>                         u32        flags;                /*    40     4 */
>                         codel_time_t enqueue_time;       /*    44     4 */
>                 } control;                               /*     8    40 */
>                 struct {
>                         u64        cookie;               /*     8     8 */
>                 } ack;                                   /*     8     8 */
>                 struct {
>                         struct ieee80211_tx_rate rates[4]; /*     8    12 */
>                         s32        ack_signal;           /*    20     4 */
>                         u8         ampdu_ack_len;        /*    24     1 */
>                         u8         ampdu_len;            /*    25     1 */
>                         u8         antenna;              /*    26     1 */
>                         u8         pad;                  /*    27     1 */
>                         u16        tx_time;              /*    28     2 */
>                         u8         flags;                /*    30     1 */
>                         u8         pad2;                 /*    31     1 */
>                         void *     status_driver_data[2]; /*    32    16 */
>                 } status;                                /*     8    40 */
>                 struct {
>                         struct ieee80211_tx_rate driver_rates[4]; /*     8    12 */
>                         u8         pad[4];               /*    20     4 */
>                         void *     rate_driver_data[3];  /*    24    24 */
>                 };                                       /*     8    40 */
>                 void *             driver_data[5];       /*     8    40 */
>         };                                               /*     8    40 */
>
>         /* size: 48, cachelines: 1, members: 7 */
>         /* sum members: 44 */
>         /* sum bitfield members: 31 bits, bit holes: 1, sum bit holes: 1 bits */
>         /* last cacheline: 48 bytes */
> };
>
> According to pahole, the size of the control inner union is actually 16 bytes
> since the compiler adds 2 bytes of padding. Since mt76_tx_status_skb_add()
> meset to 0 just mt76_tx_cb size (that is 16 bytes) I can't see how
> control.flags is overwritten. Am I missing something?
>
> struct mt76_tx_cb {
>         long unsigned int          jiffies;              /*     0     8 */
>         u16                        wcid;                 /*     8     2 */
>         u8                         pktid;                /*    10     1 */
>         u8                         flags;                /*    11     1 */
>
>         /* size: 16, cachelines: 1, members: 4 */
>         /* padding: 4 */
>         /* last cacheline: 16 bytes */
> };

Hi Lorenzo,

The mt76_tx_cb is placed at status.status_driver_data (offset 32).
It overlaps with hw_key, flags and enqueue_time in the control union.

static inline struct mt76_tx_cb *mt76_tx_skb_cb(struct sk_buff *skb)
{
BUILD_BUG_ON(sizeof(struct mt76_tx_cb) >
    sizeof(IEEE80211_SKB_CB(skb)->status.status_driver_data));
return ((void *)IEEE80211_SKB_CB(skb)->status.status_driver_data);
}

Regards,
Roy Luo

