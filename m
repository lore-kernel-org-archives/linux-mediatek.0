Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12612C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:54:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A12611EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 18:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A12611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yq7NKtulNp5OFFhbfC80X9wY7XT9HgiLQGo09bQr8Ic=; b=dlOM5O6D/ZjYIc
	z9EfpYAiGWsihugEen37RYq3KwrhHCI113q1hEmqk4pxmK9ffBxuz2UpAvKTaVUmwcJHJE0YY6mdu
	pgB5RMeKLMa4h1zm3u7dWbmRUjRB7KKw0C0FSgeXlhrp2/a/nymgeOd7o8ClOYHsgtNUscnP6J8QE
	KzZxCcr30CrCzaSMowg2/5sGm2n13JSGziYzHbUBlsATzFfRBXi3SrhsS8QuVARDOx+PHdAPedO6T
	jtg6SSy8dcxWnokOlxLJVURmUQglLq6FyST87yj/RDCD6FOVGmNyABR1FUq9RjgV6t/W4tF7FxWL1
	JaOCl0zk0aL6JgsPCIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltECP-002GIO-W9; Tue, 15 Jun 2021 18:54:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9On-000DDm-BE; Tue, 15 Jun 2021 13:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=IifgYrCLZu4q6NSLQJN1jCp6JVyoXGnRglHOAdQNozY=; b=NEBukGYbA3XX+JHo4271tAp75q
 e0j55AH0kFKukdolyoYj67Hva8gss2Y6vJ3QSTLPtjRWaKgnMTWWvGp+qNhvm72vMKQEIToujTE1o
 HwhCJxhMVd6Z71jG2REaXQ1WVovUpudLldsDFLEXjxxxyxqc507EeMZrOxcSZRgDqZxRjXh4ndCP1
 AeF0RcS/sq2xL4VqSvvqWfOrNG6wjPDHCHgA+Qh9ar0XUelnzxzT9LkbE0IfOW536EhYmBPxxVSGA
 MVx0qng1GH/fxWPv5BN7CI9Nr4K5DBF0a8NLWeG0BTpPEPUyM3AYUSUWc20ezMWyH9v0cNaGmcWRQ
 VLgWr/TA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lszSL-007Hmb-4b; Tue, 15 Jun 2021 03:09:46 +0000
X-UUID: a82b017932d94f48a9b10e3dd8ef5b06-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IifgYrCLZu4q6NSLQJN1jCp6JVyoXGnRglHOAdQNozY=; 
 b=NQAuCSWqLJokkgtcy/Esi58nx/IolKu/5W/8wYIyUAv6KDLJ6PbF4FOGYP9p+B1wsKfUlmdz1kxpVnyAkxQXG/87b9FC7H64p3QEGn3mFVyGyu4dnQQR0a56glhJpsdY5CcSZcO+ooQFBijO5oIdhjHWLQMuX4BQ2DC2VtNZSQw=;
X-UUID: a82b017932d94f48a9b10e3dd8ef5b06-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 743396744; Mon, 14 Jun 2021 20:09:38 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 20:00:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 11:00:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 11:00:38 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v1] Change compatiable string for MT8195 mmc host IP
Date: Tue, 15 Jun 2021 11:00:32 +0800
Message-ID: <1623726033-16073-1-git-send-email-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_040944_559382_8396564C 
X-CRM114-Status: UNSURE (   6.26  )
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

Wenbin Mei (1):
  dt-bindings: mmc: change compatiable string for MT8195 mmc host IP

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

--
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
