Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDwIc5hSYuzoTNhzROoEzmexiIT5k2+a7HEOgRBFDDE=; b=UCd2vVWPW6eSVD
	YVeVOn2L4W6wfXvTqatx2+RFLu3omGWDXkjIKv4DuqB6WLFBhfeXvIBktW4pxnsGCsCvL3vl5ExXE
	7MwPBB9/zuViEs63svrUIeLShPUm3grHl0/LXSi/rePmytRymmAyW6R8wwSoG1bEPYB8Sg5Aj1hPe
	3k6lBuN0VeOajCGK33zmBKjKTUobviJDncvNXRpgCOIwJNl1nt9wDSJKMwRZgB+oVvi826yPlRJXw
	uhQkKn72ghOOsicCuwAeOy8fvcQNnygxZ4lGWKy6fNAQDtQjM3KsbkFh+cXw7bNVLDvSKOjZIKs9Z
	EuhNaOIS9SJSlJl9WASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaax-00FoI0-G4; Thu, 05 May 2022 12:28:35 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaau-00FoH1-Hu
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 12:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l9mYgL4Ih0Yrkw4dha3tbuPVN2YYKfqSw+M0+XnKe/c=; b=Y6ttzwXghX0dur3EIohKOXTOcl
 Cf91TuaDvT8o+R2KUlGxL+2JpWgietScqpJ2O/A3479E8gPG5X3IVQEmaAwL391QNB2Hv1J5bf87q
 9P5ztXIHKVBL+hsNpUIoatAouqd55hfbuJjDKkC6ierJ34JpsUy4St3bUqquLw+ysqh8=;
Received: from p200300daa70ef200412f484bca3869cd.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:412f:484b:ca38:69cd] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nmaan-0001Ds-UU; Thu, 05 May 2022 14:28:25 +0200
Message-ID: <f8502bac-9b02-ac0d-3d0c-759fbddfa1fc@nbd.name>
Date: Thu, 5 May 2022 14:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 4/4] mt76: mt7915: limit minimum twt duration
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
 <20220505082554.16656-4-chui-hao.chiu@mediatek.com>
 <YnPBz8uB6A5kAPRs@lore-desk>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <YnPBz8uB6A5kAPRs@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_052832_801501_C1D517C7 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05.05.22 14:23, Lorenzo Bianconi wrote:
>> The minimum twt duration supported by mt7915 is 64 according to hardware
>> design. Reply station with TWT_SETUP_CMD_DICTATE if min_twt_dur smaller
>> than 64.
>> 
>> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> index ff60a3d2d26d..e912ecacb578 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> @@ -2633,6 +2633,7 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
>>  			      struct ieee80211_sta *sta,
>>  			      struct ieee80211_twt_setup *twt)
>>  {
>> +#define MT7915_MIN_TWT_DUR 64
> 
> nit: can you please move MT7915_MIN_TWT_DUR in mt7915.h since we have other twt
> defs there?
Fixed in my tree.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
