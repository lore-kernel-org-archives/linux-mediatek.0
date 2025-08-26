Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41082CA0FF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vluf0lRThdc/XPN/J3in6of1bo6pzNAGErsCGqniwT0=; b=TH4G3GYBtK5GqiClZY9wBviQ0e
	N0JqGlw/6CnGt2iBfpGvJ5X70uE081Jz9/CWwqc+n8+13yZm95hTL1mpjChRClj4V7prgo6djwA40
	2wsxy2A+Tjpt/g06FhlkV5GM1Aqqhj+zAkZsLsxN1OvM5vehipPQQN2edUzX6VmpxOzpIFd001Uax
	cYaWQp9gs6++hMzkjFUstKFN+obaM27K8U+SxHmBdYOoImqz+ZUuTsRkCc4qESkcp3BvEEyDWvCUC
	+ENKqd1Nwd29G24D45a1D4ov2+zrUqiZXyJ6mqRYlUUNfIKUS886QssjhRcebfVZJTXG+e5UmOLPG
	0fR9MVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwDZ-0000000CagL-2qke;
	Tue, 26 Aug 2025 16:08:17 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvGF-0000000COHv-3Ekn
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 15:07:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cB9xG3S53zlgqy9;
	Tue, 26 Aug 2025 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756220815; x=1758812816; bh=Vluf0lRThdc/XPN/J3in6of1
	bo6pzNAGErsCGqniwT0=; b=bQf77qhyeI0134ORqxWpuJBTSV3XFwdb1jcp5+Yk
	D25WWJ5L2O+CJlgGTgX4+lmpC5NPir+4leGnKbbpwPDh5dqhb/+qUFaGlpmuLP3F
	PymQL+GHk0g4FfPkj4uZaIlOydxAqoke4dDGc8plQFl3aK4Pbbc8AUCOLCn/Zjca
	VT/GRYldJJtmW/WjPU0mcoGrvn6w4qH1K4Cm/fCpcg0U334LXCZT9i+2eSLLqyCl
	xtWzQkXRKEh09vefL38gDSkJjHdMhMGRmIdpkwsube7m0+9654kVqbEVZkCT8kNz
	JvMYY8ACpYtM3mj39dyztvJbm1h6wfGcTW5Bu+6/7Cgswg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6i5KAFw-Wt05; Tue, 26 Aug 2025 15:06:55 +0000 (UTC)
Received: from [172.20.6.188] (unknown [208.98.210.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cB9wn0GPFzlrnQ0;
	Tue, 26 Aug 2025 15:06:31 +0000 (UTC)
Message-ID: <ec57c49f-dc4d-49ef-a350-20b992d29487@acm.org>
Date: Tue, 26 Aug 2025 08:06:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] ufs: host: mediatek: Enhance recovery on
 hibernation exit failure
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, sanjeev.y@mediatek.com
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
 <20250826062314.3070425-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250826062314.3070425-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_080659_914333_773C6951 
X-CRM114-Status: UNSURE (   6.57  )
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

On 8/25/25 11:22 PM, peter.wang@mediatek.com wrote:
> This patch improves the recovery process when exiting hibernation
> mode fails. It triggers the error handler and breaks the suspend
> operation, ensuring that the system can recover from hibernation
> errors more effectively. The error handling mechanism is activated
> by setting 'force_reset' and scheduling the error handler work.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

