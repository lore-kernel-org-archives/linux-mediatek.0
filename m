Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03327C6369E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 01:34:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B02D20B80
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 01:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B02D20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MPedq3kchgcRYiLisfj4Uvj3XUQ41ec+oiNXS1s5+4k=; b=QrnvA991KL1Hc12Q6491RPEj5
	tIccELRhRSvDscgzKze8nLijbpIdPlght0HBc0kbp/AZ/KvZCZvGxBsXOSS/yc3df8KGKv+QXx2Ka
	yLimlil1fvKfdNGJucmv/Zyo9zgCZ3GD48+NkwNtfn12CGMbwc4wPAULMUsMRq6hGYM7rgIqVn1lo
	5bOSMbniF+m8x9oyCe8UOmvbG+lhb8FSGvmaLeZxVM60FH8IM+O2fM3l64S9DfUf+HQzb7GrFfqP2
	jJ8Kf6i0NNBIQ7kxrZCtW3NI9AYyIl5sZ9lAmT3rHrhe7Nfr441HKD40hpCk5XlYfCAw8oB0ngDhc
	9Wns2AJOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkdW0-0004E4-Rn; Thu, 03 Dec 2020 01:34:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkdVw-0004DH-LL; Thu, 03 Dec 2020 01:34:33 +0000
X-UUID: 7731bb0c8ccc44cd8548b1910a411713-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wK0zfo0dPiyFhQQJ4nzywTR+uMF2OgABw+6Iks5D4mQ=; 
 b=CFPToLL0sZWBqroEFBvBnu3C1xB7f2YEQK55TLcFtzT7OOtnD6Umvp1NElNmQh4fAxnaxQnr4oMlgAj8q34YCcJw4kweQzVfP9D/Tn3EfyTYaGS5Vy2/6wxwsPb4bBoyrOE8l/7SZ/ki9l/IJoR2HY2NIsKdWFOxa1AzGA0kXts=;
X-UUID: 7731bb0c8ccc44cd8548b1910a411713-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 292478363; Wed, 02 Dec 2020 17:34:22 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 17:25:38 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Dec 2020 09:25:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Dec 2020 09:25:35 +0800
Message-ID: <1606958735.25719.29.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 3 Dec 2020 09:25:35 +0800
In-Reply-To: <20201202153543.GG874@kunai>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4EFEE1FEB07A9BE4BDA81639A3A3E1E0EC21718CFC0395F146C8E8461D7B11C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_203432_892682_8E813D8F 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
> Hi,
> 
> > Some i2c device driver indirectly uses I2C driver when it is now
> > being suspended. The i2c devices driver is suspended during the
> > NOIRQ phase and this cannot be changed due to other dependencies.
> > Therefore, we also need to move the suspend handling for the I2C
> > controller driver to the NOIRQ phase as well.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> 
> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
> 

Yes, Can you help to apply it into 5.10? Thanks

> Thanks,
> 
>    Wolfram
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
