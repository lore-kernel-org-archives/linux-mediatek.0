Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4820CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TK240Dx1dzoWdaIXJuYaN3i3wwO6c6dW8DEoHJi+mJA=; b=zD8DVOVpWt+AUm
	X4pxQ7MeM+NVouDUBFN0pDvOBArD9oYJov1Tp7rb1OUtfr0UAhvjjrGyCGxuBR7Szxpg2NXZMEuZK
	0AAEJ0fp5d1vrCYea5Mh/tHVFLL5qNBakYvfjXVCd0pkJ6MagnY7/d5uPZzL7lwIc7rCLfeoaY1Km
	mrLwu0c0aTXv4NwSWc/0GuFPIOIIEuVCUqmW3/2p+fmYxyNi7iGyr/gQNW8QIEBwckcLZRRa3fMEF
	GZLiXR75UY5Gx72d1qykoBOgaoCOs6NCk/3BQa9w1YhamnYChHsJ9773OMRmC+YxHQ6FG/LystZga
	rp0eTqL7HpOVPvp/ijDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u8-00000003Qex-0x2P;
	Fri, 15 Aug 2025 20:20:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz6I-00000003F9X-1S5r
	for linux-mediatek@bombadil.infradead.org;
	Fri, 15 Aug 2025 18:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TK240Dx1dzoWdaIXJuYaN3i3wwO6c6dW8DEoHJi+mJA=; b=BHjKnrIhNUfqIjt04y9UQMqjK8
	escLY+ojRsWaCVupGF+XFMbIDtRAbMks9XHic3RdjEaiyylta2XdYcWZbSamcN2EcWuK67rzAlsPc
	/cfpQ9m3CllNLEmm7kPEaN/QWxH1Gk1M2A0gXiwpeD6IUPhAoc4TAwJldH9d7OAyfSmfGPUg57Pe1
	Mn/JZTvsAekFtLJ2Yo7ZM79QC3k6h+dpSfSQ/vJXV/hsqnFfOpzcxK2rT3ofO43AGTbjMFJEb1alh
	aMXX0yzrf3LTk/QQ0Da3iSrgdIxdz2CEiYl4h+7dv7C6cUJYJ1VAIH7etjLLEzhw7ZFlBY3yjEex0
	mrfdLKMw==;
Received: from vzded161.smartservers.com.au ([203.98.83.53])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz6E-0000000G0Td-1PDr
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 18:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=arcmarine.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TK240Dx1dzoWdaIXJuYaN3i3wwO6c6dW8DEoHJi+mJA=; b=drg2JZjHD+zcZ2HvylbQ+z1i32
	SlmItLeL21fqo2a/q9bElXD0UdWMOk2ZfWavQ7J90wxv31c+4oqib5RSoxlgLWP6yVAC53W1twDG+
	+nJHn9tltWvOJS7wBYjWqxtXlqkvQWsEB9vt0oYY6e9zIWIShOyLKGUorTmrW4YYESwcHHIst868o
	+DMFYO6wj//Czas18X7COFciy+/s0bhiEk+zl3wZOkvlzaLvblNfbA3IJGBTZXmJrubOaE8x/1e9j
	oIm95KPNbfTM2tvbGrvS4SBvNy8pVQU/8KmmKrQwZjGDap2YmAdrj6s5r1Q3fGaIghYFoZOKLY8Dy
	8yJUeZOg==;
Received: from [45.94.31.42] (port=57482)
	by vzded161.smartservers.com.au with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <mail.yanalfinance@gmail.com>)
	id 1umz69-00000003AcC-1g7w
	for linux-mediatek@lists.infradead.org;
	Sat, 16 Aug 2025 04:24:14 +1000
From: "John Walter " <mail.yanalfinance@gmail.com>
To: linux-mediatek@lists.infradead.org
Subject: PARTNERSHIP\LOAN
Date: 15 Aug 2025 11:24:01 -0700
Message-ID: <20250815112400.03E128584C95D9B8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vzded161.smartservers.com.au
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Get-Message-Sender-Via: vzded161.smartservers.com.au: authenticated_id: arcmumacct7@arcmarine.com
X-Authenticated-Sender: vzded161.smartservers.com.au: arcmumacct7@arcmarine.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_192423_657014_FCF4B779 
X-CRM114-Status: SPAM  (  -6.89  )
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
Reply-To: consultjohnwalter@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Greetings linux-mediatek,

I am Financial Consultant and I found your email contact in
google business directory.

I'm contacting you to recommend an investment as I have high
profiled Investors with capacity to approve direct loan from=20
$2million to $500 million or more, to implement genuine projects.

Respond if you have a project that requires capital to execute.

I will provide guidelines for you to apply funding through the
Investment company I work with on interest rate of 1.5% annually.

Once you respond I will provide you with more details.

Look forward to hearing you.

Best Regards,

John Walter
Financial Advisor/Consultant

