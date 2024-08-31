Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD85CD13D9
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Aug 2024 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulQrbsPKeNSfASqPUtGDS42+PHiB38d6gRplMWFmY0I=; b=wsJJQ5ntQy477GWLjJwDsgxbXY
	1b+J19CwndpnQtVab/vivRof6em8haD/qYyTr0rQBy3OQmlNIPBDlpcjVA+gULGqfxzNAPusrn/Qz
	jTKFPJzhqCd+tAIVcMFPLa/I1+KTBC83tF4R5J7M7WNQ8aeVEzj/KFIyrEJU68ge40rbjJnhheL07
	oE7hHSFIzXCkPk1M9sPXUUkvmB82bmWfMxr7fJzFi0sAxam6zUB3YZMSQmUq/ekixAcra3odIfTWi
	mAB+UhzlcaxIaVq/r4rXtP+xjGjN/rlHtj15FFcHqe9ZsoRm0nfzQjblKb3X4zwmhrCUW+JCxQLbG
	WWPsidjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skWFR-0000000ACjx-3qNL;
	Sat, 31 Aug 2024 22:07:09 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skWEp-0000000ACeR-2Ipo
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Aug 2024 22:06:32 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6d6891012d5so709537b3.2
        for <linux-mediatek@lists.infradead.org>; Sat, 31 Aug 2024 15:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725141990; x=1725746790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulQrbsPKeNSfASqPUtGDS42+PHiB38d6gRplMWFmY0I=;
        b=Eu9CYPR5NLVdFRHxRARN0bHIbWOny6yAumu5BR/YztMnrtX4wY4+nLiD8QoOnPWIJU
         KrdM6nqSD/gKzENTB7FEjOmSUVYMpHk530jFQ/62nJEKj+jG+YqxR5LPPmyuFFzbLq4l
         20V4P7a1T1kHhOw8ScZnAnyBfzd91p+3tDSBsTI+LUXfUM+HYGZ5s/j1jnlnCO3fwYTB
         BBYNyKJWfzt+WeoOMd66gF6F6r5ALHkL+vslnFj0KvMARPzL71JIQoF+78dZC6VdSKJ6
         ysdC4bPZwVU216HnKYAClz+98QAKTFt0mQ+G7SS9C+NYa2pIgaWb7l35yOp3uzfLey7/
         5Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725141990; x=1725746790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulQrbsPKeNSfASqPUtGDS42+PHiB38d6gRplMWFmY0I=;
        b=hDh8+4QPTGgkjRwx/u9ZMXa3nuOPStbokmqThX24JXdZCdzUM10/0hkpuU5J4IW0Lc
         QuAIWxH9eSDcrQcWJw4Z8n9mrveZd0pMUUzL3HCzs+ihLj9scIHtU3jRmGM5ZGTJIBie
         IUFnBtiECvhekgCDunh1sIKxuDT3DPMNROGGG6gnqqwBBsNZSmxYk56RcoNRpbcNN1Eq
         z0PBxFqeJUegeLQJnZO+Ybn+Nlz4beJZOLyJOX87vJSctobEvEccdvQ3eraEcvFuwckG
         gG6lRuPZ4AAfK9K0qFtnSE2o4+s0vsHq8YtPgfyEAt5ucVH4eBVtdKlAE4Pvc51F4FCY
         GX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB9JP+xe66ZikM0XUMOzWe+exztDlkhEeF5bqutsh5gxtncpeDA2Kq4PG10oCkHUDuDEqjULq4KwGETHLLVw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0mZ8kadg+lFE7MKG17ox/9TMj95UhIW5sZPAwSmhUu73tJjn1
	U9datS8RbvLC6fUwbizdPgBLvy56tHYxc2CAmP3GEIu8KVIcPTphnOAb+ERQuFPmoOsiJTSQKzc
	ghwKrKITFxDynmyzDu9AHmhBA/Wc=
X-Google-Smtp-Source: AGHT+IGAwrWf7EGVz/bVMNvK8zEl3gIgbALsHsMVb86jJRhMXd1l1F//XDDxFyoceEhPRZCbiodQ7TVpLLRs2XP22EI=
X-Received: by 2002:a05:690c:893:b0:6b1:4eb6:345e with SMTP id
 00721157ae682-6d40e7824cemr79143697b3.26.1725141989899; Sat, 31 Aug 2024
 15:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240830073229.21593-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240830073229.21593-1-mingyen.hsieh@mediatek.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 1 Sep 2024 00:06:18 +0200
Message-ID: <CAOiHx=kaKhVw8YW1ih7Xjz9T93G5a51hLJ_5J9rqTp2EuYnTOA@mail.gmail.com>
Subject: Re: [PATCH] wifi: mac80211: introduce EHT rate support in AQL airtime
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Michael.Lo@mediatek.com, Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, 
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, 
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Bo Jiao <Bo.Jiao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_150631_632470_45781B67 
X-CRM114-Status: GOOD (  18.18  )
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

Hi,

On Fri, 30 Aug 2024 at 09:33, Mingyen Hsieh <mingyen.hsieh@mediatek.com> wrote:
>
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> Add definitions related to EHT mode and airtime calculation
> according to the 802.11BE_D4.0.
>
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
> Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
> ---
>  net/mac80211/airtime.c | 352 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 349 insertions(+), 3 deletions(-)
>
> diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
> index fdf8b658fede..1fd9bea61379 100644
> --- a/net/mac80211/airtime.c
> +++ b/net/mac80211/airtime.c

(snip)

> @@ -55,10 +55,21 @@
>  #define HE_DURATION_S(shift, streams, gi, bps)         \
>         (HE_DURATION(streams, gi, bps) >> shift)
>
> +/* gi in HE/EHT is identical. It matches enum nl80211_eht_gi as well */
> +#define EHT_GI_08 HE_GI_08
> +#define EHT_GI_16 HE_GI_16
> +#define EHT_GI_32 HE_GI_32
> +
> +#define EHT_DURATION(streams, gi, bps)                 \
> +       HE_DURATION(streams, gi, bps)
> +#define EHT_DURATION_S(shift, streams, gi, bps)                \
> +       HE_DURATION_S(shift, streams, gi, bps)
> +
>  #define BW_20                  0
>  #define BW_40                  1
>  #define BW_80                  2
>  #define BW_160                 3
> +#define BW_320                 4
...

> +       EHT_GROUP(16, EHT_GI_32, BW_320),
>  };

You define BW_320 and groups for it, but currently
ieee80211_get_rate_duration() rejects rx_statuses with a bw > 160, so
you will need to allow BW_320 (for EHT only?) as well.

>  static u32
> @@ -443,11 +771,20 @@ static u32 ieee80211_get_rate_duration(struct ieee80211_hw *hw,
>                 idx = status->rate_idx;
>                 group = HE_GROUP_IDX(streams, status->he_gi, bw);
>                 break;
> +       case RX_ENC_EHT:
> +               streams = status->nss;
> +               idx = status->rate_idx;
> +               group = EHT_GROUP_IDX(streams, status->eht.gi, bw);
> +               break;
>         default:
>                 WARN_ON_ONCE(1);
>                 return 0;
>         }
>
> +       if (WARN_ON_ONCE((status->encoding != RX_ENC_EHT && streams > 8) ||
> +                        (status->encoding == RX_ENC_EHT && streams > 16)))
> +               return 0;
> +
>         if (WARN_ON_ONCE((status->encoding != RX_ENC_HE && streams > 4) ||
>                          (status->encoding == RX_ENC_HE && streams > 8)))
>                 return 0;

RX_ENC_EHT with > 4 streams would trigger the existing WARN_ON() and
make this not work. Probably not what you indented.

Best Regards,
Jonas

