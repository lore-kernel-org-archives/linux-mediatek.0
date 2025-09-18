Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B54ACA1013
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+iOGzdWX3z/rYlrk5yA0SAeuhbPHc3L1cNeSiXPCmY=; b=L22EhoyzAak9xJj1Cos9HcGxly
	dHelAoxLtfzT0FSU5x9+0KzjCl7tmQMi6GLc91qYaj1BcHZgIrEc7q+UH6zXUDsp4pIaPolKBmskr
	plg9rhqLkOo9DPQWzdW7M2xOMvCXQ60tTz6E+IksV93XmpJsczSdI3QyuRWgNR8J8W3ijyasusayy
	Css8b/Dj2GA7DCftUrs8EB/tfd6EIEjnSMLvXbBC/4N4b2LcDJ/9b7LIT7iICgcXRzme2DWSCfGCq
	wFAYhL+jPPon3EDyYEVe/RVnmp+DCtFjwyXKVKA89FRLoI6XMzwKbX2fkPRnCgiwzmQuAyjCpBgmc
	cbjnK2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKN1-00000000zlJ-3EHs;
	Thu, 18 Sep 2025 19:32:43 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKMz-00000000zkN-35rn
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 19:32:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSQlD6N7hzlgqym;
	Thu, 18 Sep 2025 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758223958; x=1760815959; bh=B+iOGzdWX3z/rYlrk5yA0SAe
	uhbPHc3L1cNeSiXPCmY=; b=O4SG3OTzWfS4geXjtxMgQoP/tyiiFw8bt2ARrEFF
	jGAqnp+2dgojuesk4ibF62hFo60uXEs+YvWlQloGfbUKiK591c5pJT7TAwscdqt9
	7taNP5YWFadb6Ck7vA4nvT5ypJhFBaekmcD57x0JD3+Yk0hFp245vttjSi3q4T0Y
	6WOO54WPGdMRwgklgpKIETeGfu2yjhpC76HY5Yr20/eqO0nnecvi12atM64hOGJ+
	A0H7EDKmeUzfNtMu/zwfsR4RF+Bq/XdRIHRRNHnN06HN0YomxswCblC4tSJzchC2
	Pg8iZpzIsFwFRcTfW1jdsMjRHCJcq9YiWcnKhsBkCqQTeg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TNb82r7mKlWP; Thu, 18 Sep 2025 19:32:38 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSQkx1bJ8zlgqyN;
	Thu, 18 Sep 2025 19:32:24 +0000 (UTC)
Message-ID: <7a51c923-d311-46c4-b9db-5df807a091f2@acm.org>
Date: Thu, 18 Sep 2025 12:32:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/10] ufs: host: mediatek: Support new feature for
 MT6991
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-11-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-11-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_123241_854512_7E66C035 
X-CRM114-Status: UNSURE (   4.88  )
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

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> Enable random performance improvement features to boost
> overall system responsiveness.

I think that you meant "random I/O performance improvement" instead
of "random performance improvement".

Thanks,

Bart.

