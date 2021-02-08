Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92C2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 00:22:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2A764E3A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 00:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A2A764E3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rmHp0TX2YP4EUmSCdOnkeYhZppRQKNR3HxaFi0q7OFg=; b=LZ9lp2TA0K70/HzQFOKjJlAYQX
	3jNhAJlncT6VjHVocVUiw6kcK82u+8axIC04v+BAltAKV3dduxf89gdCBOYTr+cWWMgHlueqI+NpU
	9n/g/WZeLX5+nxnAGnkjcSUOowUbht/aCXlLfzdE5EpDdCMCgxdR6cTAbhfP6fLIpWBDqz5a2A5xW
	Ixw8rBNAyp56GYOb+ZzxmOHHPDMHo0PoUBj8qE4b7wMiYXHZONwHQQMHOsuFh4Mqzjktx6p7JcA/a
	z/ZbxhAaOq3fQw3vmeXJV/wardYABcXJipI00KwmDqfRbw4zNgCxGpupHKFzDHzAw8INo+A6mOQmG
	JtD1qioA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8uKB-0001iS-6g; Mon, 08 Feb 2021 00:22:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8uKA-0001iJ-KV
 for linux-mediatek@merlin.infradead.org; Mon, 08 Feb 2021 00:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Date:Reply-To:Content-Type:To:Subject:
 From:Sender:Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=22PjdP3HY0tZzoW6pHULZs18Ep/qcWy+gXqf0IurJHM=; b=WbM0r+4kI7OYRnLhZIqW+i0Rzg
 59BKd4yWuTzeIG8XYZJp/WKGarJzCvB/VkJ1TEqPhOjRK7VcF7vjcX9dkUnyfUWvwLKRe4B2Hk9Um
 0QdMhFQs09S5cNYcoqkcXxhAXheV5dw0RGmVg/18mSAdodRXOXUQ+Tz+y4ZWUZZmls/60nH4AQsym
 pFn+n52sDVz8VeCKx0V2774MsNoNysBx6W/Rcxi4XgFqZduHixqDiUiucTkiUfTiXoz38mVZognVR
 vVjVd6vrcOef6wp9l+rHw1/X5SXxbbEtPTJ1myXyXm+K2ePkGP+zk7V0jRaardLHzHc/Vf0jkl2Vi
 65ytx+iQ==;
Received: from [209.141.46.27] (helo=50uj302.com)
 by casper.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1l8uK2-005HmL-Rb
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 00:22:36 +0000
From: "Ms. Kim Chan" <mskmchanouk@gmail.com>
Subject: Investment research about your country
To: linux-mediatek@lists.infradead.org
Date: Mon, 8 Feb 2021 07:22:34 +0700
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_002236_277822_9144E440 
X-CRM114-Status: SPAM  (  -5.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: "Ms. Kim Chan" <mskmchanouk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Message-ID: <E1l8uKB-0001iS-6g@merlin.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

My name is Ms. Kim Chan Ouk, A Thai citizen in Asian Continent but currently
residing in abroad, I trust this email meets you in good health, I just got
your contact today during a research about your country and I will say that
I foresee success of my future investment ventures in your country. I want
to invest in your country and I would like you to assist me in my investment
my investment Please do reply me as soon as possible so
we can discuss more.

I look forward to hear from you soon
mskmchanouk@gmail.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
