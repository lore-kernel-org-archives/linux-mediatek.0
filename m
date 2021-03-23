Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422FFC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:41:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1122619AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1122619AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BbNL+h3FUKBIHvds+dbWrTve1pHoSFGN6OVu7uPpyw4=; b=W3Z+2M92+AEriK0e7hgTYHJtA
	YEcJXY1nrJ/UHHfCM/Ev7Jhjy2mAJoCVdz62Vw5MyR21Ho/GU4GZqs/YfSvQrca/I2XyqgkvvVdOD
	Kyfwmk+vbU7cD1gTfK7cIyHhq/4PE+Q57cbk96JpQAzhxpKwrJEk02SvxcZReSY8ddnvFEb77ZHLr
	6sGlP0qlmn0k2tWqP06kg+g3IXz842aFqXqL84xxaLbXDD4IX7mNMBVLTCxwVt0PRJAacvHKrc5IP
	1COJGfgqK2Y6ZsZJApJEch5z33UkzIM1TLX+7R/S47XPMV+ZO2BqJNvPIB9iMRtRQQkyCe8XNkV07
	wp1Er8mxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOWya-00DQZx-Ir; Tue, 23 Mar 2021 02:41:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOWyV-00DQWg-Rn; Tue, 23 Mar 2021 02:40:57 +0000
X-UUID: 13b4a7c7e84f4dfdab8acd03da35e752-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DAu9+vkOf+gCUcKhPMtDjJ5ojxZRjj0OXppDvCNG5gM=; 
 b=ZJmEO6xI/GNbOHoXIIgtpjpVrrSTTc9GZ2XkVAqRBNu3kYICbJSBfvvwDR3QcV8sZuxsmLtXDKeXrknPwgqTgWG4B3+Xn/0WwiXkajRwBCZJvTio+5r6SD3MYr20+8TrcOKu5ek0RYqFoTQ++0/OjUwgKLdDTtHh1sHcIrLeVYU=;
X-UUID: 13b4a7c7e84f4dfdab8acd03da35e752-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1962380015; Mon, 22 Mar 2021 18:40:49 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 19:40:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Mar 2021 10:40:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 10:40:45 +0800
Message-ID: <1616467245.11286.3.camel@mhfsdcap03>
Subject: Re: [PATCH 10/13] usb: mtu3: support ip-sleep wakeup for MT8183
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 23 Mar 2021 10:40:45 +0800
In-Reply-To: <47c8e339-114c-9693-222b-173e54bf298e@gmail.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-10-git-send-email-chunfeng.yun@mediatek.com>
 <47c8e339-114c-9693-222b-173e54bf298e@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 98F5B813B71D1B91477EEA6AB7E05F98280E6CE8EF4B0335014B6F4348ABFFEC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_024056_375176_40235812 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, 2021-03-22 at 11:57 +0300, Sergei Shtylyov wrote:
> Same comments as to the patch #6.
Ok, will check others, thanks a lot

> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
