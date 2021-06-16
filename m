Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A083C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121F5613DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121F5613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I93Ipalx//byFnps9OXdhG8w0s3DxODvAjf97tnwLc=; b=qWzcxOI3vekHGf
	JHrYyQIOVPNYfanXNv8di9rTItX5w8k+fPiep/wunJNy4VHKoMK5TUzOy3yiKLSyE3/lqiT2yojjn
	HSQdbO7A/VITdVK66vhBd9Gd1FQuwDerP0Thc8dn+I7FviN+end1oZC1zIfR/X5WOCJk9w+DkIijZ
	17/2dEyVmtGVnjK5ebZoNpBaLLKKBee6mdZ1KEE5FM8xEIDhR6lCH3IEUjl1drYYPOPCMlOLqtQ7Z
	L25In0+3DNIIk7QvUeAoG2ncrDpA2pISf15lafOPQBTLLJtcFSLB5eVBreXsKQvDCtga3/vOJpMB5
	RWX0laGUo4nY8GKtOGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteIV-007v8b-Ui; Wed, 16 Jun 2021 22:46:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteIP-007v7T-Ji
 for linux-mediatek@lists.infradead.org; Wed, 16 Jun 2021 22:46:10 +0000
X-UUID: c6dccc2847494f56bda08a76ac242925-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BIGTRtMI1M/NxPYpKDB7DZogZmTNQfskBsrd2oYAmuk=; 
 b=QSf8NopMydVk+ZP3dqirDGr8OMdEkVLZ/AjnwhK7G+DpFDLLAvXJ9xb5L90LxN0KRsRryMLwKf1brmJRikxZQofJDX/f+um7SIWgGDv1Gg7mQ7pfG9Knivpcg1AlrnSlnqalIBURLVFlBwZltuqsPBK8wOIRvHaTBYLXSfYB6Fs=;
X-UUID: c6dccc2847494f56bda08a76ac242925-20210616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 712155726; Wed, 16 Jun 2021 15:46:01 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:45:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:45:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 06:45:58 +0800
Message-ID: <1623883558.21078.1.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/4] mac80211: call ieee80211_tx_h_rate_ctrl() when
 dequeue
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Johannes Berg <johannes.berg@intel.com>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 "Evelyn Tsai" <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Thu, 17 Jun 2021 06:45:58 +0800
In-Reply-To: <527da6e8-172d-95ad-9a28-a790b19fa945@nbd.name>
References: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
 <527da6e8-172d-95ad-9a28-a790b19fa945@nbd.name>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_154605_697907_D25E3272 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-06-10 at 13:10 +0200, Felix Fietkau wrote:
> On 2021-05-28 08:05, Ryder Lee wrote:
> > Make ieee80211_tx_h_rate_ctrl() get called on dequeue to improve
> > performance since it reduces the turnaround time for rate control.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> For the mac80211 patches:
> Acked-by: Felix Fietkau <nbd@nbd.name>

Hi Johannes,

Does this series look okay to you?

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
