Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=3.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0891BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 23:02:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A2464F52
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 23:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A2464F52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:Date:Subject:To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O6nSTD1xoUiM5hCzkB9ZTcvkwGCUDtN+W2pvCfy3MtQ=; b=agZ8JOAlpHuoCf4R3mdM7QQoMm
	5Kjf7fNfqL73jpuiM2Pm0uYjqyzdUSiKjlNjmDVhzwWjixnZZ8RqM+6/gl1GUkv92gDXCzD0Ph5Av
	CGpx/nVJ56hqL3sGEMUvLgWDIuU0IShWxdzZN4dRUIMRDGiOT6Ph2i98IpleJ3Gihd58gN5Gefetl
	5SN+rMU+bb+ognSXeF0o+/HUv2QOfl/nUYxLCdJFzUAvT5pRoTOBP5lNERv+EMXAnPBp6a26pzcKB
	jTijiI1D6eIaby2TXt5FX/6THMQugKkQ52eX9pkVQvB3azWPQj2tx32uJS0h3qR1s8jig0S+Uz7Wt
	foe2hF4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLwDh-00H4FM-Hh; Mon, 15 Mar 2021 23:01:54 +0000
Received: from server7.internetiletisim.com ([207.154.255.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLwCU-00H4CA-Oz
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 23:00:41 +0000
Received: by server7.internetiletisim.com (Postfix, from userid 99)
 id C0895A39F2A; Tue, 16 Mar 2021 01:48:56 +0300 (+03)
To: linux-mediatek@lists.infradead.org
Subject: TREAT AS URGENT
Date: Mon, 15 Mar 2021 22:48:56 +0000
From: LEGAL EDGE <dstartup004@gmail.com>
Message-ID: <9f88cf6f6e33305f437bb820d8d5c8ce@server7.internetiletisim.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_230039_364101_D17095F8 
X-CRM114-Status: UNSURE (  -2.56  )
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
Reply-To: artemia@legalsedges.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QnVzaW5lc3MgVHJ1c3RlZSBOZWVkZWQgVXJnZW50bHkuCgoKCkNvbXBsaW1lbnQgb2YgdGhlIGRh
eS4gSSB3aWxsIGxpa2UgdG8gZGlzY3VzcyBhIExvbmctVGVybSBCdXNpbmVzcyBPcHBvcnR1bml0
eSB3aXRoIHlvdS4gS2luZGx5IGNvbnRhY3QgbWUgYmFjayBmb3IgbW9yZSBkZXRhaWxzIGFuZCBp
bmZvcm1hdGlvbi4gSXTigJlzIGEgbHVjcmF0aXZlIE11dHVhbCBCdXNpbmVzcyBWZW50dXJlLiBJ
IGF3YWl0IHlvdXIgcHJvbXB0IHJlc3BvbnNlLgoKUmVnYXJkcywKTEVHQUwgRURHRQpTaGVhdGhl
ciBBcnRlbWlhIEd1aW1lcmV5CiA2MTQ4ODg5MjA2NwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
