Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC7ACDB483
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Oct 2023 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbX+/Cf6clmZjnaWGu/k7gLoOuS98SUZXuSsZExkvcs=; b=ybY6344mLljOKae2G3+ssrGYZm
	9pjFwsCRjHZkkngEIYfcBLJB5M+dr1B2nL135bP1a7Iac8UNF27zWGRQ5iBKuTt+ZEf5W0Oa+s5Se
	YGyTogcriiY3Vl1TjU283pWPbtcjH9xR0JrNtZPECcLME4JvAqqDo1VrqMDxf48qCAb+K9vY9I1Nr
	XOo/HDGFErEDYxE0s/S1C1CltUh4Vv5Q9oub1SQ1+loT1bJp/xZdW2R65DztFSjWT+ft4BywYsCY+
	vWMjGUNWKYj+yhC2n0uWupB0LrNImU905bffaQEsORWD8sNHu5gcWVBq3ATddBN3kX5VGcFcF7YSZ
	yEnrAswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrx1F-006knF-0X;
	Sun, 15 Oct 2023 09:02:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrx1D-006kmV-0L
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Oct 2023 09:02:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53406799540so6044578a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Oct 2023 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697360557; x=1697965357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NbX+/Cf6clmZjnaWGu/k7gLoOuS98SUZXuSsZExkvcs=;
        b=Y1ffcoLviAWMkWpXcgcLmuBCBr4lgFQhvOC3FRA/aS98dEc+0Rpw8pIYCnL3ARfRzE
         7aiXDD9ZsG+0II3dZT8dG6TD3rboGO7QXyeT6nHnaBThd8+Rv1+nCWdFvFAX3gsb0zWS
         S8AGNEEWuXY+cBh3Ouxs/KLiMglJ8EVzkytoDrxOcVR6xe+HazUvIiNz5W5AdtnX+prN
         iI/ZoVUyo1IgFuVtT6Tn8yxjxj6eMC9yCvMK1A4xjnoci9F78+9vAtVoTGp8MBO+5WUa
         4bz6VKibozW98h23dMZJAThSvCR+XHXTkMrUYuGbr1nHc3/9GByElSRToOau0Z18brJg
         xZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697360557; x=1697965357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbX+/Cf6clmZjnaWGu/k7gLoOuS98SUZXuSsZExkvcs=;
        b=hFL0v34/W+05zTXAjgMqC1pZOSvJci+ubvrgvyGYJq/l1NxffLWb+LwgS5sB30L62L
         fV+rvoq7uTtSObmILgdFuw/APRtJzr1kKtlTYpCxgyMBVSTj9v9qYyasztPrJHXMxG79
         qQQhuByvN+dDDb6oZC5Z/Zm0GU+vJ4Z4PVlzuGP402xXBoYtGC3cF5BGnI1GXRAkVoeB
         AqfEhNC6c8XvOrWn63ciNKnaAPa6OupPj5Ltw6KC4mGkJjqK4drenOawPhoLKpqsqTrz
         LyWV2WuLe2CUmVgq31w8MvvpUyc4mGZtSk7tAsfXUEMWngm0TcQEUu1GsB6GPhQ2Im79
         T+GA==
X-Gm-Message-State: AOJu0YxSt4wj9SxwrenG9Glog3d0R0sns8ta0PZY8hMiyNhHQqgAYIJw
	Z5+0tfEmWDOPBl3UzWOKqVxs0LrN+LQqlIVahsE=
X-Google-Smtp-Source: AGHT+IGm1PoghK5cLlBg2XIDvYSQ1u03kMNZ7L4YQ71HrWXSEbLM1fho0WhWvYETB5TJq3XErctZ1v2hbIwAL0mddu0=
X-Received: by 2002:a17:906:55:b0:99b:dd1d:bc58 with SMTP id
 21-20020a170906005500b0099bdd1dbc58mr30972815ejg.41.1697360556773; Sun, 15
 Oct 2023 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <e6c9a6fdeeaa57d73560c895046da4a58983297d.1697146767.git.yi-chia.hsieh@mediatek.com>
In-Reply-To: <e6c9a6fdeeaa57d73560c895046da4a58983297d.1697146767.git.yi-chia.hsieh@mediatek.com>
From: James Dutton <james.dutton@gmail.com>
Date: Sun, 15 Oct 2023 10:02:00 +0100
Message-ID: <CAAMvbhF=2kt0Ya_Oq7MkJ4fGCvbhCLn9_wTPOfdi38Vax5tO5g@mail.gmail.com>
Subject: Re: [RESEND PATCH] wifi: mt76: mt7996: fix uninitialized variable in
 parsing txfree
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
	Money Wang <money.wang@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>, 
	Benjamin Lin <benjamin-jw.lin@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_020239_169367_56D675A0 
X-CRM114-Status: GOOD (  20.00  )
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

On Thu, 12 Oct 2023 at 23:09, Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com> wrote:
>
> Fix the uninitialized variable warning in mt7996_mac_tx_free.
>
> Fixes: 2461599f835e ("wifi: mt76: mt7996: get tx_retries and tx_failed from txfree")
> Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> index 04540833485f..59ab07b89087 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1074,7 +1074,7 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
>         struct mt76_phy *phy3 = mdev->phys[MT_BAND2];
>         struct mt76_txwi_cache *txwi;
>         struct ieee80211_sta *sta = NULL;
> -       struct mt76_wcid *wcid;
> +       struct mt76_wcid *wcid = NULL;
>         LIST_HEAD(free_list);
>         struct sk_buff *skb, *tmp;
>         void *end = data + len;
> --
> 2.39.0
>

I am curious. Setting "struct mt76_wcid *wcid=NULL;" at the top of the
function will remove this warning, but is this really the intended
behaviour?
I am thinking about what situations will wcid now be non zero at this
(HERE below) position in the code.
It will be non-zero as a result of a previous round of the loop,
instead of given a value on this round of the loop.
There are no comments in the code, so I don't know if the intention is
to use the wcid from previous rounds of the loop or not.
My guess is we should raise the initialisation of wcid =
rcu_dereference(dev->mt76.wcid
[idx]);   to somewhere higher up, before the previous if...else scope.

  1127                 } else if (info & MT_TXFREE_INFO_HEADER) {
    1128                         u32 tx_retries = 0, tx_failed = 0;
    1129
--> 1130                         if (!wcid)        <--- HERE

Uninitialized on first iteration

    1131                                 continue;
    1132
    1133                         tx_retries =
    1134                                 FIELD_GET(MT_TXFREE_INFO_COUN
T, info) - 1;
    1135                         tx_failed = tx_retries +
    1136                                 !!FIELD_GET(MT_TXFREE_INFO_STAT, info);
    1137
    1138                         wcid->stats.tx_retries += tx_retries;
    1139                         wcid->stats.tx_failed += tx_failed;
    1140                         continue;
    1141                 }

