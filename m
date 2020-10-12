Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C20C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 01:26:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4523520781
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 01:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0gL4fnEC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="egZlOpHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4523520781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oucRhtSfYZlQITk6UWXeCVFR3HI4/HzfXvchnvo+DqM=; b=0gL4fnECq2cZ2cOqg2pr0/nx7
	qo7t7UWOBpURZlSTf2imm5cBALJA8IOE9yyKKLDwv6cYiemom02PwetoPiUnZif/GQVAFCIBrYbyj
	R8HFpwpmLGoTE/x4CZh7JBGFmxD5FkD76Jf9JkKXmiyaQBl8JsPoQ2zkNWp7azdxMZUfPLUMwfIrx
	Q/CEmU+IRx15u9J+Jt4ryyirabP/TPo7dGoJKyAmd/avIz+M6dT7J5byz5NQfMVH6z1UuF/b8RjP1
	1HFk46ijZfDlmZnl3GbYQzygOhEKs6T50ZEGncjq9cqJRY4TfZUUUU1RtW+fU8bGUskThdt970dgX
	o6Ujlhw3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRmbQ-00078M-CW; Mon, 12 Oct 2020 01:26:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRmbN-00077I-Ae; Mon, 12 Oct 2020 01:26:14 +0000
X-UUID: 6ba964f2da8d41e9b4b28f1257af47fe-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R1q9dfekP6mSdsS/ET+QXDzN+e6bl0PwJAWHtliaE3M=; 
 b=egZlOpHpLj25rSinPIGxOKpqyurq2TpQOT20FwDiNgAfNvECWFMWSyCr+SAHzfaxkwKNJEvCdR67oSDNGVQnZETgTvtNHj/FBlSwUVqUerWH0iqvdt+opb+5SmYvCmIUN09yEgsy+GHV9R0DnlahxdRMVJwPMYupm/L6nEVu7NM=;
X-UUID: 6ba964f2da8d41e9b4b28f1257af47fe-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 561836447; Sun, 11 Oct 2020 17:26:01 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 18:25:59 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 09:25:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 09:25:55 +0800
Message-ID: <1602465955.29336.57.camel@mhfsdcap03>
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: use preferred license tag
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 12 Oct 2020 09:25:55 +0800
In-Reply-To: <20201010095052.GA989257@kroah.com>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
 <d76ca8b2d64c7c017e3ddaca8497eb38ee514204.1602318869.git.chunfeng.yun@mediatek.com>
 <20201010095052.GA989257@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 29B9D6F8DD7D8A01EEF75DC90A0B763AD3F7D6CA7860AF3A06EB30669984C0B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_212613_557188_257C8E7E 
X-CRM114-Status: GOOD (  20.58  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-10-10 at 11:50 +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 10, 2020 at 04:43:14PM +0800, Chunfeng Yun wrote:
> > This is used to fix the checkpach.pl WARNING:SPDX_LICENSE_TAG
> > 
> > See bindings/submitting-patches.rst:
> > "DT binding files should be dual licensed. The preferred license tag is
> >  (GPL-2.0-only OR BSD-2-Clause)."
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: new patch
> > ---
> >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > index 42b295afdf32..11b9b9ee2b54 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -1,4 +1,4 @@
> > -# SPDX-License-Identifier: GPL-2.0
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> 
> Are you sure you are allowed to change the license of this file?  Last I
> checked, you did not write this file, and so, you can't change the
> license of it.  You need to get the owners of the file to do so.
Got it, will abandon it in next version

Thanks

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
