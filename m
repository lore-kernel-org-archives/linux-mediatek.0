Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9BDC47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 11:11:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836DC6128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 11:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 836DC6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZGA0EI1HBVmnlYyXnCpDgfsh/AU+8ZlmMw4NarZd2x0=; b=jabvSPvPwi5I5QqO/AaIy4O9Qm
	wW/Qp04VfV8krfSOiTxQv/AM6KggGh1EA/m1sHD2N/YxVpI6YKdlX2u/oSB19gmZC4V6nWE5wE8w8
	16UFP9b0m27mAMHFfDhLSHbNEa0HN+kiQKm2couggCunruTSWDHoiRIe/0jWEuh/cVzBCroO4mUf6
	4rP/BokjKh/2jhcbpL6V1oIEZhE9qqjjCnR+hJA8ymvTqUL165MxoSLu+XiUIrXfZKZU3WFa5KIh3
	8ey+sLsv/oqlegmbicISR8b0h0rypB357o8BYpLUw7H3Jbug31gOqURFMnlQ+ZXfIJoeB9GykaaRt
	xIXTwVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrIaH-000VgJ-F5; Thu, 10 Jun 2021 11:10:49 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrIaE-000VfY-FM
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 11:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6hVsRGwQjM105uJe9n3dd7gX3g4fj7A9fEKu5+To2c=; b=ZmVQ8kb0TMXPw4RurusnUxnaCs
 nL02d0yFTJ7LckFSAMW1l9KYffXeDEk84Vlg+QB6dUOwWSbdPvp5+5/p5Oqw7GdfQ+O9SmqEK5kcx
 yGyUgi/4/GJHeIvHZeXx7AXuk4eWhMD87zwLHQWM+OKFIR6JeXEdXsdJysi4LWU5MBuM=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lrIa6-0006vu-2X; Thu, 10 Jun 2021 13:10:38 +0200
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
Message-ID: <527da6e8-172d-95ad-9a28-a790b19fa945@nbd.name>
Date: Thu, 10 Jun 2021 13:10:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_041046_744452_29AA9E39 
X-CRM114-Status: UNSURE (   6.09  )
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
For the mac80211 patches:
Acked-by: Felix Fietkau <nbd@nbd.name>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
