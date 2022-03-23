Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD76C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ah0lTooMd6OqnPc6Y5WjTdm+0On5sEpRRUvN87OcNfU=; b=B6Nh+RGavfqsEo
	kCSucwJPyDJ5379JkCq43i3+oK+hVw3ojYyrjMyXdYvQGJHG6oPtMB/wUgmDuy6Ivtht7r9oREex9
	4LbaEmCArrF6zYOMhrRSqtbQHSQqD+LQld3mCO+IEOevxOv6jnyaalPG8Z5O3aGNpPg6bexIThI0/
	8JNnNAE8DM1oRDHCf0j7HKe9G9yiU9XihsFwjEtTWNPSURPFGcr7eOyjBPixyvgBsdDSUq6WWtpnE
	PZH971HrLroL7TrO682dX+GipCoj8dNSMtmGnPqbi74Wd+eTybb5TBPiCRCAi2EAAy+zt6+CxFtLc
	hAK6gw9MrBHl1IZhqgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX0l5-00Dgws-Cv; Wed, 23 Mar 2022 13:10:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX0l2-00DgvJ-O4
 for linux-mediatek@lists.infradead.org; Wed, 23 Mar 2022 13:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Z2yzTyOYASwEuQAelkSipCGrR3PaRyKe2/oJV4xXKLE=; 
 t=1648041035; x=1649250635; b=Aq2LwJmCfQCg8qvKdqGKvhudCXA6H1JI7BAp6Byff54RwDD
 FxvReVFFVDXzU+ccmRqauLlbV5NwbzU6JqhvCZsRQYO02K5h1Uft4SiHfRFHaytlI23Liw6XA9dTT
 LlLQDReUMCXqMSanZ3zSMK9sGqSl8F4L9z1G1KwFMnWcZb8lagZ3YkgLVOBF+/Coxd3FJjTDfrZdn
 0fbvuRonGkTyI4SM9l+E+4ZJhlwTAnkje6kqffc7P6mRpuU2/Wyts56G0K0h35gR3b2INe5CRur98
 YHxPf3LxmTQTWNtl005TMy9Rnc/s+WWSmLHkotX5ZhRrM077zTAN7QzjqXwk1UbQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nX0ku-00H5rF-Uj; Wed, 23 Mar 2022 14:10:29 +0100
Message-ID: <98a39edef048fef625cdec32030d62699f89d9e8.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: adjust the replace_state of
 ieee80211_find_chanctx()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 23 Mar 2022 14:10:28 +0100
In-Reply-To: <40aabb3e10302f1d7da92b7a4eb46577d5ed8e05.1647641256.git.ryder.lee@mediatek.com>
References: <40aabb3e10302f1d7da92b7a4eb46577d5ed8e05.1647641256.git.ryder.lee@mediatek.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_061036_817082_B7FE9564 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sat, 2022-03-19 at 06:18 +0800, Ryder Lee wrote:
> We observe that the condition of chanctx could not be back to
> IEEE80211_CHANCTX_REPLACE_NONE occasionally while STA connection.

Not sure I parse this correctly, can you elaborate?

> In this case the state could be IEEE80211_CHANCTX_REPLACE_OTHER, which
> fails the check and then creates another chanctx that leads to the next
> round of chan_switch failure in cfg80211_check_combinations().

But if it's REPLACES_OTHER (note your typo), then it's not yet
registered properly or anything.

> So, modify state to just rule out IEEE80211_CHANCTX_WILL_BE_REPLACED.

Therefore, that really doesn't seem right.

A chanctx with IEEE80211_CHANCTX_REPLACES_OTHER needs to get used via
ieee80211_vif_use_reserved_switch().

johannes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
