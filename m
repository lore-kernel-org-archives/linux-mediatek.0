Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F075C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 12:16:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3568D64FEE
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 12:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3568D64FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tbYFq03u1lapVttXElzA3vKtpWNQTt6JOjEgKUWnSlY=; b=VlqI4tiKxfd8hyzvDeTsHox6gK
	6xnMGMtY5fGy3dIXvt9MqbKlnpt12Sqm4j9YzUyz4v2xhhTBT5RseQrKW+4f3oqKQT+DErjtyuuQA
	coMaeGIXKeMmVyN1pbK/Y4qgu+MHuwA7x5y7zjwSAgr+zRS4dtDco4KDIkU4ehLzbYtZzoyD/Y/zO
	L+5zMjRJDACeaEAsa9zZOFqMum5bc4pJ1hrJV0+1BdJYsLMI5yoFGoMQMKt3pjEEQ3ohXxKrCJuiw
	6RA+Wmr1TFzN8jdlR7xsRcKWO2NScPZ8fxnRit1T673K1YRLBE7Yb+AbQJgY/46cYLnnePL57Wcbs
	MFwj+h/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJxl3-006nTD-Dt; Wed, 10 Mar 2021 12:16:09 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9rxU-0004jQ-G6
 for linux-mediatek@lists.infradead.org; Wed, 10 Feb 2021 16:03:17 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l9rxQ-0002Bd-0K; Wed, 10 Feb 2021 16:03:12 +0000
To: Sean Wang <sean.wang@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Soul Huang <Soul.Huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: mt76: mt7921: add MCU support
Message-ID: <57068965-649f-ef8e-0dd2-9d25b8bec1c7@canonical.com>
Date: Wed, 10 Feb 2021 16:03:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_110316_645119_846BE7F5 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 10 Mar 2021 12:16:07 +0000
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

Hi,

Static analysis with Coverity on linux-next has found an issue with the
following commit:

commit 1c099ab44727c8e42fe4de4d91b53cec3ef02860
Author: Sean Wang <sean.wang@mediatek.com>
Date:   Thu Jan 28 03:33:39 2021 +0800

    mt76: mt7921: add MCU support

The analysis is as follows:

390 static void
391 mt7921_mcu_tx_rate_report(struct mt7921_dev *dev, struct sk_buff *skb,
392                          u16 wlan_idx)
393 {
394        struct mt7921_mcu_wlan_info_event *wtbl_info =
395                (struct mt7921_mcu_wlan_info_event *)(skb->data);
396        struct rate_info rate = {};
397        u8 curr_idx = wtbl_info->rate_info.rate_idx;
398        u16 curr = le16_to_cpu(wtbl_info->rate_info.rate[curr_idx]);
399        struct mt7921_mcu_peer_cap peer = wtbl_info->peer_cap;
400        struct mt76_phy *mphy = &dev->mphy;

   1. var_decl: Declaring variable stats without initializer.

401        struct mt7921_sta_stats *stats;
402        struct mt7921_sta *msta;
403        struct mt76_wcid *wcid;
404

   2. Condition wlan_idx >= 288, taking false branch.

405        if (wlan_idx >= MT76_N_WCIDS)
406                return;

   3. Condition 0 /* !((((sizeof ((*dev).mt76.wcid[wlan_idx]) == sizeof
(char) || sizeof ((*dev).mt76.wcid[wlan_idx]) == sizeof (short)) ||
sizeof ((*dev).mt76.wcid[wlan_idx]) == sizeof (int)) || sizeof
((*dev).mt76.wcid[wlan_idx]) == sizeof (long)) || sizeof
((*dev).mt76.wcid[wlan_idx]) == sizeof (long long)) */, taking false branch.

   4. Condition debug_lockdep_rcu_enabled(), taking true branch.
   5. Condition !__warned, taking true branch.
   6. Condition 0, taking false branch.
   7. Condition rcu_read_lock_held(), taking false branch.
407        wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
   8. Condition !wcid, taking true branch.
408        if (!wcid) {

Uninitialized pointer write (UNINIT)
   9. uninit_use: Using uninitialized value stats.

409                stats->tx_rate = rate;
410                return;
411        }

Line 409 dereferences pointer stats, however, this pointer has not yet
been initialized.  The initialization occurs later:

413        msta = container_of(wcid, struct mt7921_sta, wcid);
414        stats = &msta->stats;

Colin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
