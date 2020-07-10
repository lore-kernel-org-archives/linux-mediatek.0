Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D019C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 17:01:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0874C2068F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 17:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QoyOMtsB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W1VZL5Ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0874C2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S9JGdr/4x1eZIroupKzJXX87Ld/zAiYuSX2g4Dp77/Y=; b=QoyOMtsBm8cNPqB5KMxIe5QAs
	iAqsXOFlOLKnVH1sNCsHkQcw7k+esZW5WBd2smIFK/2fU4voXR9cF1M34S7gmhLMJ7xPRQ7moQU5r
	/vNjxjSlsyYqfdfCJX9go5F8Gb1bKdu0KAIy6Jq4wYWSFi+jKOekCH3OKFpmP7G61nItAb9X3CxMz
	0qNl6DCwKcskmDHvK06LyBInhKji9eq4nIRtBqI/j7JYFd/wKUG73pxXtj10VFxQTNg6yORYiogWw
	t/mGkbRlu8cERdm9gQliWYjkEvr691jDOQX9wr6clVpBD3FFgV1hAyEsgMytaT6CB5WB9zNoO5i5u
	dFGPFMlvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jufLt-0004Xx-EU; Sun, 12 Jul 2020 17:01:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtppc-0001KY-Hw; Fri, 10 Jul 2020 10:00:37 +0000
X-UUID: edffdc03c44e44f69b414d715486707b-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Fvop1Xi8e3CCer4hzPo+dzNj1YEbgfsUqzHs+K07MU8=; 
 b=W1VZL5EdIKZQCO+Du9cJbTrIS6KUsxLlfSbUl5hLi/Jqkme7J24AtuefZp41+EgDY7RNmQInVvdoaClH9SQVv8/1Ynl1FzWoBZaxHmdvar/VZLsWE3i4w/Z7267y40EqZiqDFQvaaQMRbpONZrtN8hqhiWdefhJ3jF7CnR1GCEM=;
X-UUID: edffdc03c44e44f69b414d715486707b-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1153966250; Fri, 10 Jul 2020 02:00:30 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 02:54:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 17:54:17 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 17:54:17 +0800
Message-ID: <1594374857.4941.2.camel@mtksdccf07>
Subject: [RESEND] Mediatek thermal driver update
From: mtk17045 <henry.yen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, "Zhang
 Rui" <rui.zhang@intel.com>
Date: Fri, 10 Jul 2020 17:54:17 +0800
In-Reply-To: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
References: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FDD4EEAC6AF5878663B9D9568B8EF0AF65527131D094D04143DF25D416B81CBA2000:8
X-MTK: N
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_060036_791468_90DFDD09 
X-CRM114-Status: GOOD (  11.26  )
X-Mailman-Approved-At: Sun, 12 Jul 2020 13:01:20 -0400
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
Cc: Steven Liu <steven.liu@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-04-30 at 17:14 +0800, Henry Yen wrote:
> Mediatek owns two thermal systems, which are almost the same except for
> the way of reading calibration data and converting temperature.
> MT8173, MT8183, MT2701 and MT2712 belongs to version 1 thermal system,
> and MT7622 belongs to version 2. The current code has already supported
> version 1 system. Then this patchset will add the support for another
> platform (e.g., MT7622 SoC).
> 
> Changelog:
> 
> v2:
> * reorganize the order of the two patches
> * remove unnecessary .extract and .convert callbacks
> * add fixes tag
> 
> v1:
> * initial post
> 
> Henry Yen (2):
>   thermal: mediatek: prepare to add support for other platforms
>   thermal: mediatek: add tsensor support for V2 thermal system
> 
>  drivers/thermal/mtk_thermal.c | 234 ++++++++++++++++++++++++++--------
>  1 file changed, 181 insertions(+), 53 deletions(-)
> 
Just gently ping.    
Many thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
