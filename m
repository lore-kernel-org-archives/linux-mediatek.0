Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337DFC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:35:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8496561440
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8496561440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cc4rQw6yzLeZmX1ya7rRHRhuLmuv+0O0/7x5YcXK9G8=; b=k0byqQKkyPPCYvzJcRMkUfck4
	HR06WEOWRZbzdHeQS1G0BZDuel+J8FseAmTKTtdRiN2mDbizYB+zN/uGVFcvtOySAKghkYX2fPcVW
	Wn5L/GLQSFVzU72zdraZOoq3rqI7J5cIgrfKIrHTX/Ep7GSWgGg5O9b+MVoaUNYvzyAp448kaGT/k
	ryd0ITtAN85D5BYtaXqpxyFNWUbI8z/C1gRiO9RfAwazuy6LVFl2N7YsN0Qloc7AGCPRFhnr+T338
	vbcD9bHGwxoFUQp5wQ8sak/ol63GO40ry6TzHdnUzrV4jkXmTeidxhLMocF+8kQUjUwc3A3+D0lco
	sU7E7kCjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZD0x-00ETPh-CN; Wed, 21 Apr 2021 13:35:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZD0u-00ETPX-K8
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UeMdVRe4bHpnIpI87GLbu9BgqITFB617fpRxifWCetg=; b=TsjXXcC+aVkMwJjilFIv7ssa/R
 qdwvQyBPltpNNWWwIV2sEYnRLcz8ZlJtTjTZrVNlS6Me623ZExW98ZPZjj9lBC1IOWbt1rknFS4Xf
 okqLH/jbZGY39zQdpNEhBsnJI1xnC3GvC0fqlZ12vACBv5PzgUO2P9z2OsMv8L+CqndAElNbMm6il
 m4AKKsaMIWV7woUfk/nsL/wLrb+AuEmdTdNlQOQc8wi691R7NPBlw3JbCa7ym0AJpH9hO+6EyGLCf
 J3gtOloKo3SjLlMJ2dzQRgXpwpaG6fHZNxjFyePMZp/fi4JA6JXyW1nyU5G2tLdkmrJjawpgx/eI/
 KuuKeo6g==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZD0p-00CvB0-7t
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:35:31 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDS3WW029034; Wed, 21 Apr 2021 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UeMdVRe4bHpnIpI87GLbu9BgqITFB617fpRxifWCetg=;
 b=ycBflKyXa4oy0AT94y20BB0Cognrwe3qtbhcnt2La/NLDtcv1eOP40S4z9UYqy75Xgvc
 z7L85FNiWNhN931jqwvCYp940IE59cwsknmm158HaFs56cVGLlbT/5qDSScqpN9B4Eq3
 17arfdz7f0k+rnM3Kz27E06iHtUIrZEJSkM2Skh0pCbB9R8sG5jUPDqoigcMG+5nwKl8
 hnnf1FLxfn+crOvF6MH+hQurZp9EjRb38AUBLqvgUFrAHhd9GQnRVj9mzFEwRJ/alE0X
 sUK/ttaTp9CLTfjtx/yZxEpmUBVWGbCCR3pPj+KtMdaD1rXS7A0uy4V23NIewVHmAEw5 2A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3818whgqym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:35:24 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDZNmr179327;
 Wed, 21 Apr 2021 13:35:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38098rrbd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:35:23 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDZ6gh178091;
 Wed, 21 Apr 2021 13:35:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 38098rrbcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:35:22 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDZK2x031000;
 Wed, 21 Apr 2021 13:35:21 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:35:19 -0700
Date: Wed, 21 Apr 2021 16:35:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] mt76: mt7915: fix a precision vs width bug in printk
Message-ID: <20210421133511.GH1959@kadam>
References: <YIAlYknkd0SoD6SY@mwanda>
 <87ecf5b648ea6d42994abbef8d9cde7e15a0a837.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ecf5b648ea6d42994abbef8d9cde7e15a0a837.camel@sipsolutions.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: JA_PlnUt8JIfTKlRo1hL60umWHaOjUJu
X-Proofpoint-GUID: JA_PlnUt8JIfTKlRo1hL60umWHaOjUJu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_063527_307589_99A3E422 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, Apr 21, 2021 at 03:29:31PM +0200, Johannes Berg wrote:
> On Wed, 2021-04-21 at 16:15 +0300, Dan Carpenter wrote:
> > Precision %.*s was intended instead of width %.*s.
> > 
> 
> typo there, the second instance should say "width %*s" :-)

The hunter has become the hunted.  *dramatic music.  dah dah dah.*

:P

Thanks.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
