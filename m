Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E75CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VfPpe/or52X+zhVBTtpPVXU4FPPLcpy3HAsFtg+RRoE=; b=kmuEjGuLoDGae2cmCuwIu8zhh6
	2DtELCKzdPxGsyNiO5fQsoeWHtnl2wZ7O3halxzkUAZ27+Buc41IgXmKBw5tV9cnmvIj5HNm0YrBm
	5YfgrZrv40v8dbfGkipZH4q4YJjPgoMwSTnFimo9/AacydTXgwWz6z8VnHGV8QF1ua3bGu3ruzc89
	ZcpDfGh0gVzGkts1MAj89k9yIwy7fPwGJ14cKI3HhFjR0D3lF+w2Tp8FBb/xxmxojnb9OS2deNR3D
	PNRJ+BvlPYvHIE/8J3eqZQ8Txqq0/2EIVYbHFaU0XN0AcO9RiG7I6Zh7eLE2qXrMKhc8Vi2J+cBWH
	JYVl7Rzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xwy-0000000CkZf-0pko;
	Tue, 23 Sep 2025 08:00:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xww-0000000CkZK-03QG
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 08:00:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so23946735e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758614432; x=1759219232; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VfPpe/or52X+zhVBTtpPVXU4FPPLcpy3HAsFtg+RRoE=;
        b=W8PsAlMXbvY86mAFkzRwtMkxhCHuVTlZeTim8KdcrnmGFG2RG05aRW8fs7n9BvLIjT
         H/sXoPzpyVECAPkPr760gW8SDl7qExa/qzM67lPWfY6mn+FC8c4hm7Bi0BldnzF7/6F4
         5fgx9eVQBQFAmf7FlH0FXFqBnLGa5EjnWfzFbeTAy4KcOWyNug2PpxVMZRwDtLk48cAz
         bnXHW7J1WLwpuOMRYRzbUsw4m5sShAH6EzTIQ/NhmzTfIQbmEHNRn118pj5OQQBeUxap
         1Bm5/slWMgY7yoQ43Rzic7xuOyg+P5BP0MO6IaEL8oR6wsOy4GOf9k/nFcbSa4xCzfQX
         Fc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758614432; x=1759219232;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfPpe/or52X+zhVBTtpPVXU4FPPLcpy3HAsFtg+RRoE=;
        b=OdYUc0WENhRNNn+zqda+RDR/V/56TmVRo3SA795yMSlNWa8ng+VIr0hYtFQN9VtW9f
         9toJydqlPluQ44Pf07YUAkwBm5HuVDLq/+o2+o5BR7WhnqDkO4+LG7El4597fqWGPd9z
         MZOWLZBATAUxwfetr7ZC2GOp3CunE4+tg5dfIHvlEHP9fcp5T4NG86KEZF8rDu4jMv9A
         2M+FCeF3NFhE5D5SPc80oFHNx6YUfUseJ5rpCYsL6mpp+uN9PidDCrL/RxljwQNpoHMP
         UfPGa0rEkf4OYL7AXOsbg4G8aZC/MBOE0rSQayXwd9xoOofwmrXKoawbdQCOZL3PI29W
         +tZw==
X-Forwarded-Encrypted: i=1; AJvYcCV/8ubTbFfV0uI0uktjH6+gYambD6rCUtwVxdmW4Gy9Y29bwH21ONC2y5Iky1UOINENdIXPwtPb9AXXJF+uTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAzbv5Cerf04nhatfEz3fSZyODZTdtuPmPCpOMMa+80opJ6h7q
	hP1AzOCiv0EzQzUhrM0fH30mxfqS1yRgA2nebE/oGft1Et/pQpKPLf27BbQtc0by75PsIkINBUZ
	T5kmw
X-Gm-Gg: ASbGncvqvfdCDwUrUbdTmVyGARJ1cWHRkxJAZ2sUE6vQSobWu33K5YQY4PlmVJo6/VY
	tZ9Ya6Y+2n3naFLY/T8bXwY3nn3VLSnKQ8X1aQekpzmktDZJW/iB8bOB9q0UpmkCzq1+9dZ4XVY
	K9KmKc2/UuFnlA8BqlOX84nKHn8swyR2YWM+8jHXfwN/cbUN5/pr1364vO5iGiAMGpavpBI4lsx
	ATSHbfTviS2JqW7j94r6Uuopnlv8Ph3sLI/RAiFHccH9pLxzlmLKYaVaNr5Jds5kst+Sb1lso6h
	ZInUREjCX3Cc9tYxGR/NSL25XKe3BXC9DtWPxqix/KWGR35xZRYJ3AlP4Qa/naorm9U5s1gZNLH
	MRMPaCsvCfz4iVImAC9oNu+FQFl+v
X-Google-Smtp-Source: AGHT+IEKEkfWWbkjde1dOLE+bL8O2HdDTlJTveliJYNiQVNvNq33H56qNuF9DYreJIpAj1wty36YjQ==
X-Received: by 2002:a05:600c:4fc7:b0:45f:286e:49a8 with SMTP id 5b1f17b1804b1-46e1e0564famr16811235e9.30.1758614431906;
        Tue, 23 Sep 2025 01:00:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a285efsm262577465e9.18.2025.09.23.01.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:00:28 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: Set proper link destination address
 in mt7996_tx()
Message-ID: <aNJTl89jpYob5XaR@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_010034_198327_DED1A508 
X-CRM114-Status: UNSURE (   6.80  )
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

Hello Lorenzo Bianconi,

Commit f940c9b7aef6 ("wifi: mt76: mt7996: Set proper link destination
address in mt7996_tx()") from Jul 31, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7996/main.c:1344 mt7996_tx()
	error: testing array offset 'link_id' after use.

drivers/net/wireless/mediatek/mt76/mt7996/main.c
    1288 static void mt7996_tx(struct ieee80211_hw *hw,
    1289                       struct ieee80211_tx_control *control,
    1290                       struct sk_buff *skb)
    1291 {
    1292         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
    1293         struct mt7996_dev *dev = mt7996_hw_dev(hw);
    1294         struct ieee80211_sta *sta = control->sta;
    1295         struct mt7996_sta *msta = sta ? (void *)sta->drv_priv : NULL;
    1296         struct mt76_phy *mphy = hw->priv;
    1297         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
    1298         struct ieee80211_vif *vif = info->control.vif;
    1299         struct mt7996_vif *mvif = vif ? (void *)vif->drv_priv : NULL;
    1300         struct mt76_wcid *wcid = &dev->mt76.global_wcid;
    1301         u8 link_id = u32_get_bits(info->control.flags,
    1302                                   IEEE80211_TX_CTRL_MLO_LINK);
    1303 
    1304         rcu_read_lock();
    1305 
    1306         /* Use primary link_id if the value from mac80211 is set to
    1307          * IEEE80211_LINK_UNSPECIFIED.
    1308          */
    1309         if (link_id == IEEE80211_LINK_UNSPECIFIED) {
    1310                 if (msta)
    1311                         link_id = msta->deflink_id;
    1312                 else if (mvif)
    1313                         link_id = mvif->mt76.deflink_id;

Can link_id be IEEE80211_LINK_UNSPECIFIED after this if statement?

    1314         }
    1315 
    1316         if (vif && ieee80211_vif_is_mld(vif)) {
    1317                 struct ieee80211_bss_conf *link_conf;
    1318 
    1319                 if (msta) {
    1320                         struct ieee80211_link_sta *link_sta;
    1321 
    1322                         link_sta = rcu_dereference(sta->link[link_id]);

Some unchecked uses.  IEEE80211_LINK_UNSPECIFIED would be off-by-one.

    1323                         if (!link_sta)
    1324                                 link_sta = rcu_dereference(sta->link[msta->deflink_id]);
    1325 
    1326                         if (link_sta) {
    1327                                 memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
    1328                                 if (ether_addr_equal(sta->addr, hdr->addr3))
    1329                                         memcpy(hdr->addr3, link_sta->addr, ETH_ALEN);
    1330                         }
    1331                 }
    1332 
    1333                 link_conf = rcu_dereference(vif->link_conf[link_id]);

Here too.

    1334                 if (link_conf) {
    1335                         memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
    1336                         if (ether_addr_equal(vif->addr, hdr->addr3))
    1337                                 memcpy(hdr->addr3, link_conf->addr, ETH_ALEN);
    1338                 }
    1339         }
    1340 
    1341         if (mvif) {
    1342                 struct mt76_vif_link *mlink = &mvif->deflink.mt76;
    1343 
--> 1344                 if (link_id < IEEE80211_LINK_UNSPECIFIED)

Is this checker required?

    1345                         mlink = rcu_dereference(mvif->mt76.link[link_id]);
    1346 
    1347                 if (mlink->wcid)
    1348                         wcid = mlink->wcid;
    1349 
    1350                 if (mvif->mt76.roc_phy &&
    1351                     (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
    1352                         mphy = mvif->mt76.roc_phy;
    1353                         if (mphy->roc_link)
    1354                                 wcid = mphy->roc_link->wcid;
    1355                 } else {
    1356                         mphy = mt76_vif_link_phy(mlink);
    1357                 }
    1358         }
    1359 
    1360         if (!mphy) {
    1361                 ieee80211_free_txskb(hw, skb);
    1362                 goto unlock;
    1363         }
    1364 
    1365         if (msta && link_id < IEEE80211_LINK_UNSPECIFIED) {

And this?

    1366                 struct mt7996_sta_link *msta_link;
    1367 
    1368                 msta_link = rcu_dereference(msta->link[link_id]);
    1369                 if (msta_link)
    1370                         wcid = &msta_link->wcid;
    1371         }
    1372         mt76_tx(mphy, control->sta, wcid, skb);
    1373 unlock:
    1374         rcu_read_unlock();
    1375 }

regards,
dan carpenter

