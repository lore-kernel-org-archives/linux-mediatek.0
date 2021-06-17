Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F0CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 10:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467D7610A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 10:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467D7610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9+eBNY5SnqrtVnzM8erlVpPufvgHyGAcd1qNXHF52F4=; b=hejG8usRTp7tN6F5BAXtpgxIbI
	lQrJMVQWE9yN5DdDoISBb+WA4982dTcTb9gKfBtiF1xKdtMmtNh2RRV3TJipt4g3+i6DuV14e0ujg
	IZoCXuIZSuBlpXjwwhJKpuZr1qZQWn+QVU8DHe9pnE1KtamC8cp211Wfz+GRN+a8ae9DhZpGZpqJZ
	iVhgIhtLL0H0fRNPktxpUY3VjuKIKTKQssWGEifnZtiIcpnvJ1MaS0lm/K0cYhHxH/IWZcKw5DkZV
	3EOYnzWEM2bD3AG5sj3qUtGQAS2KuPu1Z1NWiLfVu0ay7JL3MHSrmsjCBKQ1USGK9B9LtWtZWSSwc
	cyOD8caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltpbw-009waX-Dm; Thu, 17 Jun 2021 10:51:00 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltpbt-009wYU-1o
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 10:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/udkT5IeBSNjwumPYiud7qBUHcZ1EN6G37If3NBOIU=; b=rD5aV4Nx6K1bJFb0KVNg4L4385
 W6kQfKg1HfsbTWCSynd0rOuEOvB9H/Ht/mtOf18a6ethz/5Ch50n64wgWRSA7TFP/IyZQJG2WpABp
 2PfJuW/diQoMYI79sQMphrZoIRlXs2IEMvtTqkPCpSW2c0bnnBAjGyMeW2/qCOFlTY2g=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1ltpbj-0001KH-Sg; Thu, 17 Jun 2021 12:50:47 +0200
Subject: Re: [PATCH v2 1/4] mac80211: call ieee80211_tx_h_rate_ctrl() when
 dequeue
To: Ryder Lee <ryder.lee@mediatek.com>, Johannes Berg <johannes.berg@intel.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <a89137bf-401b-c9d0-8848-d79ea9e2a9c3@nbd.name>
Date: Thu, 17 Jun 2021 12:50:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_035057_307129_7795FB88 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-05-28 08:05, Ryder Lee wrote:
> Make ieee80211_tx_h_rate_ctrl() get called on dequeue to improve
> performance since it reduces the turnaround time for rate control.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> change since v2 - roll ieee80211_tx_h_rate_ctrl checks into one condition
There were some OpenWrt crash reported which appear to be related to
this patch. I was able to reproduce a deadlock with ath9k, and I'm
currently looking into it.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
