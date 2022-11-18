Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237E6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy9zfSxGgygHU3QKXELj5gWny0p3j9DJBoAoG1+XBFI=; b=B30OBoCGf/Bo15ECJrlAbeZZI0
	aBXezhC39KJYt/dL49xDptHifTSc8ktPQkn2kvWpzn8zj4w3OCtVtq80Vt/JMgpl1mG9PGAn8J1n5
	D4JiIJKyL4QHUU+PqTruUgGPMXO1KOwGQ3EQXknkQdaHoO/5w42+0VzuK0k2wzuE/9HLK+QA3+VLr
	2ZRq2Z41njLuXcg6O6CnumCvIVTFtk0FYdImgzk+pBKUuJDxDdklxSbOYrIr3xES4dDAvk9ktsqPi
	tUilX9l4wab1jtxrztRxb64ysqBzdLa7Vxy9gdsS+lUU2IBb67WJ7Ju8BkLNI0Xb+QAUopDiNHunH
	dBKSL4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow93P-008EqZ-RG; Fri, 18 Nov 2022 21:37:43 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow93N-008Egw-E5
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 21:37:43 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 939085C02B6;
	Fri, 18 Nov 2022 16:34:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 18 Nov 2022 16:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668807253; x=1668893653; bh=zy9zfSxGgygHU3QKXELj5gWny0p3
	j9DJBoAoG1+XBFI=; b=MtRLXpefJ+alywWKWXEspuM4omh9vNKVgudrGJFOrccG
	Wi+d6CYBxKox/R/C/YHbzVIOYhjp0o1Sil4FItWbpQZt8bAxOcOhJ1tg1hAEBuVa
	mBGswF/4PmgpXBX8+FSrBOFku/3ODq2NRbE85TPzufKCSDTvGTflzFqo9Dw5A/GX
	pgniozyqHLgj2vdMWinmJgqrKeELZQ2OUqhe1c1RED1nioqq+N8KOMnBsEEf5lNX
	1Es0MGJoeHf8EJGj54zg83vD2T0PCa2QMVhurqgEYQt2LgDkLU/bhWx3/qQqipw3
	HtvJLD3HY44R2WKuIWV77SDMTSQA9lI4PUW9abzAzw==
X-ME-Sender: <xms:VPp3Y5wDOeASLt2uqFhcrxxrUJzlk40wz0HTuyPuIQ7LDQWxzdr0Gg>
    <xme:VPp3Y5TNSpWhp3M7fUE963PcVzUPL_1Ddq69REjAnBoQvHkCPAmN4NSzLU4ngezgI
    guk4oRDrBtbF44eeG8>
X-ME-Received: <xmr:VPp3YzXYXJluBYDZDxBDnyYB_iYrMKmO4l-KX6s7JoIMqoGYmbZDlRsm7JWjjWNasFcpQEeEb_WxgkenAcQ5TGboY2a5Fu1qlSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgdduheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:VPp3Y7gYh0LK5BPOhR84I8si6E0s5e__V-qeIg4URIa6xV8qn6EFMA>
    <xmx:VPp3Y7CanklhUSWZ0rGWAJkDFP9qqlA-zUnzLhhEH9Y4jrhJ2plBAQ>
    <xmx:VPp3Y0KZqJLDrZpAUfs81tP5GxX-QrFYsuzVjMu8yGL4-bFYnCvENA>
    <xmx:Vfp3Y26syCETOIUWTbL8xDYskIg9cFHtg4jasmik2zvFieT8Yo1G1w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 16:34:10 -0500 (EST)
Date: Sat, 19 Nov 2022 08:34:43 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Bart Van Assche <bvanassche@acm.org>
cc: Chanwoo Lee <cw9316.lee@samsung.com>, stanley.chu@mediatek.com, 
    jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com, 
    linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
In-Reply-To: <db25901b-8537-ca16-aaac-0daaa636d84d@acm.org>
Message-ID: <c561e1ca-7739-efe7-5c36-952b01634a26@linux-m68k.org>
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com> <20221118045242.2770-1-cw9316.lee@samsung.com> <db25901b-8537-ca16-aaac-0daaa636d84d@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_133741_554739_49C519D5 
X-CRM114-Status: UNSURE (   4.32  )
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


On Fri, 18 Nov 2022, Bart Van Assche wrote:

> There is more Linux kernel code that [...] than code that [...]. 

Thus mediocrity prevails.

