Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF28C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 01:52:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC626613FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 01:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC626613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dumar/0CNwNjqTayJ9spfHb1+6HBev8FrFi97GW49eg=; b=Z425sD1mrcyQyinLNpMM5IHjl
	w35UYQz2FGbWDVTAMVVhCL9OvTbLKOS467wHu5cevS+Kxd5ITTiV2zyadF3+YlwzHN+F/qsz3T/Hr
	iWCz2xCpmxbTHUPmf9CHAFnEZ/1GpaP/4O/YFUSCoRgUZnWOTXT6ma3uDDxnIOEcx8l0W6eH8s+1O
	mABitFItZHwKEQ1akphpPOLtaHMy1oAnzw8Dd5zy4WLA165s9tSkxwWRMf7MLBeYQvlBkLCs04sFC
	Eg2GL0mhFzXdlq3fpM6MtplNZnUveEAA7D9QQVT2tpsT6mK07T9n0b6r4wzYnjAVUbKCB6t1xFmaQ
	8oP+cVVQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbZNI-002ZUH-TO; Wed, 28 Apr 2021 01:52:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZN5-002ZT5-Dq; Wed, 28 Apr 2021 01:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=sCr9g7nVSzeX0Jx/5Apk0r7ZWgXtrX7DYUKj+BOHPW4=; b=XbtTUHViEuWOkX9FZ3YirBYKeP
 BZ2Z+swXmQrdsNJQ8w9c1sz17jb7qak3AFMiTc7IhPBcCvuuDUWJamUWmATCVIQhLw9RHJsxcy07x
 e6dUdKfYMEu3V4HJreb4qfW7g7jjr1+LyTGblALoUjjRIki1B/739HDwZ5oPC7lTgwAAx2ztGCfAY
 hwxOZFKuv+4T4cdp0GRrA8HA3HlkSoc7Bja+uoC+E39BsyaURcWOFfkrkjb1v6qSPjz5Q/ks54eBV
 9rd0wEUHBdjNIY/7eIa4FglwdOg0+r9kUc5rGhAXVRDOc+Yh7A1Q0xAxjWI/E/4AmIWhe8feA3WTT
 yBxQi/Rw==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbZN0-00H8Nd-Eu; Wed, 28 Apr 2021 01:52:08 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id E1F5F282E56;
 Wed, 28 Apr 2021 09:51:58 +0800 (CST)
Message-ID: <ADUA9AALDva0XEeX2p71l4rW.3.1619574718914.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6W1BBVENIIFY5IDAvMl0gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Wed, 28 Apr 2021 09:51:58 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Wed, 28 Apr 2021 09:51:58 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQxgeQlZJTE8eSUkeTB5KSx1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISktDS0pKTkxLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Py46Qjo6Nz8NGksjPh4jSQtMShdPCSxVSFVKTUpCTkxPTEpCSU9OVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSEtOTDcG
X-HM-Tid: 0a79162d01d39395kuwse1f5f282e56
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_185206_696705_6C56686C 
X-CRM114-Status: UNSURE (   6.43  )
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


>Use the bark interrupt as the pretimeout notifier if available.
>The pretimeout notification shall occur at timeout-sec/2.
>
>Wang Qing (2):
>  watchdog: mtk: support pre-timeout when the bark irq is available
>  doc: mtk-wdt: support pre-timeout when the bark irq is available
>
> .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++
> drivers/watchdog/mtk_wdt.c                         | 77 ++++++++++++++++++++--
> 2 files changed, 77 insertions(+), 5 deletions(-)
>
>-- 
>2.7.4
>

Hi Guenter:
Please help review this version, if there is no problem, 
can you pick up to the next branch?

Thanks,
Qing

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
