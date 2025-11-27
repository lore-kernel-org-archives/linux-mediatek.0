Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07AFCFD2F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Nov 2025 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQY//M0GqP2UQAmlCOJ4wuisLMBRO71rgyYj5ORvoMQ=; b=f0ReXDZj5ZHtNjoBBcD9kIC7QK
	jGbQzHDOchh45NR6hZ2CC9VAalYjO/npXDsfCipTb1YTUT+r0TA9xsJ5nStQFtBpNf/jkvv5aXKlL
	sXK2+QWhYwyEj0hQgrdboCQJXl40Fd5DV6S1QM+AUUj6ftGQINtdWrco69A4JknSTq2C8Gs5t7MxQ
	btPlNLPqFnGlFcuSHDrFUkqjYx4leS9hYStxufOixKU5esyDBXephv0JNxav138qpsxTx/k99O7FB
	i3z0aeHGz6sVgxvp07EPcFt8VeKEk0AMGGtojeW41YS+zfPDDaMi2RpO469rBMPlLQadYbW5AkzBO
	HuhJCcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWCN-0000000G6YM-21nt;
	Thu, 27 Nov 2025 07:13:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWCL-0000000G6Xs-0IIu
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Nov 2025 07:13:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso4505565e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227627; x=1764832427; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQY//M0GqP2UQAmlCOJ4wuisLMBRO71rgyYj5ORvoMQ=;
        b=slrdjwOtdO/N9wkkyzgoA0XpOzTNJA/RHycCwx087hqwNpR8+8VE+VrdSKjc9rGdBw
         PNf/nlZcQY95yN5Fhs60taIx64FbZcaXRUL1cPSndSgQnUcjK+hwtMIWFOIAsU1wsdbx
         VtbykuTOHByzwq+SyPYy6cgJH+lA/yAND3yIU6hMkhmyCCMvJjaX2IEik2VuGO9H1bzA
         e8CROt/nXf0udjoPl4lGqrZATr+EjiT1Gd3tvDGXb2F7U7vlsw/sunLu7OGkPQLj7uR2
         F8pCV9MTh+px/Qz9e2NoUUJQrElE6B9MMOf2CKZ+s7hTD+YRt9xi6x2ou4KiXDgAEGhH
         kiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227627; x=1764832427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQY//M0GqP2UQAmlCOJ4wuisLMBRO71rgyYj5ORvoMQ=;
        b=AqMqiIJW43yB6E/wCPmvGGrWuNokMa3szO2EYqk2l6PP0HG2Bl+NlWSKSR8gbBvMwF
         HpLQLYfr92zv6RDf4HavSLErNzWZ7UpUwuupbFb9Y+xONKIGCx07YHcWM86tW1QeUE5Q
         TbJYQfsgS4FhxIu9wrtsAauafXJM1TjT0Hvi2V6bxGoJgRPJf3utOKq2uMVtYip76rJP
         J65EVIlt1bFd+reOFodg0zbRmDeHRFqqj04cz7y4PUzhbAHipNTTnqLWjSvfTNq0f15R
         vs85RYPSb81R707HtZP+eL5+fwe5/7r1uDf7fDeguUJZn01zvuItZlZZkyzjNQlG3nbC
         zptA==
X-Gm-Message-State: AOJu0YxCShGnlWrPW3nUy7Be0aLDJcn1FFqNX4mJj++beyNNFT3kw1oo
	vx5q21EUbHUru3bHTYdmaHjbYzDlPZyYssXgQAPLRlPYbJusbCd4J9s0IrQh4acOhavMKiftpez
	TQqMF
X-Gm-Gg: ASbGncsecg1PimVsH3bxn79qgZgjRpqGY8CxZR2vTTHaP+XLmXdSAfr/rmP2wq5gI+f
	c0JlMnttv8ds8rIUG7BAghdHeKZjjPxlShepN5DsZ1HTY1GvypAiSf6vLZODwOMHcSEqWZemPfs
	+59fh2bjzS5T1/9MSdGa+LOoJg5D4AGqBBPwtUvJbVPkh1fDMZE7CQ943Q9NdUXGClTO9bw7pWY
	HMtnRQwcMPs/mwC8XiEAKz+Uhj3nPS0Flw2X3pZvmCO8vcY/sUUhd0gOoEDLZtLK+T7Ii15In7q
	MpUQn+QPJVFHjircW+8ChKAzp5J8g1Hg5CItJXm2/mXhDNcmywVthUsdNwe8UaZlQRYebERghpY
	7QVz4A71qaQ4TKJ52W/NZU167Ozb1gLKb0STA/6JwQQ7uAZBZBjFh2kfVjC6kgY1c2E6umiJZJk
	INCdv7GxbOdvMoeJ4d
X-Google-Smtp-Source: AGHT+IGlyt0omxutxQSzZfKtlGF/0vfOUKKkvYCc5HfAf7Jn5JWQ4TkeXsfpiiHq08eqgfbVw7CtFg==
X-Received: by 2002:a05:600c:1ca5:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-477c1115ff6mr256500925e9.17.1764227627158;
        Wed, 26 Nov 2025 23:13:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790ab8bb21sm85258995e9.0.2025.11.26.23.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:13:45 -0800 (PST)
Date: Thu, 27 Nov 2025 10:13:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: use correct link_id when filling
 TXD and TXP
Message-ID: <aSf6JdCEnVQ6tFJa@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_231349_169345_C9A25E2A 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

I suspect these are false positives...  Hopefully it doesn't take too
long to review.

Hello Shayne Chen,

Commit 85cd5534a3f2 ("wifi: mt76: mt7996: use correct link_id when
filling TXD and TXP") from Nov 6, 2025 (linux-next), leads to the
following Smatch static checker warning:

drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1064 mt7996_tx_prepare_skb() error: we previously assumed 'sta' could be null (see line 1049)
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1104 mt7996_tx_prepare_skb() error: we previously assumed 'vif' could be null (see line 1048)

drivers/net/wireless/mediatek/mt76/mt7996/mac.c
    1038 int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
    1039                           enum mt76_txq_id qid, struct mt76_wcid *wcid,
    1040                           struct ieee80211_sta *sta,
    1041                           struct mt76_tx_info *tx_info)
    1042 {
    1043         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
    1044         struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
    1045         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
    1046         struct ieee80211_key_conf *key = info->control.hw_key;
    1047         struct ieee80211_vif *vif = info->control.vif;
    1048         struct mt7996_vif *mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
    1049         struct mt7996_sta *msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;

This code assumes that sta and vif can be NULL.

    1050         struct mt76_vif_link *mlink = NULL;
    1051         struct mt76_txwi_cache *t;
    1052         int id, i, pid, nbuf = tx_info->nbuf - 1;
    1053         bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
    1054         __le32 *ptr = (__le32 *)txwi_ptr;
    1055         u8 *txwi = (u8 *)txwi_ptr;
    1056         u8 link_id;
    1057 
    1058         if (unlikely(tx_info->skb->len <= ETH_HLEN))
    1059                 return -EINVAL;
    1060 
    1061         if (!wcid)
    1062                 wcid = &dev->mt76.global_wcid;
    1063 
--> 1064         if ((is_8023 || ieee80211_is_data_qos(hdr->frame_control)) && sta->mlo &&
                                                                               ^^^^^^^^
This dereferences it without checking.  Possibly the
"(is_8023 || ieee80211_is_data_qos(hdr->frame_control))" condition
means that sta is non-NULL.

    1065             likely(tx_info->skb->protocol != cpu_to_be16(ETH_P_PAE))) {
    1066                 u8 tid = tx_info->skb->priority & IEEE80211_QOS_CTL_TID_MASK;
    1067 
    1068                 link_id = (tid % 2) ? msta->seclink_id : msta->deflink_id;
                                               ^^^^^^^^^^^^^^^^^^^^^^^^^
This also is unchecked.

    1069         } else {
    1070                 link_id = u32_get_bits(info->control.flags,
    1071                                        IEEE80211_TX_CTRL_MLO_LINK);
    1072         }
    1073 
    1074         if (link_id != wcid->link_id && link_id != IEEE80211_LINK_UNSPECIFIED) {
    1075                 if (msta) {
    1076                         struct mt7996_sta_link *msta_link =
    1077                                 rcu_dereference(msta->link[link_id]);
    1078 
    1079                         if (msta_link)
    1080                                 wcid = &msta_link->wcid;
    1081                 } else if (mvif) {
    1082                         mlink = rcu_dereference(mvif->mt76.link[link_id]);
    1083                         if (mlink && mlink->wcid)
    1084                                 wcid = mlink->wcid;
    1085                 }
    1086         }
    1087 
    1088         t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
    1089         t->skb = tx_info->skb;
    1090
    1091         id = mt76_token_consume(mdev, &t);
    1092         if (id < 0)
    1093                 return id;
    1094
    1095         /* Since the rules of HW MLD address translation are not fully
    1096          * compatible with 802.11 EAPOL frame, we do the translation by
    1097          * software
    1098          */
    1099         if (tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
                                                                         ^^^^^^^^
    1100                 struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
    1101                 struct ieee80211_bss_conf *link_conf;
    1102                 struct ieee80211_link_sta *link_sta;
    1103
--> 1104                 link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
                                                     ^^^^^

    1105                 if (!link_conf)
    1106                         return -EINVAL;
    1107
    1108                 link_sta = rcu_dereference(sta->link[wcid->link_id]);
    1109                 if (!link_sta)
    1110                         return -EINVAL;
    1111

regards,
dan carpenter

