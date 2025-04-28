Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED948C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k8ExuWt18nW3cDuwIql8udRt6fuS9xYbbltMm+PnNo=; b=M9Z97h68GATYr393rvqEQyYsbC
	kMAwQk4u9SadP2suEKTSDDhXH9wm5lDAarZ7I/T3W/PfFA9Cqt4MTOc3bZSAopm8w2x8ZbLOnRY/Y
	oslAmZ7o011UbV4EGiECUQnIYWn7JC/coyAQCWkcs3ohsvY+adzkLRm405zPtnJ97z+bN4amR3xeL
	HNhkvSc0KfqgTJ1itlNkDt+M/IE1efc/FMogh+MRfu0o/9AWBZvxOz3vnTNzG/bT0D6otfAdJgelp
	lOib4crM/sLVwkSQxtArUZUKa9nA+1RJbQJK4c+EKGOsFKUEAApj0shIssOQOSL6nHeLV8QKiALCg
	rZyge0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VS6-00000007Vou-02iZ;
	Mon, 28 Apr 2025 20:51:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VS3-00000007VoS-2VgG
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 20:51:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4050033f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745873502; x=1746478302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4k8ExuWt18nW3cDuwIql8udRt6fuS9xYbbltMm+PnNo=;
        b=kGFbUO/OFCc77gS2hKmFn0olYRXL3i36uT6Ydu8eEp1JH0D2FXwVWArw2GoqO1hd9j
         NjDGQWFMM/Ohg400WhnsgPd1TR4XGRf0IPwykftog1acWx54EXXnqhXB9COkyOw8alPc
         aq/UgxGXLYFaQk+yRHTFVovTJXxJSI1xyt+2t+p5AsxvpB8vVXVg3pZ5Ra52irsB4KhR
         qcM8BrUgSgbezN3F8iVMr2JZgUqpb/m5KcAnMw5F+eNjaBKA79HlYibsfBTApsU93bBd
         3pLKh31AUb6Bv8g0CaIRgD8sfYVOuiZ9rRdJOcHeuul7OKyS/sYDaN1TsC3gN3tHJRjh
         5Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873502; x=1746478302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k8ExuWt18nW3cDuwIql8udRt6fuS9xYbbltMm+PnNo=;
        b=pBB4mwq7EArH0zyre46ot8H98ZDorulfIiDHwKV2tj0IArISsBfndVv4yQt8KcaQvo
         W+hwI1U1+xKqsbX3H/4ftRMlGYojwg+iClt/i5n+LbegAebzIF232gU6P4MW1MxB7kbG
         /rboBgJF11/O0pg3AviAjuuhv4J8Nt/Fv0Y0DTITH0Wt+c0GF5FpajvauuY9yMfHADCm
         Lmj97OWV8PMbPcG9p24VaamCzpqWVURVf/S8UOpt1ooTScW5O+2Yczxw94Bhc7rov6Aj
         rceMYkiVUnwdQH/24B61xm4dlEaQrxNCBQzzHLVqZPG37yMwQzRXWkc3DjyrWt1iOd45
         2SSg==
X-Gm-Message-State: AOJu0YwisqQFrXv/5xCxv5Dl7gegEvdJekbm3f7YHLGmZFHVmATxuWj9
	IY0Kehja16oxEMBemlp2z9O3Qp1YSlxhR69Nr4AsYz30LrUt5C2PNN+PqFclVqA=
X-Gm-Gg: ASbGncv9FFlOjKpzyCf8+EZa0y3T/EfZ3jJS/37+MztSs3oVCASOldP2CGv9gBRsMYV
	vofzfDUjPXlQI2RuuQGPCvq61C/kHm+/CyJARo3HZMTMzgI4ts2e7e2fArBL9onKA7sctz4DxGn
	KyPhzMnA9BP25tZ6RNIxWdNOwmkyz+2fP2fU8jLRgY3B/DgxglqDNBD2M+fH3vROjEBnrsa7hTD
	CI71NshYuSsU0yYnBBIEnM5M9dpce6QGsbAERGEyV3I4cKHbCsklOMvs2Ai6vyeDazCNG0o2AHw
	lACTCKd/ObpnFUugICnd6mPamqwtx/zcuV3iDIM+n9XcXg==
X-Google-Smtp-Source: AGHT+IF38oFEaPvv9eE/nPcCugE+/FkjT34ajkWCwLsb+L5e+vliam4dJwQ3H9VKp1iNCZ3SQT69XA==
X-Received: by 2002:a5d:4571:0:b0:39f:d13:32a with SMTP id ffacd0b85a97d-3a08a537866mr366117f8f.29.1745873501962;
        Mon, 28 Apr 2025 13:51:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e46869sm12099213f8f.72.2025.04.28.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:51:41 -0700 (PDT)
Date: Mon, 28 Apr 2025 23:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Wang <sean.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [bug report] wifi: mt76: mt7925: add mt7925_change_vif_links
Message-ID: <8c56080e-755a-4782-81aa-4b31e920d9da@stanley.mountain>
References: <350c8f73-26a5-4337-9b92-a211d8362195@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <350c8f73-26a5-4337-9b92-a211d8362195@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135143_655451_50BC3D30 
X-CRM114-Status: UNSURE (   9.78  )
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

Ping.

regards,
dan carpetner

On Fri, Jul 12, 2024 at 10:32:40AM -0500, Dan Carpenter wrote:
> Hello Sean Wang,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit 69acd6d910b0 ("wifi: mt76: mt7925: add
> mt7925_change_vif_links") from Jul 6, 2024, leads to the following
> Smatch complaint:
> 
>     drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1155 mt7925_mcu_set_mlo_roc()
>     warn: variable dereferenced before check 'mconf' (see line 1127)
> 
> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
>   1126	{
>   1127		struct mt792x_vif *mvif = mconf->vif;
>                                           ^^^^^^^^^^
> Dereference
> 
>   1128		struct ieee80211_vif *vif = container_of((void *)mvif,
>   1129							 struct ieee80211_vif, drv_priv);
>   1130		struct ieee80211_bss_conf *link_conf;
>   1131		struct ieee80211_channel *chan;
>   1132		const u8 ch_band[] = {
>   1133			[NL80211_BAND_2GHZ] = 1,
>   1134			[NL80211_BAND_5GHZ] = 2,
>   1135			[NL80211_BAND_6GHZ] = 3,
>   1136		};
>   1137		enum mt7925_roc_req type;
>   1138		int center_ch, i = 0;
>   1139		bool is_AG_band = false;
>   1140		struct {
>   1141			u8 id;
>   1142			u8 bss_idx;
>   1143			u16 tag;
>   1144			struct mt792x_bss_conf *mconf;
>   1145			struct ieee80211_channel *chan;
>   1146		} links[2];
>   1147	
>   1148		struct {
>   1149			struct {
>   1150				u8 rsv[4];
>   1151			} __packed hdr;
>   1152			struct roc_acquire_tlv roc[2];
>   1153		} __packed req;
>   1154	
>   1155		if (!mconf || hweight16(vif->valid_links) < 2 ||
>                      ^^^^^
> Checked too late
> 
>   1156		    hweight16(sel_links) != 2)
>   1157			return -EPERM;
> 
> regards,
> dan carpenter

