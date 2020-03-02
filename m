Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E43C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 430B52465E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYMEdthd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 430B52465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iKkhwaBPdLbFZ7S/lHgk+N7W1/MSnMfPONXugz5cN4=; b=SYMEdthd8sfVPQ
	q8R0G6PkwsmjrmuqXRySJIbSj03gASdElRAcya38AZ3DbPoVqwNXD+CK3m70ID8aAbZtUR51e5nVe
	Cx3l0GFEpa9GZuczUXw3hq27pB8hi/y30tjVvQ48DBIfbr1EhLDtou7sethXxooShpLGUNt7H8jFy
	N0AoFLztfjtR+nlGBHxFDYq1N5FVNj+vDAf4RcSLViF8mu28sDv7oMht2S3sPMhUQ47znGbrFglpu
	34ZvwQTzbR6zzZI466nlw9VONAHs9eAMZbXpFt/npNvc/5haxlWhX9kTwoeNGgB3oPuKFGE0Qv5kG
	TWHPvF2Oerl6q6GVJiJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8ue1-0003UV-69; Mon, 02 Mar 2020 23:38:41 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8udz-0003Tn-5S; Mon, 02 Mar 2020 23:38:40 +0000
Received: by mail-oi1-f194.google.com with SMTP id l12so1081650oil.9;
 Mon, 02 Mar 2020 15:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8XhrBfpdeYVeW1pNRFkev10cOhTus7KbN5tnNyTByWU=;
 b=HAbKLTJH0ncnNWFds0QjIiuMmKx6H7zvZboEdMNUWRrVRqZgkI/v7oV8Hgqa0M2Sj/
 ptW+nwlwEarCRDxr8cVXnKmofmlMijjxyKrpPqx5IQL36uo5CGswAipcwkKq2jxbpQz2
 YjELw7FbU2o/aPX4rKeOJORgcaMPA/F/nya7rYwPwMLcjur4kiJUmHFBe5yBhg+wMuw8
 sHQC9KI5H1v7qf8e4cq3hXJeZE+N6PosjjQSikJu8a/S8AQPsvDrjyBAoc1wTo3UIRUN
 ntC6MgZAcMk0ll1kZ2Ai9SCx/3F/d+ZswEHWLPwkiVdSRMENnCJ5N+A12OJO/bmABpA4
 Csuw==
X-Gm-Message-State: ANhLgQ1g8DhIV2cAQscq4vdBIi9MgN//tnPTkLQB5b3a3s9U5bIaCbsh
 YocYxIB452DUaDKwafdKbw==
X-Google-Smtp-Source: ADFU+vuhlOl6on/xI93yhKRinPGhkp/CPia34CJHv4KuiNms9QQzJ4jdxXzYrkiqTRtqOQIlBZ9/wA==
X-Received: by 2002:a05:6808:64e:: with SMTP id
 z14mr582889oih.79.1583192318164; 
 Mon, 02 Mar 2020 15:38:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w15sm3156087oiw.43.2020.03.02.15.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:38:37 -0800 (PST)
Received: (nullmailer pid 17952 invoked by uid 1000);
 Mon, 02 Mar 2020 23:38:36 -0000
Date: Mon, 2 Mar 2020 17:38:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v11 2/6] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200302233836.GB5639@bogus>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
 <20200228081441.88179-3-jitao.shi@mediatek.com>
 <20200302232903.GA4460@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302232903.GA4460@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_153839_204527_994D72E4 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 02, 2020 at 05:29:03PM -0600, Rob Herring wrote:
> On Fri, 28 Feb 2020 16:14:37 +0800, Jitao Shi wrote:
> > Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> > the dpi pins to gpio mode and output-low to avoid leakage current when dpi
> > disabled.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Sorry, not Acked. Wrong patch. On this one, please address my comments 
on v9.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
