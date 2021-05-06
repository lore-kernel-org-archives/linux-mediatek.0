Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA7FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 01:57:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D54613BF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 01:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D54613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fflL4/Iq8a7bwsJ+Ux1BRU3vdgRmU4UQcICsNXJDSes=; b=J43/dDMriTEMNOePkFgkeOyMI
	VXi6dYH2+1wiucEEBsJBONGC6J2HLb/dDfltw1nVcWJAUFvnyOjF6JVklcCmzjDHj4cscGYjBl2Uc
	HhgF8CUXcG00ljEJIHV0dvBB+M1/dw66L0PmO7q0ee3DkO8OFfxq2G/6T1fvEXJobcV7x5JEgQXzy
	WsK9B6dvTFlEWXUgDf65mK0C7fp9RKnX172O3bJ0ykH62MF2WT6De458az9vx1p9ehk0kFd47iBn2
	6X/H4SEf13SHb3x8FeCct8EEN0QUpwd0EBQ7/+jcu7Sei/rPlPG0Q8caBF5i/pvUCJiG0xhEwcvri
	JPBBX1OMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leTGb-002tAD-Fm; Thu, 06 May 2021 01:57:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leTGO-002t7T-3A; Thu, 06 May 2021 01:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=+l47teRY6dfibpD0XBKx64OFlA8iisCstRrz9ulSvko=; b=iQpiffY74Nm42MaAy5hK7Y9Xci
 S0vTxE+uTz6oIEjJnIrI6zMorN2SNzIUn1uHMjLyfJinbdIG9DtUWj/m9C4dJCilh4HLyTHWT6jdE
 otGiry5tQBhyCAfL2ULTkIzhF8BwAwX+/42lX8TlZ/t8ET70D56XcXm6P+GVnB/Z0jAj40/Gr6Gn1
 k76bd265tE2O8n8RRLKTPC0juSsNv4l5H5HYnTVksnxblMqKNrOr++8EtywZbBHr2XJqaJO9YAbzA
 JheeQlrxubKxLVqVNrksAS+Unm+xz3q3IdI/NgC58HE+KQuybYsvh+lL4bVsRUopFjkCVedKxsCDX
 X8YL9CfA==;
Received: from mail-m176231.qiye.163.com ([59.111.176.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leTGK-005UKH-Pd; Thu, 06 May 2021 01:57:14 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176231.qiye.163.com (Hmail) with ESMTP id 3D56A6C00CF;
 Thu,  6 May 2021 09:51:30 +0800 (CST)
Message-ID: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWOSAxLzJdIHdhdGNoZG9nOiBtdGs6IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <45ff044d-80ff-9001-1d4f-d39d0ae63060@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 6 May 2021 09:51:30 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Thu, 6 May 2021 09:51:30 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQh0aQlYaGUhPTh5OHkJCHUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISU9KTUlPQ0JON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Kxw6Chw6Dj8WT0MULCNRDwpNOhAwCh9VSFVKTUlLSU1OQ0JLTkpLVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSExOTDcG
X-HM-Tid: 0a793f5f71d1d9a9kuws3d56a6c00cf
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_185713_012095_258AACAE 
X-CRM114-Status: UNSURE (   8.07  )
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


>On 4/24/21 6:52 PM, Wang Qing wrote:
>> Use the bark interrupt as the pretimeout notifier if available.
>> 
>> When the watchdog timer expires in dual mode, an interrupt will be
>> triggered first, then the timing restarts. The reset signal will be
>> initiated when the timer expires again.
>> 
>> The pretimeout notification shall occur at timeout-sec/2.
>> 
>> V2:
>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>> 
>> V3:
>> - Modify the pretimeout behavior, manually reset after the pretimeout
>> - is processed and wait until timeout.
>> 
>> V4:
>> - Remove pretimeout related processing. 
>> - Add dual mode control separately.
>> 
>> V5:
>> - Fix some formatting and printing problems.
>> 
>> V6:
>> - Realize pretimeout processing through dualmode.
>> 
>> V7:
>> - Add set_pretimeout().
>> 
>> V8/V9:
>> - Fix some formatting problems.
>> 
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>
>Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
>Note that the version history should be after "---".
>
>Guenter
>

Thanks, Guenter.
And what do I need to do if I want merge into the next-tree?

Qing


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
