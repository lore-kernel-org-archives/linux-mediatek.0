Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E08C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFaa7YKXSvWLRDXhrY62aVrDz3UmYOdr/qkiXBZuk9w=; b=Nxy4QyIxGejKmYEGxP+8Wb99QM
	nSbIQUwoLNn+gSOLgb6Uqq0tniLJKXHTv6f2MI5gYWgLFaUt5n44Az9Es5544ak4kk8WG7zYUp0xF
	4xRXeFcGZ9KeyADuK72c43TKIxslFxblorsUIBv+8IjIMARwaek+mKQo9AOYaKgCokymfHSIMSlAE
	xRqBWSVqs/H/10oQhn/FCMe66FN7WunsIE7yqcwSlNvqdIzG9XWj3Uv6XnvFlw/O6wWdPfq6u22rL
	sEUft0lYEok4tz6ZwoKtAccEQroHL7bYKnWbf2eC6DqI1GwpJcORy8S/Q4ALuG2iPdDJLPRWJtEZF
	w2TWY1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hAo-006rLb-8u; Thu, 01 Dec 2022 10:52:10 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hAm-006rJF-7C
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 10:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YFaa7YKXSvWLRDXhrY62aVrDz3UmYOdr/qkiXBZuk9w=; b=Su6ZdHYotF5kFvfCFuoAraVUAy
	8dq8a6reTuVno3MUjGSlFDICWKRBOBfAcoSkhaH8pEjqCDtCt7xNcjbFdwg1SLUIaAD6MUefzzzdn
	PMxjZubvCwQRjYQYEkK7Me2A1ULevYexXWqhFfU5tvc03M2VD0n35FsAtVrZjsddpz/w=;
Received: from p200300daa7225c08186973351f2f7021.dip0.t-ipconnect.de ([2003:da:a722:5c08:1869:7335:1f2f:7021] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1p0hAW-005deM-BD; Thu, 01 Dec 2022 11:51:52 +0100
Message-ID: <973c3afc-2ea6-ff05-2c61-d047bf69867f@nbd.name>
Date: Thu, 1 Dec 2022 11:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] wifi: mt76: mt7996: add MAC support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
 <20221122084554.9494-6-shayne.chen@mediatek.com> <87zgc7mmr8.fsf@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <87zgc7mmr8.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_025208_397695_B5CEE96E 
X-CRM114-Status: UNSURE (   9.73  )
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

On 01.12.22 11:39, Kalle Valo wrote:
> Shayne Chen <shayne.chen@mediatek.com> writes:
> 
>> (Split the big patch into smaller intermediate patches by functionality
>> for easier review. Refer to the cover letter for more info.)
>>
>> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> 
> [...]
> 
>> +static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
>> +{
>> +	static const u8 ac_to_tid[] = {
>> +		[IEEE80211_AC_BE] = 0,
>> +		[IEEE80211_AC_BK] = 1,
>> +		[IEEE80211_AC_VI] = 4,
>> +		[IEEE80211_AC_VO] = 6
>> +	};
>> +	struct ieee80211_sta *sta;
>> +	struct mt7996_sta *msta;
>> +	struct rate_info *rate;
>> +	u32 tx_time[IEEE80211_NUM_ACS], rx_time[IEEE80211_NUM_ACS];
>> +	LIST_HEAD(sta_poll_list);
>> +	int i;
>> +
>> +	spin_lock_bh(&dev->sta_poll_lock);
>> +	list_splice_init(&dev->sta_poll_list, &sta_poll_list);
>> +	spin_unlock_bh(&dev->sta_poll_lock);
>> +
>> +	rcu_read_lock();
>> +
>> +	while (true) {
> 
> In upstream we have a preference that there's some kind of limit for
> loops, to avoid neverending loops.
This loop pulls entries from the on-stack sta_poll_list and bails out 
when the list is empty, so it's impossible for it to be neverending.

- Felix

