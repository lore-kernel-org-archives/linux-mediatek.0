Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC0DCD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7CuLlKDZQznwpaWJphoeGTh2ZPlfY1z5LRT1Dzsgs8=; b=Az0r6qnud4e1pOqUjljK4khfxi
	7up48Ze8EGaDcu0vlA/b3FvlKKu2IPaxebmQcdYyyGBZSbHYnXnUdJFxuYrCpnU/YL+fIMS80nKIL
	JkEKyHp16y0oMLkjkMlZ59QzfVMuN/smlBtg1q73IjwQDRgM0f9q1dvWihtbbgTugMz3qyqImm90/
	SMJkCveatEOiB3IsJZtMSFo2Lff66acikWmKCAsJz6IAd3BFEL2PiWpGbqwXeOCuu/e1p6+2LLXTT
	4GgNBa8ODZamTfmOMt1IYciFnpvaiQQHwRQT2TsttAhciH00+IC5dTYY6cmrKAL3uREO9jff93hDy
	0+0eI9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOtg-00000008HU1-2qEr;
	Wed, 10 Jun 2026 19:47:32 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOtd-00000008HTj-3QCV
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 19:47:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gbGX05D3nz1XLyhV;
	Wed, 10 Jun 2026 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781120842; x=1783712843; bh=E7CuLlKDZQznwpaWJphoeGTh
	2ZPlfY1z5LRT1Dzsgs8=; b=ZEgvhFh3aWTwzPvm/qnW0WCvohpmGvo+U1XLlAs3
	GjdJrtY6HX+CODsE9bCHSxywwBNqilyNA280kb0REZemR5DTwz3jW1AYTtOkV+QU
	IcCAcZCN9uC+YwtF3AvGmf1qvV+Ftsvnjx4nNg3fdFhO8M9xPgJBncASch0/b+2A
	XkwJxx4ilpgKHyAgc+Vq1JiO7PwJX+BPVmZFoA0V/0W8SfUIK4XaI9b+6OfYAkRF
	purUxEZshqtEnBnFzQUtXBRDLxheQrNqqk3DWZjKawpxqovbiCB6Ic4DmVhT9rtp
	i4AYjzQYGybZAXPLO/U7GQQGnPRyDe/lfcqhlmLkXAAgAw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aY3bP3U30VI7; Wed, 10 Jun 2026 19:47:22 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gbGWp0ZLdz1XLyhT;
	Wed, 10 Jun 2026 19:47:17 +0000 (UTC)
Message-ID: <42164c06-3c54-4d66-a29c-1e0d46210472@acm.org>
Date: Wed, 10 Jun 2026 12:47:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260604133503.2049288-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_124729_921306_B393A026 
X-CRM114-Status: UNSURE (   6.04  )
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

On 6/4/26 6:33 AM, peter.wang@mediatek.com wrote:
> Hence, it is not necessary to stop I/O during a power mode change,
> and this step can be removed.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


