Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD9FC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A343B6023B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A343B6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAAAVm+ajg1li5vLYw58b8rh6jXT+qKp2tIqHeD3ssM=; b=laGzqA/3/m4I0h
	zwR9HskY1xyTV8EIB96SQZ05jqBFWTzo3ZluYXSX25ys0vUoM04tFFkX335j15fpdh9Ij4/mgTiqX
	VAAQ8vRI+HGLawGRdjZKM2y7fGryUIaheRgTkQiuqCy1JdNog+JLBV1hrni6NrlyOA8NRQmcGjCvw
	/5AmAWCa4mBXQ1wXZB2Pfc4Xl73B2mRcWpVCLkf7/1ak/QC3unLGp2DqneqOcTRb2NYioSfeEDbVg
	LXxhsR0bOlJJzjlbcf72TE/7t7Oebn9HhVAqAVNFYS116+D9VhkZtSCdUxppXj3IVaOf3ZUzL5cUT
	4JxIX/o40eOts3zobsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WkZ-009nPk-PI; Fri, 30 Jul 2021 17:56:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WkA-009nKn-CL; Fri, 30 Jul 2021 17:56:25 +0000
X-UUID: ff904ec8f20443b98f0af9d9c3ec4865-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8l+AZ2PYieDguCAzfGAi17aTcglVGuO3Plp5Mxjbqi4=; 
 b=AN269eGzAFtxqQ7boOsUh7E3gPII0QXzdqC1sxcXSbwSIHh4wFFBG5KEs/rTpec7uUe+HMJStwK3FuUEbj9/67QQL7qWgBzmF7OEd0AMz9gyaNrHHdRtVUseS9qh4yU8LC8/Z2cjMwJsm3GatmEmy3sq/zR/+xR2Tqeal/iYYwA=;
X-UUID: ff904ec8f20443b98f0af9d9c3ec4865-20210730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1612348474; Fri, 30 Jul 2021 10:56:17 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:56:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32N1.mediatek.inc (172.27.4.71) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 31 Jul 2021 01:56:06 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 31 Jul 2021 01:56:05 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next] net: ipv6: add IFLA_RA_MTU to expose mtu value
 in the RA message
Date: Sat, 31 Jul 2021 01:39:46 +0800
Message-ID: <20210730173946.31205-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <57652c0b-ded8-8386-c9a7-40deb1525db2@gmail.com>
References: <57652c0b-ded8-8386-c9a7-40deb1525db2@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: ED024F4D181FE5C06A2E15C032934C38617A85931FDD670D971FE0B3D0CB59DB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_105623_889410_D15DC98A 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, 2021-07-29 at 11:28 -0600, David Ahern wrote:
On 7/29/21 9:42 AM, Rocco Yue wrote:
>> Because the purpose of this patch is for userspace to correctly read the
>> ra_mtu value of different network device, if the DEVCONF is completely dropped,
>> does that mean I can add the "ra_mtu" member in the "struct net_device" .
> 
> good point. IFLA is the wrong attribute. It should be IFLA_INET6_RA_MTU,
> stored in inet6_dev and added to the link message in
> inet6_fill_ifla6_attrs.

will do, thanks for your suggestion.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
