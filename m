Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3BFC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2D26113A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 15:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2D26113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2MBjdOmPeGU6htjHcDCIy5I1Vzly1SZ2wOv1gKxNg+Y=; b=Wo4viWpvoK4VMkWZvCxVswHBl
	uIar8fooRcoXLuVotMbG47vW8sD/NsIhVtx4/NrwZqHtupzKvFUfSW3RXQRn1WWcLKImUNHIZpfkG
	QTDds07qqI8sYNPkDS/4hz5KXUTuf7wJ+mxzpqquszWwii9rZvjKnojgaE6NjsE5+XBxcWYJHEkZd
	8zoOeVI7Zsaxx1yYcfFU2w56Ltr6JTeTb4JDtngRsjB1lqnzYO7B+xsiwZi/WIWnEohTS6lXxu0zL
	KlHRs+/7YjjjMvqgMJeqXZOGO3giPmkKw3xv7JkbwBjdjcgZsDG9yXwRIzQaMpNV1rAgRCX/CQf7l
	7emTmgfXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWvG-008VIC-2F; Thu, 08 Apr 2021 15:50:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWun-008V6U-2n; Thu, 08 Apr 2021 15:49:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A44D161151;
 Thu,  8 Apr 2021 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617896991;
 bh=e0rReV5SW9DETahBCXpGM15Z5v9yHRUujvWue+vyQ44=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHQgxjJ46Vja4kPIwtVFIjDe4Nb+bbRg8oVVXoazxB9xPzwq1lcyqFvANNMPUbb5a
 PHIWdj++hDdFHHZCf4TkbVzpnbET5h1UKOP+PPRuhnjdmiSw4mZMIqooEG/C+cKPE/
 fOlxHh2tHuhKtTP0QVsNGGWdhWOFkxc69MqYJ/75IsJNsNZjOYDom4seVUxUI3gKv6
 /AfrWEBUK9ifarCzmydviZ9+PKJd6kfEj/Rgh59OM1NBOJydK4wWxrpi9R7EyFK+AS
 ZaMn3ODs+Oias5Tr5T5lAVeQpccleupQkyqkHDz5BzKCYxch5lckldFmgLS3Mtf1pA
 JWCptbUq54b9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Fabien Parent <fparent@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.12 (second round)
Date: Thu,  8 Apr 2021 17:49:31 +0200
Message-Id: <161789693304.1636044.1039014965097284178.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
References: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_164953_565382_8AE70B3D 
X-CRM114-Status: UNSURE (   7.19  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:00:14 +0200, Matthias Brugger wrote:
> Here comes the second round of soc drivers patches. Hope I'm not too late.
> 
> Please have a look.
> Best regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 4a3c88952e13172bde13bbb718265805861bcab2

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
