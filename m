Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62844C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 08:10:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED4C20709
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 08:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K7n/s3ss";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W/3UQ0wA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED4C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pcfbqlu7IklGiSgvdkXq8jUfavJxhXbv+6vXwGq7Gdc=; b=K7n/s3ssptKyg/AQrxJcrJvg4
	7W6eoo3sCIrxqKQuizwIRyEGUpmGyV/bqMpqn+lcdBILbEZNjMslx+dx186ICE2MRXt+zH0HaJqzq
	vBFBw4dCkt3+UgCDqFtMfBgJaZBbL4UVsNuruxSwPYyLJjxHT2wHYp08fK/XVuJEyNw01rAN7ZUA2
	kn2/I5O4rjrS9nJRijBOyGugv9t71agdV19kDbHjzLwuLfkK4A+up0CaArPhwZ2LUT+tB0EAUfik/
	PotBzcRHiw5wxz6nLbRMyBHeba8mcHDQilOr272nOd1tiici0Exs302M5BaNiiya05+P0yroFYXMq
	NzfcfwZJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7g1-0001ea-8T; Thu, 12 Nov 2020 08:09:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7fv-0001at-K6; Thu, 12 Nov 2020 08:09:48 +0000
X-UUID: 985c867090934f34b0afa83ecbf4ae4e-20201112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bM1Nh5H7O3KcFpFNzFfCfarrHCbM8O55k+MWmqPlNv4=; 
 b=W/3UQ0wAFWDna46nivM4AaRKx1eaNss1GuWlZzFXAs6LkTZI2rgMhjenyfpP3PAeWFBfNdvBPmBBIRUdbbIyrUosc7sSXQxY7RFw/ClVm4R7BpWyywpkehElH967LxNVXcCVezh+AIFWGJXHKgFLwd67M0cg8BGHZz5gBmDCuIE=;
X-UUID: 985c867090934f34b0afa83ecbf4ae4e-20201112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1490611986; Thu, 12 Nov 2020 00:09:33 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 23:59:40 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 15:59:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 15:59:37 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 03/11] usb: gadget: bdc: prefer pointer dereference to
 pointer type
Date: Thu, 12 Nov 2020 15:59:26 +0800
Message-ID: <1605167974-28502-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605167974-28502-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1605167974-28502-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A0D144E8AD35B8B7D0381FC0174562B1ADD78945ECF714339B55F1E18377D082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_030947_881269_C855777F 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Prefer kzalloc(sizeof(*bd_table)...) over
kzalloc(sizeof(struct bd_table)

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4: no changes, but rebase on kernel 5.10-rc1
v3: add acked-by Florian
v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc_ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index fafdc9fdb4a5..76463de75595 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -147,7 +147,7 @@ static int ep_bd_list_alloc(struct bdc_ep *ep)
 	/* Allocate memory for each table */
 	for (index = 0; index < num_tabs; index++) {
 		/* Allocate memory for bd_table structure */
-		bd_table = kzalloc(sizeof(struct bd_table), GFP_ATOMIC);
+		bd_table = kzalloc(sizeof(*bd_table), GFP_ATOMIC);
 		if (!bd_table)
 			goto fail;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
