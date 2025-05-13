Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7183BC3ABC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAZmxHO4IKWe93G8q0zzOL5FUKSBW0etydiFxL2hXMI=; b=35pbhOFOmKSI8H4EUhQy+rMQh4
	uZtP9P2GG64KMa++F3z5n8KkBcR9RfnO6TBcAOvgCsaGA6Gv0q7QrJsC61NkVu425IVCEyBUL7PJX
	cpMu6x6vJiE1iknL6IT9ihawYGOim1Wzrmevz2iJhkvC5QkxkjRLgwWW50WBzKXMq6aR2JBlUYJTe
	YyoWVosTSubSwW7wDb6oeMpW1jA6jUi0s3vR5Blhi/4TIuH+PePMbYveJaAZj7xqNomtLJU4swc8D
	5u1l6na4+ukrXI36v5K5Ci+qY8vDFYnSDYsW1ccjIV5VlhRmqM7PsFEV/XPxiATv8a3IMuVxXGRQy
	dnOBq8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq6G-0000000CY4B-0gFK;
	Tue, 13 May 2025 13:55:16 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEptx-0000000CWJk-3dRC
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 13:42:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4Zxd2J36WtzlvhyL;
	Tue, 13 May 2025 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747143748; x=1749735749; bh=FAZmxHO4IKWe93G8q0zzOL5F
	UKSBW0etydiFxL2hXMI=; b=jyMZn4d6If179WZDQr/8wk76e894KWNZSb8posyk
	+KsT/SBvWSr2VsZovoJRLwUGzl+ujbF/6790AQ/kqrxycuvBQU4yyvaWC8RAqLbg
	tShp00nHJqjsWAWz+wsJ9ltKLV5SI8WvDJLhciYC8YoQRnJPM2w57x9DzBNLEKY1
	C9L509lTQL/RN49O67q9DmsfFYdcRvU3/gV26lnLRObhy/lIaqq6Gs5+jTUaOM6z
	lvsGVMyLYjlLA00qjvKe4rN0zurbfqmY2w2iZNcYkMXz5NgudXbNp0uU9Qvsj5ZA
	krf15ldNWpNrsvoKFFof1OMKvvD2TgFVUCwxlB9Z+/h8lA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id mazkmqSRCX3y; Tue, 13 May 2025 13:42:28 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4Zxd1q15hSzlgqV1;
	Tue, 13 May 2025 13:42:06 +0000 (UTC)
Message-ID: <4420fcd0-5125-43b1-89ff-c3e5edad2939@acm.org>
Date: Tue, 13 May 2025 06:42:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: support updating device command timeout
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250510080345.595798-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250510080345.595798-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_064234_003526_846E5B81 
X-CRM114-Status: UNSURE (   5.59  )
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

On 5/10/25 1:01 AM, peter.wang@mediatek.com wrote:
> V2:
> - Change minimun value to 1ms

For future patch submissions, please include the changelog below the
triple dash (---) such that it doesn't appear in the kernel changelog.

Thanks,

Bart.

