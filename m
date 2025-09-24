Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179D8CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 21:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTxN2750e5bpeTaQ7TppbltNZbKzod9SZvI8svLvVuY=; b=k/qBM+OThlaVkqIsA5WD/suCjc
	pLNPVnDZprXdGaH/d5HamP52Kv1PKJnDu8hMO5RLY0VqjzbWzByQD+6LqafQDWXqk3EOURDfs/2yW
	mFde8bN79CnzgM2Ppx70jil+06QKBCPY0UbYXzL3mrnJVaNBTDILQoWpmvXPrMTNXa4JRD715SQHn
	Ok9mcbSH90BVNyUxmF1z0oh1I6960CCnTsC/Qmx9mP7N2On6jVv8tUFddD/L0LZlL29+eJPkVTKk3
	t6JaFKQLwz+7c9SfFQvC8oTxgz6vpHbR4b0j8ZRPN3+W7fFa4O4DGsEz1EeljlKSqqT3i8xh9NVwb
	sc0HOERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XTr-0000000455P-1dQ1;
	Wed, 24 Sep 2025 21:56:55 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XTo-0000000453U-3uoX
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 21:56:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cX9fr0D3qzm1742;
	Wed, 24 Sep 2025 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758751009; x=1761343010; bh=iTxN2750e5bpeTaQ7TppbltN
	ZbKzod9SZvI8svLvVuY=; b=HAVMVUFU9qKgB7YhwD6kr6ks8apZY3ypNrC0tF17
	7bqbPI3lM69NE3rOjtAUeZdOzFXPiyy1WLL3s/bvQdqrpjnV9l2W4bUhOrGBECGa
	wSWzZFC7P4t8BZUzdonbQ4YprYgXe/ligU3YhHXWf19dMVteAbupGwkUgyhTSURY
	poSa/bssx6VYLaFNBof9GQmR/bR+Ef5+0Z95IihqPmPp7k2lFNqR5hB2SUTRmj0i
	uQv35kBSfQqEXIX/CcozMS+yxcOO4TEWvGEBUZyJYPl0f4MoFm9nsttXgV8yRyrm
	vMRx+6fJTvvTnlUTtH/u6JyUqXN8DTHK8rYvrAsTYl7VSQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cj1dUvO3LjJw; Wed, 24 Sep 2025 21:56:49 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cX9fZ33Bbzm0yVD;
	Wed, 24 Sep 2025 21:56:37 +0000 (UTC)
Message-ID: <0835ae8a-2abd-4438-871b-e7e4c98bf965@acm.org>
Date: Wed, 24 Sep 2025 14:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] ufs: host: mediatek: Adjust sync length for
 FASTAUTO mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
 <20250924094527.2992256-5-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250924094527.2992256-5-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_145653_048252_894E2111 
X-CRM114-Status: UNSURE (   6.08  )
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

On 9/24/25 2:43 AM, peter.wang@mediatek.com wrote:
> Set the sync length for FASTAUTO G1 mode in the UFS Mediatek
> driver. This ensures the sync length meets minimum values
> for high-speed gears, improving stability during power mode
> changes.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

