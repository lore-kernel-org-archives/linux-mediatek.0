Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05EAEB26F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA7I/kJYrPEzo77yMTNNn8uGOXpGSKO6msM5RGhG9Gc=; b=OncmUd/0JXe6BdEQOJssVHatyD
	3H2DgSTSYAGyfsGgUPghJaYIxJdyJIfhvETVo3u02qx1GNkyHuvk0Mjh7nujOfA1d08FCqvw6oPDR
	IDrgPxPk9Lr/f8sXWZdnhFO29J3Ej0iG0/Mm1dT3PLRyOb7yUOaXspWQrSO5cDwPvHv4CeSy+/pcd
	3PR8olSrdN6lirTjCLDEdxXth2jVnTIKDnC0DDemAAAlQRYi6vTgIHv27XfvrLy9lve8tMNjCISna
	HBKNC3RG2LXFG+WKk1m6UxdEWC8/19VQrTel6z3OZr/vX3kZB8GQVTjk9w0Pj6zZ5nMpN8dh5cMvL
	r7/GCipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsgW-0000000HP6E-3v8N;
	Tue, 10 Feb 2026 18:42:04 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsgU-0000000HP5v-2Xy7
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 18:42:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4f9Vlt2v2Rzlfvq4;
	Tue, 10 Feb 2026 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1770748919; x=1773340920; bh=qA7I/kJYrPEzo77yMTNNn8uG
	OXpGSKO6msM5RGhG9Gc=; b=DnNkr2Rf6RkNeryW7z6+17Xjx2KmqtOyLxk2knAa
	FmHdtc18I6YI5oV2orxOy1HKZpHmcMYo3FVCDGc8PF/U3vBkEyuj4Cplz7XwQzy2
	p/hXqyRLxzEzhglE9E1whAqUc7nTJzwTzYOShHZn82twgKHc6OeylG/iMCtfBBEH
	1Ei5kPEDlUSlYmfB6/IHZ48eTwpDhp3TBNISH7+9unGL9sDrn7KNGSBRmrODk5m5
	TZEQJzLsxJFvr1IxXDEJaHkcjpl+AAooviGsD+ijs0po4zTLpWroNwGdT3qrg/5O
	GK890ifIz0sT+R0fEoffOOnFvb1ssCfkcjSAGKQ4v24CVg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MPqQywuOkm4f; Tue, 10 Feb 2026 18:41:59 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4f9Vll3136zlfvpH;
	Tue, 10 Feb 2026 18:41:55 +0000 (UTC)
Message-ID: <21c0f687-ce78-4720-b29e-fca35f7f85e1@acm.org>
Date: Tue, 10 Feb 2026 10:41:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] add debug log for command timeout
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260210070837.1820710-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260210070837.1820710-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_104202_683623_E392F90D 
X-CRM114-Status: UNSURE (   6.00  )
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

On 2/9/26 10:41 PM, peter.wang@mediatek.com wrote:
> Add some logs to make it easier to debug after a command timeout.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

