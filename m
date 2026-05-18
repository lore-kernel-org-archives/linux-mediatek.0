Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF87CD4F50
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkRwRwwQI9Lvwqp+ZfDsXnx8pCUGF38PtuwOnzRf8PA=; b=Wlti7mNMJsFYub+TBHltuuXxKd
	X55iZjmnaQw/VHtV+zxcqHv/IpaEAW/I8MVXoQMgNQhXrIfa+nyQ/daJP9dJ5kfxeylNkFj31LS59
	1XpIdQPD0ZpeunQZXWMET/TvaIg+RbUWQirYPAHk//uRcAvGsJUH6pjfjsbGxGAWGwpVLLR6pqmPt
	Bwyol1sNG6lE/wByMVSmZw4Yh0KKwng7WgOju2w091pmZcamKiNKXRL29hq8TiMqleZNm8yepXYph
	51oaBtrxB5JmMm3yFYljHxRQdAhzXrJbylDcQQTcZsrA/UiXCM4g2sdO6zXS+q6kwghmjAKQiL9Ol
	GK763BQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2dL-0000000GYNC-3oFN;
	Mon, 18 May 2026 18:24:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2dI-0000000GYMD-3rnB
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 18:24:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-bd373f83042so534176866b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 11:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779128642; cv=none;
        d=google.com; s=arc-20240605;
        b=f4tHAefjvYpqB2Lsltdcgjp983oiVnNTtFTWJrnaKn5VkGT7Ap0Tq5qnADGt4ysYso
         HssxEOf1d1uom3XMcQ8HZDknR90tm8qWz+3fmuHhWp7WlJB0QjdezSsky35IepX+uBHO
         inh1JrkI4VskHjA9MymFNhUBUqTr0qIjQD4cdyHTTbfV77bIdp4bqlkimfpZgJEHITjP
         acgBJ85GbKnRQojfqKBNYqCXc498Z6ONAqQfa5dXUzlgbq/K6iqFTxf4A4iENb8U2IeY
         PCbQMgIxfIOVPxB05WxvHHRRHXhTabZl/7BaOxOpEt5cWu5R/oZd3OiAqht1S7NL2RQb
         erVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MkRwRwwQI9Lvwqp+ZfDsXnx8pCUGF38PtuwOnzRf8PA=;
        fh=v9bEpv47s9BEVsFeW1o6anwQcuPWhPo5bwCrPfyEi7Y=;
        b=ixx+u00KbGm0nq2U5d0JbSqRUtqqFR1bT3mYq8WXpSFCM6v3KOkLMVBAFU10fNHSIl
         mQChW7nwMYwlv+xGp70CwDJfT0n9dhZDiKLKIZ0liTCN68/d2eUIyiQU/uFEoqmWp51P
         gFrmwmKqqHAiQJJHuej1geA6Hj5V3Ff+ARtr4iCZ1yEti/qc0x+VJT0IRRPes7CmnO2A
         zBejWaWukKBOipmWlZXCPR9ExTW/hVyBcnLVmiR1TbcvwEXPlT5LLa+w0bSN4b2Nszlr
         rV3ul5EEtSiyzDJeGMVSl54y7r/YArkGZxBR2wmhCUtQz8WTachV1uhEBt6pJ0BL01yq
         xFtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128642; x=1779733442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkRwRwwQI9Lvwqp+ZfDsXnx8pCUGF38PtuwOnzRf8PA=;
        b=lSE07hcZE0g0sTtkT/cq6tz3mOxt2gQK8lh9k1eXpxvyB7P+j+gMzGnsC7j2/hN2j8
         VhLJ1NKHZ59vrQ17JVfV3yU7iEG2RLVEIFf+DvzCbU2JjiJ8Nr9fz+Wg4+Sf3CvrtW1R
         gweMNIWSJ/U5d5W+HDKrsYhKxx2dOvO4tI6SkPAG8C4vsmOzE8wf8BVaUvbWOkrNw2JZ
         fRZpDO4g20AcRCYAjyRreCptXoKtg+5XYO57SClfgjStrVf6OmQtUCSmZrMWoS/YKkGx
         M+vVn3LC9eicvFThhhKZ6LjCQ3lvt8pwHtjxMoi5BNl10K2+tzfGspEiSi7BDDn5Npyi
         UuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128642; x=1779733442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkRwRwwQI9Lvwqp+ZfDsXnx8pCUGF38PtuwOnzRf8PA=;
        b=pmje6DJDWibX4QvDsRD7qQGXL02yGNDb1psmNyOZp6QILBpB39Yt/VNnPNh7itdl29
         jYYpaPDUTnmykPOR9BO4fvSXhxXuWINhd2b1e7ip7StB/6z4Qrwfis61nqKxOW4B/p0L
         y0bMvB2ftjHvlNBCdmI6XoarDok/+U1vKh6pEMOlqePGluY2Om9RjnTy1HJaESKVI6OP
         rslAabG7FrMdzAlYH3d/0dE1QSvbpjsuurrEtAHSeMTdAlGx4VLt5HKnVHEWjyjpl0AS
         o1++syoTqzdye6zRogWQ2ViI23gHkYKRMdFo87vy5Q8OYA/YgDGD3ulBK13Bt0VBpm7u
         dAyg==
X-Forwarded-Encrypted: i=1; AFNElJ9M1dZLANP3j4MsQi3rD5gfnrcywpaDl8keY34Ko/rmUWJNv4PW89tlpUhYSppqQZX5rEQ6B0N7/b6l+3Mc9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrsTf/YyXB3qsdlXJwagjsmsJSBFCyE3tw4T5k00ABZkUB+WM2
	CWvKrHwhthLhGzgAavnSsZ+D2CUHp+HhOi9gYn/J1Jk33nagTwSSOE42fw3El/H590t2icl6+a1
	sMTJYEFuFpDRowhQgoU1757uJqrdmxrVZcB8Q
X-Gm-Gg: Acq92OEjerncHtgsmDd4x9ITsXn4noSSakhjEqYAM/FL7s0/SsZx64bTqczyqiS5VqG
	P6zv0OwPQF1oYCevv6MSBI2/aonIDX36SG7io+LcTTFVrRYYUtVph5w9yd2hZfVvQ1Wqq4xrB+8
	5okhgizSY+mB38+j23MK2JX1IZ9WSfDBWgfMsw1J5yzibGY0qXYr9Mv5OeW2hCA3jLcN/F0clF8
	VwCbW6xkMaXcQ1SOKptJn0rHGPcnRzALTJ7N3dHEzYi8EqEn29YoSSNpiEZub8nXaGuOmzxeSgl
	sCv5eRzYRUnHPAdfRf7EOwhvJxMri6D7QSvsgtG+KVR6ROwS6BM=
X-Received: by 2002:a17:907:c50e:b0:bd4:f3e5:b0f6 with SMTP id
 a640c23a62f3a-bd517964d1fmr901741666b.28.1779128642168; Mon, 18 May 2026
 11:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778521232.git.ryder.lee@mediatek.com>
 <agdJ1EtZjjWh2R1h@lore-desk> <CAHoxojJX2BRRTLMuM_QcJqMMmshxS4EAwrB1VjU3rsZ+0k2PAg@mail.gmail.com>
 <agsGiHKH6ly1afaf@lore-desk>
In-Reply-To: <agsGiHKH6ly1afaf@lore-desk>
From: Roy Luo <roychl666@gmail.com>
Date: Mon, 18 May 2026 11:23:51 -0700
X-Gm-Features: AVHnY4I8XXaA-Ix7yIv2zNLRgB6T4AcoApIY86IDAvHLUZ-cOoSi0nKs1Qxz7eM
Message-ID: <CAHoxojKeXCCnJoO7yBBmTM9euiTf38orujOhOK00X8bb3ctWuA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid memset overwriting tx_info->control.flags
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Shayne Chen <shayne.chen@mediatek.com>, Roy Luo <roy-ch.luo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112404_995423_4CF767BA 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, May 18, 2026 at 5:31=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> On May 15, Cheng Hao Luo wrote:
> > > struct ieee80211_tx_info {
> > >         u32                        flags;                /*     0    =
 4 */
> > >         u32                        band:3;               /*     4: 0 =
 4 */
> > >         u32                        status_data_idr:1;    /*     4: 3 =
 4 */
> > >         u32                        status_data:13;       /*     4: 4 =
 4 */
> > >         u32                        hw_queue:4;           /*     4:17 =
 4 */
> > >         u32                        tx_time_est:10;       /*     4:21 =
 4 */
> > >
> > >         /* XXX 1 bit hole, try to pack */
> > >
> > >         union {
> > >                 struct {
> > >                         union {
> > >                                 struct {
> > >                                         struct ieee80211_tx_rate rate=
s[4]; /*     8    12 */
> > >                                         s8     rts_cts_rate_idx; /*  =
  20     1 */
> > >                                         u8     use_rts:1; /*    21: 0=
  1 */
> > >                                         u8     use_cts_prot:1; /*    =
21: 1  1 */
> > >                                         u8     short_preamble:1; /*  =
  21: 2  1 */
> > >                                         u8     skip_table:1; /*    21=
: 3  1 */
> > >                                         u8     antennas:2; /*    21: =
4  1 */
> > >                                 };                       /*     8    =
14 */
> > >                                 long unsigned int jiffies; /*     8  =
   8 */
> > >                         };                               /*     8    =
16 */
> > >                         struct ieee80211_vif * vif;      /*    24    =
 8 */
> > >                         struct ieee80211_key_conf * hw_key; /*    32 =
    8 */
> > >                         u32        flags;                /*    40    =
 4 */
> > >                         codel_time_t enqueue_time;       /*    44    =
 4 */
> > >                 } control;                               /*     8    =
40 */
> > >                 struct {
> > >                         u64        cookie;               /*     8    =
 8 */
> > >                 } ack;                                   /*     8    =
 8 */
> > >                 struct {
> > >                         struct ieee80211_tx_rate rates[4]; /*     8  =
  12 */
> > >                         s32        ack_signal;           /*    20    =
 4 */
> > >                         u8         ampdu_ack_len;        /*    24    =
 1 */
> > >                         u8         ampdu_len;            /*    25    =
 1 */
> > >                         u8         antenna;              /*    26    =
 1 */
> > >                         u8         pad;                  /*    27    =
 1 */
> > >                         u16        tx_time;              /*    28    =
 2 */
> > >                         u8         flags;                /*    30    =
 1 */
> > >                         u8         pad2;                 /*    31    =
 1 */
> > >                         void *     status_driver_data[2]; /*    32   =
 16 */
> > >                 } status;                                /*     8    =
40 */
> > >                 struct {
> > >                         struct ieee80211_tx_rate driver_rates[4]; /* =
    8    12 */
> > >                         u8         pad[4];               /*    20    =
 4 */
> > >                         void *     rate_driver_data[3];  /*    24    =
24 */
> > >                 };                                       /*     8    =
40 */
> > >                 void *             driver_data[5];       /*     8    =
40 */
> > >         };                                               /*     8    =
40 */
> > >
> > >         /* size: 48, cachelines: 1, members: 7 */
> > >         /* sum members: 44 */
> > >         /* sum bitfield members: 31 bits, bit holes: 1, sum bit holes=
: 1 bits */
> > >         /* last cacheline: 48 bytes */
> > > };
> > >
> > > According to pahole, the size of the control inner union is actually =
16 bytes
> > > since the compiler adds 2 bytes of padding. Since mt76_tx_status_skb_=
add()
> > > meset to 0 just mt76_tx_cb size (that is 16 bytes) I can't see how
> > > control.flags is overwritten. Am I missing something?
> > >
> > > struct mt76_tx_cb {
> > >         long unsigned int          jiffies;              /*     0    =
 8 */
> > >         u16                        wcid;                 /*     8    =
 2 */
> > >         u8                         pktid;                /*    10    =
 1 */
> > >         u8                         flags;                /*    11    =
 1 */
> > >
> > >         /* size: 16, cachelines: 1, members: 4 */
> > >         /* padding: 4 */
> > >         /* last cacheline: 16 bytes */
> > > };
> >
> > Hi Lorenzo,
> >
> > The mt76_tx_cb is placed at status.status_driver_data (offset 32).
> > It overlaps with hw_key, flags and enqueue_time in the control union.
> >
> > static inline struct mt76_tx_cb *mt76_tx_skb_cb(struct sk_buff *skb)
> > {
> > BUILD_BUG_ON(sizeof(struct mt76_tx_cb) >
> >     sizeof(IEEE80211_SKB_CB(skb)->status.status_driver_data));
> > return ((void *)IEEE80211_SKB_CB(skb)->status.status_driver_data);
> > }
>
> Hi Roy,
>
> I still do not understand since mt76_tx_status_skb_add() sets to 0 just s=
izeof
> of mt76_tx_cb, that according to pahole is 16 bytes, so it can't overwrit=
e
> hw_key pointer (whose offset respect to the beginning of the control stru=
ct is
> 24, 32 - 8).
>
> Regards,
> Lorenzo
>
> >
> > Regards,
> > Roy Luo

Hi Lorenzo,

The mt76_tx_status_skb_add() memset zero the 16 bytes starting from
status.status_driver_data (please see the above inline function shared
in my last response) whose offset with respect to the beginning of
the control/status union is exactly 24 (32 - 8) instead of 0.

Regards,
Roy Luo

