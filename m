Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B0CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 11:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072736105A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 11:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 072736105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzlbs949HrqhTrCwk6XP/cLFMHsa8Emusn+5ANqJ4yA=; b=tG0/6xeyuiZosd
	7G6gPzFGqBLrjqU0NwkVxqrB9YRXQjlyTcMNB0D61H/7kVOpkUo4+bpK/XiYpa+vUnjz6jns7N+4r
	FwPehiC+NuJCZjDLzTkDjeBNX4WRV+OTJ0uJFKvsLEDY25rk+ROOrHhyhCbjuC0UwMkcyFNlObinh
	shRlhvOqhwFe85HdVuoAKvedDtB37SKhoA8P8j55ZWLtRdYdPO1XSW/0+wxfc6kD3pJrg2zkaGW7W
	qvfPxhtn2DUClW13CGlF01ucp58RUcFqEht3H2Mcjesksvht0KuFAaGArXUA100JSqGpai0l1tQQu
	VluYBI8wUUzqC/sRDy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAsIX-002En1-Hi; Tue, 03 Aug 2021 11:09:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAsIU-002EmR-Jk; Tue, 03 Aug 2021 11:09:24 +0000
X-UUID: b763e4b9009c4f4a93a050471c9e181c-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Od2MpSzeMLHI3T1P4xyf0dSDDK91tD2ThNe34CdzcnA=; 
 b=jyA4hJK21e5yEMZ0ze3OF6owXdCH0LuOLSAY7NPZPhWxc+IYPlif/MYOi0bxrXLrJqbj1a5st6TF9BwVln6iQwPGu3vYTd3Xs/wLph68Yh3qwBthHMep5Y92mL44QOXl/zDLLs2cASOV4Ja36fWTEsHjupUrS0IZ/CmZzE0NExI=;
X-UUID: b763e4b9009c4f4a93a050471c9e181c-20210803
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 164427714; Tue, 03 Aug 2021 04:09:21 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 04:09:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 19:09:18 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 19:09:17 +0800
Message-ID: <1627987970.27248.4.camel@mbjsdccf07>
Subject: Re: [PATCH 2/3] spi: modify set_cs_timing parameter
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <leilk.liu@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Tue, 3 Aug 2021 18:52:50 +0800
In-Reply-To: <1627960488.7721.2.camel@mbjsdccf07>
References: <20210719091642.24633-1-mason.zhang@mediatek.com>
 <20210802201614.GA39900@sirena.org.uk> <1627960488.7721.2.camel@mbjsdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_040922_700537_419E9249 
X-CRM114-Status: UNSURE (   9.99  )
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

On Tue, 2021-08-03 at 11:14 +0800, Mason Zhang wrote:
> Dear Mark:
> 
> 	I have fixed this build err in this patch:
> 
> https://lore.kernel.org/linux-spi/20210803021328.28291-1-Mason.Zhang@mediatek.com/T/#u
> 
> 
> Thanks
> Mason

Dear Mark:

	I have submit this change separately, but still have build err, so I
have updated the patch v2 as below:

https://lore.kernel.org/linux-spi/20210803102228.2535-1-Mason.Zhang@mediatek.com/T/#u

Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
